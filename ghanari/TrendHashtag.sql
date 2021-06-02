# in this query we find the hashtag which was used more than others (پیدا کردن علامت ویژه با بیشترین استفاده)

select *
from hashtag
where NumberOfUsage = (select max(NumberOfUsage) from hashtag);