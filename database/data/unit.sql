--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'SQL_ASCII';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

--
-- Data for Name: unit; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY unit (id, cmd_id, path, name, descr, commander_name, commander_control, nation, utype, condition, cmd_level, drill, deploy_to, gt_formation, sk_out, woods, rough, cover, rflank, lflank, has_support, bayonets, bayonets_lost, bayonets_mstate, bayonets_moved, bayonets_fired, small_arms, elite_arms, lt_coy, jg_coy, rifles, lt_lost, lt_mstate, rating, sabres, sabres_lost, sabres_mstate, sabres_charged, cav_type, cav_rating, guns, guns_lost, guns_fired, guns_moved, guns_limbered, guns_mstate, gunnery_type, horse_guns, gun_max_condition, gun_condition) FROM stdin;
1	1	Supply_Train	Supply Train		von Schulze	10	Prussia	1	2	6	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
2	1	Supply_Train.Guard_Detachment	Guard Detachment			10		5	2	6	8	1	1	\N	\N	\N	\N	\N	\N	\N	300	0	0	\N	\N	1	2	4	0	\N	0	0	10	60	0	0	0	12	7	0	0	\N	\N	\N	0	0	f	2	0
3	2	2eme_Division.Md_Foot_Bty	Md Foot Bty			10		4	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	8	0	\N	\N	\N	0	3	f	2	3
4	2	1eme_Division.Md_Foot_Bty	Md Foot Bty			10		4	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	8	0	\N	\N	\N	0	3	f	2	2
5	2	3eme_Division.Md_Foot_Bty	Md Foot Bty			10		4	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	8	0	\N	\N	\N	0	3	f	2	2
6	2	2eme_Division	2eme Division		Leval	10	France	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
7	2	2eme_Division.28e_Ligne	28e Ligne			10	France	2	2	1	5	1	1	\N	\N	\N	\N	\N	\N	\N	1400	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
8	2	1eme_Division.35e_Ligne	35e Ligne			10	France	2	2	4	5	1	1	\N	\N	\N	\N	\N	\N	\N	1400	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
9	2	3eme_Division.Corsican_Legere_Copy	Corsican Legere_Copy			10	France/Corsica	2	2	1	6	1	1	\N	\N	\N	\N	\N	\N	\N	1300	0	0	\N	\N	1	2	0	1	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
10	2	2eme_Division.46e_Ligne	46e Ligne			10	France	2	2	1	5	1	1	\N	\N	\N	\N	\N	\N	\N	1400	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
11	2	1eme_Division.43e_Ligne	43e Ligne			10	France	2	2	1	5	1	1	\N	\N	\N	\N	\N	\N	\N	1400	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
12	2	2eme_Division.24e_Legere	24e Legere			10	France	2	2	1	6	1	1	\N	\N	\N	\N	\N	\N	\N	2000	0	0	\N	\N	1	0	0	0	\N	0	0	4	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
13	2	2eme_Division.4e_Ligne	4e Ligne			10	France	2	2	1	5	1	1	\N	\N	\N	\N	\N	\N	\N	1400	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
14	2	1eme_Division	1eme Division		St Hilaire	10	France	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
15	2	3eme_Division.26e_Legere	26e Legere			10	France	2	2	4	6	1	1	\N	\N	\N	\N	\N	\N	\N	1600	0	0	\N	\N	1	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
16	2	1eme_Division.10e_Legere	10e Legere			10	France	2	2	4	6	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	4	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
17	2	2eme_Division.57e_Ligne	57e Ligne			10	France	2	2	1	5	1	1	\N	\N	\N	\N	\N	\N	\N	1700	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
18	2	3eme_Division.18e_Ligne	18e Ligne			10	France	2	2	4	5	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	4	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
19	2	Corps_Cavaly.22e_Chasseur	22e Chasseur			10	France	3	2	1	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	600	0	0	0	3	4	0	0	\N	\N	\N	0	0	f	2	0
20	2	1eme_Division.55e_Ligne	55e Ligne			10	France	2	2	1	5	1	1	\N	\N	\N	\N	\N	\N	\N	1400	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
21	2	Corps_Cavaly	Corps Cavaly		Guyot	10	France	1	2	4	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
22	2	3eme_Division	3eme Division		LeGrand	10	France	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
23	2	3eme_Division.75e_Ligne	75e Ligne			10	France	2	2	4	5	1	1	\N	\N	\N	\N	\N	\N	\N	1700	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
24	2	3eme_Division.Po_Legere	Po Legere			10	France/Italy	2	2	4	6	1	1	\N	\N	\N	\N	\N	\N	\N	1000	0	0	\N	\N	1	2	2	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
25	2	Corps_Artillery.Heavy_Bty	Heavy Bty			10		4	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	8	0	\N	\N	\N	0	1	f	2	3
26	2	Corps_Artillery	Corps Artillery			10	France	1	2	5	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
27	2	Corps_Cavaly.11e_Chasseur	11e Chasseur			10	France	3	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	600	0	0	0	3	4	0	0	\N	\N	\N	0	0	f	2	0
28	3	2eme_Division.Md_Foot_Bty	Md Foot Bty			10		4	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	8	0	\N	\N	\N	0	3	f	2	3
29	3	1eme_Division.Md_Foot_Bty	Md Foot Bty			10		4	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	8	0	\N	\N	\N	0	3	f	2	3
30	3	Cav_Bde	Cav Bde		Trelliard	10	France	1	2	4	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
31	3	Cav_Bde.10e_Hussar	10e Hussar			10	France	3	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	600	0	0	0	2	3	0	0	\N	\N	\N	0	0	f	2	0
32	3	Cav_Bde.9e_Hussar_Copy	9e Hussar_Copy			10	France	3	2	1	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	600	0	0	0	2	3	0	0	\N	\N	\N	0	0	f	2	0
33	3	Corps_Artillery	Corps Artillery		Careil	10	France	1	2	5	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
34	3	Corps_Artillery.Heavy_Foot	Heavy Foot			10		4	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	8	0	\N	\N	\N	0	1	f	2	2
35	3	1eme_Division	1eme Division		Suchet	10	France	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
36	3	1eme_Division.17e_Legere	17e Legere			10	France	2	2	4	6	1	1	\N	\N	\N	\N	\N	\N	\N	2100	0	0	\N	\N	1	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
37	3	1eme_Division.34e_Ligne	34e Ligne			10	France	2	2	4	5	1	1	\N	\N	\N	\N	\N	\N	\N	2500	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
38	3	1eme_Division.40e_Ligne	40e Ligne			10	France	2	2	4	5	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
39	3	1eme_Division.64e_Ligne	64e Ligne			10	France	2	2	1	5	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
40	3	1eme_Division.88e_Ligne	88e Ligne			10	France	2	2	1	5	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
41	3	2eme_Division	2eme Division		Gazan	10	France	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
42	3	2eme_Division.21e_Legere	21e Legere			10	France	2	2	4	6	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	1	0	0	0	\N	\N	\N	0	0	f	2	0
43	3	2eme_Division.28e_Legere	28e Legere			10	France	2	2	4	6	1	1	\N	\N	\N	\N	\N	\N	\N	900	0	0	\N	\N	1	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
44	3	2eme_Division.100e_Ligne	100e Ligne			10	France	2	2	4	3	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
45	3	2eme_Division.103e_Ligne	103e Ligne			10	France	2	2	4	3	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
46	4	Cav_Bde.9e_Hussar	9e Hussar			10	France	3	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	600	0	0	0	2	3	0	0	\N	\N	\N	0	0	f	2	0
47	4	1eme_Division.39e_Ligne	39e Ligne			10	France	2	2	4	5	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
48	4	1eme_Division.69e_Ligne	69e Ligne			10	France	2	2	1	5	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
49	4	Cav_Bde.10e_Chasseur	10e Chasseur			10	France	3	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	600	0	0	0	3	4	0	0	\N	\N	\N	0	0	f	2	0
50	4	1eme_Division.76e_Ligne	76e Ligne			10	France	2	2	1	5	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
51	4	Corps_Artillery	Corps Artillery			10	France	1	2	4	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
52	4	2eme_Division.59e_Ligne	59e Ligne			10	France	2	2	1	5	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
53	4	Corps_Artillery.1e_Heavy_Bty	1e Heavy Bty			10		4	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	8	0	\N	\N	\N	0	1	f	2	2
54	4	Corps_Artillery.2e_Heavy_Bty	2e Heavy Bty			10		4	2	1	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	8	0	\N	\N	\N	0	1	f	2	2
55	4	2eme_Division	2eme Division		Gardanne	10	France	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
56	4	1eme_Division	1eme Division		Marchand	10	France	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
57	4	Cav_Bde	Cav Bde		Charbanais	10	France	1	2	4	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
58	4	2eme_Division.50e_Ligne	50e Ligne			10	France	2	2	1	5	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
59	4	2eme_Division.27e_Ligne	27e Ligne			10	France	2	2	1	5	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
60	4	1eme_Division.6e_Legere	6e Legere			10	France	2	2	4	6	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	4	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
61	4	2eme_Division.25e_Legere	25e Legere			10	France	2	2	4	6	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	4	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
62	5	Corps_Artillery	Corps Artillery			10	France	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
63	5	1e_Cuirassier_Div	1e Cuirassier Div		Nansouty	10	France	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
64	5	1e_Dragoon_Div	1e Dragoon Div		Klein	10	France	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
65	5	2e_Cuirassier_Div	2e Cuirassier Div		d'Hautpoul	10	France	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
66	5	2e_Dragoon_Div	2e Dragoon Div		Grouchy	10	France	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
67	5	2e_Cuirassier_Div.Bde_Verdiere	Bde Verdiere			10	France	3	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	600	0	0	0	1	4	0	0	\N	\N	\N	0	0	f	2	0
68	5	3e_Dragoon_Div	3e Dragoon Div		Beaumont	10	France	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
69	5	4e_Dragoon_Div	4e Dragoon Div		Sahut	10	France	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
70	5	2e_Cuirassier_Div.Bde_StSulpice	Bde St.Sulpice			10	France	3	2	1	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	600	0	0	0	1	4	0	0	\N	\N	\N	0	0	f	2	0
71	5	Light_Div	Light Div		Lasalle	10	France	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
72	5	Light_Div.Milhaud_1e_Hussar	Milhaud 1e Hussar			10	France	3	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	600	0	0	0	2	3	0	0	\N	\N	\N	0	0	f	2	0
73	5	Light_Div.Bde_Lasalle_5_7e_Hussar	Bde Lasalle 5/7e Hussar			10	France	3	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	600	0	0	0	2	3	0	0	\N	\N	\N	0	0	f	2	0
74	5	2e_Dragoon_Div.Bde_Roget	Bde Roget			10	France	3	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	900	0	0	0	5	5	0	0	\N	\N	\N	0	0	f	2	0
75	5	1e_Cuirassier_Div.Bde_Defrance	Bde Defrance			10	France	3	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	600	0	0	0	9	2	0	0	\N	\N	\N	0	0	f	2	0
76	5	2e_Dragoon_Div.Bde_Milet	Bde Milet			10	France	3	2	1	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	600	0	0	0	5	5	0	0	\N	\N	\N	0	0	f	2	0
77	5	1e_Cuirassier_Div.Bde_Housaye	Bde Housaye			10	France	3	2	1	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	1300	0	0	0	1	2	0	0	\N	\N	\N	0	0	f	2	0
78	5	1e_Dragoon_Div.Bde_Fenerolz	Bde Fenerolz			10	France	3	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	600	0	0	0	5	4	0	0	\N	\N	\N	0	0	f	2	0
79	5	4e_Dragoon_Div.Bde_Laplanche	Bde Laplanche			10	France	3	2	1	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	1200	0	0	0	5	5	0	0	\N	\N	\N	0	0	f	2	0
80	5	1e_Dragoon_Div.Bde_Picard	Bde Picard			10	France	3	2	1	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	600	0	0	0	5	4	0	0	\N	\N	\N	0	0	f	2	0
81	5	4e_Dragoon_Div.Bde_Margaron	Bde Margaron			10	France	3	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	1200	0	0	0	5	5	0	0	\N	\N	\N	0	0	f	2	0
82	5	3e_Dragoon_Div.Bde_Boye	Bde Boye			10	France	3	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	900	0	0	0	5	5	0	0	\N	\N	\N	0	0	f	2	0
83	5	3e_Dragoon_Div.Bde_Maubourg	Bde Maubourg			10	France	3	2	1	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	600	0	0	0	5	5	0	0	\N	\N	\N	0	0	f	2	0
84	5	Corps_Artillery.1e_Horse	1e Horse			10		4	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	8	0	\N	\N	\N	0	3	t	2	2
85	5	Corps_Artillery.2e_Horse	2e Horse			10		4	2	1	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	8	0	\N	\N	\N	0	3	t	2	2
86	6	2nd_Div.Horse_Bty	Horse Bty			10	Saxony	4	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	8	0	\N	\N	\N	0	3	f	2	3
87	6	2nd_Div.von_Burgsdorf	von Burgsdorf			10	Saxony	2	2	4	1	1	1	\N	\N	\N	\N	\N	\N	\N	3400	0	0	\N	\N	1	0	1	0	\N	0	0	4	0	0	0	0	0	0	1	0	\N	\N	\N	0	4	f	2	3
88	6	2nd_Div.von_Dyherrn	von Dyherrn			10	Saxony	2	2	4	3	1	1	\N	\N	\N	\N	\N	\N	\N	4200	0	0	\N	\N	1	0	1	0	\N	0	0	4	0	0	0	0	0	0	2	0	\N	\N	\N	0	4	f	2	3
89	6	1st_Div.Horse_Bty	Horse Bty			10	Prussia	4	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	8	0	\N	\N	\N	0	3	f	2	3
90	6	Reserve_Div.Prittwitz_Grenadier_Bde	Prittwitz Grenadier Bde			10	Prussia	2	2	4	1	1	1	\N	\N	\N	\N	\N	\N	\N	3300	0	0	\N	\N	1	0	0	2	\N	0	0	4	0	0	0	0	0	0	2	0	\N	\N	\N	0	4	f	2	3
91	6	Reserve_Div.Cerrini_Grenadier_Bde	Cerrini Grenadier Bde			10	Prussia	2	2	4	1	1	1	\N	\N	\N	\N	\N	\N	\N	4200	0	0	\N	\N	1	0	0	2	\N	0	0	4	0	0	0	0	0	0	2	0	\N	\N	\N	0	4	f	2	3
92	6	1st_Div.von_Schimonsky	von Schimonsky			10	Prussia	2	2	4	1	1	1	\N	\N	\N	\N	\N	\N	\N	3400	0	0	\N	\N	1	0	1	0	\N	0	0	4	0	0	0	0	0	0	2	0	\N	\N	\N	0	4	f	2	3
93	6	Reserve_Div.Md_Foot_Bty	Md Foot Bty			10	Prussia	4	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	8	0	\N	\N	\N	0	3	f	2	4
94	6	3rd_Div	3rd Div		Tauentzein	10	Prussia	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
95	6	3rd_Div.Cav_Bde_Prince_Clement	Cav Bde Prince Clement			10	Prussia	3	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	700	0	0	0	2	4	0	0	\N	\N	\N	0	0	f	2	0
96	6	3rd_Div.Rosen_Fusilers	Rosen Fusilers			10	Prussia	2	2	4	9	1	1	\N	\N	\N	\N	\N	\N	\N	400	0	0	\N	\N	1	0	0	2	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
97	6	3rd_Div.von_Schoeneberg	von Schöneberg			10	Saxony	2	2	4	1	1	1	\N	\N	\N	\N	\N	\N	\N	3400	0	0	\N	\N	1	0	1	0	\N	0	0	5	0	0	0	0	0	0	2	0	\N	\N	\N	0	4	f	2	4
98	6	3rd_Div.von_Zweiffel	von Zweiffel			10	Prussia	2	2	4	1	1	1	\N	\N	\N	\N	\N	\N	\N	3400	0	0	\N	\N	1	0	1	0	\N	0	0	4	0	0	0	0	0	0	2	0	\N	\N	\N	0	4	f	2	0
99	6	1st_Div	1st Div		Grawert	10	Prussia	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
100	6	3rd_Div.Lt_Bty	Lt Bty			10	Prussia	4	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	6	0	\N	\N	\N	0	4	f	2	3
101	6	Reserve_Div.Cav_Bde_von_Krafft	Cav Bde von Krafft			10	Prussia	3	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	900	0	0	0	12	3	0	0	\N	\N	\N	0	0	f	2	0
102	6	1st_Div.von_Mueffling	von Müffling			10	Prussia	2	2	4	1	1	1	\N	\N	\N	\N	\N	\N	\N	3600	0	0	\N	\N	1	0	1	0	\N	0	0	4	0	0	0	0	0	0	2	0	\N	\N	\N	0	4	f	2	3
103	6	Reserve_Div	Reserve Div		Prittwitz	10	Prussia	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
104	6	Reserve_Div.Heavy_Bty	Heavy Bty			10	Prussia	4	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	8	0	\N	\N	\N	0	1	f	2	3
105	6	1st_Div.Heavy_Bty	Heavy Bty			10	Prussia	4	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	8	0	\N	\N	\N	0	1	f	2	4
106	6	1st_Div.Bde_Henkel	Bde Henkel			10	Prussia	3	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	900	0	0	0	5	3	0	0	\N	\N	\N	0	0	f	2	0
107	6	2nd_Div.Boguslawsky_Fusilers	Boguslawsky Fusilers			10	Prussia	2	2	4	9	1	1	\N	\N	\N	\N	\N	\N	\N	800	0	0	\N	\N	1	0	2	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
108	6	2nd_Div	2nd Div		Zechwitz	10	Prussia	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
109	6	1st_Div.Erichsen_Fusilers	Erichsen Fusilers			10		2	2	4	9	1	1	\N	\N	\N	\N	\N	\N	\N	700	0	0	\N	\N	1	0	0	1	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
110	6	2nd_Div.Cav_Bde_von_Kochitsky	Cav Bde von Kochitsky			10	Saxony	3	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	200	0	0	0	1	3	0	0	\N	\N	\N	0	0	f	2	0
111	6	2nd_Div.Heavy_Bty	Heavy Bty			10	Saxony	4	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	8	0	\N	\N	\N	0	1	f	2	3
112	7	Adv_Guard_Div.Saxon_Hussar_von_Truetzschler	Saxon Hussar von Trützschler	Saxon Hussar Regiment, eight squadrons		10	Saxony	3	2	1	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	1200	0	0	0	2	4	0	0	\N	\N	\N	0	0	f	2	0
113	7	Adv_Guard_Div.Cav_Bde_von_Schimmelpfennig	Cav Bde von Schimmelpfennig	Schimmelpfennig Hussar Regiment # 6, ten squadrons		10	Prussia	3	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	1500	0	0	0	2	4	6	0	\N	\N	\N	0	3	f	2	3
114	7	Adv_Guard_Div.Bde_von_Pelet	Bde von Pelet	Rabenau # 13 Pelet # 14 Rühle # 15 Fusiliers, Masars and Valentin Jager 		10	Prussia	2	2	4	9	1	1	\N	\N	\N	\N	\N	\N	\N	2400	0	0	\N	\N	1	0	0	2	\N	0	0	4	0	0	0	0	0	0	6	0	\N	\N	\N	0	3	f	2	3
115	7	Adv_Guard_Div.Bde_Belvilaqua	Bde Belvilaqua	Combined Bns from IR 49,  Prinz Clemens (saxon), and Kurfurst (saxon)		10	Prussia/Saxony	2	2	4	1	1	1	\N	\N	\N	\N	\N	\N	\N	5100	0	0	\N	\N	1	0	1	0	\N	0	0	5	0	0	0	0	0	0	6	0	\N	\N	\N	0	4	f	2	0
116	7	Adv_Guard_Div	Adv Guard Div		Ferdinand	10	Prussia	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
117	9	2nd_Div.von_Malschitsky_Grenadiers	von Malschitsky Grenadiers			10	Prussia	2	2	4	1	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	1	\N	0	0	4	0	0	0	0	0	0	2	0	\N	\N	\N	0	4	f	2	1
118	9	2nd_Div.Md_Foot_Bty	Md Foot Bty			10	Prussia	4	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	8	0	\N	\N	\N	0	3	f	2	1
119	9	1st_Div.Md_Foot_Bty	Md Foot Bty			10	Prussia	4	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	8	0	\N	\N	\N	0	3	f	2	1
120	9	2nd_Div.Pirch_Regt_Musketeer	Pirch Regt Musketeer			10	Prussia	2	2	1	1	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	1	\N	0	0	4	0	0	0	0	0	0	2	0	\N	\N	\N	0	4	f	2	1
121	9	2nd_Div.Arnim_Regt_Musketeer	Arnim Regt Musketeer			10	Prussia	2	2	1	1	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	1	\N	0	0	4	0	0	0	0	0	0	2	0	\N	\N	\N	0	4	f	2	1
122	9	2nd_Div.Zenge_Regt_Musketeer	Zenge Regt Musketeer			10	Prussia	2	2	1	1	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	1	\N	0	0	4	0	0	0	0	0	0	2	0	\N	\N	\N	0	4	f	2	1
123	9	2nd_Div.von_Zenge_Grenadiers	von Zenge Grenadiers			10	Prussia	2	2	1	1	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	1	\N	0	0	4	0	0	0	0	0	0	2	0	\N	\N	\N	0	4	f	2	1
124	9	1st_Div.Guard_Bde_von_Hirschfeld	Guard Bde von Hirschfeld			10	Prussia	2	2	1	1	1	1	\N	\N	\N	\N	\N	\N	\N	2400	0	0	\N	\N	1	0	0	1	\N	0	0	2	0	0	0	0	0	0	2	0	\N	\N	\N	0	4	f	2	1
125	9	1st_Div.Guard_Bde_von_Pletz	Guard Bde von Pletz			10	Prussia	2	2	4	1	1	1	\N	\N	\N	\N	\N	\N	\N	2400	0	0	\N	\N	1	0	0	1	\N	0	0	2	0	0	0	0	0	0	2	0	\N	\N	\N	0	4	f	2	1
126	9	1st_Div	1st Div		Kuhnheim	10	Prussia	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
127	9	1st_Div.Garde_du_Corps_Cavalry	Garde du Corps Cavalry			10	Prussia	3	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	600	0	0	0	1	1	0	0	\N	\N	\N	0	0	f	2	0
128	9	1st_Div.Beeren_Cuirassier	Beeren Cuirassier			10	Prussia	3	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	400	0	0	0	1	2	0	0	\N	\N	\N	0	0	f	2	0
129	9	2nd_Div	2nd Div		von Arnim	10	Prussia	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
130	10	3eme_Division.Md_Foot_Bty	Md Foot Bty			10		4	2	1	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	8	0	\N	\N	\N	0	3	f	2	2
131	10	2eme_Division.Md_Foot_Bty	Md Foot Bty			10		4	2	1	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	8	0	\N	\N	\N	0	3	f	2	2
132	10	Corps_Artillery.Md_Foot_Bty	Md Foot Bty			10		4	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	8	0	\N	\N	\N	0	3	f	2	2
133	10	1eme_Division.Md_Foot_Bty	Md Foot Bty			10		4	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	8	0	\N	\N	\N	0	3	f	2	2
134	10	1eme_Division.13e_Legere	13e Legere			10	France	2	2	4	6	1	1	\N	\N	\N	\N	\N	\N	\N	1400	0	0	\N	\N	1	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
135	10	1eme_Division	1eme Division		Morand	10	France	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
136	10	2eme_Division.108e_Ligne	108e Ligne			10	France	2	2	1	5	1	1	\N	\N	\N	\N	\N	\N	\N	1600	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
137	10	1eme_Division.51e_Ligne	51e Ligne			10	France	2	2	1	5	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
138	10	1eme_Division.17e_Ligne	17e Ligne			10	France	2	2	4	5	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
139	10	1eme_Division.61e_Ligne	61e Ligne			10	France	2	2	1	5	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
140	10	1eme_Division.30e_Ligne	30e Ligne			10	France	2	2	1	5	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
141	10	2eme_Division	2eme Division		Friant	10	France	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
142	10	2eme_Division.33e_Ligne	33e Ligne			10	France	2	2	1	5	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
143	10	2eme_Division.48e_Ligne	48e Ligne			10	France	2	2	1	5	1	1	\N	\N	\N	\N	\N	\N	\N	1400	0	0	\N	\N	1	0	0	0	\N	0	0	1	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
144	10	2eme_Division.111e_Ligne	111e Ligne			10	France	2	2	1	5	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
145	10	Cav_Bde	Cav Bde		Viallanes	10	France	1	2	4	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
146	10	3eme_Division	3eme Division		Gudin	10	France	1	2	1	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
147	10	3eme_Division.12e_Ligne	12e Ligne			10	France	2	2	1	5	1	1	\N	\N	\N	\N	\N	\N	\N	1300	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
148	10	3eme_Division.21e_Ligne	21e Ligne			10	France	2	2	1	5	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
149	10	3eme_Division.25e_Ligne	25e Ligne			10	France	2	2	1	5	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
150	10	3eme_Division.85e_Ligne	85e Ligne			10	France	2	2	1	5	1	1	\N	\N	\N	\N	\N	\N	\N	1600	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
151	10	Cav_Bde.1e_Chasseur	1e Chasseur			10	France	3	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	600	0	0	0	3	3	0	0	\N	\N	\N	0	0	f	2	0
152	10	Cav_Bde.2e_Chasseur	2e Chasseur			10	France	3	2	1	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	600	0	0	0	3	3	0	0	\N	\N	\N	0	0	f	2	0
153	10	Corps_Artillery	Corps Artillery		Hannicque	10	France	1	2	4	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
154	11	Guard_Artillery.Guard_Foot_Artillery	Guard Foot Artillery			10		4	2	1	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	24	0	\N	\N	\N	0	3	f	2	1
155	11	Infantry_Division.1e_Grenadiers	1e Grenadiers			10	France	2	2	4	5	1	1	\N	\N	\N	\N	\N	\N	\N	2400	0	0	\N	\N	1	0	0	0	\N	0	0	1	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
156	11	Infantry_Division.2e_Grenadiers	2e Grenadiers			10	France	2	2	1	5	1	1	\N	\N	\N	\N	\N	\N	\N	2400	0	0	\N	\N	1	0	0	0	\N	0	0	1	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
157	11	Guard_Artillery.Army_Artillery_Park	Army Artillery Park			10		4	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	16	0	\N	\N	\N	0	1	f	2	2
158	11	Cavalry_Division.Chasseurs_a_Cheval	Chasseurs a Cheval			10	France	3	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	600	0	0	0	3	1	0	0	\N	\N	\N	0	0	f	2	0
159	11	Infantry_Division.1e_Chasseurs	1e Chasseurs			10	France	2	2	1	6	1	1	\N	\N	\N	\N	\N	\N	\N	2400	0	0	\N	\N	1	0	0	0	\N	0	0	1	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
160	11	Cavalry_Division.Grenadier_a_Cheval	Grenadier a Cheval			10	France	3	2	1	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	400	0	0	0	8	1	0	0	\N	\N	\N	0	0	f	2	0
161	11	Guard_Artillery	Guard Artillery		de Lamartiniére	10	France	1	2	4	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	2	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
162	11	Infantry_Division.2e_Chasseurs_Copy	2e Chasseurs_Copy			10	France	2	2	1	6	1	1	\N	\N	\N	\N	\N	\N	\N	2400	0	0	\N	\N	1	0	0	0	\N	0	0	1	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
163	11	Infantry_Division	Infantry Division		Lefebvre	10	France	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
164	11	Infantry_Division.Foot_Dragoons	Foot Dragoons			10	France	2	2	1	6	1	1	\N	\N	\N	\N	\N	\N	\N	2400	0	0	\N	\N	1	0	0	0	\N	0	0	1	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
165	11	Cavalry_Division	Cavalry Division		Bessieres	10	France	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	1	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
166	11	Guard_Artillery.Guard_Horse_Bty	Guard Horse Bty			10		4	2	1	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	8	0	\N	\N	\N	0	4	t	2	1
167	12	2eme_Division.Md_Foot_Bty_Copy	Md Foot Bty_Copy			10		4	2	1	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	0	0	0	0	0	0	0	8	0	\N	\N	\N	0	3	f	2	3
168	12	3eme_Division.Md_Foot_Bty	Md Foot Bty			10		4	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	0	0	0	0	0	0	0	8	0	\N	\N	\N	0	3	f	2	3
169	12	3eme_Division.27e_Legere	27e Legere		Drouet	10	France	2	2	4	6	1	1	\N	\N	\N	\N	\N	\N	\N	1500	0	0	\N	\N	1	0	2	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	4	f	2	0
170	12	Artillery_Reserve.Md_Foot_Bty	Md Foot Bty			10		4	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	8	0	\N	\N	\N	0	3	f	2	2
171	12	2eme_Division.Md_Foot_Bty	Md Foot Bty			10		4	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	0	0	0	0	0	0	0	8	0	\N	\N	\N	0	3	f	2	3
172	12	1eme_Division.Md_Foot_Bty	Md Foot Bty			10		4	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	0	0	0	0	0	0	0	8	0	\N	\N	\N	0	3	f	2	3
173	12	1eme_Division.9e_Legere	9e Legere		de l'Eltang	10	France	2	2	4	6	1	1	\N	\N	\N	\N	\N	\N	\N	2600	0	0	\N	\N	1	2	0	0	\N	0	0	4	0	0	0	0	0	0	0	0	\N	\N	\N	0	4	f	2	0
174	12	2eme_Division.45e_Ligne	45e Ligne		Rivaud	10	France	2	2	4	5	1	1	\N	\N	\N	\N	\N	\N	\N	2000	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
175	12	2eme_Division.54e_Ligne	54e Ligne		Rivaud	10	France	2	2	4	5	1	1	\N	\N	\N	\N	\N	\N	\N	2000	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
176	12	2eme_Division	2eme Division		Rivaud	10	France	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
177	12	1eme_Division.32e_Ligne	32e Ligne		de l'Eltang	10	France	2	2	4	5	1	1	\N	\N	\N	\N	\N	\N	\N	2000	0	0	\N	\N	1	0	0	0	\N	0	0	4	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
178	12	1eme_Division	1eme Division		de l'Eltang	10	France	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
179	12	1eme_Division.96e_Ligne	96e Ligne		de l'Eltang	10	France	2	2	4	5	1	1	\N	\N	\N	\N	\N	\N	\N	2000	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
180	12	2eme_Division.4e_Legere	4e Legere		Rivaud	10	France	2	2	4	6	1	1	\N	\N	\N	\N	\N	\N	\N	2000	0	0	\N	\N	1	0	1	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
181	12	Cav_Reserve	Cav Reserve		Tilley	10	France	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
182	12	Cav_Reserve.2e_Hussar	2e Hussar			10	France	3	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	300	0	0	0	2	3	0	0	\N	\N	\N	0	0	f	2	0
183	12	Cav_Reserve.4e_Hussar	4e Hussar			10	France	3	2	1	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	422	0	0	0	2	4	0	0	\N	\N	\N	0	0	f	2	0
184	12	Artillery_Reserve	Artillery Reserve		Eble	10	France	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
185	12	3eme_Division	3eme Division		Drouet	10	France	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
186	12	3eme_Division.95e_Ligne	95e Ligne		Drouet	10	France	2	2	4	5	1	1	\N	\N	\N	\N	\N	\N	\N	2600	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
187	12	3eme_Division.94e_Ligne	94e Ligne		Drouet	10	France	2	2	4	5	1	1	\N	\N	\N	\N	\N	\N	\N	1500	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
188	13	2eme_Division.Md_Foot_Bty	Md Foot Bty			10		4	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	8	0	\N	\N	\N	0	3	f	2	3
189	13	1eme_Division.Md_Foot_Bty	Md Foot Bty			10		4	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	8	0	\N	\N	\N	0	3	f	2	3
190	13	Corps_Cav.7e_Chasseur	7e Chasseur			10	France	3	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	600	0	0	0	3	4	0	0	\N	\N	\N	0	0	f	2	0
191	13	1eme_Division.105e_Ligne	105e Ligne			10	France	2	2	1	3	1	1	\N	\N	\N	\N	\N	\N	\N	1700	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
192	13	Corps_Cav.20e_Chasseur	20e Chasseur			10	France	3	2	1	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	600	0	0	0	3	4	0	0	\N	\N	\N	0	0	f	2	0
193	13	1eme_Division.14e_Ligne	14e Ligne			10	France	2	2	4	5	1	1	\N	\N	\N	\N	\N	\N	\N	700	0	0	\N	\N	1	0	0	0	\N	0	0	4	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
194	13	Corps_Cav	Corps Cav		Durosnel	10	France	1	2	4	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
195	13	Corps_Artillery	Corps Artillery			10	France	1	2	4	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
196	13	2eme_Division.63e_Ligne	63e Ligne			10	France	2	2	1	5	1	1	\N	\N	\N	\N	\N	\N	\N	700	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
197	13	Corps_Artillery.Heavy_Bty	Heavy Bty			10		4	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	8	0	\N	\N	\N	0	1	f	2	2
198	13	1eme_Division.16e_Legere	16e Legere			10	France	2	2	4	6	1	1	\N	\N	\N	\N	\N	\N	\N	2700	0	0	\N	\N	1	0	0	0	\N	0	0	4	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
199	13	1eme_Division.44e_Ligne	44e Ligne			10	France	2	2	1	5	1	1	\N	\N	\N	\N	\N	\N	\N	1700	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
200	13	1eme_Division	1eme Division		Desjardin	10	France	1	2	4	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
201	13	2eme_Division.24e_Ligne	24e Ligne			10	France	2	2	4	5	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
202	13	2eme_Division.7e_Legere	7e Legere			10	France	2	2	4	6	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	4	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
203	13	2eme_Division	2eme Division		Bierre	10	France	1	2	4	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
204	13	2eme_Division.Hesse_Darmstadt	Hesse Darmstadt			10	Hesse	2	2	1	1	1	1	\N	\N	\N	\N	\N	\N	\N	800	0	0	\N	\N	1	0	0	0	\N	0	0	4	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
205	13	2eme_Division.Allied_Nassau	Allied Nassau			10	Nassau	2	2	1	5	1	1	\N	\N	\N	\N	\N	\N	\N	400	0	0	\N	\N	1	0	0	0	\N	0	0	4	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
206	14	Supply_Train	Supply Train			10	France	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
207	14	Supply_Train.Supply_Escort_Detachment	Supply Escort Detachment			10		5	2	5	6	1	1	\N	\N	\N	\N	\N	\N	\N	300	0	0	\N	\N	1	2	4	0	\N	0	0	6	50	0	0	0	3	0	0	0	\N	\N	\N	0	0	f	2	0
208	15	2nd_Div.3rd_special_regt_von_X	3rd special regt von X			10		2	2	1	8	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	2	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
209	15	2nd_Div.1st_Regt_of_Death	1st Regt of Death	with data		10		2	2	4	3	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
210	15	2nd_Div.Devils_Bde_as_such	Devils Bde as such	as such six much as such		10	gotta break this	2	2	4	4	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	3	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
211	15	2nd_Duvussion.NZ_Brugade_from_NZ	NZ Brugade from NZ			10		2	2	4	7	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
212	15	2nd_Duvussion	2nd Duvussion			10		1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
213	15	7th_Div.4th_Bn	4th Bn			10		2	2	4	3	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
214	15	7th_Div.1st_Bn	1st Bn			10		2	2	4	3	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
215	15	6th_Division	6th Division			10		1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
216	15	6th_Division.2nd_Regt	2nd Regt			10		2	2	4	3	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
217	15	6th_Division.1st_Regt	1st Regt			10		2	2	4	3	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
218	15	7th_Div	7th Div			10		1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
219	15	2nd_Div.2nd_Regt	2nd Regt			10		2	2	4	3	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
220	15	2nd_Div.1st_Regt	1st Regt			10		2	2	4	3	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
221	15	2nd_Div	2nd Div			10		1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
222	15	1st_Div.3rd_special_regt	3rd special regt			10		2	2	4	3	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
223	15	1st_Div.2nd_Regt	2nd Regt			10	France	2	2	4	3	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	6	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
224	15	1st_Div.1st_Regt	1st Regt			10		2	2	4	3	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
225	15	1st_Div	1st Div			10		1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
226	16	Supply_Train	Supply Train		von Schulze	10	Prussia	1	2	6	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
227	16	Supply_Train.Guard_Detachment	Guard Detachment			10		5	2	6	8	1	1	\N	\N	\N	\N	\N	\N	\N	300	0	0	\N	\N	1	2	4	0	\N	0	0	10	60	0	0	0	12	7	0	0	\N	\N	\N	0	0	f	2	0
228	17	2eme_Division.Md_Foot_Bty	Md Foot Bty			10		4	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	8	0	\N	\N	\N	0	3	f	2	3
229	17	1eme_Division.Md_Foot_Bty	Md Foot Bty			10		4	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	8	0	\N	\N	\N	0	3	f	2	2
230	17	3eme_Division.Md_Foot_Bty	Md Foot Bty			10		4	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	8	0	\N	\N	\N	0	3	f	2	2
231	17	2eme_Division	2eme Division		Leval	10	France	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
232	17	2eme_Division.28e_Ligne	28e Ligne			10	France	2	2	1	5	1	1	\N	\N	\N	\N	\N	\N	\N	1400	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
233	17	1eme_Division.35e_Ligne	35e Ligne			10	France	2	2	4	5	1	1	\N	\N	\N	\N	\N	\N	\N	1400	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
234	17	3eme_Division.Corsican_Legere_Copy	Corsican Legere_Copy			10	France/Corsica	2	2	1	6	1	1	\N	\N	\N	\N	\N	\N	\N	1300	0	0	\N	\N	1	2	0	1	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
235	17	2eme_Division.46e_Ligne	46e Ligne			10	France	2	2	1	5	1	1	\N	\N	\N	\N	\N	\N	\N	1400	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
236	17	1eme_Division.43e_Ligne	43e Ligne			10	France	2	2	1	5	1	1	\N	\N	\N	\N	\N	\N	\N	1400	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
237	17	2eme_Division.24e_Legere	24e Legere			10	France	2	2	1	6	1	1	\N	\N	\N	\N	\N	\N	\N	2000	0	0	\N	\N	1	0	0	0	\N	0	0	4	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
238	17	2eme_Division.4e_Ligne	4e Ligne			10	France	2	2	1	5	1	1	\N	\N	\N	\N	\N	\N	\N	1400	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
239	17	1eme_Division	1eme Division		St Hilaire	10	France	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
240	17	3eme_Division.26e_Legere	26e Legere			10	France	2	2	4	6	1	1	\N	\N	\N	\N	\N	\N	\N	1600	0	0	\N	\N	1	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
241	17	1eme_Division.10e_Legere	10e Legere			10	France	2	2	4	6	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	4	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
242	17	2eme_Division.57e_Ligne	57e Ligne			10	France	2	2	1	5	1	1	\N	\N	\N	\N	\N	\N	\N	1700	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
243	17	3eme_Division.18e_Ligne	18e Ligne			10	France	2	2	4	5	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	4	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
244	17	Corps_Cavaly.22e_Chasseur	22e Chasseur			10	France	3	2	1	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	600	0	0	0	3	4	0	0	\N	\N	\N	0	0	f	2	0
245	17	1eme_Division.55e_Ligne	55e Ligne			10	France	2	2	1	5	1	1	\N	\N	\N	\N	\N	\N	\N	1400	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
246	17	Corps_Cavaly	Corps Cavaly		Guyot	10	France	1	2	4	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
247	17	3eme_Division	3eme Division		LeGrand	10	France	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
248	17	3eme_Division.75e_Ligne	75e Ligne			10	France	2	2	4	5	1	1	\N	\N	\N	\N	\N	\N	\N	1700	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
249	17	3eme_Division.Po_Legere	Po Legere			10	France/Italy	2	2	4	6	1	1	\N	\N	\N	\N	\N	\N	\N	1000	0	0	\N	\N	1	2	2	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
250	17	Corps_Artillery.Heavy_Bty	Heavy Bty			10		4	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	8	0	\N	\N	\N	0	1	f	2	3
251	17	Corps_Artillery	Corps Artillery			10	France	1	2	5	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
252	17	Corps_Cavaly.11e_Chasseur	11e Chasseur			10	France	3	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	600	0	0	0	3	4	0	0	\N	\N	\N	0	0	f	2	0
253	18	2eme_Division.Md_Foot_Bty	Md Foot Bty			10		4	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	8	0	\N	\N	\N	0	3	f	2	3
254	18	1eme_Division.Md_Foot_Bty	Md Foot Bty			10		4	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	8	0	\N	\N	\N	0	3	f	2	3
255	18	Cav_Bde	Cav Bde		Trelliard	10	France	1	2	4	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
256	18	Cav_Bde.10e_Hussar	10e Hussar			10	France	3	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	600	0	0	0	2	3	0	0	\N	\N	\N	0	0	f	2	0
257	18	Cav_Bde.9e_Hussar_Copy	9e Hussar_Copy			10	France	3	2	1	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	600	0	0	0	2	3	0	0	\N	\N	\N	0	0	f	2	0
258	18	Corps_Artillery	Corps Artillery		Careil	10	France	1	2	5	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
259	18	Corps_Artillery.Heavy_Foot	Heavy Foot			10		4	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	8	0	\N	\N	\N	0	1	f	2	2
260	18	1eme_Division	1eme Division		Suchet	10	France	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
261	18	1eme_Division.17e_Legere	17e Legere			10	France	2	2	4	6	1	1	\N	\N	\N	\N	\N	\N	\N	2100	0	0	\N	\N	1	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
262	18	1eme_Division.34e_Ligne	34e Ligne			10	France	2	2	4	5	1	1	\N	\N	\N	\N	\N	\N	\N	2500	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
263	18	1eme_Division.40e_Ligne	40e Ligne			10	France	2	2	4	5	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
264	18	1eme_Division.64e_Ligne	64e Ligne			10	France	2	2	1	5	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
265	18	1eme_Division.88e_Ligne	88e Ligne			10	France	2	2	1	5	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
266	18	2eme_Division	2eme Division		Gazan	10	France	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
267	18	2eme_Division.21e_Legere	21e Legere			10	France	2	2	4	6	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	1	0	0	0	\N	\N	\N	0	0	f	2	0
268	18	2eme_Division.28e_Legere	28e Legere			10	France	2	2	4	6	1	1	\N	\N	\N	\N	\N	\N	\N	900	0	0	\N	\N	1	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
269	18	2eme_Division.100e_Ligne	100e Ligne			10	France	2	2	4	3	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
270	18	2eme_Division.103e_Ligne	103e Ligne			10	France	2	2	4	3	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
271	19	Cav_Bde.9e_Hussar	9e Hussar			10	France	3	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	600	0	0	0	2	3	0	0	\N	\N	\N	0	0	f	2	0
272	19	1eme_Division.39e_Ligne	39e Ligne			10	France	2	2	4	5	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
273	19	1eme_Division.69e_Ligne	69e Ligne			10	France	2	2	1	5	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
274	19	Cav_Bde.10e_Chasseur	10e Chasseur			10	France	3	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	600	0	0	0	3	4	0	0	\N	\N	\N	0	0	f	2	0
275	19	1eme_Division.76e_Ligne	76e Ligne			10	France	2	2	1	5	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
276	19	Corps_Artillery	Corps Artillery			10	France	1	2	4	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
277	19	2eme_Division.59e_Ligne	59e Ligne			10	France	2	2	1	5	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
278	19	Corps_Artillery.1e_Heavy_Bty	1e Heavy Bty			10		4	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	8	0	\N	\N	\N	0	1	f	2	2
279	19	Corps_Artillery.2e_Heavy_Bty	2e Heavy Bty			10		4	2	1	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	8	0	\N	\N	\N	0	1	f	2	2
280	19	2eme_Division	2eme Division		Gardanne	10	France	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
281	19	1eme_Division	1eme Division		Marchand	10	France	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
282	19	Cav_Bde	Cav Bde		Charbanais	10	France	1	2	4	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
283	19	2eme_Division.50e_Ligne	50e Ligne			10	France	2	2	1	5	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
284	19	2eme_Division.27e_Ligne	27e Ligne			10	France	2	2	1	5	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
285	19	1eme_Division.6e_Legere	6e Legere			10	France	2	2	4	6	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	4	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
286	19	2eme_Division.25e_Legere	25e Legere			10	France	2	2	4	6	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	4	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
287	20	Corps_Artillery	Corps Artillery			10	France	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
288	20	1e_Cuirassier_Div	1e Cuirassier Div		Nansouty	10	France	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
289	20	1e_Dragoon_Div	1e Dragoon Div		Klein	10	France	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
290	20	2e_Cuirassier_Div	2e Cuirassier Div		d'Hautpoul	10	France	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
291	20	2e_Dragoon_Div	2e Dragoon Div		Grouchy	10	France	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
292	20	2e_Cuirassier_Div.Bde_Verdiere	Bde Verdiere			10	France	3	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	600	0	0	0	1	4	0	0	\N	\N	\N	0	0	f	2	0
293	20	3e_Dragoon_Div	3e Dragoon Div		Beaumont	10	France	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
294	20	4e_Dragoon_Div	4e Dragoon Div		Sahut	10	France	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
295	20	2e_Cuirassier_Div.Bde_StSulpice	Bde St.Sulpice			10	France	3	2	1	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	600	0	0	0	1	4	0	0	\N	\N	\N	0	0	f	2	0
296	20	Light_Div	Light Div		Lasalle	10	France	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
297	20	Light_Div.Milhaud_1e_Hussar	Milhaud 1e Hussar			10	France	3	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	600	0	0	0	2	3	0	0	\N	\N	\N	0	0	f	2	0
298	20	Light_Div.Bde_Lasalle_5_7e_Hussar	Bde Lasalle 5/7e Hussar			10	France	3	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	600	0	0	0	2	3	0	0	\N	\N	\N	0	0	f	2	0
299	20	2e_Dragoon_Div.Bde_Roget	Bde Roget			10	France	3	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	900	0	0	0	5	5	0	0	\N	\N	\N	0	0	f	2	0
300	20	1e_Cuirassier_Div.Bde_Defrance	Bde Defrance			10	France	3	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	600	0	0	0	9	2	0	0	\N	\N	\N	0	0	f	2	0
301	20	2e_Dragoon_Div.Bde_Milet	Bde Milet			10	France	3	2	1	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	600	0	0	0	5	5	0	0	\N	\N	\N	0	0	f	2	0
302	20	1e_Cuirassier_Div.Bde_Housaye	Bde Housaye			10	France	3	2	1	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	1300	0	0	0	1	2	0	0	\N	\N	\N	0	0	f	2	0
303	20	1e_Dragoon_Div.Bde_Fenerolz	Bde Fenerolz			10	France	3	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	600	0	0	0	5	4	0	0	\N	\N	\N	0	0	f	2	0
304	20	4e_Dragoon_Div.Bde_Laplanche	Bde Laplanche			10	France	3	2	1	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	1200	0	0	0	5	5	0	0	\N	\N	\N	0	0	f	2	0
305	20	1e_Dragoon_Div.Bde_Picard	Bde Picard			10	France	3	2	1	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	600	0	0	0	5	4	0	0	\N	\N	\N	0	0	f	2	0
306	20	4e_Dragoon_Div.Bde_Margaron	Bde Margaron			10	France	3	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	1200	0	0	0	5	5	0	0	\N	\N	\N	0	0	f	2	0
307	20	3e_Dragoon_Div.Bde_Boye	Bde Boye			10	France	3	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	900	0	0	0	5	5	0	0	\N	\N	\N	0	0	f	2	0
308	20	3e_Dragoon_Div.Bde_Maubourg	Bde Maubourg			10	France	3	2	1	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	600	0	0	0	5	5	0	0	\N	\N	\N	0	0	f	2	0
309	20	Corps_Artillery.1e_Horse	1e Horse			10		4	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	8	0	\N	\N	\N	0	3	t	2	2
310	20	Corps_Artillery.2e_Horse	2e Horse			10		4	2	1	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	8	0	\N	\N	\N	0	3	t	2	2
311	21	2nd_Div.Horse_Bty	Horse Bty			10	Saxony	4	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	8	0	\N	\N	\N	0	3	f	2	3
312	21	2nd_Div.von_Burgsdorf	von Burgsdorf			10	Saxony	2	2	4	1	1	1	\N	\N	\N	\N	\N	\N	\N	3400	0	0	\N	\N	1	0	1	0	\N	0	0	4	0	0	0	0	0	0	1	0	\N	\N	\N	0	4	f	2	3
313	21	2nd_Div.von_Dyherrn	von Dyherrn			10	Saxony	2	2	4	3	1	1	\N	\N	\N	\N	\N	\N	\N	4200	0	0	\N	\N	1	0	1	0	\N	0	0	4	0	0	0	0	0	0	2	0	\N	\N	\N	0	4	f	2	3
314	21	1st_Div.Horse_Bty	Horse Bty			10	Prussia	4	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	8	0	\N	\N	\N	0	3	f	2	3
315	21	Reserve_Div.Prittwitz_Grenadier_Bde	Prittwitz Grenadier Bde			10	Prussia	2	2	4	1	1	1	\N	\N	\N	\N	\N	\N	\N	3300	0	0	\N	\N	1	0	0	2	\N	0	0	4	0	0	0	0	0	0	2	0	\N	\N	\N	0	4	f	2	3
316	21	Reserve_Div.Cerrini_Grenadier_Bde	Cerrini Grenadier Bde			10	Prussia	2	2	4	1	1	1	\N	\N	\N	\N	\N	\N	\N	4200	0	0	\N	\N	1	0	0	2	\N	0	0	4	0	0	0	0	0	0	2	0	\N	\N	\N	0	4	f	2	3
317	21	1st_Div.von_Schimonsky	von Schimonsky			10	Prussia	2	2	4	1	1	1	\N	\N	\N	\N	\N	\N	\N	3400	0	0	\N	\N	1	0	1	0	\N	0	0	4	0	0	0	0	0	0	2	0	\N	\N	\N	0	4	f	2	3
318	21	Reserve_Div.Md_Foot_Bty	Md Foot Bty			10	Prussia	4	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	8	0	\N	\N	\N	0	3	f	2	4
319	21	3rd_Div	3rd Div		Tauentzein	10	Prussia	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
320	21	3rd_Div.Cav_Bde_Prince_Clement	Cav Bde Prince Clement			10	Prussia	3	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	700	0	0	0	2	4	0	0	\N	\N	\N	0	0	f	2	0
321	21	3rd_Div.Rosen_Fusilers	Rosen Fusilers			10	Prussia	2	2	4	9	1	1	\N	\N	\N	\N	\N	\N	\N	400	0	0	\N	\N	1	0	0	2	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
322	21	3rd_Div.von_Schoeneberg	von Schöneberg			10	Saxony	2	2	4	1	1	1	\N	\N	\N	\N	\N	\N	\N	3400	0	0	\N	\N	1	0	1	0	\N	0	0	5	0	0	0	0	0	0	2	0	\N	\N	\N	0	4	f	2	4
323	21	3rd_Div.von_Zweiffel	von Zweiffel			10	Prussia	2	2	4	1	1	1	\N	\N	\N	\N	\N	\N	\N	3400	0	0	\N	\N	1	0	1	0	\N	0	0	4	0	0	0	0	0	0	2	0	\N	\N	\N	0	4	f	2	0
324	21	1st_Div	1st Div		Grawert	10	Prussia	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
325	21	3rd_Div.Lt_Bty	Lt Bty			10	Prussia	4	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	6	0	\N	\N	\N	0	4	f	2	3
326	21	Reserve_Div.Cav_Bde_von_Krafft	Cav Bde von Krafft			10	Prussia	3	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	900	0	0	0	12	3	0	0	\N	\N	\N	0	0	f	2	0
327	21	1st_Div.von_Mueffling	von Müffling			10	Prussia	2	2	4	1	1	1	\N	\N	\N	\N	\N	\N	\N	3600	0	0	\N	\N	1	0	1	0	\N	0	0	4	0	0	0	0	0	0	2	0	\N	\N	\N	0	4	f	2	3
328	21	Reserve_Div	Reserve Div		Prittwitz	10	Prussia	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
329	21	Reserve_Div.Heavy_Bty	Heavy Bty			10	Prussia	4	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	8	0	\N	\N	\N	0	1	f	2	3
330	21	1st_Div.Heavy_Bty	Heavy Bty			10	Prussia	4	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	8	0	\N	\N	\N	0	1	f	2	4
331	21	1st_Div.Bde_Henkel	Bde Henkel			10	Prussia	3	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	900	0	0	0	5	3	0	0	\N	\N	\N	0	0	f	2	0
332	21	2nd_Div.Boguslawsky_Fusilers	Boguslawsky Fusilers			10	Prussia	2	2	4	9	1	1	\N	\N	\N	\N	\N	\N	\N	800	0	0	\N	\N	1	0	2	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
333	21	2nd_Div	2nd Div		Zechwitz	10	Prussia	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
334	21	1st_Div.Erichsen_Fusilers	Erichsen Fusilers			10		2	2	4	9	1	1	\N	\N	\N	\N	\N	\N	\N	700	0	0	\N	\N	1	0	0	1	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
335	21	2nd_Div.Cav_Bde_von_Kochitsky	Cav Bde von Kochitsky			10	Saxony	3	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	200	0	0	0	1	3	0	0	\N	\N	\N	0	0	f	2	0
336	21	2nd_Div.Heavy_Bty	Heavy Bty			10	Saxony	4	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	8	0	\N	\N	\N	0	1	f	2	3
337	22	Adv_Guard_Div.Saxon_Hussar_von_Truetzschler	Saxon Hussar von Trützschler	Saxon Hussar Regiment, eight squadrons		10	Saxony	3	2	1	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	1200	0	0	0	2	4	0	0	\N	\N	\N	0	0	f	2	0
338	22	Adv_Guard_Div.Cav_Bde_von_Schimmelpfennig	Cav Bde von Schimmelpfennig	Schimmelpfennig Hussar Regiment # 6, ten squadrons		10	Prussia	3	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	1500	0	0	0	2	4	6	0	\N	\N	\N	0	3	f	2	3
339	22	Adv_Guard_Div.Bde_von_Pelet	Bde von Pelet	Rabenau # 13 Pelet # 14 Rühle # 15 Fusiliers, Masars and Valentin Jager 		10	Prussia	2	2	4	9	1	1	\N	\N	\N	\N	\N	\N	\N	2400	0	0	\N	\N	1	0	0	2	\N	0	0	4	0	0	0	0	0	0	6	0	\N	\N	\N	0	3	f	2	3
340	22	Adv_Guard_Div.Bde_Belvilaqua	Bde Belvilaqua	Combined Bns from IR 49,  Prinz Clemens (saxon), and Kurfurst (saxon)		10	Prussia/Saxony	2	2	4	1	1	1	\N	\N	\N	\N	\N	\N	\N	5100	0	0	\N	\N	1	0	1	0	\N	0	0	5	0	0	0	0	0	0	6	0	\N	\N	\N	0	4	f	2	0
341	22	Adv_Guard_Div	Adv Guard Div		Ferdinand	10	Prussia	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
342	24	2nd_Div.von_Malschitsky_Grenadiers	von Malschitsky Grenadiers			10	Prussia	2	2	4	1	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	1	\N	0	0	4	0	0	0	0	0	0	2	0	\N	\N	\N	0	4	f	2	1
343	24	2nd_Div.Md_Foot_Bty	Md Foot Bty			10	Prussia	4	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	8	0	\N	\N	\N	0	3	f	2	1
344	24	1st_Div.Md_Foot_Bty	Md Foot Bty			10	Prussia	4	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	8	0	\N	\N	\N	0	3	f	2	1
345	24	2nd_Div.Pirch_Regt_Musketeer	Pirch Regt Musketeer			10	Prussia	2	2	1	1	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	1	\N	0	0	4	0	0	0	0	0	0	2	0	\N	\N	\N	0	4	f	2	1
346	24	2nd_Div.Arnim_Regt_Musketeer	Arnim Regt Musketeer			10	Prussia	2	2	1	1	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	1	\N	0	0	4	0	0	0	0	0	0	2	0	\N	\N	\N	0	4	f	2	1
347	24	2nd_Div.Zenge_Regt_Musketeer	Zenge Regt Musketeer			10	Prussia	2	2	1	1	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	1	\N	0	0	4	0	0	0	0	0	0	2	0	\N	\N	\N	0	4	f	2	1
348	24	2nd_Div.von_Zenge_Grenadiers	von Zenge Grenadiers			10	Prussia	2	2	1	1	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	1	\N	0	0	4	0	0	0	0	0	0	2	0	\N	\N	\N	0	4	f	2	1
349	24	1st_Div.Guard_Bde_von_Hirschfeld	Guard Bde von Hirschfeld			10	Prussia	2	2	1	1	1	1	\N	\N	\N	\N	\N	\N	\N	2400	0	0	\N	\N	1	0	0	1	\N	0	0	2	0	0	0	0	0	0	2	0	\N	\N	\N	0	4	f	2	1
350	24	1st_Div.Guard_Bde_von_Pletz	Guard Bde von Pletz			10	Prussia	2	2	4	1	1	1	\N	\N	\N	\N	\N	\N	\N	2400	0	0	\N	\N	1	0	0	1	\N	0	0	2	0	0	0	0	0	0	2	0	\N	\N	\N	0	4	f	2	1
351	24	1st_Div	1st Div		Kuhnheim	10	Prussia	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
352	24	1st_Div.Garde_du_Corps_Cavalry	Garde du Corps Cavalry			10	Prussia	3	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	600	0	0	0	1	1	0	0	\N	\N	\N	0	0	f	2	0
353	24	1st_Div.Beeren_Cuirassier	Beeren Cuirassier			10	Prussia	3	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	400	0	0	0	1	2	0	0	\N	\N	\N	0	0	f	2	0
354	24	2nd_Div	2nd Div		von Arnim	10	Prussia	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
355	25	3eme_Division.Md_Foot_Bty	Md Foot Bty			10		4	2	1	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	8	0	\N	\N	\N	0	3	f	2	2
356	25	2eme_Division.Md_Foot_Bty	Md Foot Bty			10		4	2	1	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	8	0	\N	\N	\N	0	3	f	2	2
357	25	Corps_Artillery.Md_Foot_Bty	Md Foot Bty			10		4	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	8	0	\N	\N	\N	0	3	f	2	2
358	25	1eme_Division.Md_Foot_Bty	Md Foot Bty			10		4	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	8	0	\N	\N	\N	0	3	f	2	2
359	25	1eme_Division.13e_Legere	13e Legere			10	France	2	2	4	6	1	1	\N	\N	\N	\N	\N	\N	\N	1400	0	0	\N	\N	1	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
360	25	1eme_Division	1eme Division		Morand	10	France	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
361	25	2eme_Division.108e_Ligne	108e Ligne			10	France	2	2	1	5	1	1	\N	\N	\N	\N	\N	\N	\N	1600	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
362	25	1eme_Division.51e_Ligne	51e Ligne			10	France	2	2	1	5	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
363	25	1eme_Division.17e_Ligne	17e Ligne			10	France	2	2	4	5	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
364	25	1eme_Division.61e_Ligne	61e Ligne			10	France	2	2	1	5	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
365	25	1eme_Division.30e_Ligne	30e Ligne			10	France	2	2	1	5	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
366	25	2eme_Division	2eme Division		Friant	10	France	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
367	25	2eme_Division.33e_Ligne	33e Ligne			10	France	2	2	1	5	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
368	25	2eme_Division.48e_Ligne	48e Ligne			10	France	2	2	1	5	1	1	\N	\N	\N	\N	\N	\N	\N	1400	0	0	\N	\N	1	0	0	0	\N	0	0	1	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
369	25	2eme_Division.111e_Ligne	111e Ligne			10	France	2	2	1	5	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
370	25	Cav_Bde	Cav Bde		Viallanes	10	France	1	2	4	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
371	25	3eme_Division	3eme Division		Gudin	10	France	1	2	1	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
372	25	3eme_Division.12e_Ligne	12e Ligne			10	France	2	2	1	5	1	1	\N	\N	\N	\N	\N	\N	\N	1300	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
373	25	3eme_Division.21e_Ligne	21e Ligne			10	France	2	2	1	5	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
374	25	3eme_Division.25e_Ligne	25e Ligne			10	France	2	2	1	5	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
375	25	3eme_Division.85e_Ligne	85e Ligne			10	France	2	2	1	5	1	1	\N	\N	\N	\N	\N	\N	\N	1600	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
376	25	Cav_Bde.1e_Chasseur	1e Chasseur			10	France	3	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	600	0	0	0	3	3	0	0	\N	\N	\N	0	0	f	2	0
377	25	Cav_Bde.2e_Chasseur	2e Chasseur			10	France	3	2	1	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	600	0	0	0	3	3	0	0	\N	\N	\N	0	0	f	2	0
378	25	Corps_Artillery	Corps Artillery		Hannicque	10	France	1	2	4	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
379	26	Guard_Artillery.Guard_Foot_Artillery	Guard Foot Artillery			10		4	2	1	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	24	0	\N	\N	\N	0	3	f	2	1
380	26	Infantry_Division.1e_Grenadiers	1e Grenadiers			10	France	2	2	4	5	1	1	\N	\N	\N	\N	\N	\N	\N	2400	0	0	\N	\N	1	0	0	0	\N	0	0	1	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
381	26	Infantry_Division.2e_Grenadiers	2e Grenadiers			10	France	2	2	1	5	1	1	\N	\N	\N	\N	\N	\N	\N	2400	0	0	\N	\N	1	0	0	0	\N	0	0	1	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
382	26	Guard_Artillery.Army_Artillery_Park	Army Artillery Park			10		4	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	16	0	\N	\N	\N	0	1	f	2	2
383	26	Cavalry_Division.Chasseurs_a_Cheval	Chasseurs a Cheval			10	France	3	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	600	0	0	0	3	1	0	0	\N	\N	\N	0	0	f	2	0
384	26	Infantry_Division.1e_Chasseurs	1e Chasseurs			10	France	2	2	1	6	1	1	\N	\N	\N	\N	\N	\N	\N	2400	0	0	\N	\N	1	0	0	0	\N	0	0	1	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
385	26	Cavalry_Division.Grenadier_a_Cheval	Grenadier a Cheval			10	France	3	2	1	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	400	0	0	0	8	1	0	0	\N	\N	\N	0	0	f	2	0
386	26	Guard_Artillery	Guard Artillery		de Lamartiniére	10	France	1	2	4	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	2	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
387	26	Infantry_Division.2e_Chasseurs_Copy	2e Chasseurs_Copy			10	France	2	2	1	6	1	1	\N	\N	\N	\N	\N	\N	\N	2400	0	0	\N	\N	1	0	0	0	\N	0	0	1	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
388	26	Infantry_Division	Infantry Division		Lefebvre	10	France	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
389	26	Infantry_Division.Foot_Dragoons	Foot Dragoons			10	France	2	2	1	6	1	1	\N	\N	\N	\N	\N	\N	\N	2400	0	0	\N	\N	1	0	0	0	\N	0	0	1	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
390	26	Cavalry_Division	Cavalry Division		Bessieres	10	France	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	1	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
391	26	Guard_Artillery.Guard_Horse_Bty	Guard Horse Bty			10		4	2	1	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	8	0	\N	\N	\N	0	4	t	2	1
392	27	2eme_Division.Md_Foot_Bty_Copy	Md Foot Bty_Copy			10		4	2	1	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	0	0	0	0	0	0	0	8	0	\N	\N	\N	0	3	f	2	3
393	27	3eme_Division.Md_Foot_Bty	Md Foot Bty			10		4	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	0	0	0	0	0	0	0	8	0	\N	\N	\N	0	3	f	2	3
394	27	3eme_Division.27e_Legere	27e Legere		Drouet	10	France	2	2	4	6	1	1	\N	\N	\N	\N	\N	\N	\N	1500	0	0	\N	\N	1	0	2	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	4	f	2	0
395	27	Artillery_Reserve.Md_Foot_Bty	Md Foot Bty			10		4	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	8	0	\N	\N	\N	0	3	f	2	2
396	27	2eme_Division.Md_Foot_Bty	Md Foot Bty			10		4	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	0	0	0	0	0	0	0	8	0	\N	\N	\N	0	3	f	2	3
397	27	1eme_Division.Md_Foot_Bty	Md Foot Bty			10		4	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	0	0	0	0	0	0	0	8	0	\N	\N	\N	0	3	f	2	3
398	27	1eme_Division.9e_Legere	9e Legere		de l'Eltang	10	France	2	2	4	6	1	1	\N	\N	\N	\N	\N	\N	\N	2600	0	0	\N	\N	1	2	0	0	\N	0	0	4	0	0	0	0	0	0	0	0	\N	\N	\N	0	4	f	2	0
399	27	2eme_Division.45e_Ligne	45e Ligne		Rivaud	10	France	2	2	4	5	1	1	\N	\N	\N	\N	\N	\N	\N	2000	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
400	27	2eme_Division.54e_Ligne	54e Ligne		Rivaud	10	France	2	2	4	5	1	1	\N	\N	\N	\N	\N	\N	\N	2000	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
401	27	2eme_Division	2eme Division		Rivaud	10	France	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
402	27	1eme_Division.32e_Ligne	32e Ligne		de l'Eltang	10	France	2	2	4	5	1	1	\N	\N	\N	\N	\N	\N	\N	2000	0	0	\N	\N	1	0	0	0	\N	0	0	4	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
403	27	1eme_Division	1eme Division		de l'Eltang	10	France	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
404	27	1eme_Division.96e_Ligne	96e Ligne		de l'Eltang	10	France	2	2	4	5	1	1	\N	\N	\N	\N	\N	\N	\N	2000	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
405	27	2eme_Division.4e_Legere	4e Legere		Rivaud	10	France	2	2	4	6	1	1	\N	\N	\N	\N	\N	\N	\N	2000	0	0	\N	\N	1	0	1	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
406	27	Cav_Reserve	Cav Reserve		Tilley	10	France	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
407	27	Cav_Reserve.2e_Hussar	2e Hussar			10	France	3	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	300	0	0	0	2	3	0	0	\N	\N	\N	0	0	f	2	0
408	27	Cav_Reserve.4e_Hussar	4e Hussar			10	France	3	2	1	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	422	0	0	0	2	4	0	0	\N	\N	\N	0	0	f	2	0
409	27	Artillery_Reserve	Artillery Reserve		Eble	10	France	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
410	27	3eme_Division	3eme Division		Drouet	10	France	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
411	27	3eme_Division.95e_Ligne	95e Ligne		Drouet	10	France	2	2	4	5	1	1	\N	\N	\N	\N	\N	\N	\N	2600	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
412	27	3eme_Division.94e_Ligne	94e Ligne		Drouet	10	France	2	2	4	5	1	1	\N	\N	\N	\N	\N	\N	\N	1500	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
413	28	2eme_Division.Md_Foot_Bty	Md Foot Bty			10		4	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	8	0	\N	\N	\N	0	3	f	2	3
414	28	1eme_Division.Md_Foot_Bty	Md Foot Bty			10		4	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	8	0	\N	\N	\N	0	3	f	2	3
415	28	Corps_Cav.7e_Chasseur	7e Chasseur			10	France	3	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	600	0	0	0	3	4	0	0	\N	\N	\N	0	0	f	2	0
416	28	1eme_Division.105e_Ligne	105e Ligne			10	France	2	2	1	3	1	1	\N	\N	\N	\N	\N	\N	\N	1700	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
417	28	Corps_Cav.20e_Chasseur	20e Chasseur			10	France	3	2	1	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	600	0	0	0	3	4	0	0	\N	\N	\N	0	0	f	2	0
418	28	1eme_Division.14e_Ligne	14e Ligne			10	France	2	2	4	5	1	1	\N	\N	\N	\N	\N	\N	\N	700	0	0	\N	\N	1	0	0	0	\N	0	0	4	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
419	28	Corps_Cav	Corps Cav		Durosnel	10	France	1	2	4	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
420	28	Corps_Artillery	Corps Artillery			10	France	1	2	4	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
421	28	2eme_Division.63e_Ligne	63e Ligne			10	France	2	2	1	5	1	1	\N	\N	\N	\N	\N	\N	\N	700	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
422	28	Corps_Artillery.Heavy_Bty	Heavy Bty			10		4	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	8	0	\N	\N	\N	0	1	f	2	2
423	28	1eme_Division.16e_Legere	16e Legere			10	France	2	2	4	6	1	1	\N	\N	\N	\N	\N	\N	\N	2700	0	0	\N	\N	1	0	0	0	\N	0	0	4	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
424	28	1eme_Division.44e_Ligne	44e Ligne			10	France	2	2	1	5	1	1	\N	\N	\N	\N	\N	\N	\N	1700	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
425	28	1eme_Division	1eme Division		Desjardin	10	France	1	2	4	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
426	28	2eme_Division.24e_Ligne	24e Ligne			10	France	2	2	4	5	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
427	28	2eme_Division.7e_Legere	7e Legere			10	France	2	2	4	6	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	4	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
428	28	2eme_Division	2eme Division		Bierre	10	France	1	2	4	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
429	28	2eme_Division.Hesse_Darmstadt	Hesse Darmstadt			10	Hesse	2	2	1	1	1	1	\N	\N	\N	\N	\N	\N	\N	800	0	0	\N	\N	1	0	0	0	\N	0	0	4	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
430	28	2eme_Division.Allied_Nassau	Allied Nassau			10	Nassau	2	2	1	5	1	1	\N	\N	\N	\N	\N	\N	\N	400	0	0	\N	\N	1	0	0	0	\N	0	0	4	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
431	29	Supply_Train	Supply Train			10	France	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
432	29	Supply_Train.Supply_Escort_Detachment	Supply Escort Detachment			10		5	2	5	6	1	1	\N	\N	\N	\N	\N	\N	\N	300	0	0	\N	\N	1	2	4	0	\N	0	0	6	50	0	0	0	3	0	0	0	\N	\N	\N	0	0	f	2	0
433	30	2nd_Div.3rd_special_regt_von_X	3rd special regt von X			10		2	2	1	8	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	2	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
434	30	2nd_Div.1st_Regt_of_Death	1st Regt of Death	with data		10		2	2	4	3	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
435	30	2nd_Div.Devils_Bde_as_such	Devils Bde as such	as such six much as such		10	gotta break this	2	2	4	4	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	3	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
436	30	2nd_Duvussion.NZ_Brugade_from_NZ	NZ Brugade from NZ			10		2	2	4	7	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
437	30	2nd_Duvussion	2nd Duvussion			10		1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
438	30	7th_Div.4th_Bn	4th Bn			10		2	2	4	3	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
439	30	7th_Div.1st_Bn	1st Bn			10		2	2	4	3	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
440	30	6th_Division	6th Division			10		1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
441	30	6th_Division.2nd_Regt	2nd Regt			10		2	2	4	3	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
442	30	6th_Division.1st_Regt	1st Regt			10		2	2	4	3	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
443	30	7th_Div	7th Div			10		1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
444	30	2nd_Div.2nd_Regt	2nd Regt			10		2	2	4	3	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
445	30	2nd_Div.1st_Regt	1st Regt			10		2	2	4	3	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
446	30	2nd_Div	2nd Div			10		1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
447	30	1st_Div.3rd_special_regt	3rd special regt			10		2	2	4	3	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
448	30	1st_Div.2nd_Regt	2nd Regt			10	France	2	2	4	3	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	6	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
449	30	1st_Div.1st_Regt	1st Regt			10		2	2	4	3	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
450	30	1st_Div	1st Div			10		1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
451	31	Supply_Train.Guard_Detachment	Guard Detachment			10		5	2	6	8	1	1	\N	\N	\N	\N	\N	\N	\N	300	0	0	\N	\N	1	2	4	0	\N	0	0	10	60	0	0	0	12	7	0	0	\N	\N	\N	0	0	f	2	0
452	31	Supply_Train	Supply Train		von Schulze	10	Prussia	1	2	6	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
453	32	Corps_Cavaly.11e_Chasseur	11e Chasseur			10	France	3	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	600	0	0	0	3	4	0	0	\N	\N	\N	0	0	f	2	0
454	32	Corps_Artillery	Corps Artillery			10	France	1	2	5	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
455	32	Corps_Artillery.Heavy_Bty	Heavy Bty			10		4	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	8	0	\N	\N	\N	0	1	f	2	3
456	32	3eme_Division.Po_Legere	Po Legere			10	France/Italy	2	2	4	6	1	1	\N	\N	\N	\N	\N	\N	\N	1000	0	0	\N	\N	1	2	2	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
457	32	3eme_Division.75e_Ligne	75e Ligne			10	France	2	2	4	5	1	1	\N	\N	\N	\N	\N	\N	\N	1700	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
458	32	3eme_Division	3eme Division		LeGrand	10	France	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
459	32	Corps_Cavaly	Corps Cavaly		Guyot	10	France	1	2	4	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
460	32	1eme_Division.55e_Ligne	55e Ligne			10	France	2	2	1	5	1	1	\N	\N	\N	\N	\N	\N	\N	1400	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
461	32	Corps_Cavaly.22e_Chasseur	22e Chasseur			10	France	3	2	1	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	600	0	0	0	3	4	0	0	\N	\N	\N	0	0	f	2	0
462	32	3eme_Division.18e_Ligne	18e Ligne			10	France	2	2	4	5	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	4	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
463	32	2eme_Division.57e_Ligne	57e Ligne			10	France	2	2	1	5	1	1	\N	\N	\N	\N	\N	\N	\N	1700	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
464	32	1eme_Division.10e_Legere	10e Legere			10	France	2	2	4	6	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	4	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
465	32	3eme_Division.26e_Legere	26e Legere			10	France	2	2	4	6	1	1	\N	\N	\N	\N	\N	\N	\N	1600	0	0	\N	\N	1	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
466	32	1eme_Division	1eme Division		St Hilaire	10	France	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
467	32	2eme_Division.4e_Ligne	4e Ligne			10	France	2	2	1	5	1	1	\N	\N	\N	\N	\N	\N	\N	1400	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
468	32	2eme_Division.24e_Legere	24e Legere			10	France	2	2	1	6	1	1	\N	\N	\N	\N	\N	\N	\N	2000	0	0	\N	\N	1	0	0	0	\N	0	0	4	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
469	32	1eme_Division.43e_Ligne	43e Ligne			10	France	2	2	1	5	1	1	\N	\N	\N	\N	\N	\N	\N	1400	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
470	32	2eme_Division.46e_Ligne	46e Ligne			10	France	2	2	1	5	1	1	\N	\N	\N	\N	\N	\N	\N	1400	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
471	32	3eme_Division.Corsican_Legere_Copy	Corsican Legere_Copy			10	France/Corsica	2	2	1	6	1	1	\N	\N	\N	\N	\N	\N	\N	1300	0	0	\N	\N	1	2	0	1	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
472	32	1eme_Division.35e_Ligne	35e Ligne			10	France	2	2	4	5	1	1	\N	\N	\N	\N	\N	\N	\N	1400	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
473	32	2eme_Division.28e_Ligne	28e Ligne			10	France	2	2	1	5	1	1	\N	\N	\N	\N	\N	\N	\N	1400	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
474	32	2eme_Division	2eme Division		Leval	10	France	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
475	32	3eme_Division.Md_Foot_Bty	Md Foot Bty			10		4	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	8	0	\N	\N	\N	0	3	f	2	2
476	32	1eme_Division.Md_Foot_Bty	Md Foot Bty			10		4	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	8	0	\N	\N	\N	0	3	f	2	2
477	32	2eme_Division.Md_Foot_Bty	Md Foot Bty			10		4	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	8	0	\N	\N	\N	0	3	f	2	3
478	33	2eme_Division.103e_Ligne	103e Ligne			10	France	2	2	4	3	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
479	33	2eme_Division.100e_Ligne	100e Ligne			10	France	2	2	4	3	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
480	33	2eme_Division.28e_Legere	28e Legere			10	France	2	2	4	6	1	1	\N	\N	\N	\N	\N	\N	\N	900	0	0	\N	\N	1	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
481	33	2eme_Division.21e_Legere	21e Legere			10	France	2	2	4	6	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	1	0	0	0	\N	\N	\N	0	0	f	2	0
482	33	2eme_Division	2eme Division		Gazan	10	France	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
483	33	1eme_Division.88e_Ligne	88e Ligne			10	France	2	2	1	5	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
484	33	1eme_Division.64e_Ligne	64e Ligne			10	France	2	2	1	5	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
485	33	1eme_Division.40e_Ligne	40e Ligne			10	France	2	2	4	5	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
486	33	1eme_Division.34e_Ligne	34e Ligne			10	France	2	2	4	5	1	1	\N	\N	\N	\N	\N	\N	\N	2500	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
487	33	1eme_Division.17e_Legere	17e Legere			10	France	2	2	4	6	1	1	\N	\N	\N	\N	\N	\N	\N	2100	0	0	\N	\N	1	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
488	33	1eme_Division	1eme Division		Suchet	10	France	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
489	33	Corps_Artillery.Heavy_Foot	Heavy Foot			10		4	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	8	0	\N	\N	\N	0	1	f	2	2
490	33	Corps_Artillery	Corps Artillery		Careil	10	France	1	2	5	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
491	33	Cav_Bde.9e_Hussar_Copy	9e Hussar_Copy			10	France	3	2	1	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	600	0	0	0	2	3	0	0	\N	\N	\N	0	0	f	2	0
492	33	Cav_Bde.10e_Hussar	10e Hussar			10	France	3	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	600	0	0	0	2	3	0	0	\N	\N	\N	0	0	f	2	0
493	33	Cav_Bde	Cav Bde		Trelliard	10	France	1	2	4	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
494	33	1eme_Division.Md_Foot_Bty	Md Foot Bty			10		4	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	8	0	\N	\N	\N	0	3	f	2	3
495	33	2eme_Division.Md_Foot_Bty	Md Foot Bty			10		4	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	8	0	\N	\N	\N	0	3	f	2	3
496	34	2eme_Division.25e_Legere	25e Legere			10	France	2	2	4	6	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	4	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
497	34	1eme_Division.6e_Legere	6e Legere			10	France	2	2	4	6	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	4	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
498	34	2eme_Division.27e_Ligne	27e Ligne			10	France	2	2	1	5	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
499	34	2eme_Division.50e_Ligne	50e Ligne			10	France	2	2	1	5	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
500	34	Cav_Bde	Cav Bde		Charbanais	10	France	1	2	4	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
501	34	1eme_Division	1eme Division		Marchand	10	France	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
502	34	2eme_Division	2eme Division		Gardanne	10	France	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
503	34	Corps_Artillery.2e_Heavy_Bty	2e Heavy Bty			10		4	2	1	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	8	0	\N	\N	\N	0	1	f	2	2
504	34	Corps_Artillery.1e_Heavy_Bty	1e Heavy Bty			10		4	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	8	0	\N	\N	\N	0	1	f	2	2
505	34	2eme_Division.59e_Ligne	59e Ligne			10	France	2	2	1	5	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
506	34	Corps_Artillery	Corps Artillery			10	France	1	2	4	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
507	34	1eme_Division.76e_Ligne	76e Ligne			10	France	2	2	1	5	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
508	34	Cav_Bde.10e_Chasseur	10e Chasseur			10	France	3	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	600	0	0	0	3	4	0	0	\N	\N	\N	0	0	f	2	0
509	34	1eme_Division.69e_Ligne	69e Ligne			10	France	2	2	1	5	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
510	34	1eme_Division.39e_Ligne	39e Ligne			10	France	2	2	4	5	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
511	34	Cav_Bde.9e_Hussar	9e Hussar			10	France	3	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	600	0	0	0	2	3	0	0	\N	\N	\N	0	0	f	2	0
512	35	Corps_Artillery.2e_Horse	2e Horse			10		4	2	1	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	8	0	\N	\N	\N	0	3	t	2	2
513	35	Corps_Artillery.1e_Horse	1e Horse			10		4	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	8	0	\N	\N	\N	0	3	t	2	2
514	35	3e_Dragoon_Div.Bde_Maubourg	Bde Maubourg			10	France	3	2	1	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	600	0	0	0	5	5	0	0	\N	\N	\N	0	0	f	2	0
515	35	3e_Dragoon_Div.Bde_Boye	Bde Boye			10	France	3	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	900	0	0	0	5	5	0	0	\N	\N	\N	0	0	f	2	0
516	35	4e_Dragoon_Div.Bde_Margaron	Bde Margaron			10	France	3	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	1200	0	0	0	5	5	0	0	\N	\N	\N	0	0	f	2	0
517	35	1e_Dragoon_Div.Bde_Picard	Bde Picard			10	France	3	2	1	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	600	0	0	0	5	4	0	0	\N	\N	\N	0	0	f	2	0
518	35	4e_Dragoon_Div.Bde_Laplanche	Bde Laplanche			10	France	3	2	1	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	1200	0	0	0	5	5	0	0	\N	\N	\N	0	0	f	2	0
519	35	1e_Dragoon_Div.Bde_Fenerolz	Bde Fenerolz			10	France	3	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	600	0	0	0	5	4	0	0	\N	\N	\N	0	0	f	2	0
520	35	1e_Cuirassier_Div.Bde_Housaye	Bde Housaye			10	France	3	2	1	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	1300	0	0	0	1	2	0	0	\N	\N	\N	0	0	f	2	0
521	35	2e_Dragoon_Div.Bde_Milet	Bde Milet			10	France	3	2	1	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	600	0	0	0	5	5	0	0	\N	\N	\N	0	0	f	2	0
522	35	1e_Cuirassier_Div.Bde_Defrance	Bde Defrance			10	France	3	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	600	0	0	0	9	2	0	0	\N	\N	\N	0	0	f	2	0
523	35	2e_Dragoon_Div.Bde_Roget	Bde Roget			10	France	3	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	900	0	0	0	5	5	0	0	\N	\N	\N	0	0	f	2	0
524	35	Light_Div.Bde_Lasalle_5_7e_Hussar	Bde Lasalle 5/7e Hussar			10	France	3	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	600	0	0	0	2	3	0	0	\N	\N	\N	0	0	f	2	0
525	35	Light_Div.Milhaud_1e_Hussar	Milhaud 1e Hussar			10	France	3	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	600	0	0	0	2	3	0	0	\N	\N	\N	0	0	f	2	0
526	35	Light_Div	Light Div		Lasalle	10	France	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
527	35	2e_Cuirassier_Div.Bde_StSulpice	Bde St.Sulpice			10	France	3	2	1	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	600	0	0	0	1	4	0	0	\N	\N	\N	0	0	f	2	0
528	35	4e_Dragoon_Div	4e Dragoon Div		Sahut	10	France	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
529	35	3e_Dragoon_Div	3e Dragoon Div		Beaumont	10	France	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
530	35	2e_Cuirassier_Div.Bde_Verdiere	Bde Verdiere			10	France	3	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	600	0	0	0	1	4	0	0	\N	\N	\N	0	0	f	2	0
531	35	2e_Dragoon_Div	2e Dragoon Div		Grouchy	10	France	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
532	35	2e_Cuirassier_Div	2e Cuirassier Div		d'Hautpoul	10	France	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
533	35	1e_Dragoon_Div	1e Dragoon Div		Klein	10	France	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
534	35	1e_Cuirassier_Div	1e Cuirassier Div		Nansouty	10	France	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
535	35	Corps_Artillery	Corps Artillery			10	France	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
536	36	2nd_Div.Heavy_Bty	Heavy Bty			10	Saxony	4	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	8	0	\N	\N	\N	0	1	f	2	3
537	36	2nd_Div.Cav_Bde_von_Kochitsky	Cav Bde von Kochitsky			10	Saxony	3	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	200	0	0	0	1	3	0	0	\N	\N	\N	0	0	f	2	0
538	36	1st_Div.Erichsen_Fusilers	Erichsen Fusilers			10		2	2	4	9	1	1	\N	\N	\N	\N	\N	\N	\N	700	0	0	\N	\N	1	0	0	1	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
539	36	2nd_Div	2nd Div		Zechwitz	10	Prussia	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
540	36	2nd_Div.Boguslawsky_Fusilers	Boguslawsky Fusilers			10	Prussia	2	2	4	9	1	1	\N	\N	\N	\N	\N	\N	\N	800	0	0	\N	\N	1	0	2	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
541	36	1st_Div.Bde_Henkel	Bde Henkel			10	Prussia	3	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	900	0	0	0	5	3	0	0	\N	\N	\N	0	0	f	2	0
542	36	1st_Div.Heavy_Bty	Heavy Bty			10	Prussia	4	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	8	0	\N	\N	\N	0	1	f	2	4
543	36	Reserve_Div.Heavy_Bty	Heavy Bty			10	Prussia	4	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	8	0	\N	\N	\N	0	1	f	2	3
544	36	Reserve_Div	Reserve Div		Prittwitz	10	Prussia	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
545	36	1st_Div.von_Mueffling	von Müffling			10	Prussia	2	2	4	1	1	1	\N	\N	\N	\N	\N	\N	\N	3600	0	0	\N	\N	1	0	1	0	\N	0	0	4	0	0	0	0	0	0	2	0	\N	\N	\N	0	4	f	2	3
546	36	Reserve_Div.Cav_Bde_von_Krafft	Cav Bde von Krafft			10	Prussia	3	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	900	0	0	0	12	3	0	0	\N	\N	\N	0	0	f	2	0
547	36	3rd_Div.Lt_Bty	Lt Bty			10	Prussia	4	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	6	0	\N	\N	\N	0	4	f	2	3
548	36	1st_Div	1st Div		Grawert	10	Prussia	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
549	36	3rd_Div.von_Zweiffel	von Zweiffel			10	Prussia	2	2	4	1	1	1	\N	\N	\N	\N	\N	\N	\N	3400	0	0	\N	\N	1	0	1	0	\N	0	0	4	0	0	0	0	0	0	2	0	\N	\N	\N	0	4	f	2	0
550	36	3rd_Div.von_Schoeneberg	von Schöneberg			10	Saxony	2	2	4	1	1	1	\N	\N	\N	\N	\N	\N	\N	3400	0	0	\N	\N	1	0	1	0	\N	0	0	5	0	0	0	0	0	0	2	0	\N	\N	\N	0	4	f	2	4
551	36	3rd_Div.Rosen_Fusilers	Rosen Fusilers			10	Prussia	2	2	4	9	1	1	\N	\N	\N	\N	\N	\N	\N	400	0	0	\N	\N	1	0	0	2	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
552	36	3rd_Div.Cav_Bde_Prince_Clement	Cav Bde Prince Clement			10	Prussia	3	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	700	0	0	0	2	4	0	0	\N	\N	\N	0	0	f	2	0
553	36	3rd_Div	3rd Div		Tauentzein	10	Prussia	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
554	36	Reserve_Div.Md_Foot_Bty	Md Foot Bty			10	Prussia	4	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	8	0	\N	\N	\N	0	3	f	2	4
555	36	1st_Div.von_Schimonsky	von Schimonsky			10	Prussia	2	2	4	1	1	1	\N	\N	\N	\N	\N	\N	\N	3400	0	0	\N	\N	1	0	1	0	\N	0	0	4	0	0	0	0	0	0	2	0	\N	\N	\N	0	4	f	2	3
556	36	Reserve_Div.Cerrini_Grenadier_Bde	Cerrini Grenadier Bde			10	Prussia	2	2	4	1	1	1	\N	\N	\N	\N	\N	\N	\N	4200	0	0	\N	\N	1	0	0	2	\N	0	0	4	0	0	0	0	0	0	2	0	\N	\N	\N	0	4	f	2	3
557	36	Reserve_Div.Prittwitz_Grenadier_Bde	Prittwitz Grenadier Bde			10	Prussia	2	2	4	1	1	1	\N	\N	\N	\N	\N	\N	\N	3300	0	0	\N	\N	1	0	0	2	\N	0	0	4	0	0	0	0	0	0	2	0	\N	\N	\N	0	4	f	2	3
558	36	1st_Div.Horse_Bty	Horse Bty			10	Prussia	4	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	8	0	\N	\N	\N	0	3	f	2	3
559	36	2nd_Div.von_Dyherrn	von Dyherrn			10	Saxony	2	2	4	3	1	1	\N	\N	\N	\N	\N	\N	\N	4200	0	0	\N	\N	1	0	1	0	\N	0	0	4	0	0	0	0	0	0	2	0	\N	\N	\N	0	4	f	2	3
560	36	2nd_Div.von_Burgsdorf	von Burgsdorf			10	Saxony	2	2	4	1	1	1	\N	\N	\N	\N	\N	\N	\N	3400	0	0	\N	\N	1	0	1	0	\N	0	0	4	0	0	0	0	0	0	1	0	\N	\N	\N	0	4	f	2	3
561	36	2nd_Div.Horse_Bty	Horse Bty			10	Saxony	4	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	8	0	\N	\N	\N	0	3	f	2	3
562	37	Adv_Guard_Div	Adv Guard Div		Ferdinand	10	Prussia	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
563	37	Adv_Guard_Div.Bde_Belvilaqua	Bde Belvilaqua	Combined Bns from IR 49,  Prinz Clemens (saxon), and Kurfurst (saxon)		10	Prussia/Saxony	2	2	4	1	1	1	\N	\N	\N	\N	\N	\N	\N	5100	0	0	\N	\N	1	0	1	0	\N	0	0	5	0	0	0	0	0	0	6	0	\N	\N	\N	0	4	f	2	0
564	37	Adv_Guard_Div.Bde_von_Pelet	Bde von Pelet	Rabenau # 13 Pelet # 14 Rühle # 15 Fusiliers, Masars and Valentin Jager 		10	Prussia	2	2	4	9	1	1	\N	\N	\N	\N	\N	\N	\N	2400	0	0	\N	\N	1	0	0	2	\N	0	0	4	0	0	0	0	0	0	6	0	\N	\N	\N	0	3	f	2	3
565	37	Adv_Guard_Div.Cav_Bde_von_Schimmelpfennig	Cav Bde von Schimmelpfennig	Schimmelpfennig Hussar Regiment # 6, ten squadrons		10	Prussia	3	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	1500	0	0	0	2	4	6	0	\N	\N	\N	0	3	f	2	3
566	37	Adv_Guard_Div.Saxon_Hussar_von_Truetzschler	Saxon Hussar von Trützschler	Saxon Hussar Regiment, eight squadrons		10	Saxony	3	2	1	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	1200	0	0	0	2	4	0	0	\N	\N	\N	0	0	f	2	0
567	39	2nd_Div	2nd Div		von Arnim	10	Prussia	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
568	39	1st_Div.Beeren_Cuirassier	Beeren Cuirassier			10	Prussia	3	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	400	0	0	0	1	2	0	0	\N	\N	\N	0	0	f	2	0
569	39	1st_Div.Garde_du_Corps_Cavalry	Garde du Corps Cavalry			10	Prussia	3	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	600	0	0	0	1	1	0	0	\N	\N	\N	0	0	f	2	0
570	39	1st_Div	1st Div		Kuhnheim	10	Prussia	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
571	39	1st_Div.Guard_Bde_von_Pletz	Guard Bde von Pletz			10	Prussia	2	2	4	1	1	1	\N	\N	\N	\N	\N	\N	\N	2400	0	0	\N	\N	1	0	0	1	\N	0	0	2	0	0	0	0	0	0	2	0	\N	\N	\N	0	4	f	2	1
572	39	1st_Div.Guard_Bde_von_Hirschfeld	Guard Bde von Hirschfeld			10	Prussia	2	2	1	1	1	1	\N	\N	\N	\N	\N	\N	\N	2400	0	0	\N	\N	1	0	0	1	\N	0	0	2	0	0	0	0	0	0	2	0	\N	\N	\N	0	4	f	2	1
573	39	2nd_Div.von_Zenge_Grenadiers	von Zenge Grenadiers			10	Prussia	2	2	1	1	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	1	\N	0	0	4	0	0	0	0	0	0	2	0	\N	\N	\N	0	4	f	2	1
574	39	2nd_Div.Zenge_Regt_Musketeer	Zenge Regt Musketeer			10	Prussia	2	2	1	1	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	1	\N	0	0	4	0	0	0	0	0	0	2	0	\N	\N	\N	0	4	f	2	1
575	39	2nd_Div.Arnim_Regt_Musketeer	Arnim Regt Musketeer			10	Prussia	2	2	1	1	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	1	\N	0	0	4	0	0	0	0	0	0	2	0	\N	\N	\N	0	4	f	2	1
576	39	2nd_Div.Pirch_Regt_Musketeer	Pirch Regt Musketeer			10	Prussia	2	2	1	1	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	1	\N	0	0	4	0	0	0	0	0	0	2	0	\N	\N	\N	0	4	f	2	1
577	39	1st_Div.Md_Foot_Bty	Md Foot Bty			10	Prussia	4	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	8	0	\N	\N	\N	0	3	f	2	1
578	39	2nd_Div.Md_Foot_Bty	Md Foot Bty			10	Prussia	4	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	8	0	\N	\N	\N	0	3	f	2	1
579	39	2nd_Div.von_Malschitsky_Grenadiers	von Malschitsky Grenadiers			10	Prussia	2	2	4	1	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	1	\N	0	0	4	0	0	0	0	0	0	2	0	\N	\N	\N	0	4	f	2	1
580	40	Corps_Artillery	Corps Artillery		Hannicque	10	France	1	2	4	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
581	40	Cav_Bde.2e_Chasseur	2e Chasseur			10	France	3	2	1	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	600	0	0	0	3	3	0	0	\N	\N	\N	0	0	f	2	0
582	40	Cav_Bde.1e_Chasseur	1e Chasseur			10	France	3	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	600	0	0	0	3	3	0	0	\N	\N	\N	0	0	f	2	0
583	40	3eme_Division.85e_Ligne	85e Ligne			10	France	2	2	1	5	1	1	\N	\N	\N	\N	\N	\N	\N	1600	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
584	40	3eme_Division.25e_Ligne	25e Ligne			10	France	2	2	1	5	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
585	40	3eme_Division.21e_Ligne	21e Ligne			10	France	2	2	1	5	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
586	40	3eme_Division.12e_Ligne	12e Ligne			10	France	2	2	1	5	1	1	\N	\N	\N	\N	\N	\N	\N	1300	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
587	40	3eme_Division	3eme Division		Gudin	10	France	1	2	1	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
588	40	Cav_Bde	Cav Bde		Viallanes	10	France	1	2	4	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
589	40	2eme_Division.111e_Ligne	111e Ligne			10	France	2	2	1	5	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
590	40	2eme_Division.48e_Ligne	48e Ligne			10	France	2	2	1	5	1	1	\N	\N	\N	\N	\N	\N	\N	1400	0	0	\N	\N	1	0	0	0	\N	0	0	1	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
591	40	2eme_Division.33e_Ligne	33e Ligne			10	France	2	2	1	5	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
592	40	2eme_Division	2eme Division		Friant	10	France	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
593	40	1eme_Division.30e_Ligne	30e Ligne			10	France	2	2	1	5	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
594	40	1eme_Division.61e_Ligne	61e Ligne			10	France	2	2	1	5	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
595	40	1eme_Division.17e_Ligne	17e Ligne			10	France	2	2	4	5	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
596	40	1eme_Division.51e_Ligne	51e Ligne			10	France	2	2	1	5	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
597	40	2eme_Division.108e_Ligne	108e Ligne			10	France	2	2	1	5	1	1	\N	\N	\N	\N	\N	\N	\N	1600	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
598	40	1eme_Division	1eme Division		Morand	10	France	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
599	40	1eme_Division.13e_Legere	13e Legere			10	France	2	2	4	6	1	1	\N	\N	\N	\N	\N	\N	\N	1400	0	0	\N	\N	1	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
600	40	1eme_Division.Md_Foot_Bty	Md Foot Bty			10		4	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	8	0	\N	\N	\N	0	3	f	2	2
601	40	Corps_Artillery.Md_Foot_Bty	Md Foot Bty			10		4	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	8	0	\N	\N	\N	0	3	f	2	2
602	40	2eme_Division.Md_Foot_Bty	Md Foot Bty			10		4	2	1	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	8	0	\N	\N	\N	0	3	f	2	2
603	40	3eme_Division.Md_Foot_Bty	Md Foot Bty			10		4	2	1	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	8	0	\N	\N	\N	0	3	f	2	2
604	41	Guard_Artillery.Guard_Horse_Bty	Guard Horse Bty			10		4	2	1	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	8	0	\N	\N	\N	0	4	t	2	1
605	41	Cavalry_Division	Cavalry Division		Bessieres	10	France	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	1	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
606	41	Infantry_Division.Foot_Dragoons	Foot Dragoons			10	France	2	2	1	6	1	1	\N	\N	\N	\N	\N	\N	\N	2400	0	0	\N	\N	1	0	0	0	\N	0	0	1	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
607	41	Infantry_Division	Infantry Division		Lefebvre	10	France	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
608	41	Infantry_Division.2e_Chasseurs_Copy	2e Chasseurs_Copy			10	France	2	2	1	6	1	1	\N	\N	\N	\N	\N	\N	\N	2400	0	0	\N	\N	1	0	0	0	\N	0	0	1	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
609	41	Guard_Artillery	Guard Artillery		de Lamartiniére	10	France	1	2	4	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	2	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
610	41	Cavalry_Division.Grenadier_a_Cheval	Grenadier a Cheval			10	France	3	2	1	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	400	0	0	0	8	1	0	0	\N	\N	\N	0	0	f	2	0
611	41	Infantry_Division.1e_Chasseurs	1e Chasseurs			10	France	2	2	1	6	1	1	\N	\N	\N	\N	\N	\N	\N	2400	0	0	\N	\N	1	0	0	0	\N	0	0	1	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
612	41	Cavalry_Division.Chasseurs_a_Cheval	Chasseurs a Cheval			10	France	3	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	600	0	0	0	3	1	0	0	\N	\N	\N	0	0	f	2	0
613	41	Guard_Artillery.Army_Artillery_Park	Army Artillery Park			10		4	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	16	0	\N	\N	\N	0	1	f	2	2
614	41	Infantry_Division.2e_Grenadiers	2e Grenadiers			10	France	2	2	1	5	1	1	\N	\N	\N	\N	\N	\N	\N	2400	0	0	\N	\N	1	0	0	0	\N	0	0	1	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
615	41	Infantry_Division.1e_Grenadiers	1e Grenadiers			10	France	2	2	4	5	1	1	\N	\N	\N	\N	\N	\N	\N	2400	0	0	\N	\N	1	0	0	0	\N	0	0	1	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
616	41	Guard_Artillery.Guard_Foot_Artillery	Guard Foot Artillery			10		4	2	1	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	24	0	\N	\N	\N	0	3	f	2	1
617	42	3eme_Division.94e_Ligne	94e Ligne		Drouet	10	France	2	2	4	5	1	1	\N	\N	\N	\N	\N	\N	\N	1500	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
618	42	3eme_Division.95e_Ligne	95e Ligne		Drouet	10	France	2	2	4	5	1	1	\N	\N	\N	\N	\N	\N	\N	2600	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
619	42	3eme_Division	3eme Division		Drouet	10	France	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
620	42	Artillery_Reserve	Artillery Reserve		Eble	10	France	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
621	42	Cav_Reserve.4e_Hussar	4e Hussar			10	France	3	2	1	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	422	0	0	0	2	4	0	0	\N	\N	\N	0	0	f	2	0
622	42	Cav_Reserve.2e_Hussar	2e Hussar			10	France	3	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	300	0	0	0	2	3	0	0	\N	\N	\N	0	0	f	2	0
623	42	Cav_Reserve	Cav Reserve		Tilley	10	France	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
624	42	2eme_Division.4e_Legere	4e Legere		Rivaud	10	France	2	2	4	6	1	1	\N	\N	\N	\N	\N	\N	\N	2000	0	0	\N	\N	1	0	1	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
625	42	1eme_Division.96e_Ligne	96e Ligne		de l'Eltang	10	France	2	2	4	5	1	1	\N	\N	\N	\N	\N	\N	\N	2000	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
626	42	1eme_Division	1eme Division		de l'Eltang	10	France	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
627	42	1eme_Division.32e_Ligne	32e Ligne		de l'Eltang	10	France	2	2	4	5	1	1	\N	\N	\N	\N	\N	\N	\N	2000	0	0	\N	\N	1	0	0	0	\N	0	0	4	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
628	42	2eme_Division	2eme Division		Rivaud	10	France	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
629	42	2eme_Division.54e_Ligne	54e Ligne		Rivaud	10	France	2	2	4	5	1	1	\N	\N	\N	\N	\N	\N	\N	2000	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
630	42	2eme_Division.45e_Ligne	45e Ligne		Rivaud	10	France	2	2	4	5	1	1	\N	\N	\N	\N	\N	\N	\N	2000	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
631	42	1eme_Division.9e_Legere	9e Legere		de l'Eltang	10	France	2	2	4	6	1	1	\N	\N	\N	\N	\N	\N	\N	2600	0	0	\N	\N	1	2	0	0	\N	0	0	4	0	0	0	0	0	0	0	0	\N	\N	\N	0	4	f	2	0
632	42	1eme_Division.Md_Foot_Bty	Md Foot Bty			10		4	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	0	0	0	0	0	0	0	8	0	\N	\N	\N	0	3	f	2	3
633	42	2eme_Division.Md_Foot_Bty	Md Foot Bty			10		4	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	0	0	0	0	0	0	0	8	0	\N	\N	\N	0	3	f	2	3
634	42	Artillery_Reserve.Md_Foot_Bty	Md Foot Bty			10		4	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	8	0	\N	\N	\N	0	3	f	2	2
635	42	3eme_Division.27e_Legere	27e Legere		Drouet	10	France	2	2	4	6	1	1	\N	\N	\N	\N	\N	\N	\N	1500	0	0	\N	\N	1	0	2	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	4	f	2	0
636	42	3eme_Division.Md_Foot_Bty	Md Foot Bty			10		4	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	0	0	0	0	0	0	0	8	0	\N	\N	\N	0	3	f	2	3
637	42	2eme_Division.Md_Foot_Bty_Copy	Md Foot Bty_Copy			10		4	2	1	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	0	0	0	0	0	0	0	8	0	\N	\N	\N	0	3	f	2	3
638	43	2eme_Division.Allied_Nassau	Allied Nassau			10	Nassau	2	2	1	5	1	1	\N	\N	\N	\N	\N	\N	\N	400	0	0	\N	\N	1	0	0	0	\N	0	0	4	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
639	43	2eme_Division.Hesse_Darmstadt	Hesse Darmstadt			10	Hesse	2	2	1	1	1	1	\N	\N	\N	\N	\N	\N	\N	800	0	0	\N	\N	1	0	0	0	\N	0	0	4	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
640	43	2eme_Division	2eme Division		Bierre	10	France	1	2	4	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
641	43	2eme_Division.7e_Legere	7e Legere			10	France	2	2	4	6	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	4	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
642	43	2eme_Division.24e_Ligne	24e Ligne			10	France	2	2	4	5	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
643	43	1eme_Division	1eme Division		Desjardin	10	France	1	2	4	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
644	43	1eme_Division.44e_Ligne	44e Ligne			10	France	2	2	1	5	1	1	\N	\N	\N	\N	\N	\N	\N	1700	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
645	43	1eme_Division.16e_Legere	16e Legere			10	France	2	2	4	6	1	1	\N	\N	\N	\N	\N	\N	\N	2700	0	0	\N	\N	1	0	0	0	\N	0	0	4	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
646	43	Corps_Artillery.Heavy_Bty	Heavy Bty			10		4	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	8	0	\N	\N	\N	0	1	f	2	2
647	43	2eme_Division.63e_Ligne	63e Ligne			10	France	2	2	1	5	1	1	\N	\N	\N	\N	\N	\N	\N	700	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
648	43	Corps_Artillery	Corps Artillery			10	France	1	2	4	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
649	43	Corps_Cav	Corps Cav		Durosnel	10	France	1	2	4	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
650	43	1eme_Division.14e_Ligne	14e Ligne			10	France	2	2	4	5	1	1	\N	\N	\N	\N	\N	\N	\N	700	0	0	\N	\N	1	0	0	0	\N	0	0	4	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
651	43	Corps_Cav.20e_Chasseur	20e Chasseur			10	France	3	2	1	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	600	0	0	0	3	4	0	0	\N	\N	\N	0	0	f	2	0
652	43	1eme_Division.105e_Ligne	105e Ligne			10	France	2	2	1	3	1	1	\N	\N	\N	\N	\N	\N	\N	1700	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
653	43	Corps_Cav.7e_Chasseur	7e Chasseur			10	France	3	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	600	0	0	0	3	4	0	0	\N	\N	\N	0	0	f	2	0
654	43	1eme_Division.Md_Foot_Bty	Md Foot Bty			10		4	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	8	0	\N	\N	\N	0	3	f	2	3
655	43	2eme_Division.Md_Foot_Bty	Md Foot Bty			10		4	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	8	0	\N	\N	\N	0	3	f	2	3
656	44	Supply_Train.Supply_Escort_Detachment	Supply Escort Detachment			10		5	2	5	6	1	1	\N	\N	\N	\N	\N	\N	\N	300	0	0	\N	\N	1	2	4	0	\N	0	0	6	50	0	0	0	3	0	0	0	\N	\N	\N	0	0	f	2	0
657	44	Supply_Train	Supply Train			10	France	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
658	45	1st_Div	1st Div			10		1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
659	45	1st_Div.1st_Regt	1st Regt			10		2	2	4	3	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
660	45	1st_Div.2nd_Regt	2nd Regt			10	France	2	2	4	3	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	6	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
661	45	1st_Div.3rd_special_regt	3rd special regt			10		2	2	4	3	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
662	45	2nd_Div	2nd Div			10		1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
663	45	2nd_Div.1st_Regt	1st Regt			10		2	2	4	3	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
664	45	2nd_Div.2nd_Regt	2nd Regt			10		2	2	4	3	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
665	45	7th_Div	7th Div			10		1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
666	45	6th_Division.1st_Regt	1st Regt			10		2	2	4	3	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
667	45	6th_Division.2nd_Regt	2nd Regt			10		2	2	4	3	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
668	45	6th_Division	6th Division			10		1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
669	45	7th_Div.1st_Bn	1st Bn			10		2	2	4	3	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
670	45	7th_Div.4th_Bn	4th Bn			10		2	2	4	3	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
671	45	2nd_Duvussion	2nd Duvussion			10		1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
672	45	2nd_Duvussion.NZ_Brugade_from_NZ	NZ Brugade from NZ			10		2	2	4	7	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
673	45	2nd_Div.Devils_Bde_as_such	Devils Bde as such	as such six much as such		10	gotta break this	2	2	4	4	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	3	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
674	45	2nd_Div.1st_Regt_of_Death	1st Regt of Death	with data		10		2	2	4	3	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
675	45	2nd_Div.3rd_special_regt_von_X	3rd special regt von X			10		2	2	1	8	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	2	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
676	46	Supply_Train	Supply Train		von Schulze	10	Prussia	1	2	6	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
677	46	Supply_Train.Guard_Detachment	Guard Detachment			10		5	2	6	8	1	1	\N	\N	\N	\N	\N	\N	\N	300	0	0	\N	\N	1	2	4	0	\N	0	0	10	60	0	0	0	12	7	0	0	\N	\N	\N	0	0	f	2	0
678	47	2eme_Division.Md_Foot_Bty	Md Foot Bty			10		4	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	8	0	\N	\N	\N	0	3	f	2	3
679	47	1eme_Division.Md_Foot_Bty	Md Foot Bty			10		4	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	8	0	\N	\N	\N	0	3	f	2	2
680	47	3eme_Division.Md_Foot_Bty	Md Foot Bty			10		4	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	8	0	\N	\N	\N	0	3	f	2	2
681	47	2eme_Division	2eme Division		Leval	10	France	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
682	47	2eme_Division.28e_Ligne	28e Ligne			10	France	2	2	1	5	1	1	\N	\N	\N	\N	\N	\N	\N	1400	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
683	47	1eme_Division.35e_Ligne	35e Ligne			10	France	2	2	4	5	1	1	\N	\N	\N	\N	\N	\N	\N	1400	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
684	47	3eme_Division.Corsican_Legere_Copy	Corsican Legere_Copy			10	France/Corsica	2	2	1	6	1	1	\N	\N	\N	\N	\N	\N	\N	1300	0	0	\N	\N	1	2	0	1	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
685	47	2eme_Division.46e_Ligne	46e Ligne			10	France	2	2	1	5	1	1	\N	\N	\N	\N	\N	\N	\N	1400	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
686	47	1eme_Division.43e_Ligne	43e Ligne			10	France	2	2	1	5	1	1	\N	\N	\N	\N	\N	\N	\N	1400	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
687	47	2eme_Division.24e_Legere	24e Legere			10	France	2	2	1	6	1	1	\N	\N	\N	\N	\N	\N	\N	2000	0	0	\N	\N	1	0	0	0	\N	0	0	4	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
688	47	2eme_Division.4e_Ligne	4e Ligne			10	France	2	2	1	5	1	1	\N	\N	\N	\N	\N	\N	\N	1400	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
689	47	1eme_Division	1eme Division		St Hilaire	10	France	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
690	47	3eme_Division.26e_Legere	26e Legere			10	France	2	2	4	6	1	1	\N	\N	\N	\N	\N	\N	\N	1600	0	0	\N	\N	1	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
691	47	1eme_Division.10e_Legere	10e Legere			10	France	2	2	4	6	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	4	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
692	47	2eme_Division.57e_Ligne	57e Ligne			10	France	2	2	1	5	1	1	\N	\N	\N	\N	\N	\N	\N	1700	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
693	47	3eme_Division.18e_Ligne	18e Ligne			10	France	2	2	4	5	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	4	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
694	47	Corps_Cavaly.22e_Chasseur	22e Chasseur			10	France	3	2	1	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	600	0	0	0	3	4	0	0	\N	\N	\N	0	0	f	2	0
695	47	1eme_Division.55e_Ligne	55e Ligne			10	France	2	2	1	5	1	1	\N	\N	\N	\N	\N	\N	\N	1400	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
696	47	Corps_Cavaly	Corps Cavaly		Guyot	10	France	1	2	4	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
697	47	3eme_Division	3eme Division		LeGrand	10	France	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
698	47	3eme_Division.75e_Ligne	75e Ligne			10	France	2	2	4	5	1	1	\N	\N	\N	\N	\N	\N	\N	1700	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
699	47	3eme_Division.Po_Legere	Po Legere			10	France/Italy	2	2	4	6	1	1	\N	\N	\N	\N	\N	\N	\N	1000	0	0	\N	\N	1	2	2	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
700	47	Corps_Artillery.Heavy_Bty	Heavy Bty			10		4	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	8	0	\N	\N	\N	0	1	f	2	3
701	47	Corps_Artillery	Corps Artillery			10	France	1	2	5	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
702	47	Corps_Cavaly.11e_Chasseur	11e Chasseur			10	France	3	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	600	0	0	0	3	4	0	0	\N	\N	\N	0	0	f	2	0
703	48	2eme_Division.Md_Foot_Bty	Md Foot Bty			10		4	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	8	0	\N	\N	\N	0	3	f	2	3
704	48	1eme_Division.Md_Foot_Bty	Md Foot Bty			10		4	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	8	0	\N	\N	\N	0	3	f	2	3
705	48	Cav_Bde	Cav Bde		Trelliard	10	France	1	2	4	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
706	48	Cav_Bde.10e_Hussar	10e Hussar			10	France	3	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	600	0	0	0	2	3	0	0	\N	\N	\N	0	0	f	2	0
707	48	Cav_Bde.9e_Hussar_Copy	9e Hussar_Copy			10	France	3	2	1	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	600	0	0	0	2	3	0	0	\N	\N	\N	0	0	f	2	0
708	48	Corps_Artillery	Corps Artillery		Careil	10	France	1	2	5	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
709	48	Corps_Artillery.Heavy_Foot	Heavy Foot			10		4	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	8	0	\N	\N	\N	0	1	f	2	2
710	48	1eme_Division	1eme Division		Suchet	10	France	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
711	48	1eme_Division.17e_Legere	17e Legere			10	France	2	2	4	6	1	1	\N	\N	\N	\N	\N	\N	\N	2100	0	0	\N	\N	1	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
712	48	1eme_Division.34e_Ligne	34e Ligne			10	France	2	2	4	5	1	1	\N	\N	\N	\N	\N	\N	\N	2500	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
713	48	1eme_Division.40e_Ligne	40e Ligne			10	France	2	2	4	5	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
714	48	1eme_Division.64e_Ligne	64e Ligne			10	France	2	2	1	5	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
715	48	1eme_Division.88e_Ligne	88e Ligne			10	France	2	2	1	5	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
716	48	2eme_Division	2eme Division		Gazan	10	France	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
717	48	2eme_Division.21e_Legere	21e Legere			10	France	2	2	4	6	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	1	0	0	0	\N	\N	\N	0	0	f	2	0
718	48	2eme_Division.28e_Legere	28e Legere			10	France	2	2	4	6	1	1	\N	\N	\N	\N	\N	\N	\N	900	0	0	\N	\N	1	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
719	48	2eme_Division.100e_Ligne	100e Ligne			10	France	2	2	4	3	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
720	48	2eme_Division.103e_Ligne	103e Ligne			10	France	2	2	4	3	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
721	49	Cav_Bde.9e_Hussar	9e Hussar			10	France	3	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	600	0	0	0	2	3	0	0	\N	\N	\N	0	0	f	2	0
722	49	1eme_Division.39e_Ligne	39e Ligne			10	France	2	2	4	5	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
723	49	1eme_Division.69e_Ligne	69e Ligne			10	France	2	2	1	5	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
724	49	Cav_Bde.10e_Chasseur	10e Chasseur			10	France	3	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	600	0	0	0	3	4	0	0	\N	\N	\N	0	0	f	2	0
725	49	1eme_Division.76e_Ligne	76e Ligne			10	France	2	2	1	5	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
726	49	Corps_Artillery	Corps Artillery			10	France	1	2	4	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
727	49	2eme_Division.59e_Ligne	59e Ligne			10	France	2	2	1	5	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
728	49	Corps_Artillery.1e_Heavy_Bty	1e Heavy Bty			10		4	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	8	0	\N	\N	\N	0	1	f	2	2
729	49	Corps_Artillery.2e_Heavy_Bty	2e Heavy Bty			10		4	2	1	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	8	0	\N	\N	\N	0	1	f	2	2
730	49	2eme_Division	2eme Division		Gardanne	10	France	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
731	49	1eme_Division	1eme Division		Marchand	10	France	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
732	49	Cav_Bde	Cav Bde		Charbanais	10	France	1	2	4	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
733	49	2eme_Division.50e_Ligne	50e Ligne			10	France	2	2	1	5	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
734	49	2eme_Division.27e_Ligne	27e Ligne			10	France	2	2	1	5	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
735	49	1eme_Division.6e_Legere	6e Legere			10	France	2	2	4	6	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	4	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
736	49	2eme_Division.25e_Legere	25e Legere			10	France	2	2	4	6	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	4	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
737	50	Corps_Artillery	Corps Artillery			10	France	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
738	50	1e_Cuirassier_Div	1e Cuirassier Div		Nansouty	10	France	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
739	50	1e_Dragoon_Div	1e Dragoon Div		Klein	10	France	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
740	50	2e_Cuirassier_Div	2e Cuirassier Div		d'Hautpoul	10	France	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
741	50	2e_Dragoon_Div	2e Dragoon Div		Grouchy	10	France	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
742	50	2e_Cuirassier_Div.Bde_Verdiere	Bde Verdiere			10	France	3	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	600	0	0	0	1	4	0	0	\N	\N	\N	0	0	f	2	0
743	50	3e_Dragoon_Div	3e Dragoon Div		Beaumont	10	France	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
744	50	4e_Dragoon_Div	4e Dragoon Div		Sahut	10	France	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
745	50	2e_Cuirassier_Div.Bde_StSulpice	Bde St.Sulpice			10	France	3	2	1	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	600	0	0	0	1	4	0	0	\N	\N	\N	0	0	f	2	0
746	50	Light_Div	Light Div		Lasalle	10	France	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
747	50	Light_Div.Milhaud_1e_Hussar	Milhaud 1e Hussar			10	France	3	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	600	0	0	0	2	3	0	0	\N	\N	\N	0	0	f	2	0
748	50	Light_Div.Bde_Lasalle_5_7e_Hussar	Bde Lasalle 5/7e Hussar			10	France	3	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	600	0	0	0	2	3	0	0	\N	\N	\N	0	0	f	2	0
749	50	2e_Dragoon_Div.Bde_Roget	Bde Roget			10	France	3	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	900	0	0	0	5	5	0	0	\N	\N	\N	0	0	f	2	0
750	50	1e_Cuirassier_Div.Bde_Defrance	Bde Defrance			10	France	3	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	600	0	0	0	9	2	0	0	\N	\N	\N	0	0	f	2	0
751	50	2e_Dragoon_Div.Bde_Milet	Bde Milet			10	France	3	2	1	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	600	0	0	0	5	5	0	0	\N	\N	\N	0	0	f	2	0
752	50	1e_Cuirassier_Div.Bde_Housaye	Bde Housaye			10	France	3	2	1	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	1300	0	0	0	1	2	0	0	\N	\N	\N	0	0	f	2	0
753	50	1e_Dragoon_Div.Bde_Fenerolz	Bde Fenerolz			10	France	3	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	600	0	0	0	5	4	0	0	\N	\N	\N	0	0	f	2	0
754	50	4e_Dragoon_Div.Bde_Laplanche	Bde Laplanche			10	France	3	2	1	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	1200	0	0	0	5	5	0	0	\N	\N	\N	0	0	f	2	0
755	50	1e_Dragoon_Div.Bde_Picard	Bde Picard			10	France	3	2	1	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	600	0	0	0	5	4	0	0	\N	\N	\N	0	0	f	2	0
756	50	4e_Dragoon_Div.Bde_Margaron	Bde Margaron			10	France	3	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	1200	0	0	0	5	5	0	0	\N	\N	\N	0	0	f	2	0
757	50	3e_Dragoon_Div.Bde_Boye	Bde Boye			10	France	3	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	900	0	0	0	5	5	0	0	\N	\N	\N	0	0	f	2	0
758	50	3e_Dragoon_Div.Bde_Maubourg	Bde Maubourg			10	France	3	2	1	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	600	0	0	0	5	5	0	0	\N	\N	\N	0	0	f	2	0
759	50	Corps_Artillery.1e_Horse	1e Horse			10		4	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	8	0	\N	\N	\N	0	3	t	2	2
760	50	Corps_Artillery.2e_Horse	2e Horse			10		4	2	1	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	8	0	\N	\N	\N	0	3	t	2	2
761	51	2nd_Div.Horse_Bty	Horse Bty			10	Saxony	4	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	8	0	\N	\N	\N	0	3	f	2	3
762	51	2nd_Div.von_Burgsdorf	von Burgsdorf			10	Saxony	2	2	4	1	1	1	\N	\N	\N	\N	\N	\N	\N	3400	0	0	\N	\N	1	0	1	0	\N	0	0	4	0	0	0	0	0	0	1	0	\N	\N	\N	0	4	f	2	3
763	51	2nd_Div.von_Dyherrn	von Dyherrn			10	Saxony	2	2	4	3	1	1	\N	\N	\N	\N	\N	\N	\N	4200	0	0	\N	\N	1	0	1	0	\N	0	0	4	0	0	0	0	0	0	2	0	\N	\N	\N	0	4	f	2	3
764	51	1st_Div.Horse_Bty	Horse Bty			10	Prussia	4	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	8	0	\N	\N	\N	0	3	f	2	3
765	51	Reserve_Div.Prittwitz_Grenadier_Bde	Prittwitz Grenadier Bde			10	Prussia	2	2	4	1	1	1	\N	\N	\N	\N	\N	\N	\N	3300	0	0	\N	\N	1	0	0	2	\N	0	0	4	0	0	0	0	0	0	2	0	\N	\N	\N	0	4	f	2	3
766	51	Reserve_Div.Cerrini_Grenadier_Bde	Cerrini Grenadier Bde			10	Prussia	2	2	4	1	1	1	\N	\N	\N	\N	\N	\N	\N	4200	0	0	\N	\N	1	0	0	2	\N	0	0	4	0	0	0	0	0	0	2	0	\N	\N	\N	0	4	f	2	3
767	51	1st_Div.von_Schimonsky	von Schimonsky			10	Prussia	2	2	4	1	1	1	\N	\N	\N	\N	\N	\N	\N	3400	0	0	\N	\N	1	0	1	0	\N	0	0	4	0	0	0	0	0	0	2	0	\N	\N	\N	0	4	f	2	3
768	51	Reserve_Div.Md_Foot_Bty	Md Foot Bty			10	Prussia	4	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	8	0	\N	\N	\N	0	3	f	2	4
769	51	3rd_Div	3rd Div		Tauentzein	10	Prussia	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
770	51	3rd_Div.Cav_Bde_Prince_Clement	Cav Bde Prince Clement			10	Prussia	3	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	700	0	0	0	2	4	0	0	\N	\N	\N	0	0	f	2	0
771	51	3rd_Div.Rosen_Fusilers	Rosen Fusilers			10	Prussia	2	2	4	9	1	1	\N	\N	\N	\N	\N	\N	\N	400	0	0	\N	\N	1	0	0	2	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
772	51	3rd_Div.von_Schoeneberg	von Schöneberg			10	Saxony	2	2	4	1	1	1	\N	\N	\N	\N	\N	\N	\N	3400	0	0	\N	\N	1	0	1	0	\N	0	0	5	0	0	0	0	0	0	2	0	\N	\N	\N	0	4	f	2	4
773	51	3rd_Div.von_Zweiffel	von Zweiffel			10	Prussia	2	2	4	1	1	1	\N	\N	\N	\N	\N	\N	\N	3400	0	0	\N	\N	1	0	1	0	\N	0	0	4	0	0	0	0	0	0	2	0	\N	\N	\N	0	4	f	2	0
774	51	1st_Div	1st Div		Grawert	10	Prussia	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
775	51	3rd_Div.Lt_Bty	Lt Bty			10	Prussia	4	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	6	0	\N	\N	\N	0	4	f	2	3
776	51	Reserve_Div.Cav_Bde_von_Krafft	Cav Bde von Krafft			10	Prussia	3	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	900	0	0	0	12	3	0	0	\N	\N	\N	0	0	f	2	0
777	51	1st_Div.von_Mueffling	von Müffling			10	Prussia	2	2	4	1	1	1	\N	\N	\N	\N	\N	\N	\N	3600	0	0	\N	\N	1	0	1	0	\N	0	0	4	0	0	0	0	0	0	2	0	\N	\N	\N	0	4	f	2	3
778	51	Reserve_Div	Reserve Div		Prittwitz	10	Prussia	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
779	51	Reserve_Div.Heavy_Bty	Heavy Bty			10	Prussia	4	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	8	0	\N	\N	\N	0	1	f	2	3
780	51	1st_Div.Heavy_Bty	Heavy Bty			10	Prussia	4	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	8	0	\N	\N	\N	0	1	f	2	4
781	51	1st_Div.Bde_Henkel	Bde Henkel			10	Prussia	3	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	900	0	0	0	5	3	0	0	\N	\N	\N	0	0	f	2	0
782	51	2nd_Div.Boguslawsky_Fusilers	Boguslawsky Fusilers			10	Prussia	2	2	4	9	1	1	\N	\N	\N	\N	\N	\N	\N	800	0	0	\N	\N	1	0	2	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
783	51	2nd_Div	2nd Div		Zechwitz	10	Prussia	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
784	51	1st_Div.Erichsen_Fusilers	Erichsen Fusilers			10		2	2	4	9	1	1	\N	\N	\N	\N	\N	\N	\N	700	0	0	\N	\N	1	0	0	1	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
785	51	2nd_Div.Cav_Bde_von_Kochitsky	Cav Bde von Kochitsky			10	Saxony	3	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	200	0	0	0	1	3	0	0	\N	\N	\N	0	0	f	2	0
786	51	2nd_Div.Heavy_Bty	Heavy Bty			10	Saxony	4	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	8	0	\N	\N	\N	0	1	f	2	3
787	52	Adv_Guard_Div.Saxon_Hussar_von_Truetzschler	Saxon Hussar von Trützschler	Saxon Hussar Regiment, eight squadrons		10	Saxony	3	2	1	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	1200	0	0	0	2	4	0	0	\N	\N	\N	0	0	f	2	0
788	52	Adv_Guard_Div.Cav_Bde_von_Schimmelpfennig	Cav Bde von Schimmelpfennig	Schimmelpfennig Hussar Regiment # 6, ten squadrons		10	Prussia	3	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	1500	0	0	0	2	4	6	0	\N	\N	\N	0	3	f	2	3
789	52	Adv_Guard_Div.Bde_von_Pelet	Bde von Pelet	Rabenau # 13 Pelet # 14 Rühle # 15 Fusiliers, Masars and Valentin Jager 		10	Prussia	2	2	4	9	1	1	\N	\N	\N	\N	\N	\N	\N	2400	0	0	\N	\N	1	0	0	2	\N	0	0	4	0	0	0	0	0	0	6	0	\N	\N	\N	0	3	f	2	3
790	52	Adv_Guard_Div.Bde_Belvilaqua	Bde Belvilaqua	Combined Bns from IR 49,  Prinz Clemens (saxon), and Kurfurst (saxon)		10	Prussia/Saxony	2	2	4	1	1	1	\N	\N	\N	\N	\N	\N	\N	5100	0	0	\N	\N	1	0	1	0	\N	0	0	5	0	0	0	0	0	0	6	0	\N	\N	\N	0	4	f	2	0
791	52	Adv_Guard_Div	Adv Guard Div		Ferdinand	10	Prussia	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
792	54	2nd_Div.von_Malschitsky_Grenadiers	von Malschitsky Grenadiers			10	Prussia	2	2	4	1	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	1	\N	0	0	4	0	0	0	0	0	0	2	0	\N	\N	\N	0	4	f	2	1
793	54	2nd_Div.Md_Foot_Bty	Md Foot Bty			10	Prussia	4	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	8	0	\N	\N	\N	0	3	f	2	1
794	54	1st_Div.Md_Foot_Bty	Md Foot Bty			10	Prussia	4	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	8	0	\N	\N	\N	0	3	f	2	1
795	54	2nd_Div.Pirch_Regt_Musketeer	Pirch Regt Musketeer			10	Prussia	2	2	1	1	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	1	\N	0	0	4	0	0	0	0	0	0	2	0	\N	\N	\N	0	4	f	2	1
796	54	2nd_Div.Arnim_Regt_Musketeer	Arnim Regt Musketeer			10	Prussia	2	2	1	1	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	1	\N	0	0	4	0	0	0	0	0	0	2	0	\N	\N	\N	0	4	f	2	1
797	54	2nd_Div.Zenge_Regt_Musketeer	Zenge Regt Musketeer			10	Prussia	2	2	1	1	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	1	\N	0	0	4	0	0	0	0	0	0	2	0	\N	\N	\N	0	4	f	2	1
798	54	2nd_Div.von_Zenge_Grenadiers	von Zenge Grenadiers			10	Prussia	2	2	1	1	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	1	\N	0	0	4	0	0	0	0	0	0	2	0	\N	\N	\N	0	4	f	2	1
799	54	1st_Div.Guard_Bde_von_Hirschfeld	Guard Bde von Hirschfeld			10	Prussia	2	2	1	1	1	1	\N	\N	\N	\N	\N	\N	\N	2400	0	0	\N	\N	1	0	0	1	\N	0	0	2	0	0	0	0	0	0	2	0	\N	\N	\N	0	4	f	2	1
800	54	1st_Div.Guard_Bde_von_Pletz	Guard Bde von Pletz			10	Prussia	2	2	4	1	1	1	\N	\N	\N	\N	\N	\N	\N	2400	0	0	\N	\N	1	0	0	1	\N	0	0	2	0	0	0	0	0	0	2	0	\N	\N	\N	0	4	f	2	1
801	54	1st_Div	1st Div		Kuhnheim	10	Prussia	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
802	54	1st_Div.Garde_du_Corps_Cavalry	Garde du Corps Cavalry			10	Prussia	3	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	600	0	0	0	1	1	0	0	\N	\N	\N	0	0	f	2	0
803	54	1st_Div.Beeren_Cuirassier	Beeren Cuirassier			10	Prussia	3	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	400	0	0	0	1	2	0	0	\N	\N	\N	0	0	f	2	0
804	54	2nd_Div	2nd Div		von Arnim	10	Prussia	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
805	55	3eme_Division.Md_Foot_Bty	Md Foot Bty			10		4	2	1	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	8	0	\N	\N	\N	0	3	f	2	2
806	55	2eme_Division.Md_Foot_Bty	Md Foot Bty			10		4	2	1	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	8	0	\N	\N	\N	0	3	f	2	2
807	55	Corps_Artillery.Md_Foot_Bty	Md Foot Bty			10		4	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	8	0	\N	\N	\N	0	3	f	2	2
808	55	1eme_Division.Md_Foot_Bty	Md Foot Bty			10		4	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	8	0	\N	\N	\N	0	3	f	2	2
809	55	1eme_Division.13e_Legere	13e Legere			10	France	2	2	4	6	1	1	\N	\N	\N	\N	\N	\N	\N	1400	0	0	\N	\N	1	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
810	55	1eme_Division	1eme Division		Morand	10	France	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
811	55	2eme_Division.108e_Ligne	108e Ligne			10	France	2	2	1	5	1	1	\N	\N	\N	\N	\N	\N	\N	1600	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
812	55	1eme_Division.51e_Ligne	51e Ligne			10	France	2	2	1	5	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
813	55	1eme_Division.17e_Ligne	17e Ligne			10	France	2	2	4	5	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
814	55	1eme_Division.61e_Ligne	61e Ligne			10	France	2	2	1	5	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
815	55	1eme_Division.30e_Ligne	30e Ligne			10	France	2	2	1	5	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
816	55	2eme_Division	2eme Division		Friant	10	France	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
817	55	2eme_Division.33e_Ligne	33e Ligne			10	France	2	2	1	5	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
818	55	2eme_Division.48e_Ligne	48e Ligne			10	France	2	2	1	5	1	1	\N	\N	\N	\N	\N	\N	\N	1400	0	0	\N	\N	1	0	0	0	\N	0	0	1	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
819	55	2eme_Division.111e_Ligne	111e Ligne			10	France	2	2	1	5	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
820	55	Cav_Bde	Cav Bde		Viallanes	10	France	1	2	4	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
821	55	3eme_Division	3eme Division		Gudin	10	France	1	2	1	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
822	55	3eme_Division.12e_Ligne	12e Ligne			10	France	2	2	1	5	1	1	\N	\N	\N	\N	\N	\N	\N	1300	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
823	55	3eme_Division.21e_Ligne	21e Ligne			10	France	2	2	1	5	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
824	55	3eme_Division.25e_Ligne	25e Ligne			10	France	2	2	1	5	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
825	55	3eme_Division.85e_Ligne	85e Ligne			10	France	2	2	1	5	1	1	\N	\N	\N	\N	\N	\N	\N	1600	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
826	55	Cav_Bde.1e_Chasseur	1e Chasseur			10	France	3	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	600	0	0	0	3	3	0	0	\N	\N	\N	0	0	f	2	0
827	55	Cav_Bde.2e_Chasseur	2e Chasseur			10	France	3	2	1	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	600	0	0	0	3	3	0	0	\N	\N	\N	0	0	f	2	0
828	55	Corps_Artillery	Corps Artillery		Hannicque	10	France	1	2	4	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
829	56	Guard_Artillery.Guard_Foot_Artillery	Guard Foot Artillery			10		4	2	1	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	24	0	\N	\N	\N	0	3	f	2	1
830	56	Infantry_Division.1e_Grenadiers	1e Grenadiers			10	France	2	2	4	5	1	1	\N	\N	\N	\N	\N	\N	\N	2400	0	0	\N	\N	1	0	0	0	\N	0	0	1	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
831	56	Infantry_Division.2e_Grenadiers	2e Grenadiers			10	France	2	2	1	5	1	1	\N	\N	\N	\N	\N	\N	\N	2400	0	0	\N	\N	1	0	0	0	\N	0	0	1	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
832	56	Guard_Artillery.Army_Artillery_Park	Army Artillery Park			10		4	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	16	0	\N	\N	\N	0	1	f	2	2
833	56	Cavalry_Division.Chasseurs_a_Cheval	Chasseurs a Cheval			10	France	3	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	600	0	0	0	3	1	0	0	\N	\N	\N	0	0	f	2	0
834	56	Infantry_Division.1e_Chasseurs	1e Chasseurs			10	France	2	2	1	6	1	1	\N	\N	\N	\N	\N	\N	\N	2400	0	0	\N	\N	1	0	0	0	\N	0	0	1	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
835	56	Cavalry_Division.Grenadier_a_Cheval	Grenadier a Cheval			10	France	3	2	1	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	400	0	0	0	8	1	0	0	\N	\N	\N	0	0	f	2	0
836	56	Guard_Artillery	Guard Artillery		de Lamartiniére	10	France	1	2	4	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	2	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
837	56	Infantry_Division.2e_Chasseurs_Copy	2e Chasseurs_Copy			10	France	2	2	1	6	1	1	\N	\N	\N	\N	\N	\N	\N	2400	0	0	\N	\N	1	0	0	0	\N	0	0	1	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
838	56	Infantry_Division	Infantry Division		Lefebvre	10	France	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
839	56	Infantry_Division.Foot_Dragoons	Foot Dragoons			10	France	2	2	1	6	1	1	\N	\N	\N	\N	\N	\N	\N	2400	0	0	\N	\N	1	0	0	0	\N	0	0	1	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
840	56	Cavalry_Division	Cavalry Division		Bessieres	10	France	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	1	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
841	56	Guard_Artillery.Guard_Horse_Bty	Guard Horse Bty			10		4	2	1	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	8	0	\N	\N	\N	0	4	t	2	1
842	57	2eme_Division.Md_Foot_Bty_Copy	Md Foot Bty_Copy			10		4	2	1	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	0	0	0	0	0	0	0	8	0	\N	\N	\N	0	3	f	2	3
843	57	3eme_Division.Md_Foot_Bty	Md Foot Bty			10		4	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	0	0	0	0	0	0	0	8	0	\N	\N	\N	0	3	f	2	3
844	57	3eme_Division.27e_Legere	27e Legere		Drouet	10	France	2	2	4	6	1	1	\N	\N	\N	\N	\N	\N	\N	1500	0	0	\N	\N	1	0	2	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	4	f	2	0
845	57	Artillery_Reserve.Md_Foot_Bty	Md Foot Bty			10		4	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	8	0	\N	\N	\N	0	3	f	2	2
846	57	2eme_Division.Md_Foot_Bty	Md Foot Bty			10		4	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	0	0	0	0	0	0	0	8	0	\N	\N	\N	0	3	f	2	3
847	57	1eme_Division.Md_Foot_Bty	Md Foot Bty			10		4	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	0	0	0	0	0	0	0	8	0	\N	\N	\N	0	3	f	2	3
848	57	1eme_Division.9e_Legere	9e Legere		de l'Eltang	10	France	2	2	4	6	1	1	\N	\N	\N	\N	\N	\N	\N	2600	0	0	\N	\N	1	2	0	0	\N	0	0	4	0	0	0	0	0	0	0	0	\N	\N	\N	0	4	f	2	0
849	57	2eme_Division.45e_Ligne	45e Ligne		Rivaud	10	France	2	2	4	5	1	1	\N	\N	\N	\N	\N	\N	\N	2000	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
850	57	2eme_Division.54e_Ligne	54e Ligne		Rivaud	10	France	2	2	4	5	1	1	\N	\N	\N	\N	\N	\N	\N	2000	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
851	57	2eme_Division	2eme Division		Rivaud	10	France	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
852	57	1eme_Division.32e_Ligne	32e Ligne		de l'Eltang	10	France	2	2	4	5	1	1	\N	\N	\N	\N	\N	\N	\N	2000	0	0	\N	\N	1	0	0	0	\N	0	0	4	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
853	57	1eme_Division	1eme Division		de l'Eltang	10	France	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
854	57	1eme_Division.96e_Ligne	96e Ligne		de l'Eltang	10	France	2	2	4	5	1	1	\N	\N	\N	\N	\N	\N	\N	2000	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
855	57	2eme_Division.4e_Legere	4e Legere		Rivaud	10	France	2	2	4	6	1	1	\N	\N	\N	\N	\N	\N	\N	2000	0	0	\N	\N	1	0	1	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
856	57	Cav_Reserve	Cav Reserve		Tilley	10	France	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
857	57	Cav_Reserve.2e_Hussar	2e Hussar			10	France	3	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	300	0	0	0	2	3	0	0	\N	\N	\N	0	0	f	2	0
858	57	Cav_Reserve.4e_Hussar	4e Hussar			10	France	3	2	1	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	422	0	0	0	2	4	0	0	\N	\N	\N	0	0	f	2	0
859	57	Artillery_Reserve	Artillery Reserve		Eble	10	France	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
860	57	3eme_Division	3eme Division		Drouet	10	France	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
861	57	3eme_Division.95e_Ligne	95e Ligne		Drouet	10	France	2	2	4	5	1	1	\N	\N	\N	\N	\N	\N	\N	2600	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
862	57	3eme_Division.94e_Ligne	94e Ligne		Drouet	10	France	2	2	4	5	1	1	\N	\N	\N	\N	\N	\N	\N	1500	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
863	58	2eme_Division.Md_Foot_Bty	Md Foot Bty			10		4	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	8	0	\N	\N	\N	0	3	f	2	3
864	58	1eme_Division.Md_Foot_Bty	Md Foot Bty			10		4	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	8	0	\N	\N	\N	0	3	f	2	3
865	58	Corps_Cav.7e_Chasseur	7e Chasseur			10	France	3	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	600	0	0	0	3	4	0	0	\N	\N	\N	0	0	f	2	0
866	58	1eme_Division.105e_Ligne	105e Ligne			10	France	2	2	1	3	1	1	\N	\N	\N	\N	\N	\N	\N	1700	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
867	58	Corps_Cav.20e_Chasseur	20e Chasseur			10	France	3	2	1	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	600	0	0	0	3	4	0	0	\N	\N	\N	0	0	f	2	0
868	58	1eme_Division.14e_Ligne	14e Ligne			10	France	2	2	4	5	1	1	\N	\N	\N	\N	\N	\N	\N	700	0	0	\N	\N	1	0	0	0	\N	0	0	4	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
869	58	Corps_Cav	Corps Cav		Durosnel	10	France	1	2	4	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
870	58	Corps_Artillery	Corps Artillery			10	France	1	2	4	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
871	58	2eme_Division.63e_Ligne	63e Ligne			10	France	2	2	1	5	1	1	\N	\N	\N	\N	\N	\N	\N	700	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
872	58	Corps_Artillery.Heavy_Bty	Heavy Bty			10		4	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	8	0	\N	\N	\N	0	1	f	2	2
873	58	1eme_Division.16e_Legere	16e Legere			10	France	2	2	4	6	1	1	\N	\N	\N	\N	\N	\N	\N	2700	0	0	\N	\N	1	0	0	0	\N	0	0	4	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
874	58	1eme_Division.44e_Ligne	44e Ligne			10	France	2	2	1	5	1	1	\N	\N	\N	\N	\N	\N	\N	1700	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
875	58	1eme_Division	1eme Division		Desjardin	10	France	1	2	4	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
876	58	2eme_Division.24e_Ligne	24e Ligne			10	France	2	2	4	5	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
877	58	2eme_Division.7e_Legere	7e Legere			10	France	2	2	4	6	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	4	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
878	58	2eme_Division	2eme Division		Bierre	10	France	1	2	4	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
879	58	2eme_Division.Hesse_Darmstadt	Hesse Darmstadt			10	Hesse	2	2	1	1	1	1	\N	\N	\N	\N	\N	\N	\N	800	0	0	\N	\N	1	0	0	0	\N	0	0	4	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
880	58	2eme_Division.Allied_Nassau	Allied Nassau			10	Nassau	2	2	1	5	1	1	\N	\N	\N	\N	\N	\N	\N	400	0	0	\N	\N	1	0	0	0	\N	0	0	4	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
881	59	Supply_Train	Supply Train			10	France	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
882	59	Supply_Train.Supply_Escort_Detachment	Supply Escort Detachment			10		5	2	5	6	1	1	\N	\N	\N	\N	\N	\N	\N	300	0	0	\N	\N	1	2	4	0	\N	0	0	6	50	0	0	0	3	0	0	0	\N	\N	\N	0	0	f	2	0
883	60	2nd_Div.3rd_special_regt_von_X	3rd special regt von X			10		2	2	1	8	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	2	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
884	60	2nd_Div.1st_Regt_of_Death	1st Regt of Death	with data		10		2	2	4	3	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
885	60	2nd_Div.Devils_Bde_as_such	Devils Bde as such	as such six much as such		10	gotta break this	2	2	4	4	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	3	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
886	60	2nd_Duvussion.NZ_Brugade_from_NZ	NZ Brugade from NZ			10		2	2	4	7	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
887	60	2nd_Duvussion	2nd Duvussion			10		1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
888	60	7th_Div.4th_Bn	4th Bn			10		2	2	4	3	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
889	60	7th_Div.1st_Bn	1st Bn			10		2	2	4	3	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
890	60	6th_Division	6th Division			10		1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
891	60	6th_Division.2nd_Regt	2nd Regt			10		2	2	4	3	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
892	60	6th_Division.1st_Regt	1st Regt			10		2	2	4	3	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
893	60	7th_Div	7th Div			10		1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
894	60	2nd_Div.2nd_Regt	2nd Regt			10		2	2	4	3	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
895	60	2nd_Div.1st_Regt	1st Regt			10		2	2	4	3	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
896	60	2nd_Div	2nd Div			10		1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
897	60	1st_Div.3rd_special_regt	3rd special regt			10		2	2	4	3	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
898	60	1st_Div.2nd_Regt	2nd Regt			10	France	2	2	4	3	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	6	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
899	60	1st_Div.1st_Regt	1st Regt			10		2	2	4	3	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
900	60	1st_Div	1st Div			10		1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
\.


--
-- Name: unit_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('unit_id_seq', 900, true);


--
-- PostgreSQL database dump complete
--

