drop table if exists users;
create table users (
	id serial not null primary key,
	username text not null unique,
	passwd text not null,
	name text not null,
	email text not null unique,
	rank int not null default 1,
	created timestamptz not null default localtimestamp,
	expires timestamptz not null default localtimestamp,
	channel int not null default 0,
	ip_address text not null default '',
	country text not null default '',
	bloglink text not null default '',
	notes text not null default '',
	banned bool not null default false,
	disqus bool not null default true,
	newsletter bool not null default true
);
\i users.sql

drop table if exists login;
create table login (
	user_id int not null,
	date timestamptz not null default localtimestamp,
	ip_address text not null default '',
	channel int not null default 0
);
create index login_date_idx on login(date);
create index login_user_idx on login(user_id);

drop table if exists vcode;
create table vcode (
	uid int not null primary key,
	code text not null default '',
	expires timestamp default now() + interval '2 hour'
);

drop table if exists user_rego;
create table user_rego (
	user_id int not null default 0,
	created timestamptz not null default localtimestamp,
	expires timestamptz not null default localtimestamp,
	charge numeric(8,2),
	receipt text not null default ''
);
create index user_rego_idx on user_rego (user_id, created);

drop table if exists stdimg;
create table stdimg (
	id serial not null primary key,
	code text not null default '',	
	name text not null default '',
	photo text not null default '',
	preview text not null default '',
	thumb	text not null default ''
);
\i stdimg.sql

create extension ltree;
-- create extension postgis;
-- create extension cube;
-- create extension earthdistance;

drop table if exists campaign;
create table campaign (
	id serial not null primary key,
	author_id int not null default 0,
	forked_from int not null default 0,
	name text not null default '',
	year int not null default 1800,
	descr text not null default '',
	notes text not null default '',
	-- latlon geography(point,4326)
	latlon point,
	public bool default true
);
\i campaign.sql
create index campaign_author_idx on campaign(author_id);
create index campaign_fork_idx on campaign(forked_from);

drop table if exists army;
create table army (
	id serial not null primary key,
	campaign_id int not null,
	name text not null default '',
	nation text not null default '',
	descr text not null default ''
);
drop index if exists army_campaign_idx;
create index army_campaign_idx on army(campaign_id);

-- cmd levels
-- 1 Wing
-- 2 Corps
-- 3 Division
-- 4 Brigade
-- 5 Battalion

drop table if exists cmd;
create table cmd (
	id serial not null primary key,
	army_id int not null,
	nation text not null default '',
	name text not null default '',
	level int not null default 1,
	descr text not null default '',
	rating int not null default 0,
	inspiration int not null default 0
);
drop index if exists cmd_army_idx;
create index cmd_army_idx on cmd(army_id);

-- unit type
-- 1 Command
-- 2 Infantry Brigade
-- 3 Cavalry Brigade
-- 4 Artillery Reserve
-- 5 Other / Asset
drop table if exists utype;
create table utype (
	id serial not null primary key,
	name text not null default ''
);
\. utype.sql

-- ratings
-- 1 Guard
-- 2 Grenadier
-- 3 Elite
-- 4 Crack Line
-- 5 Regular Line
-- 6 2nd Rate / Reserve Line
-- 7 Conscript
-- 8 Landwehr
-- 9 Militia
-- 10 Rabble
drop table if exists rating;
create table rating (
	id serial not null primary key,
	name text not null default '',
	shock bool,
	form_close bool,
	form_engage bool,
	sk_close bool,
	attack_superior bool,
	attack_guns bool,
	fire_bonus int not null default 0,
	melee_bonus int not null default 0,
	ammo int not null default 10
);
\i rating.sql

-- Drill
-- 1 Old School Linear
-- 2 Conscript 
-- 3 Reformed Prussian System
-- 4 French System
-- 5 British System
drop table if exists drill;
create table drill (
	id serial not null primary key,
	name text not null default '',
	ranks int not null default 3,
	flankers bool,
	elite_coy bool,
	third_rank bool,
	open_order bool,
	line bool,
	mixed bool,
	att_col bool,
	close_col bool,
	oblique bool,
	square bool,
	mob bool,
	control int not null default 1,
	speed int not null default 1
);
\i drill.sql

