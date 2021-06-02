# in this query each user can add a hashtag to his/her ava (اضافه کردن علامت ویژه به آوا)

########### add "#Hello" hashtag on ava with id = 34
insert into hashtag (Content, NumberOfUsage)
select "#Hello", 1
where "#Hello" like '#_____'
on duplicate key update NumberOfUsage = NumberOfUsage + 1;

insert into hashtagOfEachAva (id, Content)
	select 34, "#Hello"
    where "#Hello" like '#_____';
###########


########### add another hashtag for ava with id = 34
insert into hashtag (Content, NumberOfUsage)
select "#gdbye", 1
where "#gdbye" like '#_____'
on duplicate key update NumberOfUsage = NumberOfUsage + 1;

insert into hashtagOfEachAva (id, Content)
	select 34, "#gdbye"
    where "#gdbye" like '#_____';
###########

########### can not add this hashtag, it is too long
insert into hashtag (Content, NumberOfUsage)
select "#abcdefg", 1
where "#abcdefg" like '#_____'
on duplicate key update NumberOfUsage = NumberOfUsage + 1;

insert into hashtagOfEachAva (id, Content)
	select 35, "#abcdefg"
    where "#abcdefg" like '#_____';
###########

########### for testing the increament of number of usage
insert into hashtag (Content, NumberOfUsage)
select "#Hello", 1
where "#Hello" like '#_____'
on duplicate key update NumberOfUsage = NumberOfUsage + 1;

insert into hashtagOfEachAva (id, Content)
	select 36, "#Hello"
    where "#Hello" like '#_____';
###########

########### for having more than one hashtag on our data base:)
insert into hashtag (Content, NumberOfUsage)
select "#noerd", 1
where "#noerd" like '#_____'
on duplicate key update NumberOfUsage = NumberOfUsage + 1;

insert into hashtagOfEachAva (id, Content)
	select 37, "#noerd"
    where "#noerd" like '#_____';
###########

