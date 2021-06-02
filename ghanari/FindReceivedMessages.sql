# users can find the messages been send to them
# but can not see messages with ava content that 
# main sender of ava blocked them (دریافت لیست پیام های دریافتی کاربر)

# Rosham Vali Khamosh can see 2 of messages that RahimRahim sent for him
# and he can not see message with ava id = 34 because main sender of this ava
# has blocked Roshan Vali Khamosh
select *
from message
where message.Receiver = "Roshan Vali Khamosh" and (
not exists(
	select block.Blocked
    from ava left join block on ava.Sender = block.Blocker
    where message.ContentAva = ava.id and block.Blocked = "Roshan Vali Khamosh")
)
order by message.SendingTime desc;