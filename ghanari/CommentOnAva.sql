# in this query users can leave comment on ava of users (if they are not in their blocked list) (نظر دادن)

# poorya can leave comment on MJZandiyeh ava becuase he is not in its blocked list
insert into ava (Content, Sender, SendingTime, CommentOn)
	select "why did you sent this ava?????", "poorya", current_timestamp(), 34
    where not exists(select block.Blocked
					 from ava inner join block on block.Blocker = ava.Sender
                     where ava.id = 34 and block.Blocked = "poorya");

insert into ava (Content, Sender, SendingTime, CommentOn)
	select "Have a nice day:)", "MJZandiyeh", current_timestamp(), 35
    where not exists(select block.Blocked
					 from ava inner join block on block.Blocker = ava.Sender
                     where ava.id = 35 and block.Blocked = "MJZandiyeh");

insert into ava (Content, Sender, SendingTime, CommentOn)
	select ":)))))", "AT", current_timestamp(), 35
    where not exists(select block.Blocked
					 from ava inner join block on block.Blocker = ava.Sender
                     where ava.id = 35 and block.Blocked = "AT");


# Roshan Vali Khamosh can't leave comment on MJZandiyeh ava becuase he is in its blocked list
insert into ava (Content, Sender, SendingTime, CommentOn)
	select "wellcome mohammad javad to ghanari", "Roshan Vali Khamosh", current_timestamp(), 34
    where not exists(select block.Blocked
					 from ava inner join block on block.Blocker = ava.Sender
                     where ava.id = 34 and block.Blocked = "Roshan Vali Khamosh");