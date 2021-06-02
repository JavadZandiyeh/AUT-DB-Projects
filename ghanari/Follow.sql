# in this query each user can follow other users (دنبال کردن)

# add new following relations   
insert ignore into follow values
	("Roshan Vali Khamosh", "AT"),
    ("poorya", "MJZandiyeh"),
    ("RahimRahim", "MJZandiyeh"),
    ("Roshan Vali Khamosh", "poorya"),
    ("MJZandiyeh", "RahimRahim"),
    ("Roshan Vali Khamosh", "RahimRahim"),
    ("AT", "Roshan Vali Khamosh"),
    ("FR", "poorya");

# FR is the follower of AT thus can not follow it again now
insert ignore into follow values
	("Roshan Vali Khamosh", "AT");
