truncate gunnery restart identity;
copy gunnery (id,name,hw,ranges,good_effect,bad_effect,cannister,cannister_bad) from stdin;
1	12lb	0	{0,1,2,4}	{{8,8,13,13,13,20},{5,5,9,9,10,14},{3,3,3,5,5,7},{2,2,3,3,3,4}}	{{4,4,7,7,7,7},{3,3,5,5,5,5},{2,2,2,2,2,2},{1,1,1,1,1,1}}	{{15,15,26,26,30,40},{10,10,16,17,20,27},{8,8,14,14,16,21}}	{{7,7,9,9,9,9},{5,5,5,6,6,6},{4,4,4,4,4,4}}
2	6lb	0	{0,1,2,3}	{{6,10,10,12,12,16},{4,7,7,8,8,11},{2,2,2,3,3,5},{2,2,3,4,4,6}}	{{3,3,5,5,6,8},{2,2,3,3,5,5},{1,1,1,1,2,2},{1,1,2,2,2,3}}	{{12,20,20,24,24,32},{8,13,13,16,16,21},{6,10,10,12,12,16}}	{{4,4,5,5,8,12},{3,3,3,3,5,8},{2,2,3,3,4,6}}
3	Light Guns	0	{0,1}	{{4,6,6,8,8,8},{3,4,4,4,5,7}}	{{1,2,3,3,4,5},{1,1,1,2,2,3}}	{{10,15,15,18,18,24},{4,6,6,8,8,10}}	{{2,3,3,3,5,8},{0,1,1,1,2,5}}
4	Howitzer	1	{0,1,2,3}	{{0,0,0,0,0,0},{3,5,5,6,6,8},{2,4,4,5,5,6},{1,2,2,2,2,3}}	{{0,0,0,0,0,0},{2,2,3,3,3,5},{1,1,2,2,2,4},{0,0,1,1,1,2}}	{{0,0,0,0,0,0},{5,7,7,8,8,11},{3,5,5,6,6,8}}	{{0,0,0,0,0,0},{3,3,4,4,5,7},{2,2,3,3,3,5}}
\.
select * from gunnery;
	-- id serial not null primary key,
	-- name text not null default '',
	-- cannister int[3][6],
	-- cannister_bad int[3][6],
	-- ranges int[4],
	-- good_effect int[4][6],
	-- bad_effect int[4][6],
	-- hw bool,
	-- hw_fire int,
	-- roll int 