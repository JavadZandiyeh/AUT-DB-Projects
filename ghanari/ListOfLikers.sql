# users can see who have liked a specific ava but by two conditions
# one: this user can not see this list for users who blocked him
# two: this user can not see for example user A liked this ava if A has blocked this user (دریافت لیست پسند کنندگان) 

# a view of what is going to be happend
# this query is not on the answer, just for understanding better
select ava.id, ava.Content, ava.Sender, ava.SendingTime, ava.CommentOn, avalike.WhoLiked, b1.Blocked as bloked_to_see_this_ava, b2.Blocked as blocked_to_see_this_comment
from ((ava left join avalike on ava.id = avalike.Ava)
	 left join (block as b1) on b1.Blocker = ava.Sender)
     left join (block as b2) on b2.Blocker = avalike.WhoLiked;

# Roshan Vali Khamosh wants to see that who liked ava 35
select ava.Content, avalike.WhoLiked
from (ava left join avalike on ava.id = avalike.Ava)
where ava.id = 35 and ava.id not in (select distinct ava.id
					 from ((ava left join avalike on ava.id = avalike.Ava)
					 left join (block as b1) on b1.Blocker = ava.Sender)
					 left join (block as b2) on b2.Blocker = avalike.WhoLiked
					 where (b2.Blocked = "Roshan Vali Khamosh" or b1.Blocked = "Roshan Vali Khamosh"));
                     
# Roshan Vali Khamosh wants to see that who liked ava 34
select ava.Content, avalike.WhoLiked
from (ava left join avalike on ava.id = avalike.Ava)
where ava.id = 34 and ava.id not in (select distinct ava.id
					 from ((ava left join avalike on ava.id = avalike.Ava)
					 left join (block as b1) on b1.Blocker = ava.Sender)
					 left join (block as b2) on b2.Blocker = avalike.WhoLiked
					 where (b2.Blocked = "Roshan Vali Khamosh" or b1.Blocked = "Roshan Vali Khamosh"));