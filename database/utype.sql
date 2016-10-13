truncate utype restart identity;
copy utype (id,name) from stdin;
1	Command
2	Infantry Brigade
3	Cavalry Brigade
4	Artillery Battery
5	Other Detachment
\.
select * from utype;
