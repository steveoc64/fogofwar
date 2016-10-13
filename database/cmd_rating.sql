truncate cmd_rating restart identity;
copy cmd_rating (id,name,effect) from stdin;
1	Magnificent	2
2	Excellent	1
3	Competent	0
4	Doddering Fool	-1
5	Blithering Idiot	-2
\.
select * from cmd_rating;