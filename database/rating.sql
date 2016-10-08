truncate rating restart identity;
copy rating (id,name,shock,form_close,form_engage,sk_close,attack_superior,attack_guns,fire_bonus,melee_bonus,ammo) from stdin;
1	Guard	1	1	1	1	1	1	1	2	10
2	Grenadier	1	1	1	1	1	1	1	2	9
3	Elite	0	1	1	1	1	1	1	1	8
4	Crack Line	0	1	1	0	1	1	1	1	7
5	Regular Line	0	0	1	0	1	1	0	0	7
6	Reserve Line	0	0	0	0	1	1	0	0	6
7	Conscript	0	0	0	0	0	1	0	-1	6
8	Landwehr	0	0	0	0	0	0	-1	-1	5
9	Militia	0	0	0	0	0	0	0	-1	7
10	Rabble	1	0	0	0	1	0	-2	-2	2
\.
select * from rating;