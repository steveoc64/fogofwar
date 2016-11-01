-- drop table if exists campaign;
-- drop table if exists scenario_cmd;
-- drop table if exists cmd;

-- create table migration (
-- 	id serial not null primary key,
-- 	name text,
-- 	date timestamptz not null default localtimestamp
-- );


-- drop table if exists users;
-- create table users (
-- 	id serial not null primary key,
-- 	username text not null unique,
-- 	passwd text not null,
-- 	name text not null,
-- 	email text not null unique,
-- 	rank int not null default 1,
-- 	created timestamptz not null default localtimestamp,
-- 	expires timestamptz not null default localtimestamp,
-- 	channel int not null default 0,
-- 	ip_address text not null default '',
-- 	country text not null default '',
-- 	bloglink text not null default '',
-- 	notes text not null default '',
-- 	banned bool not null default false,
-- 	disqus bool not null default true,
-- 	newsletter bool not null default true
-- );
-- \i data/users.sql

-- drop table if exists login;
-- create unlogged table login (
-- 	user_id int not null,
-- 	date timestamptz not null default localtimestamp,
-- 	ip_address text not null default '',
-- 	channel int not null default 0,
-- 	up bool default true
-- );
-- create index login_date_idx on login(date);
-- create index login_user_idx on login(user_id,up);

-- drop table if exists vcode;
-- create unlogged table vcode (
-- 	uid int not null primary key,
-- 	code text not null default '',
-- 	expires timestamp default now() + interval '2 hour'
-- );

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
\i data/stdimg.sql

-- create extension ltree;
-- create extension postgis;
-- create extension cube;
-- create extension earthdistance;

-- cmd levels
-- 1 Army
-- 2 Corps
-- 3 Division
-- 4 Brigade
-- 5 Battalion
drop table if exists cmd_level;
create table cmd_level (
	id serial not null primary key,
	name text not null default ''
);
\i data/cmd_level.sql 

drop table if exists cmd_rating;
create table cmd_rating (
	id serial not null primary key,
	name text not null default '',
	effect int not null default 0
);
\i data/cmd_rating.sql

drop table if exists inspiration;
create table inspiration (
	id serial not null primary key,
	name text not null default '',
	effect int not null default 0
);
\i data/inspiration.sql

drop table if exists condition;
create table condition (
	id serial not null primary key,
	name text not null default '',
	effect int not null default 0
);
\i data/condition.sql

drop table if exists gt_formation;
create table gt_formation (
	id serial not null primary key,
	name text,
	speed int,
	cav_defence bool,
	march bool,
	static bool
);
\i data/gt_formation.sql


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
\i data/utype.sql

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
	code text not null default '',
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
\i data/rating.sql

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
	lines bool,
	mixed bool,
	att_col bool,
	close_col bool,
	oblique bool,
	square bool,
	mob bool,
	control int not null default 1,
	speed int not null default 1
);
\i data/drill.sql

drop table if exists small_arms;
create table small_arms (
	id serial not null primary key,
	name text not null default '',
	ranges int[4],
	effects int[4][6],
	covered int[4][6]
);
\i data/small_arms.sql

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
\i data/gunnery.sql

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
\i data/cav_type.sql

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
\i data/cmd_action.sql;

drop table if exists orders;
create table orders (
	id serial not null primary key,
	name text not null default '',
	min_rank int not null default 0,
	objective bool,
	enemy_unit bool,
	friendly_unit bool
);
\i data/orders.sql









-- Scenario Level Data

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
	public bool default false,
	review bool default false, 
	latlon point,
	red_team text not null default '',
	red_brief text not null default '',
	blue_team text not null default '',
	blue_brief text not null default ''
);
\i data/scenario.sql
-- drop index if exists scenario_campaign_idx;
-- create index scenario_campaign_idx on scenario (campaign_id);
drop index if exists scenario_author_idx;
create index scenario_author_idx on scenario (author_id);

drop table if exists force;
create table force (
	id serial not null primary key,
	scenario_id int not null default 0,
	red_team bool,
	blue_team bool,
	nation text not null default '',
	name text not null default '',
	commander_name text not null default '',
	level int not null default 1,
	descr text not null default '',
	rating int not null default 0,
	inspiration int not null default 0,
	condition int not null default 2
);
\i data/force.sql
drop index if exists force_scenario_idx;
create index force_scenario_idx on force (scenario_id);


drop table if exists force_unit;
create table force_unit (
	id serial not null primary key,
	force_id int not null,
	path ltree,
	name text not null default '',
	descr text not null default '',
	commander_name text not null default '',
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
	gun_condition int not null default 2,
	horse_guns bool default false
);
\i data/force_unit.sql
drop index if exists force_unit_force_idx;
create index force_unit_force_idx on force_unit (force_id);












-- Game Level Data 
-- All data from here on is mostly temporary, and those 
-- files which take lots of small updates are set to unlogged for speed

drop table if exists game;
create table game (
	id serial not null primary key,
	scenario_id int not null,
	hosted_by int not null default 0,
	created timestamptz not null default localtimestamp,
	start_date timestamptz not null default localtimestamp,
	expires timestamptz not null default localtimestamp,
	started  bool not null default false,
	stopped  bool not null default false,
	paused   bool not null default false,
	turn int not null default 0,
	phase int not null default 0,
	turn_limit int not null default 12,
	name text not null default '',
	descr text not null default '',
	notes text not null default '',
	year int not null default 1800,
	latlon point,
	red_team text not null default '',
	red_brief text not null default '',
	blue_team text not null default '',
	blue_brief text not null default '',
	table_x int not null default 6,
	table_y int not null default 4,
	grid_size int not null default 6,
	check_table bool default false,
	check_objectives bool default false,
	check_forces bool default false,
	check_players bool default false,
	check_connected bool default false,
	red_flip bool not null default false,
	blue_flip bool not null default true
);
\i data/game.sql
create index game_scenario_idx on game (scenario_id);

