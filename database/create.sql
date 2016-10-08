drop table if exists users;
create table users (
	id serial not null primary key,
	username text not null unique,
	passwd text not null,
	name text not null,
	email text not null unique,
	rank int not null default 1,
	channel int not null default 0,
	country text not null default '',
	bloglink text not null default '',
	notes text not null default ''
);

drop table if exists vcode;
create table vcode (
	uid int not null primary key,
	code text not null default '',
	expires timestamp default now() + interval '2 hour'
);

drop table if exists stdimg;
create table stdimg (
	id serial not null primary key,
	code text not null default '',	
	name text not null default '',
	photo text not null default '',
	preview text not null default '',
	thumb	text not null default ''
);

create extension ltree;
-- create extension postgis;
-- create extension cube;
-- create extension earthdistance;

drop table if exists campaign;
create table campaign (
	id serial not null primary key,
	author int not null default 0,
	forked_from int not null default 0,
	name text not null default '',
	year int not null default 1800,
	-- latlon geography(point,4326)
	latlon point
);

drop table if exists army;
create table army (
	id serial not null primary key,
	campaign int not null,
	name text not null default '',
	descr text not null default ''
);

drop table if exists cmd;
create table cmd (
	id serial not null primary key,
	army int not null,
	name text not null default '',
	level int not null default 1,
	descr text not null default '',
	rating int not null default 0
);

drop table if exists unit;
create table unit (
);








