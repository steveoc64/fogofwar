truncate orders restart identity;
copy orders from stdin;
\.
select * from orders;