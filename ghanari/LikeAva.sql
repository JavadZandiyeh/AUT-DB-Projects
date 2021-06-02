# in this query users can like ava of other users but not users who have blocked him (پسندیدن آوا)

# AT can like MJZandiyeh's ava but can not like poorya's ava because he has blocked him
# can like ava of MJZandiyeh with id = 34
insert into avalike
select "AT", 34
where not exists (select * 
				  from block inner join ava on ava.Sender = block.Blocker
                  where ava.id = 34 and block.Blocked = "AT")
on duplicate key update avalike.Ava = avalike.Ava;

# can not like ava of poorya with id = 36
insert into avalike
select "AT", 36
where not exists (select * 
				  from block inner join ava on ava.Sender = block.Blocker
                  where ava.id = 36 and block.Blocked = "AT")
on duplicate key update avalike.Ava = avalike.Ava;

# some more ava like for having better table for next queries
insert into avalike
select "FR", 34
where not exists (select * 
				  from block inner join ava on ava.Sender = block.Blocker
                  where ava.id = 34 and block.Blocked = "FR")
on duplicate key update avalike.Ava = avalike.Ava;

insert into avalike
select "RahimRahim", 34
where not exists (select * 
				  from block inner join ava on ava.Sender = block.Blocker
                  where ava.id = 34 and block.Blocked = "RahimRahim")
on duplicate key update avalike.Ava = avalike.Ava;

insert into avalike
select "RahimRahim", 35
where not exists (select * 
				  from block inner join ava on ava.Sender = block.Blocker
                  where ava.id = 35 and block.Blocked = "RahimRahim")
on duplicate key update avalike.Ava = avalike.Ava;

insert into avalike
select "MJZandiyeh", 36
where not exists (select * 
				  from block inner join ava on ava.Sender = block.Blocker
                  where ava.id = 36 and block.Blocked = "MJZandiyeh")
on duplicate key update avalike.Ava = avalike.Ava;