# this query used for creating tables of the database

create table user(
	FirstName varchar(20),
    LastName varchar(20),
    Username varchar(20),
    Password varchar(128),
    Birthday date,
    MembershipDate timestamp,
    Biography varchar(64),
    primary key (Username)
);

create table login_details(
	id int not null auto_increment,
    Username varchar(20),
    Login timestamp,
    primary key(id),
    foreign key(Username) references user(Username)
);

create table ava(
	id int not null auto_increment,
    Content varchar(256),
    Sender varchar(20),
    SendingTime timestamp,
	CommentOn int,
    primary key(id),
    foreign key(Sender) references user(Username),
    foreign key(CommentOn) references ava(id)
);
