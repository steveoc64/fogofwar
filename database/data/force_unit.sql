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
-- Data for Name: force_unit; Type: TABLE DATA; Schema: public; Owner: steve
--

COPY force_unit (id, force_id, path, name, commander_name, nation, utype, cmd_level, drill, bayonets, small_arms, elite_arms, lt_coy, jg_coy, rating, sabres, cav_type, cav_rating, guns, gunnery_type, gun_condition, horse_guns) FROM stdin;
13	2	2nd_Division.45e_Ligne	45e Ligne	Rivaud	France	2	4	5	2000	1	0	0	0	5	0	0	0	0	0	0	f
14	2	2nd_Division.54e_Ligne	54e Ligne	Rivaud	France	2	4	5	2000	1	0	0	0	5	0	0	0	0	0	0	f
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
42	1	Infantry_Division.1e_Grenadiers	1e Grenadiers		France	2	4	5	2400	1	0	0	0	1	0	0	0	0	0	0	f
33	2	Cav_Reserve	Cav Reserve	Tilley	France	1	3	1	0	0	0	0	0	3	0	0	0	0	0	2	f
44	1	Infantry_Division.2e_Grenadiers	2e Grenadiers		France	2	1	5	2400	1	0	0	0	1	0	0	0	0	0	0	f
34	2	Cav_Reserve.2e_Hussar	2e Hussar		France	3	4	0	0	0	0	0	0	3	300	2	3	0	0	0	f
48	1	Guard_Artillery.Army_Artillery_Park	Army Artillery Park			4	4	0	0	0	0	0	0	4	0	0	0	16	1	2	f
40	1	Cavalry_Division.Chasseurs_a_Cheval	Chasseurs a Cheval		France	3	4	0	0	0	0	0	0	3	600	3	1	0	0	0	f
35	2	Cav_Reserve.4e_Hussar	4e Hussar		France	3	1	0	0	0	0	0	0	3	422	2	4	0	0	0	f
36	2	Artillery_Reserve	Artillery Reserve	Eble	France	1	3	1	0	0	0	0	0	3	0	0	0	0	0	2	f
45	1	Infantry_Division.1e_Chasseurs	1e Chasseurs		France	2	1	6	2400	1	0	0	0	1	0	0	0	0	0	0	f
37	2	Artillery_Reserve.Md_Foot_Bty	Md Foot Bty			4	4	0	0	0	0	0	0	4	0	0	0	8	2	2	f
41	1	Cavalry_Division.Grenadier_a_Cheval	Grenadier a Cheval		France	3	1	0	0	0	0	0	0	3	400	8	1	0	0	0	f
50	1	Guard_Artillery.Guard_Foot_Artillery	Guard Foot Artillery			4	1	0	0	0	0	0	0	4	0	0	0	24	2	1	f
38	1	Guard_Artillery	Guard Artillery	de Lamartiniére	France	1	4	1	0	0	0	0	0	2	0	0	0	0	0	2	f
47	1	Infantry_Division.2e_Chasseurs_Copy	2e Chasseurs_Copy		France	2	1	6	2400	1	0	0	0	1	0	0	0	0	0	0	f
4	1	Infantry_Division	Infantry Division	Lefebvre	France	1	3	1	0	0	0	0	0	3	0	0	0	0	0	2	f
46	1	Infantry_Division.Foot_Dragoons	Foot Dragoons		France	2	1	6	2400	1	0	0	0	1	0	0	0	0	0	0	f
5	1	Cavalry_Division	Cavalry Division	Bessieres	France	1	3	1	0	0	0	0	0	1	0	0	0	0	0	2	f
53	3	1eme_Division.13e_Legere	13e Legere		France	2	4	6	1400	1	0	0	0	3	0	0	0	0	0	0	f
52	3	1eme_Division	1eme Division	Morand	France	1	3	1	0	0	0	0	0	3	0	0	0	0	0	2	f
61	3	2eme_Division.108e_Ligne	108e Ligne		France	2	1	5	1600	1	0	0	0	5	0	0	0	0	0	0	f
56	3	1eme_Division.51e_Ligne	51e Ligne		France	2	1	5	1800	1	0	0	0	5	0	0	0	0	0	0	f
49	1	Guard_Artillery.Guard_Horse_Bty	Guard Horse Bty			4	1	0	0	0	0	0	0	4	0	0	0	8	3	1	f
54	3	1eme_Division.17e_Ligne	17e Ligne		France	2	4	5	1800	1	0	0	0	5	0	0	0	0	0	0	f
58	3	1eme_Division.Md_Foot_Bty	Md Foot Bty			4	4	0	0	0	0	0	0	4	0	0	0	8	2	2	f
57	3	1eme_Division.61e_Ligne	61e Ligne		France	2	1	5	1800	1	0	0	0	5	0	0	0	0	0	0	f
55	3	1eme_Division.30e_Ligne	30e Ligne		France	2	1	5	1800	1	0	0	0	5	0	0	0	0	0	0	f
59	3	2eme_Division	2eme Division	Friant	France	1	3	1	0	0	0	0	0	3	0	0	0	0	0	2	f
100	4	3eme_Division.Md_Foot_Bty	Md Foot Bty			4	4	0	0	0	0	0	0	4	0	0	0	8	2	2	f
62	3	2eme_Division.33e_Ligne	33e Ligne		France	2	1	5	1800	1	0	0	0	5	0	0	0	0	0	0	f
83	4	2eme_Division	2eme Division	Leval	France	1	3	1	0	0	0	0	0	3	0	0	0	0	0	2	f
91	4	2eme_Division.28e_Ligne	28e Ligne		France	2	1	5	1400	1	0	0	0	5	0	0	0	0	0	0	f
79	4	1eme_Division.35e_Ligne	35e Ligne		France	2	4	5	1400	1	0	0	0	5	0	0	0	0	0	0	f
73	3	Corps_Artillery.Md_Foot_Bty	Md Foot Bty			4	4	0	0	0	0	0	0	4	0	0	0	8	2	2	f
65	3	2eme_Division.48e_Ligne	48e Ligne		France	2	1	5	1400	1	0	0	0	5	0	0	0	0	0	0	f
64	3	2eme_Division.111e_Ligne	111e Ligne		France	2	1	5	1800	1	0	0	0	5	0	0	0	0	0	0	f
97	4	3eme_Division.Corsican_Legere_Copy	Corsican Legere_Copy		France/Corsica	2	1	6	1300	1	2	0	1	3	0	0	0	0	0	0	f
85	4	2eme_Division.46e_Ligne	46e Ligne		France	2	1	5	1400	1	0	0	0	5	0	0	0	0	0	0	f
74	3	Cav_Bde	Cav Bde	Viallanes	France	1	4	1	0	0	0	0	0	3	0	0	0	0	0	2	f
66	3	3eme_Division	3eme Division	Gudin	France	1	1	1	0	0	0	0	0	3	0	0	0	0	0	2	f
80	4	1eme_Division.43e_Ligne	43e Ligne		France	2	1	5	1400	1	0	0	0	5	0	0	0	0	0	0	f
67	3	3eme_Division.12e_Ligne	12e Ligne		France	2	1	5	1300	1	0	0	0	5	0	0	0	0	0	0	f
88	4	2eme_Division.24e_Legere	24e Legere		France	2	1	6	2000	1	0	0	0	4	0	0	0	0	0	0	f
71	3	3eme_Division.21e_Ligne	21e Ligne		France	2	1	5	1800	1	0	0	0	5	0	0	0	0	0	0	f
69	3	3eme_Division.25e_Ligne	25e Ligne		France	2	1	5	1800	1	0	0	0	5	0	0	0	0	0	0	f
84	4	2eme_Division.4e_Ligne	4e Ligne		France	2	1	5	1400	1	0	0	0	5	0	0	0	0	0	0	f
70	3	3eme_Division.85e_Ligne	85e Ligne		France	2	1	5	1600	1	0	0	0	5	0	0	0	0	0	0	f
82	4	1eme_Division.Md_Foot_Bty	Md Foot Bty			4	4	0	0	0	0	0	0	4	0	0	0	8	2	2	f
75	3	Cav_Bde.1e_Chasseur	1e Chasseur		France	3	4	0	0	0	0	0	0	3	600	3	3	0	0	0	f
76	3	Cav_Bde.2e_Chasseur	2e Chasseur		France	3	1	0	0	0	0	0	0	3	600	3	3	0	0	0	f
72	3	Corps_Artillery	Corps Artillery	Hannicque	France	1	4	1	0	0	0	0	0	3	0	0	0	0	0	2	f
77	4	1eme_Division	1eme Division	St Hilaire	France	1	3	1	0	0	0	0	0	3	0	0	0	0	0	2	f
95	4	3eme_Division.26e_Legere	26e Legere		France	2	4	6	1600	1	0	0	0	3	0	0	0	0	0	0	f
78	4	1eme_Division.10e_Legere	10e Legere		France	2	4	6	1800	1	0	0	0	4	0	0	0	0	0	0	f
92	4	2eme_Division.57e_Ligne	57e Ligne		France	2	1	5	1700	1	0	0	0	5	0	0	0	0	0	0	f
106	5	Cav_Bde	Cav Bde	Trelliard	France	1	4	1	0	0	0	0	0	3	0	0	0	0	0	2	f
93	4	2eme_Division.Md_Foot_Bty	Md Foot Bty			4	4	0	0	0	0	0	0	4	0	0	0	8	2	3	f
98	4	3eme_Division.18e_Ligne	18e Ligne		France	2	4	5	1800	1	0	0	0	4	0	0	0	0	0	0	f
63	3	2eme_Division.Md_Foot_Bty	Md Foot Bty			4	1	0	0	0	0	0	0	4	0	0	0	8	2	2	f
68	3	3eme_Division.Md_Foot_Bty	Md Foot Bty			4	1	0	0	0	0	0	0	4	0	0	0	8	2	2	f
103	4	Corps_Cavaly.22e_Chasseur	22e Chasseur		France	3	1	0	0	0	0	0	0	3	600	3	4	0	0	0	f
90	4	1eme_Division.55e_Ligne	55e Ligne		France	2	1	5	1400	1	0	0	0	5	0	0	0	0	0	0	f
101	4	Corps_Cavaly	Corps Cavaly	Guyot	France	1	4	1	0	0	0	0	0	3	0	0	0	0	0	2	f
94	4	3eme_Division	3eme Division	LeGrand	France	1	3	1	0	0	0	0	0	3	0	0	0	0	0	2	f
99	4	3eme_Division.75e_Ligne	75e Ligne		France	2	4	5	1700	1	0	0	0	5	0	0	0	0	0	0	f
96	4	3eme_Division.Po_Legere	Po Legere		France/Italy	2	4	6	1000	1	2	2	0	3	0	0	0	0	0	0	f
105	4	Corps_Artillery.Heavy_Bty	Heavy Bty			4	4	0	0	0	0	0	0	4	0	0	0	8	1	3	f
104	4	Corps_Artillery	Corps Artillery		France	1	5	1	0	0	0	0	0	3	0	0	0	0	0	2	f
102	4	Corps_Cavaly.11e_Chasseur	11e Chasseur		France	3	4	0	0	0	0	0	0	3	600	3	4	0	0	0	f
107	5	Cav_Bde.10e_Hussar	10e Hussar		France	3	4	0	0	0	0	0	0	3	600	2	3	0	0	0	f
108	5	Cav_Bde.9e_Hussar_Copy	9e Hussar_Copy		France	3	1	0	0	0	0	0	0	3	600	2	3	0	0	0	f
109	5	Corps_Artillery	Corps Artillery	Careil	France	1	5	1	0	0	0	0	0	3	0	0	0	0	0	2	f
110	5	Corps_Artillery.Heavy_Foot	Heavy Foot			4	4	0	0	0	0	0	0	4	0	0	0	8	1	2	f
111	5	1eme_Division	1eme Division	Suchet	France	1	3	1	0	0	0	0	0	3	0	0	0	0	0	2	f
112	5	1eme_Division.17e_Legere	17e Legere		France	2	4	6	2100	1	0	0	0	3	0	0	0	0	0	0	f
113	5	1eme_Division.34e_Ligne	34e Ligne		France	2	4	5	2500	1	0	0	0	5	0	0	0	0	0	0	f
114	5	1eme_Division.40e_Ligne	40e Ligne		France	2	4	5	1800	1	0	0	0	5	0	0	0	0	0	0	f
115	5	1eme_Division.64e_Ligne	64e Ligne		France	2	1	5	1800	1	0	0	0	5	0	0	0	0	0	0	f
125	6	Cav_Bde.9e_Hussar	9e Hussar		France	3	4	0	0	0	0	0	0	3	600	2	3	0	0	0	f
116	5	1eme_Division.88e_Ligne	88e Ligne		France	2	1	5	1800	1	0	0	0	5	0	0	0	0	0	0	f
117	5	1eme_Division.Md_Foot_Bty	Md Foot Bty			4	4	0	0	0	0	0	0	4	0	0	0	8	2	3	f
132	6	1eme_Division.39e_Ligne	39e Ligne		France	2	4	5	1800	1	0	0	0	5	0	0	0	0	0	0	f
118	5	2eme_Division	2eme Division	Gazan	France	1	3	1	0	0	0	0	0	3	0	0	0	0	0	2	f
133	6	1eme_Division.69e_Ligne	69e Ligne		France	2	1	5	1800	1	0	0	0	5	0	0	0	0	0	0	f
119	5	2eme_Division.21e_Legere	21e Legere		France	2	4	6	1800	1	0	0	0	5	0	0	0	0	0	0	f
126	6	Cav_Bde.10e_Chasseur	10e Chasseur		France	3	4	0	0	0	0	0	0	3	600	3	4	0	0	0	f
134	6	1eme_Division.76e_Ligne	76e Ligne		France	2	1	5	1800	1	0	0	0	5	0	0	0	0	0	0	f
127	6	Corps_Artillery	Corps Artillery		France	1	4	1	0	0	0	0	0	3	0	0	0	0	0	2	f
120	5	2eme_Division.28e_Legere	28e Legere		France	2	4	6	900	1	0	0	0	3	0	0	0	0	0	0	f
128	6	Corps_Artillery.1e_Heavy_Bty	1e Heavy Bty			4	4	0	0	0	0	0	0	4	0	0	0	8	1	2	f
121	5	2eme_Division.100e_Ligne	100e Ligne		France	2	4	3	1800	1	0	0	0	5	0	0	0	0	0	0	f
122	5	2eme_Division.103e_Ligne	103e Ligne		France	2	4	3	1800	1	0	0	0	5	0	0	0	0	0	0	f
129	6	Corps_Artillery.2e_Heavy_Bty	2e Heavy Bty			4	1	0	0	0	0	0	0	4	0	0	0	8	1	2	f
123	5	2eme_Division.Md_Foot_Bty	Md Foot Bty			4	4	0	0	0	0	0	0	4	0	0	0	8	2	3	f
130	6	1eme_Division	1eme Division	Marchand	France	1	3	1	0	0	0	0	0	3	0	0	0	0	0	2	f
124	6	Cav_Bde	Cav Bde	Charbanais	France	1	4	1	0	0	0	0	0	3	0	0	0	0	0	2	f
131	6	1eme_Division.6e_Legere	6e Legere		France	2	4	6	1800	1	0	0	0	4	0	0	0	0	0	0	f
\.


--
-- Name: force_unit_id_seq; Type: SEQUENCE SET; Schema: public; Owner: steve
--

SELECT pg_catalog.setval('force_unit_id_seq', 134, true);


--
-- PostgreSQL database dump complete
--

