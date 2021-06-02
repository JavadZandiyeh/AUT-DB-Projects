# in this query users can find comments on a specific ava with two conditions
# one: sender of top ava has not blocked him
# two: sender of comments has not blocked him (دریافت نظرات آوا)

# MJZandiyeh wants to find comments on ava with id = 34
select ava.Content, ava.Sender
from ava
where ava.CommentOn = 34
and ava.id not in (
	select ava.id
	from ava left join block on ava.Sender = block.Blocker
	where ava.CommentOn = 34 and block.Blocked = "MJZandiyeh")
and
	"MJZandiyeh" not in(
	select block.Blocked
	from ava inner join block on ava.Sender = block.Blocker
	where ava.id = 34);

# Roshan Vali Khamosh wants to find comments on ava with id = 34
# but can not find it because sender of ava 34 blocked him
select ava.Content, ava.Sender
from ava
where ava.CommentOn = 34
and ava.id not in (
	select ava.id
	from ava left join block on ava.Sender = block.Blocker
	where ava.CommentOn = 34 and block.Blocked = "Roshan Vali Khamosh")
and
	"Roshan Vali Khamosh" not in(
	select block.Blocked
	from ava inner join block on ava.Sender = block.Blocker
	where ava.id = 34);
    

# Roshan Vali Khamosh can not see MJZandiyeh's comment on ava 35
# but can see comment of AT on this ava
select ava.Content, ava.Sender
from ava
where ava.CommentOn = 35
and ava.id not in (
	select ava.id
	from ava left join block on ava.Sender = block.Blocker
	where ava.CommentOn = 35 and block.Blocked = "Roshan Vali Khamosh")
and
	"Roshan Vali Khamosh" not in(
	select block.Blocked
	from ava inner join block on ava.Sender = block.Blocker
	where ava.id = 35);
