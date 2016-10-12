truncate condition restart identity;
copy condition (id,name,effect) from stdin;
1	Excellent	2
2	Good	1
3	Adequate	0
4	Poor	-1
5	Spent	-3
\.
select * from condition;