-- conditions
-- 1 Superior
-- 2 Good
-- 3 Adequate
-- 4 Shoddy
-- 5 Spent 

drop table if exists small_arms;
create table small_arms (
	id serial not null primary key,
	name text not null default '',
	ranges int[4],
	effects int[4][6],
	covered int[4][6]
);
\i small_arms

drop table if exists gunnery;
create table gunnery (
	id serial not null primary key,
	name text not null default '',
	cannister int[3][6],
	cannister_bad int[3][6],
	ranges int[4],
	good_effect int[4][6],
	bad_effect int[4][6],
	hw bool
);
\i gunnery.sql

drop table if exists cav_type;
create table cav_type (
	id serial not null primary key,
	name text not null default '',
	weight int not null default 1, -- Light Medium Heavy
	battle bool,
	lances bool,
	dragoon bool,
	cossack bool,
	dubious bool
);
\i cav_type.sql

drop table if exists unit;
create table unit (
	id serial not null primary key,
	cmd_id int not null default 0,
	path ltree,
	name text not null default '',
	nation text not null default '',
	utype int not null default 1,
	cmd_level int not null default 1,
	drill int not null default 1,
	bayonets int not null default 0,
	small_arms int not null default 0,
	elite_arms int not null default 0,
	lt_coy int not null default 0,
	jg_coy int not null default 0,
	rating int not null default 5,
	sabres int not null default 0,
	cav_type int not null default 0,
	cav_rating int not null default 0,
	guns int not null default 0,
	gunnery_type int not null default 0,
	gun_condition int not null default 2
);
create index unit_cmd_idx on unit (cmd_id);

drop table if exists cmd_action;
create table cmd_action (
	id serial not null primary key,
	descr text not null default '',
	chance int not null default 1, -- -1 each attempt, -1 repulsed, -2 defeated, -1 engaged  
	rank int not null default 0,
	level int not null default 0,
	attach bool,
	cav bool,
	gun bool,
	sk bool,
	bayonet bool,
	not_engaged bool,
	engaged bool,
	repulsed bool,
	defeated bool
);
\i cmd_action.sql;

drop table if exists orders;
create table orders (
	id serial not null primary key,
	name text not null default '',
	min_rank int not null default 0,
	objective bool,
	enemy_unit bool,
	friendly_unit bool
);
\i orders.sql

drop table if exists scenario;
create table scenario (
	id serial not null primary key,
	campaign_id int not null default 0,
	author_id int not null default 0,
	created timestamptz not null default localtimestamp,
	forked_from int not null default 0,
	name text not null default '',
	descr text not null default '',
	notes text not null default '',
	year int not null default 1800,
	public bool default true,
	latlon point,
	red_team text not null default '',
	red_brief text not null default '',
	blue_team text not null default '',
	blue_brief text not null default ''
);
\i scenario.sql
-- drop index if exists scenario_campaign_idx;
-- create index scenario_campaign_idx on scenario (campaign_id);
drop index if exists scenario_author_idx;
create index scenario_author_idx on scenario (author_id);

drop table if exists scenario_cmd;
create table scenario_cmd (
	id serial not null primary key,
	scenario_id int not null default 0,
	red_team bool,
	blue_team bool,
	nation text not null default '',
	name text not null default '',
	level int not null default 1,
	descr text not null default '',
	rating int not null default 0,
	inspiration int not null default 0,
	condition int not null default 2
);
\i scenario_cmd.sql
drop index if exists scenario_cmd_scenario_idx;
create index scenario_cmd_scenario_idx on scenario_cmd (scenario_id);


drop table if exists scenario_unit;
create table scenario_unit (
	id serial not null primary key,
	cmd_id int not null,
	path ltree,
	name text not null default '',
	nation text not null default '',
	utype int not null default 1,
	condition int not null default 2,
	cmd_level int not null default 1,
	drill int not null default 1,
	bayonets int not null default 0,
	small_arms int not null default 0,
	elite_arms int not null default 0,
	lt_coy int not null default 0,
	jg_coy int not null default 0,
	rating int not null default 5,
	sabres int not null default 0,
	cav_type int not null default 0,
	cav_rating int not null default 0,
	guns int not null default 0,
	gunnery_type int not null default 0,
	gun_condition int not null default 2
);
drop index if exists scenario_unit_cmd_idx;
create index scenario_unit_cmd_idx on scenario_unit (cmd_id);

