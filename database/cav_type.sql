truncate cav_type restart identity;
copy cav_type (id,name,weight,battle,lances,dragoon,cossack,dubious) from stdin;
1	Cuirassier	3	1	0	0	0	0
2	Hussar	1	1	0	0	0	0
3	Chasseur	1	0	0	1	0	0
4	Lancers	1	1	1	0	0	0
5	Dragoons	2	0	0	1	0	0
6	Cossack	1	0	1	0	1	0
7	Landwehr	2	0	1	0	0	1
8	Heavy Dragoons	3	1	0	0	0	0
9	Carabiniers	3	1	0	0	0	0
10	Mtd Jagers	1	0	0	1	0	0
11	Irregular	1	0	0	0	1	1
12	Lt Dragoons	1	0	0	1	0	0
\.
select * from cav_type;
