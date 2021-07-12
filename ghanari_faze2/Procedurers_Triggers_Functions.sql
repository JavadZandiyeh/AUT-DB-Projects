#---------------------------------------CreateAccount---------------------------------------#
# this query creates some new accounts (ایجاد حساب کاربری)
# using hashed passwords with sha1 function
DELIMITER $$
CREATE PROCEDURE `CreateAccount` (
	in FirstName varchar(20),
    in LastName varchar(20),
    in Username varchar(20),
    in Password varchar(128),
    in Birthday date,
    in Biography varchar(64)
)
BEGIN
	insert into user values(
		FirstName, LastName, Username, sha1(Password),
        Birthday, current_timestamp(), Biography
    );
END$$
DELIMITER ;

#---------------------------------------LoginToAccount---------------------------------------#
# this query used for logging in to the account (ورود به حساب کاربری)
DELIMITER $$
CREATE PROCEDURE `LoginToAccount` (
	in Username varchar(20)
)
BEGIN
	insert into login_details(Username, Login)
    values(Username, current_timestamp());
END$$
DELIMITER ;


#---------------------------------------Trigger_AccountLog---------------------------------------#
# after creation of each account we have to log this creation
# as user login (لاگ بعد از ایجاد حساب کاربری جدید به عنوان ورود به سامانه)
DELIMITER $$
create trigger after_create_account 
	after insert 
    on user for each row
begin
	call LoginToAccount(new.Username);
end$$
DELIMITER ;


#---------------------------------------LoginCheck---------------------------------------#
# in this query we show login details of users ordered by login time in a descending way (بررسی ورود های کاربر)
DELIMITER $$
CREATE PROCEDURE `LoginCheck` (
    in u_name varchar(20) #Username
)
BEGIN	
	select Username, Login
	from login_details
	where Username = u_name
	order by Login desc;
END$$
DELIMITER ;


#---------------------------------------Function_GetCurrentUser---------------------------------------#
# get current user (احراز هویت)
DELIMITER $$
create Function `GetCurrentUser`()
returns varchar(20)
deterministic
begin
	declare curr varchar(20);
    
    select Username
    into curr
    from login_details
    order by Login desc
    limit 1;
    
    return curr;
end$$
DELIMITER ;


##################################################################################################
#---------------------------------------Follow---------------------------------------#
# in this query each user can follow other users (دنبال کردن)
DELIMITER $$
CREATE PROCEDURE `Follow`(
	in ToBeFollowed varchar(20)
)
BEGIN
    insert ignore into follow values
	(GetCurrentUser(), ToBeFollowed);
END$$
DELIMITER ;


#---------------------------------------UnFollow---------------------------------------#
# in this query we can unfollow accounts (توقف دنبال کردن)
DELIMITER $$
CREATE PROCEDURE `UnFollow`(
	in ToBeUnFollowed varchar(20)
)
BEGIN
    delete from follow
	where Follower = GetCurrentUser() and ToBeFollowed = ToBeUnFollowed;
END$$
DELIMITER ;


#---------------------------------------Block---------------------------------------#
# in this query users can block others (مسدود کردن)
DELIMITER $$
CREATE PROCEDURE `Block`(
	in Blocked varchar(20)
)
BEGIN
    insert ignore into block values(Blocked, GetCurrentUser());
END$$
DELIMITER ;


#---------------------------------------UnBlock---------------------------------------#
# in this query users can unblock accounts which have blocked before (آزاد کردن)
DELIMITER $$
CREATE PROCEDURE `UnBlock`(
	in UnBlocked varchar(20)
)
BEGIN
	delete from block
	where Blocked = UnBlocked and Blocker = GetCurrentUser();
END$$
DELIMITER ;