drop table if exists game;
create table game (
	id serial not null primary key,
	scenario_id int not null,
	hosted_by int not null default 0,
	created timestamptz not null default localtimestamp,
	expires timestamptz not null default localtimestamp,
	turn int not null default 1,
	turn_limit int not null default 1
);
create index game_scenario_idx on game (scenario_id);

drop table if exists game_objective;
-- TODO create table

drop table if exists game_condition;
-- TODO create table

drop table if exists game_players;
create table game_players (
	game_id int not null,
	player_id int not null,
	red_team bool,
	blue_team bool
);
create unique index game_player_game_idx on game_players (game_id, player_id);
create unique index game_player_player_idx on game_players (player_id,game_id);

drop table if exists game_cmd;
create table game_cmd (
	id serial not null primary key,
	game_id int not null default 0,
	red_team bool,
	blue_team bool,
	nation text not null default '',
	name text not null default '',
	level int not null default 1,
	descr text not null default '',
	rating int not null default 0,
	inspiration int not null default 0,
	condition int not null default 2
);
create index game_cmd_game_idx on game_cmd (game_id);

drop table if exists game_cmd_order;
create table game_cmd_order (
	game_id int not null,
	cmd_id int not null,
	turns int not null default 2,  -- Once hits 0, stick. If counts down to 0, replaces existing
	new_order int not null,
	objective int not null default 0,
	enemy int not null default 0,
	friend int not null default 0
);
drop index if exists game_cmd_order_game_idx;
drop index if exists game_cmd_order_cmd_idx;
create index game_cmd_order_game_idx on game_cmd_order (game_id);
create index game_cmd_order_cmd_idx on game_cmd_order (cmd_id);

drop table if exists game_cmd_player;
create table game_cmd_player (
	cmd_id int not null,
	player_id int not null
);
create unique index game_cmd_player_player_idx on game_cmd_player (player_id,cmd_id);
create unique index game_cmd_player_cmd_idx on game_cmd_player (cmd_id,player_id);

drop table if exists gt_formation;
create table gt_formation (
	id serial not null primary key,
	name text,
	speed int,
	cav_defence bool,
	march bool,
	static bool
);

drop table if exists game_unit;
create table game_unit (
	id serial not null primary key,
	cmd_id int not null,
	path ltree,
	name text not null default '',
	commander_control int not null default 10, -- 0-10 = remaining control points to spend  -1 = injured, -2 = dead
	nation text not null default '',
	utype int not null default 1,
	condition int not null default 2,
	cmd_level int not null default 1,
	drill int not null default 1,
	table_sector int not null default 0, -- 0 left, 1 Centre, 2 Right
	deploy_to int not null default 1, -- 0 advance, 1st Line, 2nd Line, 3 Left Flnk, 4 R Flnk, 5..6.. Reserve lines
	gt_formation int not null default 1,  
	sk_out bool,
	woods bool,
	rough bool,
	cover bool,
	rflank bool,
	lflank bool,
	has_support bool,
	bayonets int not null default 0,
	bayonets_lost int not null default 0,
	bayonets_mstate int not null default 0,  -- 0 Good 1,2 Repulsed 3,4,5,6 Defeated 12 TotalDefeat
	bayonets_moved bool,
	bayonets_fired bool,
	small_arms int not null default 0,
	elite_arms int not null default 0,
	lt_coy int not null default 0,
	rifles bool,
	lt_lost int not null default 0,
	lt_mstate int not null default 0,  -- 0 Good 1,2 Repulsed 3,4,5,6 Defeated 12 TotalDefeat
	rating int not null default 5,
	sabres int not null default 0,
	sabres_lost int not null default 0,
	sabres_mstate int not null default 0,
	sabres_charged int not null default 0,  -- 3,2,1 Blown  0 Fresh
	cav_type int not null default 0,
	cav_rating int not null default 0,
	guns int not null default 0,
	guns_lost int not null default 0,
	guns_fired bool,
	guns_moved bool,
	guns_limbered bool,
	guns_mstate int not null default 0,
	gunnery_type int not null default 0,
	gun_max_condition int not null default 2,
	gun_condition int not null default 2
);
create index game_unit_cmd_idx on game_unit (cmd_id);







