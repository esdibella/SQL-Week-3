create database if not exists social;

use social; 

drop table if exists post;

drop table if exists comment;

drop table if exists user;

create table user (
  user_id int(11) NOT NULL auto_increment,
  username char(50) NOT NULL,
  email char(50) NOT NULL,
  password char(50) NOT NULL,
  primary key (user_id)
);

create table post (
  post_id int(11) NOT NULL auto_increment,
  user_id int(11) NOT NULL,
  create_time datetime default current_timestamp,
  content varchar(500) NOT NULL,
  primary key (post_id),
  foreign key (user_id) references user(user_id)
);

create table comment (
  comment_id int(11) NOT NULL auto_increment,
  user_id int(11) NOT NULL,
  post_id int(11) NOT NULL,
  create_time datetime default current_timestamp,
  content varchar(500) NOT NULL,
  primary key (comment_id),
  foreign key (user_id) references user(user_id),
  foreign key (post_id) references post(post_id)
);