##################################################################################################
#---------------------------------------SendAva&CommentOnAva---------------------------------------#
# in this query user can send ava (ارسال آوا)
# also in this query users can leave comment on ava of users (if they are not in their blocked list) (نظر دادن)
DELIMITER $$
CREATE PROCEDURE `SendAva`(
	in Content varchar(256),
    in CommentOn int    
)
BEGIN
	if not exists(select block.Blocked
				  from ava inner join block on block.Blocker = ava.Sender
				  where ava.id = CommentOn and block.Blocked = GetCurrentUser()) then
			
		insert into ava (Content, Sender, SendingTime, CommentOn) 
		values (Content, GetCurrentUser(), current_timestamp(), CommentOn);
    
    end if;
END$$
DELIMITER ;


#---------------------------------------Trigger_AvaLog---------------------------------------#
# after sending ava we have to save sender, sending time and id of ava (لاگ بعد از ایجاد آوا)
DELIMITER $$
create trigger after_send_ava 
	after insert 
    on ava for each row
begin
	insert into ava_log values(new.id, new.Sender, new.SendingTime);
end$$
DELIMITER ;


#---------------------------------------Trigger_AvaHashTag---------------------------------------#
# in this query each user can add a hashtag to his/her ava (اضافه کردن علامت ویژه به آوا)
DELIMITER $$
create trigger after_send_ava_for_hashtag 
	after insert 
    on ava for each row
begin
	
    declare txt varchar(256);
	declare current_position int;
    declare hashtag char(6);
    
    set txt = new.Content;
    set current_position = 1;
    set txt = new.Content;
    
    loop_label : loop
		select locate("#", txt, current_position) into current_position;
        if current_position = 0 then
			leave loop_label;
		end if;
        
        select substring(txt, current_position, 6) into hashtag;
		
        insert into hashtag (Content, NumberOfUsage)
		select hashtag, 1
		on duplicate key update NumberOfUsage = NumberOfUsage + 1;
        
        insert ignore into hashtagOfEachAva (id, Content)
		select new.id, hashtag;
        
		set current_position = current_position + 6;
    end loop;
end$$
DELIMITER ;


#---------------------------------------TrendHashTag---------------------------------------#
# in this query we find the hashtag which was used more than others (پیدا کردن علامت ویژه با بیشترین استفاده)
DELIMITER $$
CREATE PROCEDURE `TrendHashTag`()
BEGIN
	select *
	from hashtag
	where NumberOfUsage = (select max(NumberOfUsage) from hashtag);
END$$
DELIMITER ;


#---------------------------------------SeePersonalAva---------------------------------------#
# in this query users can see what they have sent as ava (دریافت آواهای شخصی)
DELIMITER $$
CREATE PROCEDURE `SeePersonalAva`()
BEGIN
	select ava.Content, ava.SendingTime
	from ava
	where ava.Sender = GetCurrentUser();
END$$
DELIMITER ;


#---------------------------------------SeeAvasOfSpecificHashtag---------------------------------------#
# in this query users can see Avas of specific hashtag 
# if sender of that ava has not blocked this user  (دریافت آواهای یک علامت ویژه)
DELIMITER $$
CREATE PROCEDURE `SeeAvasOfSpecificHashtag`(
	in hash_tag char(6)
)
BEGIN
	select ava.Content as content, ava.Sender as sender, ava.SendingTime as sending_time, hashtagofeachava.Content as hashtag
	from (hashtagofeachava inner join ava on ava.id = hashtagofeachava.id) inner join block on ava.Sender = block.Blocker
	where hashtagofeachava.Content = hash_tag and block.Blocked != GetCurrentUser()
	order by ava.SendingTime desc;
END$$
DELIMITER ;


#---------------------------------------LikeAva---------------------------------------#
# in this query users can like ava of other users but not users who have blocked him (پسندیدن آوا)
DELIMITER $$
CREATE PROCEDURE `LikeAva`(
	in id_ava int
)
BEGIN
	insert into avalike
	select GetCurrentUser(), id_ava
	where not exists 
		(select * 
		from block inner join ava on ava.Sender = block.Blocker
		where ava.id = id_ava and block.Blocked = GetCurrentUser())
	on duplicate key update avalike.Ava = avalike.Ava;
END$$
DELIMITER ;


#---------------------------------------FindNumberOfLikes---------------------------------------#


