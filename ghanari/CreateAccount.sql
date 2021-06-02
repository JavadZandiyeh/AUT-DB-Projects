# this query creates some new accounts (ایجاد حساب کاربری)
# using hashed passwords with sha1 function
insert into user values(
	"Mohammad Javad",
    "Zandiyeh",
    "MJZandiyeh",
    sha1("ghanari.javad"),
    "2000-11-20",
    current_timestamp(),
    "BS Computer student at AUT"
);

insert into user values(
	"Mohammad Reza",
    "Rahimian",
    "RahimRahim",
    sha1("ghanari.rahim"),
    "2001-10-17",
    current_timestamp(),
    "BS Computer student at AUT"
);

insert into user values(
	"Ali",
    "Roshan Fekr",
    "Roshan Vali Khamosh",
    sha1("ghanari.roshan"),
    "1998-2-22",
    current_timestamp(),
    "A User Without any bio:)"
);

insert into user values(
	"Ali Reza",
    "Taghavi",
    "AT",
    sha1("ghanari.taghavi"),
    "2012-12-02",
    current_timestamp(),
    "bioooo:)"
);

insert into user values(
	"farzad",
    "poorya",
    "poorya",
    sha1("ghanari.farzad"),
    "1998-11-01",
    current_timestamp(),
    "bio nadaram"
);

insert into user values(
	"farzad",
    "radnia",
    "FR",
    sha1("ghanari.farzad"),
    "2000-01-10",
    current_timestamp(),
    "codeeeeee"
);