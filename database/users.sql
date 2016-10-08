truncate users restart identity;
copy users (id, username, passwd, name, email, rank, country, bloglink) from stdin;
1	steveoc64	unx911zxx	Steve O'Connor	steveoc64@gmail.com	10	Australia	http://15mm-madness.blogspot.com
2	kat	fysherdog	Kat Formato	kformato@gmail.com	1	Australia	http://witchwoodstudio.com
\.
select * from users;