drop table if exists game_objective;
create table game_objective (
	game_id int not null,
	name text not null default '',
	X int not null default 0,
	Y int not null default 0,
	vp_per_turn int not null default 1,
	red_vp int not null default 20,
	blue_vp int not null default 20,
	current_owner int not null default 0
);
\i data/game_objective.sql
create index obj_game_idx on game_objective (game_id);


drop table if exists tiles;
create unlogged table tiles (
	game_id int not null,
	i int not null,
	height  int,
	content int,
	owner   int
);
\i data/tiles.sql
create index tiles_game_idx on tiles (game_id,i);

drop table if exists game_condition;
-- TODO create table

drop table if exists game_players;
create table game_players (
	game_id int not null,
	player_id int not null,
	red_team bool not null default false,
	blue_team bool not null default false,
	accepted bool not null default false
);
\i data/game_players.sql
create unique index game_player_game_idx on game_players (game_id, player_id);
create unique index game_player_player_idx on game_players (player_id,game_id);

drop table if exists game_cmd;
create  table game_cmd (
	id serial not null primary key,
	game_id int not null default 0,
	start_turn int not null default 1,
	start_x int not null default -1,
	start_y int not null default -1,
	red_team bool not null default false,
	blue_team bool not null default false,
	nation text not null default '',
	name text not null default '',
	commander_name text not null default '',
	level int not null default 1,
	descr text not null default '',
	rating int not null default 0,
	inspiration int not null default 0,
	condition int not null default 2,
	player_id int not null default 0,
	player_ready bool not null default 'f',
	vp int not null default 0,
	cull bool not null default 't'
);
\i data/game_cmd.sql
create index game_cmd_game_idx on game_cmd (game_id);

drop table if exists game_cmd_order;
create  table game_cmd_order (
	game_id int not null,
	cmd_id int not null,
	turns int not null default 2,  -- Once hits 0, stick. If counts down to 0, replaces existing
	new_order int not null,
	objective int not null default 0,
	enemy int not null default 0,
	friend int not null default 0
);
\i data/game_cmd_order.sql
drop index if exists game_cmd_order_game_idx;
drop index if exists game_cmd_order_cmd_idx;
create index game_cmd_order_game_idx on game_cmd_order (game_id);
create index game_cmd_order_cmd_idx on game_cmd_order (cmd_id);

drop table if exists game_cmd_player;

drop table if exists game_unit;
drop table if exists unit;
create unlogged table unit (
	id serial not null primary key,
	cmd_id int not null,
	game_id int not null,
	path ltree,
	name text not null default '',
	descr text not null default '',
	commander_name text not null default '',
	commander_control int not null default 10, -- 0-10 = remaining control points to spend  -1 = injured, -2 = dead
	nation text not null default '',
	utype int not null default 1,
	condition int not null default 2,
	cmd_level int not null default 1,
	drill int not null default 1,
	deploy_to int not null default 1, -- 0 advance, 1st Line, 2nd Line, 3 Left Flnk, 4 R Flnk, 5..6.. Reserve lines
	gt_formation int not null default 1,  
	sk_out bool not null default false,
	woods bool not null default false,
	rough bool not null default false,
	cover bool not null default false,
	rflank bool not null default false,
	lflank bool not null default false,
	has_support bool not null default false,
	bayonets int not null default 0,
	bayonets_lost int not null default 0,
	bayonets_mstate int not null default 0,  -- 0 Good 1,2 Repulsed 3,4,5,6 Defeated 12 TotalDefeat
	bayonets_moved bool not null default false,
	bayonets_fired bool not null default false,
	small_arms int not null default 0,
	elite_arms int not null default 0,
	lt_coy int not null default 0,
	jg_coy int not null default 0,
	rifles bool not null default false,
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
	guns_fired bool not null default false,
	guns_moved bool not null default false,
	guns_limbered bool not null default false,
	guns_mstate int not null default 0,
	gunnery_type int not null default 0,
	horse_guns bool not null default false,
	gun_max_condition int not null default 2,
	gun_condition int not null default 2
);
\i data/unit.sql
create index unit_cmd_idx on unit (cmd_id);
create index unit_game_idx on unit (game_id);

drop table if exists contact_message;
create table contact_message (
	id serial not null primary key,
	user_id int,
	date timestamptz not null default localtimestamp,
	ref_id int,
	email_to text not null default '',
	subject text not null default '',
	message text not null default ''
);
create index contact_user_idx on contact_message (user_id, date);

drop table if exists paypal;
create table paypal (
	id serial not null primary key,
	payment_id text not null default '',
	payer_id text not null default '',
	token text not null default '',
	amount numeric(8,2) not null default 0,
	created timestamptz not null default localtimestamp,
	user_id int not null default 0,
	channel int not null default 0,
	sale_id text not null default '',
	approved bool not null default false,
	descr text not null default '',
	rank int not null default 1,
	months int not null default 1,
	end_date date not null
);
create unique index paypal_payment_idx on paypal (payment_id);

