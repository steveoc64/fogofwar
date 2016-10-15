truncate condition restart identity;
copy condition (id,name,effect) from stdin;
1	Parade Order	2
2	Battle Ready	1
3	Serviceable	0
4	Tattered	-1
5	Spent	-3
\.
select * from condition;