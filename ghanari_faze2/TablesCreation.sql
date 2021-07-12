# this query used for creating tables of the database (ساخت جداول مورد نیاز سامانه)

create table user(
	FirstName varchar(20) not null,
    LastName varchar(20) not null,
    Username varchar(20) not null,
    Password varchar(128) not null,
    Birthday date,
    MembershipDate timestamp not null,
    Biography varchar(64),
    primary key (Username)
);

create table login_details(
	id int not null auto_increment,
    Username varchar(20) not null,
    Login timestamp not null,
    primary key(id),
    foreign key(Username) references user(Username)
);

create table ava(
	id int not null auto_increment,
    Content varchar(256) not null,
    Sender varchar(20) not null,
    SendingTime timestamp not null,
	CommentOn int,
    primary key(id),
    foreign key(Sender) references user(Username),
    foreign key(CommentOn) references ava(id)
);

create table ava_log(
	id int not null,
	Sender varchar(20) not null,
	SendingTime timestamp not null,
	primary key(id),
    foreign key(Sender) references user(Username)
);

create table hashtag(
	Content char(6) not null,
    NumberOfUsage int not null,
    primary key(Content)
);

create table hashtagOfEachAva(
	id int not null,
    Content char(6) not null,
	primary key(id, Content),
    foreign key(id) references ava(id),
    foreign key(Content) references hashtag(Content)
);

create table follow(
	Follower varchar(20) not null,
    ToBeFollowed varchar(20) not null,
    primary key(Follower, ToBeFollowed),
    foreign key(Follower) references user(Username),
	foreign key(ToBeFollowed) references user(Username)
);

create table block(
	Blocked varchar(20) not null,
    Blocker varchar(20) not null,
    primary key(Blocked, Blocker),
    foreign key(Blocked) references user(Username),
	foreign key(Blocker) references user(Username)
);

create table avaLike(
	WhoLiked varchar(20) not null,
	Ava int not null,
    primary key(WhoLiked, Ava),
    foreign key(WhoLiked) references user(Username),
    foreign key(Ava) references ava(id)
);

create table message(
	id int not null auto_increment,
    ContentAva int,
    ContentText varchar(256),
    Sender varchar(20) not null,
    Receiver varchar(20) not null,
    SendingTime timestamp not null,
    primary key(id),
    foreign key(ContentAva) references ava(id),
    foreign key(Sender) references user(Username),
    foreign key(Receiver) references user(Username)
);
