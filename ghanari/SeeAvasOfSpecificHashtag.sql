# in this query users can see Avas of specific hashtag 
# if sender of that ava has not blocked this user  (دریافت آواهای یک علامت ویژه)

# see ava of with hashtag #Hello via Roshan Vali Khamosh
# he can see ava of FR that has this hashtag because FR has not blocked him
# but he can not see ava of MJZandiyeh that has this hashtag because MJZandiyeh has blocked him
select ava.Content as content, ava.Sender as sender, ava.SendingTime as sending_time, hashtagofeachava.Content as hashtag
from (hashtagofeachava inner join ava on ava.id = hashtagofeachava.id) inner join block on ava.Sender = block.Blocker
where hashtagofeachava.Content = "#Hello" and block.Blocked != "Roshan Vali Khamosh"
order by ava.SendingTime desc;

# if we ommit condition of blocking we can see that "Roshan Vali Khamosh" can see ava of "MJZanidyeh"
# this part is not what manual wants us but is usefull for understanding what happend on last query
select ava.Content as content, ava.Sender as sender, ava.SendingTime as sending_time, hashtagofeachava.Content as hashtag
from (hashtagofeachava inner join ava on ava.id = hashtagofeachava.id) inner join block on ava.Sender = block.Blocker
where hashtagofeachava.Content = "#Hello"
order by ava.SendingTime desc;