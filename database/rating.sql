truncate rating restart identity;
copy rating (id,code,name,shock,form_close,form_engage,sk_close,attack_superior,attack_guns,fire_bonus,melee_bonus,ammo) from stdin;
1	Guard	Guard	1	1	1	1	1	1	1	2	10
2	Grend	Grenadier	1	1	1	1	1	1	1	2	9
3	Elite	Elite	0	1	1	1	1	1	1	1	8
4	Crack	Crack Line	0	1	1	0	1	1	1	1	7
5	Reglr	Regular Line	0	0	1	0	1	1	0	0	7
6	2ndLn	Reserve Line	0	0	0	0	1	1	0	0	6
7	Consr	Conscript	0	0	0	0	0	1	0	-1	6
8	Landw	Landwehr	0	0	0	0	0	0	-1	-1	5
9	Milit	Militia	0	0	0	0	0	0	0	-1	7
10	Mob	Rabble	1	0	0	0	1	0	-2	-2	2
\.
select * from rating;