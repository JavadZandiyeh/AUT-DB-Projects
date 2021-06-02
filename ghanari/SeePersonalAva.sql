# in this query users can see what they have sent as ava (دریافت آواهای شخصی)

select ava.Content, ava.SendingTime, hashtagOfEachAva.Content as hashtag
from (ava inner join hashtagOfEachAva on ava.id = hashtagOfEachAva.id)
where ava.Sender = "MJZandiyeh";
