# this query used for logging in to the account (ورود به حساب کاربری)

# correct Password and Username --> login and save details to login_details table
insert into login_details (Username, Login)
    select Username, current_timestamp()
	from user
    where Username = "AT" and Password = sha1("ghanari.taghavi");

insert into login_details (Username, Login)
	select Username, current_timestamp()
	from user
	where Username = "MJZandiyeh" and Password = sha1("ghanari.javad");

# incorrect Password --> can not login and nothing save on login_details table
insert into login_details (Username, Login)
	select Username, current_timestamp()
	from user
	where Username = "MJZandiyeh" and Password = sha1("ghanari.l;askfn");
