truncate cmd_action restart identity;
copy cmd_action (id,descr,chance,rank,level,attach,cav,gun,sk,bayonet,not_engaged,engaged,repulsed,defeated) from stdin;
1	Move Commander	1	1	3	1	1	1	1	1	1	1	1	0
2	Cavalry Charge	3	1	4	0	1	0	0	0	1	1	0	0
3	Skirmisher Screen	1	1	4	0	0	0	0	1	1	1	1	0
4	Recall Skirmishers	2	1	4	0	0	0	1	0	1	1	0	0
5	Cavalry Dismount	2	2	4	0	1	0	0	0	1	1	0	0
6	Cavalry Remount	3	2	4	0	1	0	0	0	1	1	0	0
7	Deploy Guns	3	1	3	0	0	1	0	0	1	0	0	0
8	Relocate Guns	3	2	3	0	0	1	0	0	1	0	0	0
9	Retire Guns	3	1	3	0	0	1	0	0	1	1	1	0
10	Cold Steel!	3	1	4	0	0	0	0	1	0	1	0	0
11	Fire!	2	1	4	0	0	0	0	1	0	1	0	0
12	Fall Back	1	1	3	0	1	0	1	1	0	1	1	1
13	Sauve Qui Peut!	3	2	2	0	1	1	1	1	1	1	1	1
14	Last Stand!	4	2	3	0	0	1	0	1	0	1	1	1
15	Form Bde Square	2	2	3	0	0	1	0	1	1	1	0	0
16	Redeploy under Fire	4	2	3	0	1	1	1	1	0	1	0	0
17	Change Formation / Facing	2	1	3	0	1	0	0	1	1	0	1	0
18	Halt!	2	2	3	0	1	1	1	1	1	1	0	0
19	Rally the Troops	3	2	3	0	1	1	1	1	1	0	1	1
20	Emergency Rally!	4	2	3	0	1	1	1	1	0	1	1	1
21	Detach Unit	2	2	3	0	1	1	1	1	1	0	0	0
22	Advance to Contact	2	2	3	0	0	0	1	1	1	0	0	0
23	Advance!	1	1	4	0	0	0	1	1	0	1	0	0
24	Prepare Defence	2	2	4	0	0	1	1	1	1	0	1	0
25	Bombardment	2	1	3	0	0	1	0	0	1	0	0	0
\.
select * from cmd_action;
	-- id serial not null primary key,
	-- descr text not null default '',
	-- min_rank int not null default 0,
	-- min_level int not null default 0,
	-- attach bool,
	-- cav bool,
	-- gun bool,
	-- sk bool,
	-- bayonet bool,
	-- engaged bool,
	-- repulsed bool,
	-- defeated bool