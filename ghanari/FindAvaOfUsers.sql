# users can find ava of users who not blocked him (دریافت فعالیت کاربران)

# "Roshan Vali Khamosh" wants to find ava of "AT" --> he can find them because AT has not blocked him
select ava.Content, ava.SendingTime
from ava 
where ava.Sender = "AT"
and 
"Roshan Vali Khamosh" not in(
select block.Blocked
from block
where block.Blocker = ava.Sender)
order by ava.SendingTime desc;

# "Roshan Vali Khamosh" wants to find ava of "MJZandiyeh" --> he can not find them because MJZandiyeh has blocked him
select ava.Content, ava.SendingTime
from ava 
where ava.Sender = "MJZandiyeh"
and 
"Roshan Vali Khamosh" not in(
select block.Blocked
from block
where block.Blocker = ava.Sender)
order by ava.SendingTime desc;