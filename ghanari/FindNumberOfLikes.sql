# in this query users can find number of likes for each ava except ava's whose sender blocked him (دریافت تعدا پسند ها)

# AT can find number of likes for ava with id = 34 whose sender is MJZaniyeh
select ava.Content as ava, count(avalike.WhoLiked) as num_likes
from (avalike inner join ava on ava.id = avalike.Ava)
	  inner join block on ava.Sender = block.Blocker
where ava.id = 34 and block.Blocked != "AT"
group by ava.Content;

# but Roshan Vali Khamosh can not find number of likes (find 0 agains) 
# for ava with id = 34 whose sender is MJZaniyeh
select ifnull((select count(avalike.WhoLiked) as num_likes
			   from (avalike inner join ava on ava.id = avalike.Ava)
			   inner join block on ava.Sender = block.Blocker
			   where ava.id = 34 and block.Blocked != "Roshan Vali Khamosh"
               group by ava.Content), '0') as num_likes;