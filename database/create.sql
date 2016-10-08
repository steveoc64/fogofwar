drop table if exists users;
create table users (
	id serial not null primary key,
	username text not null unique,
	passwd text not null,
	name text not null,
	email text not null unique,
	rank int not null default 1,
	created timestamptz not null default localtimestamp,
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

drop table if exists user_rego;
create table user_rego (
	user_id int not null default 0,
	created timestamptz not null default localtimestamp,
	expires timestamptz not null default localtimestamp,
	charge numeric(8,2),
	receipt text not null default '',
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
	descr text not null default '',
	-- latlon geography(point,4326)
	latlon point
);
create index campaign_author_idx on campaign(author);
create index campaign_fork_idx on campaign(forked_from);

drop table if exists army;
create table army (
	id serial not null primary key,
	campaign_id int not null,
	name text not null default '',
	nation text not null default '',
	descr text not null default ''
);
create index army_campaign_idx on army(campaign_id)

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
create index cmd_army_idx on cmd(army);

-- unit type
-- 1 Command
-- 2 Infantry Brigade
-- 3 Cavalry Brigade
-- 4 Artillery Reserve
-- 5 Other / Asset
drop table if exists utype;
create table utype (
	int serial not null primary key,
	name text not null default ''
);

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
	melee_bonus int not null default 0
	ammo int not null default 10,
);

-- Drill
-- 1 Old School Linear
-- 2 Conscript 
-- 3 Reformed Prussian System
-- 4 French System
-- 5 British System
drop table if exists drill;
create table drill (
	int serial not null primary key,
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
	effects int[4][6]
);

drop table if exists gunnery;
create table gunnery (
	id serial not null primary key,
	name text not null default '',
	cannister_ranges int[2],
	cannister_effects int[2][6],
	ranges int[4],
	effects int[4][6],
	hw bool,
	hw_fire int,
	roll int 
);

drop table if exists cav_type;
create table cav_type (
	int serial not null primary key,
	name text not null default '',
	weight int not null default 1, -- Light Medium Heavy
	battle bool,
	lances bool,
	dragoon bool,
	cossack bool,
	dubious bool
);

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
	min_rank int not null default 0,
	min_level int not null default 0,
	attach bool,
	cav bool,
	gun bool,
	sk bool,
	bayonet bool,
	engaged bool,
	repulsed bool,
	defeated bool
);

drop table if exists orders;
create table orders (
	id serial not null primary key,
	name text not null default '',
	min_rank int not null default 0,
	objective bool,
	enemy_unit bool,
	friendly_unit bool
);

drop table if exists scenario;
create table screnario (
	id serial not null primary key,
	campaign_id int not null default 0,
	author int not null default 0,
	created timestamptz not null default localtimestamp,
	forked_from int not null default 0,
	name text not null default '',
	descr text not null default '',
	year int not null default 1800,
	latlon point,
	red_team text not null default '',
	red_brief text not null default '',
	blue_team text not null default '',
	blue_brief text not null default ''
);
create index scenario_campaign_idx on screnario (campaign_id);
create index scenario_author_idx on screnario (author);

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
create index scenario_cmd_scenario_idx on scenario_cmd (screnario_id);


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
create index screnario_unit_cmd_idx on screnario_cmd (cmd_id);

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

drop table if exsits game_objective;
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
	order int not null,
	objective int not null default 0,
	enemy int not null default 0
);
create index game_cmd_order_game_idx on game_cmd_order (game_id);
create index game_cmd_order_cmd_idx on game_cmd_order (game_id);

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
	commander_condition int not null default 10, -- 10 = in command, 1 = lost control 0 = injured, -1 = dead
	nation text not null default '',
	utype int not null default 1,
	condition int not null default 2,
	control int not null default 0,   -- 0 Ready, >0 = turns to restore order before fmt change
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
	jg_coy int not null default 0,
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
	gun_max_condition int not null default 2
	gun_condition int not null default 2
);
create index game_unit_cmd_idx on game_unit (cmd_id);








