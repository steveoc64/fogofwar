truncate inspiration restart identity;
copy inspiration (id,name,effect) from stdin;
1	Charismatic	2
2	Dashing	1
3	Respected	0
4	Unlikable	-1
5	Detested	-2
\.
select * from inspiration;