truncate cmd_level restart identity;
copy cmd_level (id,name) from stdin;
1	Army
2	Corps
3	Division
4	Brigade
5	Battalion
6	Company
\.
select * from cmd_level;