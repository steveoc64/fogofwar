truncate force_unit restart identity;
COPY force_unit (id, force_id, path, name, commander_name, nation, utype, cmd_level, drill, bayonets, small_arms, elite_arms, lt_coy, jg_coy, rating, sabres, cav_type, cav_rating, guns, gunnery_type, gun_condition, horse_guns) FROM stdin;
13	2	2nd_Division.45e_Ligne	45e Ligne	Rivaud	France	2	4	5	2000	1	0	0	0	5	0	0	0	0	0	0	f
4	1	Infantry_Division	Infantry Division	Lefebvre	France	1	3	1	0	0	0	0	0	5	0	0	0	0	0	2	f
14	2	2nd_Division.54e_Ligne	54e Ligne	Rivaud	France	2	4	5	2000	1	0	0	0	5	0	0	0	0	0	0	f
5	1	Cavalry_Division	Cavalry Division	Bessieres	France	1	3	1	0	0	0	0	0	5	0	0	0	0	0	2	f
7	2	2eme_Division	2eme Division	Rivaud	France	1	3	1	0	0	0	0	0	3	0	0	0	0	0	2	f
18	2	3rd_Division.95e_Ligne	95e Ligne	Drouet	France	2	4	5	2600	1	0	0	0	5	0	0	0	0	0	0	f
16	2	3rd_Division.27e_Legere	27e Legere	Drouet	France	2	4	6	1500	1	0	2	0	5	0	0	0	0	3	0	f
11	2	1st_Division.32e_Ligne	32e Ligne	de l'Eltang	France	2	4	5	2000	1	0	0	0	4	0	0	0	0	0	0	f
6	2	1eme_Division	1eme Division	de l'Eltang	France	1	3	1	0	0	0	0	0	3	0	0	0	0	0	2	f
8	2	3rd_Division	3rd Division	Drouet	France	1	3	1	0	0	0	0	0	4	0	0	0	0	0	2	f
12	2	1st_Division.96e_Ligne	96e Ligne	de l'Eltang	France	2	4	5	2000	1	0	0	0	5	0	0	0	0	0	0	f
9	2	1st_Division.9e_Legere	9e Legere	de l'Eltang	France	2	4	6	2600	1	2	0	0	4	0	0	0	0	3	0	f
30	2	1st_Division.Md_Foot_Bty	Md Foot Bty			4	4	0	0	0	0	0	0	0	0	0	0	8	2	3	f
31	2	2nd_Division.Md_Foot_Bty	Md Foot Bty			4	4	0	0	0	0	0	0	0	0	0	0	8	2	3	f
32	2	3rd_Division.Md_Foot_Bty	Md Foot Bty			4	4	0	0	0	0	0	0	0	0	0	0	8	2	3	f
10	2	2nd_Division.4e_Legere	4e Legere	Rivaud	France	2	4	6	2000	1	0	1	0	5	0	0	0	0	0	0	f
17	2	3rd_Division.94e_Ligne	94e Ligne	Drouet	France	2	4	5	1500	1	0	0	0	5	0	0	0	0	0	0	f
\.
select * from force_unit order by id;
select setval(pg_get_serial_sequence('force_unit','id'),(select max(id) from force_unit) ); 
