truncate cmd_rating restart identity;
copy cmd_rating (id,name,effect) from stdin;
1	Magnificent	2
2	Excellent	1
3	Good	0
4	Poor	-1
5	Incompetent	-2
\.
select * from cmd_rating;