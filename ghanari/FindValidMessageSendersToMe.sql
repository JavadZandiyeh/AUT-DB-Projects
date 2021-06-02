# users can see who has sent to him valid messages (دریافت لیست ارسال کنندگان پیام)

# Roshan Vali Khamosh wants to see who has sent him a valid message
select distinct message.Sender
from message
where message.Receiver = "Roshan Vali Khamosh" and (
not exists(
	select block.Blocked
    from ava left join block on ava.Sender = block.Blocker
    where message.ContentAva = ava.id and block.Blocked = "Roshan Vali Khamosh")
)
order by message.SendingTime desc;

###### next two queries are for showing the correctness of previous query and they are not in my answer

# note: if ommit 'distinct' command we can see that one of message of 
# RahimRahim to Roshan Vali Khamosh was invalid and it is not in our list
select message.Sender
from message
where message.Receiver = "Roshan Vali Khamosh"
order by message.SendingTime desc;

select message.Sender
from message
where message.Receiver = "Roshan Vali Khamosh" and (
not exists(
	select block.Blocked
    from ava left join block on ava.Sender = block.Blocker
    where message.ContentAva = ava.id and block.Blocked = "Roshan Vali Khamosh")
)
order by message.SendingTime desc;