truncate drill restart identity;
copy drill (id,name,ranks,flankers,elite_coy,third_rank,open_order,line,mixed,att_col,close_col,oblique,square,mob,control,speed) from stdin;
1	Linear	3	0	0	0	0	1	0	0	1	1	1	0	8	2
2	Green Conscript	3	0	0	0	0	1	0	0	1	0	0	1	4	1
3	Basic Training	3	0	0	1	0	1	0	1	1	0	0	0	5	2
4	Prussian Reformed	3	0	0	1	0	1	1	1	0	0	1	0	6	2
5	French Drilled	3	0	1	0	1	1	1	1	1	0	1	0	8	3
6	British Drilled	2	1	0	0	1	1	1	1	0	1	1	0	9	2
7	Irregular Light Infantry	2	0	0	0	1	1	0	0	1	0	0	1	3	3
8	Drilled Light Infantry	2	0	1	0	1	1	0	0	0	1	1	0	7	4
\.
select * from drill;