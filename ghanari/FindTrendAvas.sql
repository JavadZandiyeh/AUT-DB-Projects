# in this query users can see avas which their 
# sender has not blocked him ordered by likes (دریافت آواهای پرطرفدار)

# finding trend ava by MJZanidyeh
select ava.Content as ava_content, count(ava.id) as num_like
from (ava left join avalike on ava.id = avalike.Ava) inner join block on ava.Sender = block.Blocker
where block.Blocked != "MJZandiyeh"
group by content
order by num_like desc;

# finding trend ava by Roshan Vali Khamosh --> he can not find avas of MJZandiye because he has blocked him
select ava.Content as ava_content, count(ava.id) as num_like
from (ava left join avalike on ava.id = avalike.Ava) inner join block on ava.Sender = block.Blocker
where block.Blocked != "Roshan Vali Khamosh"
group by content
order by num_like desc;