# users can send message to others with two conditions
# one: he has not been blocked by receiver
# two: he has not been blocked by sender of main ava of message (ارسال پیام)

# RahimRahim can send text message to MJZandiyeh because he has not blocked him
insert into message (ContentAva, ContentText, Sender, Receiver, SendingTime)
	select null, "hello javad, how are you?", "RahimRahim", "MJZandiyeh", current_timestamp()
	where "RahimRahim" not in(
		select block.Blocked
        from block
        where block.Blocker = "MJZandiyeh");
        
insert into message (ContentAva, ContentText, Sender, Receiver, SendingTime)
	select null, "hello khamosh", "RahimRahim", "Roshan Vali Khamosh", current_timestamp()
	where "RahimRahim" not in(
		select block.Blocked
        from block
        where block.Blocker = "Roshan Vali Khamosh");
        
insert into message (ContentAva, ContentText, Sender, Receiver, SendingTime)
	select null, "hi i am farzad", "AT", "Roshan Vali Khamosh", current_timestamp()
	where "AT" not in(
		select block.Blocked
        from block
        where block.Blocker = "Roshan Vali Khamosh");

# Roshan Vali Khamosh can not send text message to MJZandiyeh because he has blocked him
insert into message (ContentAva, ContentText, Sender, Receiver, SendingTime)
	select null, "why did you blocked me?????", "Roshan Vali Khamosh", "MJZandiyeh", current_timestamp()
	where "Roshan Vali Khamosh" not in(
		select block.Blocked
        from block
        where block.Blocker = "MJZandiyeh");


# RahimRahim can send message with ava by id = 35 to MJZandiyeh
# because sender of ava 35 has not blocked RahimRahim
insert into message (ContentAva, ContentText, Sender, Receiver, SendingTime)
	select 35 , null, "RahimRahim", "MJZandiyeh", current_timestamp()
	where not exists(
		select *
        from ava left join block on ava.Sender = block.Blocker 
        where block.Blocked = "Rahim Rahim" and ava.id = 35);

# RahimRahim can send message with ava by id = 34 to Roshan Vali Khamosh
# because sender of ava 34 has not blocked RahimRahim
insert into message (ContentAva, ContentText, Sender, Receiver, SendingTime)
	select 34 , null, "RahimRahim", "Roshan Vali Khamosh", current_timestamp()
	where not exists(
		select *
        from ava left join block on ava.Sender = block.Blocker 
        where block.Blocked = "Rahim Rahim" and ava.id = 34);

insert into message (ContentAva, ContentText, Sender, Receiver, SendingTime)
	select 35 , null, "RahimRahim", "Roshan Vali Khamosh", current_timestamp()
	where not exists(
		select *
        from ava left join block on ava.Sender = block.Blocker 
        where block.Blocked = "Rahim Rahim" and ava.id = 35);

# Roshan Vali Khamosh can not send message with ava by id = 34 to FR
# because sender of ava 34 blocked Roshan Vali Khamosh
insert into message (ContentAva, ContentText, Sender, Receiver, SendingTime)
	select 34 , null, "Roshan Vali Khamosh", "FR", current_timestamp()
	where not exists(
		select *
        from ava left join block on ava.Sender = block.Blocker 
        where block.Blocked = "Roshan Vali Khamosh" and ava.id = 34);