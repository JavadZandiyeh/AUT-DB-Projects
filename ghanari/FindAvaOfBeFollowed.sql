# users can find ava of users that follow them but not users that blocked him (دریافت فعالیت دنبال شوندگان)

# Roshan Vali Khamosh wants to find ava of users that follow them
select ava.Content, ava.Sender, ava.SendingTime
from ava inner join follow on ava.Sender = follow.ToBeFollowed
where follow.Follower = "Roshan Vali Khamosh"
and "Roshan Vali Khamosh" not in(
select block.Blocked
from block
where block.Blocker = ava.Sender)
order by ava.SendingTime desc;