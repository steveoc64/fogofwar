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

COPY force_unit (id, force_id, path, name, descr, commander_name, nation, utype, cmd_level, drill, bayonets, small_arms, elite_arms, lt_coy, jg_coy, rating, sabres, cav_type, cav_rating, guns, gunnery_type, gun_condition, horse_guns) FROM stdin;
263	9	Supply_Train	Supply Train			France	1	3	1	0	0	0	0	0	3	0	0	0	0	0	2	f
264	9	Supply_Train.Supply_Escort_Detachment	Supply Escort Detachment				5	5	6	300	1	2	4	0	6	50	3	0	0	0	0	f
215	11	Adv_Guard_Div	Adv Guard Div		Ferdinand	Prussia	1	3	1	0	0	0	0	0	3	0	0	0	0	0	2	f
235	10	3rd_Div	3rd Div		Tauentzein	Prussia	1	3	1	0	0	0	0	0	3	0	0	0	0	0	2	f
239	10	3rd_Div.Cav_Bde_Prince_Clement	Cav Bde Prince Clement			Prussia	3	4	0	0	0	0	0	0	3	700	2	4	0	0	0	f
238	10	3rd_Div.Rosen_Fusilers	Rosen Fusilers			Prussia	2	4	9	400	1	0	0	2	5	0	0	0	0	0	0	f
221	10	1st_Div	1st Div		Grawert	Prussia	1	3	1	0	0	0	0	0	4	0	0	0	0	0	2	f
244	10	Reserve_Div.Cav_Bde_von_Krafft	Cav Bde von Krafft			Prussia	3	4	0	0	0	0	0	0	3	900	12	3	0	0	0	f
241	10	Reserve_Div	Reserve Div		Prittwitz	Prussia	1	3	1	0	0	0	0	0	4	0	0	0	0	0	2	f
245	10	Reserve_Div.Heavy_Bty	Heavy Bty			Prussia	4	4	0	0	0	0	0	0	4	0	0	0	8	1	3	f
247	13	1st_Div	1st Div		Kuhnheim	Prussia	1	3	1	0	0	0	0	0	3	0	0	0	0	0	2	f
226	10	1st_Div.Heavy_Bty	Heavy Bty			Prussia	4	4	0	0	0	0	0	0	4	0	0	0	8	1	4	f
250	13	1st_Div.Garde_du_Corps_Cavalry	Garde du Corps Cavalry			Prussia	3	4	0	0	0	0	0	0	3	600	1	1	0	0	0	f
225	10	1st_Div.Bde_Henkel	Bde Henkel			Prussia	3	4	0	0	0	0	0	0	3	900	5	3	0	0	0	f
251	13	1st_Div.Beeren_Cuirassier	Beeren Cuirassier			Prussia	3	4	0	0	0	0	0	0	3	400	1	2	0	0	0	f
1274	94	Infanterie_de_la_garde	Infanterie de la garde		Soulès	France	1	3	1	0	0	0	0	0	3	0	0	0	0	0	2	f
228	10	2nd_Div	2nd Div		Zechwitz	Prussia	1	3	1	0	0	0	0	0	4	0	0	0	0	0	2	f
224	10	1st_Div.Erichsen_Fusilers	Erichsen Fusilers				2	4	9	700	1	0	0	1	5	0	0	0	0	0	0	f
253	13	2nd_Div	2nd Div		von Arnim	Prussia	1	3	1	0	0	0	0	0	4	0	0	0	0	0	2	f
261	14	Supply_Train	Supply Train		von Schulze	Prussia	1	6	1	0	0	0	0	0	5	0	0	0	0	0	2	f
232	10	2nd_Div.Cav_Bde_von_Kochitsky	Cav Bde von Kochitsky			Saxony	3	4	0	0	0	0	0	0	3	200	1	3	0	0	0	f
237	10	3rd_Div.von_Schoeneberg	von Schöneberg			Saxony	2	4	1	3400	1	0	1	0	5	0	0	0	2	4	4	f
236	10	3rd_Div.von_Zweiffel	von Zweiffel			Prussia	2	4	1	3400	1	0	1	0	4	0	0	0	2	4	0	f
240	10	3rd_Div.Lt_Bty	Lt Bty			Prussia	4	4	0	0	0	0	0	0	4	0	0	0	6	4	3	f
222	10	1st_Div.von_Mueffling	von Müffling			Prussia	2	4	1	3600	1	0	1	0	4	0	0	0	2	4	3	f
248	13	1st_Div.Guard_Bde_von_Pletz	Guard Bde von Pletz			Prussia	2	4	1	2400	1	0	0	1	2	0	0	0	2	4	1	f
262	14	Supply_Train.Guard_Detachment	Guard Detachment				5	6	8	300	1	2	4	0	10	60	12	7	0	0	0	f
990	77	Supply_Train	Supply Train		von Schulze	Prussia	1	6	1	0	0	0	0	0	5	0	0	0	0	0	2	f
233	10	2nd_Div.Heavy_Bty	Heavy Bty			Saxony	4	4	0	0	0	0	0	0	4	0	0	0	8	1	3	f
991	77	Supply_Train.Guard_Detachment	Guard Detachment				5	6	8	300	1	2	4	0	10	60	12	7	0	0	0	f
992	78	2eme_Division.Md_Foot_Bty	Md Foot Bty				4	4	0	0	0	0	0	0	4	0	0	0	8	3	3	f
993	78	1eme_Division.Md_Foot_Bty	Md Foot Bty				4	4	0	0	0	0	0	0	4	0	0	0	8	3	2	f
42	1	Infantry_Division.1e_Grenadiers	1e Grenadiers			France	2	4	5	2400	1	0	0	0	1	0	0	0	0	0	0	f
33	2	Cav_Reserve	Cav Reserve		Tilley	France	1	3	1	0	0	0	0	0	3	0	0	0	0	0	2	f
44	1	Infantry_Division.2e_Grenadiers	2e Grenadiers			France	2	1	5	2400	1	0	0	0	1	0	0	0	0	0	0	f
34	2	Cav_Reserve.2e_Hussar	2e Hussar			France	3	4	0	0	0	0	0	0	3	300	2	3	0	0	0	f
48	1	Guard_Artillery.Army_Artillery_Park	Army Artillery Park				4	4	0	0	0	0	0	0	4	0	0	0	16	1	2	f
40	1	Cavalry_Division.Chasseurs_a_Cheval	Chasseurs a Cheval			France	3	4	0	0	0	0	0	0	3	600	3	1	0	0	0	f
35	2	Cav_Reserve.4e_Hussar	4e Hussar			France	3	1	0	0	0	0	0	0	3	422	2	4	0	0	0	f
36	2	Artillery_Reserve	Artillery Reserve		Eble	France	1	3	1	0	0	0	0	0	3	0	0	0	0	0	2	f
45	1	Infantry_Division.1e_Chasseurs	1e Chasseurs			France	2	1	6	2400	1	0	0	0	1	0	0	0	0	0	0	f
994	78	3eme_Division.Md_Foot_Bty	Md Foot Bty				4	4	0	0	0	0	0	0	4	0	0	0	8	3	2	f
41	1	Cavalry_Division.Grenadier_a_Cheval	Grenadier a Cheval			France	3	1	0	0	0	0	0	0	3	400	8	1	0	0	0	f
995	78	2eme_Division	2eme Division		Leval	France	1	3	1	0	0	0	0	0	3	0	0	0	0	0	2	f
38	1	Guard_Artillery	Guard Artillery		de Lamartiniére	France	1	4	1	0	0	0	0	0	2	0	0	0	0	0	2	f
47	1	Infantry_Division.2e_Chasseurs_Copy	2e Chasseurs_Copy			France	2	1	6	2400	1	0	0	0	1	0	0	0	0	0	0	f
1275	94	Infanterie_de_la_garde.Bde_Soules	Bde Soulès	1°/2° Rgt. de chasseurs à pied de la Garde impériale		France	2	4	6	1800	1	0	0	0	1	0	0	0	0	0	0	f
46	1	Infantry_Division.Foot_Dragoons	Foot Dragoons			France	2	1	6	2400	1	0	0	0	1	0	0	0	0	0	0	f
53	3	1eme_Division.13e_Legere	13e Legere			France	2	4	6	1400	1	0	0	0	3	0	0	0	0	0	0	f
52	3	1eme_Division	1eme Division		Morand	France	1	3	1	0	0	0	0	0	3	0	0	0	0	0	2	f
61	3	2eme_Division.108e_Ligne	108e Ligne			France	2	1	5	1600	1	0	0	0	5	0	0	0	0	0	0	f
56	3	1eme_Division.51e_Ligne	51e Ligne			France	2	1	5	1800	1	0	0	0	5	0	0	0	0	0	0	f
54	3	1eme_Division.17e_Ligne	17e Ligne			France	2	4	5	1800	1	0	0	0	5	0	0	0	0	0	0	f
996	78	2eme_Division.28e_Ligne	28e Ligne			France	2	1	5	1400	1	0	0	0	5	0	0	0	0	0	0	f
57	3	1eme_Division.61e_Ligne	61e Ligne			France	2	1	5	1800	1	0	0	0	5	0	0	0	0	0	0	f
55	3	1eme_Division.30e_Ligne	30e Ligne			France	2	1	5	1800	1	0	0	0	5	0	0	0	0	0	0	f
8	2	3eme_Division	3eme Division		Drouet	France	1	3	1	0	0	0	0	0	4	0	0	0	0	0	2	f
59	3	2eme_Division	2eme Division		Friant	France	1	3	1	0	0	0	0	0	3	0	0	0	0	0	2	f
18	2	3eme_Division.95e_Ligne	95e Ligne		Drouet	France	2	4	5	2600	1	0	0	0	5	0	0	0	0	0	0	f
997	78	1eme_Division.35e_Ligne	35e Ligne			France	2	4	5	1400	1	0	0	0	5	0	0	0	0	0	0	f
998	78	3eme_Division.Corsican_Legere_Copy	Corsican Legere_Copy			France/Corsica	2	1	6	1300	1	2	0	1	3	0	0	0	0	0	0	f
17	2	3eme_Division.94e_Ligne	94e Ligne		Drouet	France	2	4	5	1500	1	0	0	0	5	0	0	0	0	0	0	f
999	78	2eme_Division.46e_Ligne	46e Ligne			France	2	1	5	1400	1	0	0	0	5	0	0	0	0	0	0	f
62	3	2eme_Division.33e_Ligne	33e Ligne			France	2	1	5	1800	1	0	0	0	5	0	0	0	0	0	0	f
83	4	2eme_Division	2eme Division		Leval	France	1	3	1	0	0	0	0	0	3	0	0	0	0	0	2	f
13	2	2eme_Division.45e_Ligne	45e Ligne		Rivaud	France	2	4	5	2000	1	0	0	0	5	0	0	0	0	0	0	f
14	2	2eme_Division.54e_Ligne	54e Ligne		Rivaud	France	2	4	5	2000	1	0	0	0	5	0	0	0	0	0	0	f
11	2	1eme_Division.32e_Ligne	32e Ligne		de l'Eltang	France	2	4	5	2000	1	0	0	0	4	0	0	0	0	0	0	f
12	2	1eme_Division.96e_Ligne	96e Ligne		de l'Eltang	France	2	4	5	2000	1	0	0	0	5	0	0	0	0	0	0	f
6	2	1eme_Division	1eme Division		de l'Eltang	France	1	3	1	0	0	0	0	0	3	0	0	0	0	0	2	f
10	2	2eme_Division.4e_Legere	4e Legere		Rivaud	France	2	4	6	2000	1	0	1	0	5	0	0	0	0	0	0	f
7	2	2eme_Division	2eme Division		Rivaud	France	1	3	1	0	0	0	0	0	3	0	0	0	0	0	2	f
91	4	2eme_Division.28e_Ligne	28e Ligne			France	2	1	5	1400	1	0	0	0	5	0	0	0	0	0	0	f
79	4	1eme_Division.35e_Ligne	35e Ligne			France	2	4	5	1400	1	0	0	0	5	0	0	0	0	0	0	f
1000	78	1eme_Division.43e_Ligne	43e Ligne			France	2	1	5	1400	1	0	0	0	5	0	0	0	0	0	0	f
64	3	2eme_Division.111e_Ligne	111e Ligne			France	2	1	5	1800	1	0	0	0	5	0	0	0	0	0	0	f
97	4	3eme_Division.Corsican_Legere_Copy	Corsican Legere_Copy			France/Corsica	2	1	6	1300	1	2	0	1	3	0	0	0	0	0	0	f
85	4	2eme_Division.46e_Ligne	46e Ligne			France	2	1	5	1400	1	0	0	0	5	0	0	0	0	0	0	f
74	3	Cav_Bde	Cav Bde		Viallanes	France	1	4	1	0	0	0	0	0	3	0	0	0	0	0	2	f
66	3	3eme_Division	3eme Division		Gudin	France	1	1	1	0	0	0	0	0	3	0	0	0	0	0	2	f
80	4	1eme_Division.43e_Ligne	43e Ligne			France	2	1	5	1400	1	0	0	0	5	0	0	0	0	0	0	f
67	3	3eme_Division.12e_Ligne	12e Ligne			France	2	1	5	1300	1	0	0	0	5	0	0	0	0	0	0	f
88	4	2eme_Division.24e_Legere	24e Legere			France	2	1	6	2000	1	0	0	0	4	0	0	0	0	0	0	f
71	3	3eme_Division.21e_Ligne	21e Ligne			France	2	1	5	1800	1	0	0	0	5	0	0	0	0	0	0	f
69	3	3eme_Division.25e_Ligne	25e Ligne			France	2	1	5	1800	1	0	0	0	5	0	0	0	0	0	0	f
84	4	2eme_Division.4e_Ligne	4e Ligne			France	2	1	5	1400	1	0	0	0	5	0	0	0	0	0	0	f
70	3	3eme_Division.85e_Ligne	85e Ligne			France	2	1	5	1600	1	0	0	0	5	0	0	0	0	0	0	f
1001	78	2eme_Division.24e_Legere	24e Legere			France	2	1	6	2000	1	0	0	0	4	0	0	0	0	0	0	f
75	3	Cav_Bde.1e_Chasseur	1e Chasseur			France	3	4	0	0	0	0	0	0	3	600	3	3	0	0	0	f
76	3	Cav_Bde.2e_Chasseur	2e Chasseur			France	3	1	0	0	0	0	0	0	3	600	3	3	0	0	0	f
72	3	Corps_Artillery	Corps Artillery		Hannicque	France	1	4	1	0	0	0	0	0	3	0	0	0	0	0	2	f
77	4	1eme_Division	1eme Division		St Hilaire	France	1	3	1	0	0	0	0	0	3	0	0	0	0	0	2	f
95	4	3eme_Division.26e_Legere	26e Legere			France	2	4	6	1600	1	0	0	0	3	0	0	0	0	0	0	f
78	4	1eme_Division.10e_Legere	10e Legere			France	2	4	6	1800	1	0	0	0	4	0	0	0	0	0	0	f
92	4	2eme_Division.57e_Ligne	57e Ligne			France	2	1	5	1700	1	0	0	0	5	0	0	0	0	0	0	f
5	1	Cavalry_Division	Cavalry Division		Bessieres	France	1	3	1	0	0	0	0	0	1	0	0	0	0	0	2	f
106	5	Cav_Bde	Cav Bde		Trelliard	France	1	4	1	0	0	0	0	0	3	0	0	0	0	0	2	f
1002	78	2eme_Division.4e_Ligne	4e Ligne			France	2	1	5	1400	1	0	0	0	5	0	0	0	0	0	0	f
98	4	3eme_Division.18e_Ligne	18e Ligne			France	2	4	5	1800	1	0	0	0	4	0	0	0	0	0	0	f
1003	78	1eme_Division	1eme Division		St Hilaire	France	1	3	1	0	0	0	0	0	3	0	0	0	0	0	2	f
1004	78	3eme_Division.26e_Legere	26e Legere			France	2	4	6	1600	1	0	0	0	3	0	0	0	0	0	0	f
103	4	Corps_Cavaly.22e_Chasseur	22e Chasseur			France	3	1	0	0	0	0	0	0	3	600	3	4	0	0	0	f
90	4	1eme_Division.55e_Ligne	55e Ligne			France	2	1	5	1400	1	0	0	0	5	0	0	0	0	0	0	f
101	4	Corps_Cavaly	Corps Cavaly		Guyot	France	1	4	1	0	0	0	0	0	3	0	0	0	0	0	2	f
94	4	3eme_Division	3eme Division		LeGrand	France	1	3	1	0	0	0	0	0	3	0	0	0	0	0	2	f
99	4	3eme_Division.75e_Ligne	75e Ligne			France	2	4	5	1700	1	0	0	0	5	0	0	0	0	0	0	f
96	4	3eme_Division.Po_Legere	Po Legere			France/Italy	2	4	6	1000	1	2	2	0	3	0	0	0	0	0	0	f
105	4	Corps_Artillery.Heavy_Bty	Heavy Bty				4	4	0	0	0	0	0	0	4	0	0	0	8	1	3	f
104	4	Corps_Artillery	Corps Artillery			France	1	5	1	0	0	0	0	0	3	0	0	0	0	0	2	f
102	4	Corps_Cavaly.11e_Chasseur	11e Chasseur			France	3	4	0	0	0	0	0	0	3	600	3	4	0	0	0	f
107	5	Cav_Bde.10e_Hussar	10e Hussar			France	3	4	0	0	0	0	0	0	3	600	2	3	0	0	0	f
108	5	Cav_Bde.9e_Hussar_Copy	9e Hussar_Copy			France	3	1	0	0	0	0	0	0	3	600	2	3	0	0	0	f
109	5	Corps_Artillery	Corps Artillery		Careil	France	1	5	1	0	0	0	0	0	3	0	0	0	0	0	2	f
110	5	Corps_Artillery.Heavy_Foot	Heavy Foot				4	4	0	0	0	0	0	0	4	0	0	0	8	1	2	f
111	5	1eme_Division	1eme Division		Suchet	France	1	3	1	0	0	0	0	0	3	0	0	0	0	0	2	f
113	5	1eme_Division.34e_Ligne	34e Ligne			France	2	4	5	2500	1	0	0	0	5	0	0	0	0	0	0	f
114	5	1eme_Division.40e_Ligne	40e Ligne			France	2	4	5	1800	1	0	0	0	5	0	0	0	0	0	0	f
115	5	1eme_Division.64e_Ligne	64e Ligne			France	2	1	5	1800	1	0	0	0	5	0	0	0	0	0	0	f
125	6	Cav_Bde.9e_Hussar	9e Hussar			France	3	4	0	0	0	0	0	0	3	600	2	3	0	0	0	f
116	5	1eme_Division.88e_Ligne	88e Ligne			France	2	1	5	1800	1	0	0	0	5	0	0	0	0	0	0	f
65	3	2eme_Division.48e_Ligne	48e Ligne			France	2	1	5	1400	1	0	0	0	1	0	0	0	0	0	0	f
112	5	1eme_Division.17e_Legere	17e Legere			France	2	4	6	2100	1	0	0	0	3	0	0	0	0	0	0	f
1005	78	1eme_Division.10e_Legere	10e Legere			France	2	4	6	1800	1	0	0	0	4	0	0	0	0	0	0	f
132	6	1eme_Division.39e_Ligne	39e Ligne			France	2	4	5	1800	1	0	0	0	5	0	0	0	0	0	0	f
118	5	2eme_Division	2eme Division		Gazan	France	1	3	1	0	0	0	0	0	3	0	0	0	0	0	2	f
142	7	Corps_Cav.7e_Chasseur	7e Chasseur			France	3	4	0	0	0	0	0	0	3	600	3	4	0	0	0	f
133	6	1eme_Division.69e_Ligne	69e Ligne			France	2	1	5	1800	1	0	0	0	5	0	0	0	0	0	0	f
126	6	Cav_Bde.10e_Chasseur	10e Chasseur			France	3	4	0	0	0	0	0	0	3	600	3	4	0	0	0	f
134	6	1eme_Division.76e_Ligne	76e Ligne			France	2	1	5	1800	1	0	0	0	5	0	0	0	0	0	0	f
127	6	Corps_Artillery	Corps Artillery			France	1	4	1	0	0	0	0	0	3	0	0	0	0	0	2	f
120	5	2eme_Division.28e_Legere	28e Legere			France	2	4	6	900	1	0	0	0	3	0	0	0	0	0	0	f
139	6	2eme_Division.59e_Ligne	59e Ligne			France	2	1	5	1800	1	0	0	0	5	0	0	0	0	0	0	f
128	6	Corps_Artillery.1e_Heavy_Bty	1e Heavy Bty				4	4	0	0	0	0	0	0	4	0	0	0	8	1	2	f
121	5	2eme_Division.100e_Ligne	100e Ligne			France	2	4	3	1800	1	0	0	0	5	0	0	0	0	0	0	f
122	5	2eme_Division.103e_Ligne	103e Ligne			France	2	4	3	1800	1	0	0	0	5	0	0	0	0	0	0	f
129	6	Corps_Artillery.2e_Heavy_Bty	2e Heavy Bty				4	1	0	0	0	0	0	0	4	0	0	0	8	1	2	f
1006	78	2eme_Division.57e_Ligne	57e Ligne			France	2	1	5	1700	1	0	0	0	5	0	0	0	0	0	0	f
135	6	2eme_Division	2eme Division		Gardanne	France	1	3	1	0	0	0	0	0	3	0	0	0	0	0	2	f
130	6	1eme_Division	1eme Division		Marchand	France	1	3	1	0	0	0	0	0	3	0	0	0	0	0	2	f
124	6	Cav_Bde	Cav Bde		Charbanais	France	1	4	1	0	0	0	0	0	3	0	0	0	0	0	2	f
138	6	2eme_Division.50e_Ligne	50e Ligne			France	2	1	5	1800	1	0	0	0	5	0	0	0	0	0	0	f
150	7	1eme_Division.105e_Ligne	105e Ligne			France	2	1	3	1700	1	0	0	0	5	0	0	0	0	0	0	f
140	6	2eme_Division.27e_Ligne	27e Ligne			France	2	1	5	1800	1	0	0	0	5	0	0	0	0	0	0	f
143	7	Corps_Cav.20e_Chasseur	20e Chasseur			France	3	1	0	0	0	0	0	0	3	600	3	4	0	0	0	f
131	6	1eme_Division.6e_Legere	6e Legere			France	2	4	6	1800	1	0	0	0	4	0	0	0	0	0	0	f
136	6	2eme_Division.25e_Legere	25e Legere			France	2	4	6	1800	1	0	0	0	4	0	0	0	0	0	0	f
148	7	1eme_Division.14e_Ligne	14e Ligne			France	2	4	5	700	1	0	0	0	4	0	0	0	0	0	0	f
141	7	Corps_Cav	Corps Cav		Durosnel	France	1	4	1	0	0	0	0	0	3	0	0	0	0	0	2	f
144	7	Corps_Artillery	Corps Artillery			France	1	4	1	0	0	0	0	0	3	0	0	0	0	0	2	f
155	7	2eme_Division.63e_Ligne	63e Ligne			France	2	1	5	700	1	0	0	0	5	0	0	0	0	0	0	f
1007	78	3eme_Division.18e_Ligne	18e Ligne			France	2	4	5	1800	1	0	0	0	4	0	0	0	0	0	0	f
145	7	Corps_Artillery.Heavy_Bty	Heavy Bty				4	4	0	0	0	0	0	0	4	0	0	0	8	1	2	f
147	7	1eme_Division.16e_Legere	16e Legere			France	2	4	6	2700	1	0	0	0	4	0	0	0	0	0	0	f
149	7	1eme_Division.44e_Ligne	44e Ligne			France	2	1	5	1700	1	0	0	0	5	0	0	0	0	0	0	f
146	7	1eme_Division	1eme Division		Desjardin	France	1	4	1	0	0	0	0	0	3	0	0	0	0	0	2	f
154	7	2eme_Division.24e_Ligne	24e Ligne			France	2	4	5	1800	1	0	0	0	5	0	0	0	0	0	0	f
153	7	2eme_Division.7e_Legere	7e Legere			France	2	4	6	1800	1	0	0	0	4	0	0	0	0	0	0	f
152	7	2eme_Division	2eme Division		Bierre	France	1	4	1	0	0	0	0	0	3	0	0	0	0	0	2	f
156	7	2eme_Division.Hesse_Darmstadt	Hesse Darmstadt			Hesse	2	1	1	800	1	0	0	0	4	0	0	0	0	0	0	f
1008	78	Corps_Cavaly.22e_Chasseur	22e Chasseur			France	3	1	0	0	0	0	0	0	3	600	3	4	0	0	0	f
159	8	Corps_Artillery	Corps Artillery			France	1	3	1	0	0	0	0	0	3	0	0	0	0	0	2	f
157	7	2eme_Division.Allied_Nassau	Allied Nassau			Nassau	2	1	5	400	1	0	0	0	4	0	0	0	0	0	0	f
162	8	1e_Cuirassier_Div	1e Cuirassier Div		Nansouty	France	1	3	1	0	0	0	0	0	3	0	0	0	0	0	2	f
164	8	1e_Dragoon_Div	1e Dragoon Div		Klein	France	1	3	1	0	0	0	0	0	3	0	0	0	0	0	2	f
163	8	2e_Cuirassier_Div	2e Cuirassier Div		d'Hautpoul	France	1	3	1	0	0	0	0	0	3	0	0	0	0	0	2	f
165	8	2e_Dragoon_Div	2e Dragoon Div		Grouchy	France	1	3	1	0	0	0	0	0	3	0	0	0	0	0	2	f
173	8	2e_Cuirassier_Div.Bde_Verdiere	Bde Verdiere			France	3	4	0	0	0	0	0	0	3	600	1	4	0	0	0	f
166	8	3e_Dragoon_Div	3e Dragoon Div		Beaumont	France	1	3	1	0	0	0	0	0	3	0	0	0	0	0	2	f
167	8	4e_Dragoon_Div	4e Dragoon Div		Sahut	France	1	3	1	0	0	0	0	0	3	0	0	0	0	0	2	f
174	8	2e_Cuirassier_Div.Bde_StSulpice	Bde St.Sulpice			France	3	1	0	0	0	0	0	0	3	600	1	4	0	0	0	f
119	5	2eme_Division.21e_Legere	21e Legere			France	2	4	6	1800	1	0	0	0	5	0	1	0	0	0	0	f
168	8	Light_Div	Light Div		Lasalle	France	1	3	1	0	0	0	0	0	3	0	0	0	0	0	2	f
182	8	Light_Div.Milhaud_1e_Hussar	Milhaud 1e Hussar			France	3	4	0	0	0	0	0	0	3	600	2	3	0	0	0	f
181	8	Light_Div.Bde_Lasalle_5_7e_Hussar	Bde Lasalle 5/7e Hussar			France	3	4	0	0	0	0	0	0	3	600	2	3	0	0	0	f
175	8	2e_Dragoon_Div.Bde_Roget	Bde Roget			France	3	4	0	0	0	0	0	0	3	900	5	5	0	0	0	f
169	8	1e_Cuirassier_Div.Bde_Defrance	Bde Defrance			France	3	4	0	0	0	0	0	0	3	600	9	2	0	0	0	f
176	8	2e_Dragoon_Div.Bde_Milet	Bde Milet			France	3	1	0	0	0	0	0	0	3	600	5	5	0	0	0	f
170	8	1e_Cuirassier_Div.Bde_Housaye	Bde Housaye			France	3	1	0	0	0	0	0	0	3	1300	1	2	0	0	0	f
187	16	Kill_this_one_as_well	Kill this one as well				1	3	1	0	0	0	0	0	3	0	0	0	0	0	2	f
171	8	1e_Dragoon_Div.Bde_Fenerolz	Bde Fenerolz			France	3	4	0	0	0	0	0	0	3	600	5	4	0	0	0	f
172	8	1e_Dragoon_Div.Bde_Picard	Bde Picard			France	3	1	0	0	0	0	0	0	3	600	5	4	0	0	0	f
188	16	Kill_this_one_as_well.2nd_Special_Forces_killer_BDE	2nd Special Forces killer BDE				2	4	3	1800	1	0	0	0	5	0	0	0	0	0	0	f
177	8	3e_Dragoon_Div.Bde_Boye	Bde Boye			France	3	4	0	0	0	0	0	0	3	900	5	5	0	0	0	f
178	8	3e_Dragoon_Div.Bde_Maubourg	Bde Maubourg			France	3	1	0	0	0	0	0	0	3	600	5	5	0	0	0	f
1009	78	1eme_Division.55e_Ligne	55e Ligne			France	2	1	5	1400	1	0	0	0	5	0	0	0	0	0	0	f
49	1	Guard_Artillery.Guard_Horse_Bty	Guard Horse Bty				4	1	0	0	0	0	0	0	4	0	0	0	8	4	1	t
160	8	Corps_Artillery.1e_Horse	1e Horse				4	4	0	0	0	0	0	0	4	0	0	0	8	3	2	t
161	8	Corps_Artillery.2e_Horse	2e Horse				4	1	0	0	0	0	0	0	4	0	0	0	8	3	2	t
216	11	Adv_Guard_Div.Bde_von_Pelet	Bde von Pelet	Rabenau # 13 Pelet # 14 Rühle # 15 Fusiliers, Masars and Valentin Jager 		Prussia	2	4	9	2400	1	0	0	2	4	0	0	0	6	3	3	f
265	11	Adv_Guard_Div.Cav_Bde_von_Schimmelpfennig	Cav Bde von Schimmelpfennig	Schimmelpfennig Hussar Regiment # 6, ten squadrons		Prussia	3	4	0	0	0	0	0	0	3	1500	2	4	6	3	3	f
217	11	Adv_Guard_Div.Bde_Belvilaqua	Bde Belvilaqua	Combined Bns from IR 49,  Prinz Clemens (saxon), and Kurfurst (saxon)		Prussia/Saxony	2	4	1	5100	1	0	1	0	5	0	0	0	6	4	0	f
1010	78	Corps_Cavaly	Corps Cavaly		Guyot	France	1	4	1	0	0	0	0	0	3	0	0	0	0	0	2	f
1011	78	3eme_Division	3eme Division		LeGrand	France	1	3	1	0	0	0	0	0	3	0	0	0	0	0	2	f
179	8	4e_Dragoon_Div.Bde_Margaron	Bde Margaron	17th Dragoon Regiment, 1st, 2nd, and 3rd squadrons 27th Dragoon Regiment, 1st, 2nd, and 3rd squadrons		France	3	4	0	0	0	0	0	0	3	1200	5	5	0	0	0	f
1012	78	3eme_Division.75e_Ligne	75e Ligne			France	2	4	5	1700	1	0	0	0	5	0	0	0	0	0	0	f
1013	78	3eme_Division.Po_Legere	Po Legere			France/Italy	2	4	6	1000	1	2	2	0	3	0	0	0	0	0	0	f
266	11	Adv_Guard_Div.Saxon_Hussar_von_Truetzschler	Saxon Hussar von Trützschler	Saxon Hussar Regiment, eight squadrons		Saxony	3	1	0	0	0	0	0	0	3	1200	2	4	0	0	0	f
1014	78	Corps_Artillery.Heavy_Bty	Heavy Bty				4	4	0	0	0	0	0	0	4	0	0	0	8	1	3	f
1015	78	Corps_Artillery	Corps Artillery			France	1	5	1	0	0	0	0	0	3	0	0	0	0	0	2	f
1016	78	Corps_Cavaly.11e_Chasseur	11e Chasseur			France	3	4	0	0	0	0	0	0	3	600	3	4	0	0	0	f
246	10	Reserve_Div.Md_Foot_Bty	Md Foot Bty			Prussia	4	4	0	0	0	0	0	0	4	0	0	0	8	3	4	f
223	10	1st_Div.von_Schimonsky	von Schimonsky			Prussia	2	4	1	3400	1	0	1	0	4	0	0	0	2	4	3	f
243	10	Reserve_Div.Cerrini_Grenadier_Bde	Cerrini Grenadier Bde			Prussia	2	4	1	4200	1	0	0	2	4	0	0	0	2	4	3	f
242	10	Reserve_Div.Prittwitz_Grenadier_Bde	Prittwitz Grenadier Bde			Prussia	2	4	1	3300	1	0	0	2	4	0	0	0	2	4	3	f
227	10	1st_Div.Horse_Bty	Horse Bty			Prussia	4	4	0	0	0	0	0	0	4	0	0	0	8	3	3	f
249	13	1st_Div.Guard_Bde_von_Hirschfeld	Guard Bde von Hirschfeld			Prussia	2	1	1	2400	1	0	0	1	2	0	0	0	2	4	1	f
1017	79	2eme_Division.Md_Foot_Bty	Md Foot Bty				4	4	0	0	0	0	0	0	4	0	0	0	8	3	3	f
1018	79	1eme_Division.Md_Foot_Bty	Md Foot Bty				4	4	0	0	0	0	0	0	4	0	0	0	8	3	3	f
1019	79	Cav_Bde	Cav Bde		Trelliard	France	1	4	1	0	0	0	0	0	3	0	0	0	0	0	2	f
1020	79	Cav_Bde.10e_Hussar	10e Hussar			France	3	4	0	0	0	0	0	0	3	600	2	3	0	0	0	f
1021	79	Cav_Bde.9e_Hussar_Copy	9e Hussar_Copy			France	3	1	0	0	0	0	0	0	3	600	2	3	0	0	0	f
1022	79	Corps_Artillery	Corps Artillery		Careil	France	1	5	1	0	0	0	0	0	3	0	0	0	0	0	2	f
1023	79	Corps_Artillery.Heavy_Foot	Heavy Foot				4	4	0	0	0	0	0	0	4	0	0	0	8	1	2	f
1024	79	1eme_Division	1eme Division		Suchet	France	1	3	1	0	0	0	0	0	3	0	0	0	0	0	2	f
1025	79	1eme_Division.17e_Legere	17e Legere			France	2	4	6	2100	1	0	0	0	3	0	0	0	0	0	0	f
255	13	2nd_Div.von_Zenge_Grenadiers	von Zenge Grenadiers			Prussia	2	1	1	1800	1	0	0	1	4	0	0	0	2	4	1	f
230	10	2nd_Div.von_Dyherrn	von Dyherrn			Saxony	2	4	3	4200	1	0	1	0	4	0	0	0	2	4	3	f
256	13	2nd_Div.Zenge_Regt_Musketeer	Zenge Regt Musketeer			Prussia	2	1	1	1800	1	0	0	1	4	0	0	0	2	4	1	f
257	13	2nd_Div.Arnim_Regt_Musketeer	Arnim Regt Musketeer			Prussia	2	1	1	1800	1	0	0	1	4	0	0	0	2	4	1	f
258	13	2nd_Div.Pirch_Regt_Musketeer	Pirch Regt Musketeer			Prussia	2	1	1	1800	1	0	0	1	4	0	0	0	2	4	1	f
252	13	1st_Div.Md_Foot_Bty	Md Foot Bty			Prussia	4	4	0	0	0	0	0	0	4	0	0	0	8	3	1	f
259	13	2nd_Div.Md_Foot_Bty	Md Foot Bty			Prussia	4	4	0	0	0	0	0	0	4	0	0	0	8	3	1	f
254	13	2nd_Div.von_Malschitsky_Grenadiers	von Malschitsky Grenadiers			Prussia	2	4	1	1800	1	0	0	1	4	0	0	0	2	4	1	f
229	10	2nd_Div.von_Burgsdorf	von Burgsdorf			Saxony	2	4	1	3400	1	0	1	0	4	0	0	0	1	4	3	f
234	10	2nd_Div.Horse_Bty	Horse Bty			Saxony	4	4	0	0	0	0	0	0	4	0	0	0	8	3	3	f
37	2	Artillery_Reserve.Md_Foot_Bty	Md Foot Bty				4	4	0	0	0	0	0	0	4	0	0	0	8	3	2	f
50	1	Guard_Artillery.Guard_Foot_Artillery	Guard Foot Artillery				4	1	0	0	0	0	0	0	4	0	0	0	24	3	1	f
58	3	1eme_Division.Md_Foot_Bty	Md Foot Bty				4	4	0	0	0	0	0	0	4	0	0	0	8	3	2	f
16	2	3eme_Division.27e_Legere	27e Legere		Drouet	France	2	4	6	1500	1	0	2	0	5	0	0	0	0	4	0	f
32	2	3eme_Division.Md_Foot_Bty	Md Foot Bty				4	4	0	0	0	0	0	0	0	0	0	0	8	3	3	f
100	4	3eme_Division.Md_Foot_Bty	Md Foot Bty				4	4	0	0	0	0	0	0	4	0	0	0	8	3	2	f
73	3	Corps_Artillery.Md_Foot_Bty	Md Foot Bty				4	4	0	0	0	0	0	0	4	0	0	0	8	3	2	f
82	4	1eme_Division.Md_Foot_Bty	Md Foot Bty				4	4	0	0	0	0	0	0	4	0	0	0	8	3	2	f
93	4	2eme_Division.Md_Foot_Bty	Md Foot Bty				4	4	0	0	0	0	0	0	4	0	0	0	8	3	3	f
63	3	2eme_Division.Md_Foot_Bty	Md Foot Bty				4	1	0	0	0	0	0	0	4	0	0	0	8	3	2	f
68	3	3eme_Division.Md_Foot_Bty	Md Foot Bty				4	1	0	0	0	0	0	0	4	0	0	0	8	3	2	f
117	5	1eme_Division.Md_Foot_Bty	Md Foot Bty				4	4	0	0	0	0	0	0	4	0	0	0	8	3	3	f
123	5	2eme_Division.Md_Foot_Bty	Md Foot Bty				4	4	0	0	0	0	0	0	4	0	0	0	8	3	3	f
151	7	1eme_Division.Md_Foot_Bty	Md Foot Bty				4	4	0	0	0	0	0	0	4	0	0	0	8	3	3	f
158	7	2eme_Division.Md_Foot_Bty	Md Foot Bty				4	4	0	0	0	0	0	0	4	0	0	0	8	3	3	f
1026	79	1eme_Division.34e_Ligne	34e Ligne			France	2	4	5	2500	1	0	0	0	5	0	0	0	0	0	0	f
284	28	1st_Div.3rd_special_regt	3rd special regt				2	4	3	1800	1	0	0	0	5	0	0	0	0	0	0	f
281	28	1st_Div	1st Div				1	3	1	0	0	0	0	0	3	0	0	0	0	0	2	f
9	2	1eme_Division.9e_Legere	9e Legere		de l'Eltang	France	2	4	6	2600	1	2	0	0	4	0	0	0	0	4	0	f
30	2	1eme_Division.Md_Foot_Bty	Md Foot Bty				4	4	0	0	0	0	0	0	0	0	0	0	8	3	3	f
31	2	2eme_Division.Md_Foot_Bty	Md Foot Bty				4	4	0	0	0	0	0	0	0	0	0	0	8	3	3	f
276	2	2eme_Division.Md_Foot_Bty_Copy	Md Foot Bty_Copy				4	1	0	0	0	0	0	0	0	0	0	0	8	3	3	f
298	28	2nd_Div.1st_Regt_of_Death	1st Regt of Death	with data			2	4	3	1800	1	0	0	0	5	0	0	0	0	0	0	f
282	28	1st_Div.1st_Regt	1st Regt				2	4	3	1800	1	0	0	0	5	0	0	0	0	0	0	f
285	28	2nd_Div	2nd Div				1	3	1	0	0	0	0	0	3	0	0	0	0	0	2	f
283	28	1st_Div.2nd_Regt	2nd Regt			France	2	4	3	1800	1	0	0	0	6	0	0	0	0	0	0	f
286	28	2nd_Div.1st_Regt	1st Regt				2	4	3	1800	1	0	0	0	5	0	0	0	0	0	0	f
287	28	2nd_Div.2nd_Regt	2nd Regt				2	4	3	1800	1	0	0	0	5	0	0	0	0	0	0	f
292	28	6th_Division	6th Division				1	3	1	0	0	0	0	0	3	0	0	0	0	0	2	f
291	28	6th_Division.2nd_Regt	2nd Regt				2	4	3	1800	1	0	0	0	5	0	0	0	0	0	0	f
289	28	7th_Div	7th Div				1	3	1	0	0	0	0	0	3	0	0	0	0	0	2	f
290	28	6th_Division.1st_Regt	1st Regt				2	4	3	1800	1	0	0	0	5	0	0	0	0	0	0	f
293	28	7th_Div.1st_Bn	1st Bn				2	4	3	1800	1	0	0	0	5	0	0	0	0	0	0	f
294	28	7th_Div.4th_Bn	4th Bn				2	4	3	1800	1	0	0	0	5	0	0	0	0	0	0	f
295	28	2nd_Duvussion	2nd Duvussion				1	3	1	0	0	0	0	0	3	0	0	0	0	0	2	f
296	28	2nd_Duvussion.NZ_Brugade_from_NZ	NZ Brugade from NZ				2	4	7	1800	1	0	0	0	5	0	0	0	0	0	0	f
297	28	2nd_Div.Devils_Bde_as_such	Devils Bde as such	as such six much as such		gotta break this	2	4	4	1800	3	0	0	0	5	0	0	0	0	0	0	f
1027	79	1eme_Division.40e_Ligne	40e Ligne			France	2	4	5	1800	1	0	0	0	5	0	0	0	0	0	0	f
1028	79	1eme_Division.64e_Ligne	64e Ligne			France	2	1	5	1800	1	0	0	0	5	0	0	0	0	0	0	f
1029	79	1eme_Division.88e_Ligne	88e Ligne			France	2	1	5	1800	1	0	0	0	5	0	0	0	0	0	0	f
1030	79	2eme_Division	2eme Division		Gazan	France	1	3	1	0	0	0	0	0	3	0	0	0	0	0	2	f
1031	79	2eme_Division.21e_Legere	21e Legere			France	2	4	6	1800	1	0	0	0	5	0	1	0	0	0	0	f
1032	79	2eme_Division.28e_Legere	28e Legere			France	2	4	6	900	1	0	0	0	3	0	0	0	0	0	0	f
1033	79	2eme_Division.100e_Ligne	100e Ligne			France	2	4	3	1800	1	0	0	0	5	0	0	0	0	0	0	f
1034	79	2eme_Division.103e_Ligne	103e Ligne			France	2	4	3	1800	1	0	0	0	5	0	0	0	0	0	0	f
1035	80	Cav_Bde.9e_Hussar	9e Hussar			France	3	4	0	0	0	0	0	0	3	600	2	3	0	0	0	f
1036	80	1eme_Division.39e_Ligne	39e Ligne			France	2	4	5	1800	1	0	0	0	5	0	0	0	0	0	0	f
1037	80	1eme_Division.69e_Ligne	69e Ligne			France	2	1	5	1800	1	0	0	0	5	0	0	0	0	0	0	f
1038	80	Cav_Bde.10e_Chasseur	10e Chasseur			France	3	4	0	0	0	0	0	0	3	600	3	4	0	0	0	f
1039	80	1eme_Division.76e_Ligne	76e Ligne			France	2	1	5	1800	1	0	0	0	5	0	0	0	0	0	0	f
1040	80	Corps_Artillery	Corps Artillery			France	1	4	1	0	0	0	0	0	3	0	0	0	0	0	2	f
1041	80	2eme_Division.59e_Ligne	59e Ligne			France	2	1	5	1800	1	0	0	0	5	0	0	0	0	0	0	f
1042	80	Corps_Artillery.1e_Heavy_Bty	1e Heavy Bty				4	4	0	0	0	0	0	0	4	0	0	0	8	1	2	f
1043	80	Corps_Artillery.2e_Heavy_Bty	2e Heavy Bty				4	1	0	0	0	0	0	0	4	0	0	0	8	1	2	f
1044	80	2eme_Division	2eme Division		Gardanne	France	1	3	1	0	0	0	0	0	3	0	0	0	0	0	2	f
1045	80	1eme_Division	1eme Division		Marchand	France	1	3	1	0	0	0	0	0	3	0	0	0	0	0	2	f
1046	80	Cav_Bde	Cav Bde		Charbanais	France	1	4	1	0	0	0	0	0	3	0	0	0	0	0	2	f
288	28	2nd_Div.3rd_special_regt_von_X	3rd special regt von X				2	1	8	1800	2	0	0	0	5	0	0	0	0	0	0	f
1047	80	2eme_Division.50e_Ligne	50e Ligne			France	2	1	5	1800	1	0	0	0	5	0	0	0	0	0	0	f
1048	80	2eme_Division.27e_Ligne	27e Ligne			France	2	1	5	1800	1	0	0	0	5	0	0	0	0	0	0	f
1049	80	1eme_Division.6e_Legere	6e Legere			France	2	4	6	1800	1	0	0	0	4	0	0	0	0	0	0	f
1050	80	2eme_Division.25e_Legere	25e Legere			France	2	4	6	1800	1	0	0	0	4	0	0	0	0	0	0	f
1051	81	Corps_Artillery	Corps Artillery			France	1	3	1	0	0	0	0	0	3	0	0	0	0	0	2	f
1052	81	1e_Cuirassier_Div	1e Cuirassier Div		Nansouty	France	1	3	1	0	0	0	0	0	3	0	0	0	0	0	2	f
1053	81	1e_Dragoon_Div	1e Dragoon Div		Klein	France	1	3	1	0	0	0	0	0	3	0	0	0	0	0	2	f
1054	81	2e_Cuirassier_Div	2e Cuirassier Div		d'Hautpoul	France	1	3	1	0	0	0	0	0	3	0	0	0	0	0	2	f
1055	81	2e_Dragoon_Div	2e Dragoon Div		Grouchy	France	1	3	1	0	0	0	0	0	3	0	0	0	0	0	2	f
1056	81	2e_Cuirassier_Div.Bde_Verdiere	Bde Verdiere			France	3	4	0	0	0	0	0	0	3	600	1	4	0	0	0	f
1057	81	3e_Dragoon_Div	3e Dragoon Div		Beaumont	France	1	3	1	0	0	0	0	0	3	0	0	0	0	0	2	f
1058	81	4e_Dragoon_Div	4e Dragoon Div		Sahut	France	1	3	1	0	0	0	0	0	3	0	0	0	0	0	2	f
1059	81	2e_Cuirassier_Div.Bde_StSulpice	Bde St.Sulpice			France	3	1	0	0	0	0	0	0	3	600	1	4	0	0	0	f
1060	81	Light_Div	Light Div		Lasalle	France	1	3	1	0	0	0	0	0	3	0	0	0	0	0	2	f
1061	81	Light_Div.Milhaud_1e_Hussar	Milhaud 1e Hussar			France	3	4	0	0	0	0	0	0	3	600	2	3	0	0	0	f
1062	81	Light_Div.Bde_Lasalle_5_7e_Hussar	Bde Lasalle 5/7e Hussar			France	3	4	0	0	0	0	0	0	3	600	2	3	0	0	0	f
1063	81	2e_Dragoon_Div.Bde_Roget	Bde Roget			France	3	4	0	0	0	0	0	0	3	900	5	5	0	0	0	f
1064	81	1e_Cuirassier_Div.Bde_Defrance	Bde Defrance			France	3	4	0	0	0	0	0	0	3	600	9	2	0	0	0	f
1065	81	2e_Dragoon_Div.Bde_Milet	Bde Milet			France	3	1	0	0	0	0	0	0	3	600	5	5	0	0	0	f
1066	81	1e_Cuirassier_Div.Bde_Housaye	Bde Housaye			France	3	1	0	0	0	0	0	0	3	1300	1	2	0	0	0	f
1067	81	1e_Dragoon_Div.Bde_Fenerolz	Bde Fenerolz			France	3	4	0	0	0	0	0	0	3	600	5	4	0	0	0	f
1068	81	4e_Dragoon_Div.Bde_Laplanche	Bde Laplanche			France	3	1	0	0	0	0	0	0	3	1200	5	5	0	0	0	f
1069	81	1e_Dragoon_Div.Bde_Picard	Bde Picard			France	3	1	0	0	0	0	0	0	3	600	5	4	0	0	0	f
1070	81	4e_Dragoon_Div.Bde_Margaron	Bde Margaron			France	3	4	0	0	0	0	0	0	3	1200	5	5	0	0	0	f
1071	81	3e_Dragoon_Div.Bde_Boye	Bde Boye			France	3	4	0	0	0	0	0	0	3	900	5	5	0	0	0	f
1072	81	3e_Dragoon_Div.Bde_Maubourg	Bde Maubourg			France	3	1	0	0	0	0	0	0	3	600	5	5	0	0	0	f
1073	81	Corps_Artillery.1e_Horse	1e Horse				4	4	0	0	0	0	0	0	4	0	0	0	8	3	2	t
1074	81	Corps_Artillery.2e_Horse	2e Horse				4	1	0	0	0	0	0	0	4	0	0	0	8	3	2	t
1075	82	2nd_Div.Horse_Bty	Horse Bty			Saxony	4	4	0	0	0	0	0	0	4	0	0	0	8	3	3	f
1076	82	2nd_Div.von_Burgsdorf	von Burgsdorf			Saxony	2	4	1	3400	1	0	1	0	4	0	0	0	1	4	3	f
1077	82	2nd_Div.von_Dyherrn	von Dyherrn			Saxony	2	4	3	4200	1	0	1	0	4	0	0	0	2	4	3	f
1078	82	1st_Div.Horse_Bty	Horse Bty			Prussia	4	4	0	0	0	0	0	0	4	0	0	0	8	3	3	f
1079	82	Reserve_Div.Prittwitz_Grenadier_Bde	Prittwitz Grenadier Bde			Prussia	2	4	1	3300	1	0	0	2	4	0	0	0	2	4	3	f
1080	82	Reserve_Div.Cerrini_Grenadier_Bde	Cerrini Grenadier Bde			Prussia	2	4	1	4200	1	0	0	2	4	0	0	0	2	4	3	f
1081	82	1st_Div.von_Schimonsky	von Schimonsky			Prussia	2	4	1	3400	1	0	1	0	4	0	0	0	2	4	3	f
1082	82	Reserve_Div.Md_Foot_Bty	Md Foot Bty			Prussia	4	4	0	0	0	0	0	0	4	0	0	0	8	3	4	f
1083	82	3rd_Div	3rd Div		Tauentzein	Prussia	1	3	1	0	0	0	0	0	3	0	0	0	0	0	2	f
1084	82	3rd_Div.Cav_Bde_Prince_Clement	Cav Bde Prince Clement			Prussia	3	4	0	0	0	0	0	0	3	700	2	4	0	0	0	f
1085	82	3rd_Div.Rosen_Fusilers	Rosen Fusilers			Prussia	2	4	9	400	1	0	0	2	5	0	0	0	0	0	0	f
1086	82	3rd_Div.von_Schoeneberg	von Schöneberg			Saxony	2	4	1	3400	1	0	1	0	5	0	0	0	2	4	4	f
1087	82	3rd_Div.von_Zweiffel	von Zweiffel			Prussia	2	4	1	3400	1	0	1	0	4	0	0	0	2	4	0	f
1088	82	1st_Div	1st Div		Grawert	Prussia	1	3	1	0	0	0	0	0	4	0	0	0	0	0	2	f
1089	82	3rd_Div.Lt_Bty	Lt Bty			Prussia	4	4	0	0	0	0	0	0	4	0	0	0	6	4	3	f
1090	82	Reserve_Div.Cav_Bde_von_Krafft	Cav Bde von Krafft			Prussia	3	4	0	0	0	0	0	0	3	900	12	3	0	0	0	f
1091	82	1st_Div.von_Mueffling	von Müffling			Prussia	2	4	1	3600	1	0	1	0	4	0	0	0	2	4	3	f
1092	82	Reserve_Div	Reserve Div		Prittwitz	Prussia	1	3	1	0	0	0	0	0	4	0	0	0	0	0	2	f
1093	82	Reserve_Div.Heavy_Bty	Heavy Bty			Prussia	4	4	0	0	0	0	0	0	4	0	0	0	8	1	3	f
1094	82	1st_Div.Heavy_Bty	Heavy Bty			Prussia	4	4	0	0	0	0	0	0	4	0	0	0	8	1	4	f
1095	82	1st_Div.Bde_Henkel	Bde Henkel			Prussia	3	4	0	0	0	0	0	0	3	900	5	3	0	0	0	f
1096	82	2nd_Div.Boguslawsky_Fusilers	Boguslawsky Fusilers			Prussia	2	4	9	800	1	0	2	0	5	0	0	0	0	0	0	f
1097	82	2nd_Div	2nd Div		Zechwitz	Prussia	1	3	1	0	0	0	0	0	4	0	0	0	0	0	2	f
1098	82	1st_Div.Erichsen_Fusilers	Erichsen Fusilers				2	4	9	700	1	0	0	1	5	0	0	0	0	0	0	f
1099	82	2nd_Div.Cav_Bde_von_Kochitsky	Cav Bde von Kochitsky			Saxony	3	4	0	0	0	0	0	0	3	200	1	3	0	0	0	f
1100	82	2nd_Div.Heavy_Bty	Heavy Bty			Saxony	4	4	0	0	0	0	0	0	4	0	0	0	8	1	3	f
1101	83	Adv_Guard_Div.Saxon_Hussar_von_Truetzschler	Saxon Hussar von Trützschler	Saxon Hussar Regiment, eight squadrons		Saxony	3	1	0	0	0	0	0	0	3	1200	2	4	0	0	0	f
1102	83	Adv_Guard_Div.Cav_Bde_von_Schimmelpfennig	Cav Bde von Schimmelpfennig	Schimmelpfennig Hussar Regiment # 6, ten squadrons		Prussia	3	4	0	0	0	0	0	0	3	1500	2	4	6	3	3	f
1103	83	Adv_Guard_Div.Bde_von_Pelet	Bde von Pelet	Rabenau # 13 Pelet # 14 Rühle # 15 Fusiliers, Masars and Valentin Jager 		Prussia	2	4	9	2400	1	0	0	2	4	0	0	0	6	3	3	f
1104	83	Adv_Guard_Div.Bde_Belvilaqua	Bde Belvilaqua	Combined Bns from IR 49,  Prinz Clemens (saxon), and Kurfurst (saxon)		Prussia/Saxony	2	4	1	5100	1	0	1	0	5	0	0	0	6	4	0	f
1105	83	Adv_Guard_Div	Adv Guard Div		Ferdinand	Prussia	1	3	1	0	0	0	0	0	3	0	0	0	0	0	2	f
1106	85	2nd_Div.von_Malschitsky_Grenadiers	von Malschitsky Grenadiers			Prussia	2	4	1	1800	1	0	0	1	4	0	0	0	2	4	1	f
1107	85	2nd_Div.Md_Foot_Bty	Md Foot Bty			Prussia	4	4	0	0	0	0	0	0	4	0	0	0	8	3	1	f
1108	85	1st_Div.Md_Foot_Bty	Md Foot Bty			Prussia	4	4	0	0	0	0	0	0	4	0	0	0	8	3	1	f
1109	85	2nd_Div.Pirch_Regt_Musketeer	Pirch Regt Musketeer			Prussia	2	1	1	1800	1	0	0	1	4	0	0	0	2	4	1	f
1110	85	2nd_Div.Arnim_Regt_Musketeer	Arnim Regt Musketeer			Prussia	2	1	1	1800	1	0	0	1	4	0	0	0	2	4	1	f
1111	85	2nd_Div.Zenge_Regt_Musketeer	Zenge Regt Musketeer			Prussia	2	1	1	1800	1	0	0	1	4	0	0	0	2	4	1	f
1112	85	2nd_Div.von_Zenge_Grenadiers	von Zenge Grenadiers			Prussia	2	1	1	1800	1	0	0	1	4	0	0	0	2	4	1	f
1113	85	1st_Div.Guard_Bde_von_Hirschfeld	Guard Bde von Hirschfeld			Prussia	2	1	1	2400	1	0	0	1	2	0	0	0	2	4	1	f
1114	85	1st_Div.Guard_Bde_von_Pletz	Guard Bde von Pletz			Prussia	2	4	1	2400	1	0	0	1	2	0	0	0	2	4	1	f
1115	85	1st_Div	1st Div		Kuhnheim	Prussia	1	3	1	0	0	0	0	0	3	0	0	0	0	0	2	f
1116	85	1st_Div.Garde_du_Corps_Cavalry	Garde du Corps Cavalry			Prussia	3	4	0	0	0	0	0	0	3	600	1	1	0	0	0	f
1117	85	1st_Div.Beeren_Cuirassier	Beeren Cuirassier			Prussia	3	4	0	0	0	0	0	0	3	400	1	2	0	0	0	f
1118	85	2nd_Div	2nd Div		von Arnim	Prussia	1	3	1	0	0	0	0	0	4	0	0	0	0	0	2	f
1119	86	3eme_Division.Md_Foot_Bty	Md Foot Bty				4	1	0	0	0	0	0	0	4	0	0	0	8	3	2	f
1120	86	2eme_Division.Md_Foot_Bty	Md Foot Bty				4	1	0	0	0	0	0	0	4	0	0	0	8	3	2	f
1121	86	Corps_Artillery.Md_Foot_Bty	Md Foot Bty				4	4	0	0	0	0	0	0	4	0	0	0	8	3	2	f
1122	86	1eme_Division.Md_Foot_Bty	Md Foot Bty				4	4	0	0	0	0	0	0	4	0	0	0	8	3	2	f
1123	86	1eme_Division.13e_Legere	13e Legere			France	2	4	6	1400	1	0	0	0	3	0	0	0	0	0	0	f
1124	86	1eme_Division	1eme Division		Morand	France	1	3	1	0	0	0	0	0	3	0	0	0	0	0	2	f
1125	86	2eme_Division.108e_Ligne	108e Ligne			France	2	1	5	1600	1	0	0	0	5	0	0	0	0	0	0	f
1126	86	1eme_Division.51e_Ligne	51e Ligne			France	2	1	5	1800	1	0	0	0	5	0	0	0	0	0	0	f
1127	86	1eme_Division.17e_Ligne	17e Ligne			France	2	4	5	1800	1	0	0	0	5	0	0	0	0	0	0	f
1128	86	1eme_Division.61e_Ligne	61e Ligne			France	2	1	5	1800	1	0	0	0	5	0	0	0	0	0	0	f
1129	86	1eme_Division.30e_Ligne	30e Ligne			France	2	1	5	1800	1	0	0	0	5	0	0	0	0	0	0	f
1130	86	2eme_Division	2eme Division		Friant	France	1	3	1	0	0	0	0	0	3	0	0	0	0	0	2	f
1131	86	2eme_Division.33e_Ligne	33e Ligne			France	2	1	5	1800	1	0	0	0	5	0	0	0	0	0	0	f
1132	86	2eme_Division.48e_Ligne	48e Ligne			France	2	1	5	1400	1	0	0	0	1	0	0	0	0	0	0	f
1133	86	2eme_Division.111e_Ligne	111e Ligne			France	2	1	5	1800	1	0	0	0	5	0	0	0	0	0	0	f
1134	86	Cav_Bde	Cav Bde		Viallanes	France	1	4	1	0	0	0	0	0	3	0	0	0	0	0	2	f
1135	86	3eme_Division	3eme Division		Gudin	France	1	1	1	0	0	0	0	0	3	0	0	0	0	0	2	f
1136	86	3eme_Division.12e_Ligne	12e Ligne			France	2	1	5	1300	1	0	0	0	5	0	0	0	0	0	0	f
1137	86	3eme_Division.21e_Ligne	21e Ligne			France	2	1	5	1800	1	0	0	0	5	0	0	0	0	0	0	f
1138	86	3eme_Division.25e_Ligne	25e Ligne			France	2	1	5	1800	1	0	0	0	5	0	0	0	0	0	0	f
1139	86	3eme_Division.85e_Ligne	85e Ligne			France	2	1	5	1600	1	0	0	0	5	0	0	0	0	0	0	f
1140	86	Cav_Bde.1e_Chasseur	1e Chasseur			France	3	4	0	0	0	0	0	0	3	600	3	3	0	0	0	f
1141	86	Cav_Bde.2e_Chasseur	2e Chasseur			France	3	1	0	0	0	0	0	0	3	600	3	3	0	0	0	f
1142	86	Corps_Artillery	Corps Artillery		Hannicque	France	1	4	1	0	0	0	0	0	3	0	0	0	0	0	2	f
1143	87	Guard_Artillery.Guard_Foot_Artillery	Guard Foot Artillery				4	1	0	0	0	0	0	0	4	0	0	0	24	3	1	f
1144	87	Infantry_Division.1e_Grenadiers	1e Grenadiers			France	2	4	5	2400	1	0	0	0	1	0	0	0	0	0	0	f
1145	87	Infantry_Division.2e_Grenadiers	2e Grenadiers			France	2	1	5	2400	1	0	0	0	1	0	0	0	0	0	0	f
1146	87	Guard_Artillery.Army_Artillery_Park	Army Artillery Park				4	4	0	0	0	0	0	0	4	0	0	0	16	1	2	f
1147	87	Cavalry_Division.Chasseurs_a_Cheval	Chasseurs a Cheval			France	3	4	0	0	0	0	0	0	3	600	3	1	0	0	0	f
1148	87	Infantry_Division.1e_Chasseurs	1e Chasseurs			France	2	1	6	2400	1	0	0	0	1	0	0	0	0	0	0	f
1149	87	Cavalry_Division.Grenadier_a_Cheval	Grenadier a Cheval			France	3	1	0	0	0	0	0	0	3	400	8	1	0	0	0	f
1150	87	Guard_Artillery	Guard Artillery		de Lamartiniére	France	1	4	1	0	0	0	0	0	2	0	0	0	0	0	2	f
1151	87	Infantry_Division.2e_Chasseurs_Copy	2e Chasseurs_Copy			France	2	1	6	2400	1	0	0	0	1	0	0	0	0	0	0	f
1152	87	Infantry_Division	Infantry Division		Lefebvre	France	1	3	1	0	0	0	0	0	3	0	0	0	0	0	2	f
1153	87	Infantry_Division.Foot_Dragoons	Foot Dragoons			France	2	1	6	2400	1	0	0	0	1	0	0	0	0	0	0	f
1154	87	Cavalry_Division	Cavalry Division		Bessieres	France	1	3	1	0	0	0	0	0	1	0	0	0	0	0	2	f
1155	87	Guard_Artillery.Guard_Horse_Bty	Guard Horse Bty				4	1	0	0	0	0	0	0	4	0	0	0	8	4	1	t
1156	88	2eme_Division.Md_Foot_Bty_Copy	Md Foot Bty_Copy				4	1	0	0	0	0	0	0	0	0	0	0	8	3	3	f
1157	88	3eme_Division.Md_Foot_Bty	Md Foot Bty				4	4	0	0	0	0	0	0	0	0	0	0	8	3	3	f
1158	88	3eme_Division.27e_Legere	27e Legere		Drouet	France	2	4	6	1500	1	0	2	0	5	0	0	0	0	4	0	f
1159	88	Artillery_Reserve.Md_Foot_Bty	Md Foot Bty				4	4	0	0	0	0	0	0	4	0	0	0	8	3	2	f
1160	88	2eme_Division.Md_Foot_Bty	Md Foot Bty				4	4	0	0	0	0	0	0	0	0	0	0	8	3	3	f
1161	88	1eme_Division.Md_Foot_Bty	Md Foot Bty				4	4	0	0	0	0	0	0	0	0	0	0	8	3	3	f
1162	88	1eme_Division.9e_Legere	9e Legere		de l'Eltang	France	2	4	6	2600	1	2	0	0	4	0	0	0	0	4	0	f
1163	88	2eme_Division.45e_Ligne	45e Ligne		Rivaud	France	2	4	5	2000	1	0	0	0	5	0	0	0	0	0	0	f
1164	88	2eme_Division.54e_Ligne	54e Ligne		Rivaud	France	2	4	5	2000	1	0	0	0	5	0	0	0	0	0	0	f
1165	88	2eme_Division	2eme Division		Rivaud	France	1	3	1	0	0	0	0	0	3	0	0	0	0	0	2	f
1166	88	1eme_Division.32e_Ligne	32e Ligne		de l'Eltang	France	2	4	5	2000	1	0	0	0	4	0	0	0	0	0	0	f
1167	88	1eme_Division	1eme Division		de l'Eltang	France	1	3	1	0	0	0	0	0	3	0	0	0	0	0	2	f
1168	88	1eme_Division.96e_Ligne	96e Ligne		de l'Eltang	France	2	4	5	2000	1	0	0	0	5	0	0	0	0	0	0	f
1169	88	2eme_Division.4e_Legere	4e Legere		Rivaud	France	2	4	6	2000	1	0	1	0	5	0	0	0	0	0	0	f
1170	88	Cav_Reserve	Cav Reserve		Tilley	France	1	3	1	0	0	0	0	0	3	0	0	0	0	0	2	f
1171	88	Cav_Reserve.2e_Hussar	2e Hussar			France	3	4	0	0	0	0	0	0	3	300	2	3	0	0	0	f
1172	88	Cav_Reserve.4e_Hussar	4e Hussar			France	3	1	0	0	0	0	0	0	3	422	2	4	0	0	0	f
1173	88	Artillery_Reserve	Artillery Reserve		Eble	France	1	3	1	0	0	0	0	0	3	0	0	0	0	0	2	f
1174	88	3eme_Division	3eme Division		Drouet	France	1	3	1	0	0	0	0	0	4	0	0	0	0	0	2	f
1175	88	3eme_Division.95e_Ligne	95e Ligne		Drouet	France	2	4	5	2600	1	0	0	0	5	0	0	0	0	0	0	f
1176	88	3eme_Division.94e_Ligne	94e Ligne		Drouet	France	2	4	5	1500	1	0	0	0	5	0	0	0	0	0	0	f
1177	89	2eme_Division.Md_Foot_Bty	Md Foot Bty				4	4	0	0	0	0	0	0	4	0	0	0	8	3	3	f
1178	89	1eme_Division.Md_Foot_Bty	Md Foot Bty				4	4	0	0	0	0	0	0	4	0	0	0	8	3	3	f
1179	89	Corps_Cav.7e_Chasseur	7e Chasseur			France	3	4	0	0	0	0	0	0	3	600	3	4	0	0	0	f
1180	89	1eme_Division.105e_Ligne	105e Ligne			France	2	1	3	1700	1	0	0	0	5	0	0	0	0	0	0	f
1181	89	Corps_Cav.20e_Chasseur	20e Chasseur			France	3	1	0	0	0	0	0	0	3	600	3	4	0	0	0	f
1182	89	1eme_Division.14e_Ligne	14e Ligne			France	2	4	5	700	1	0	0	0	4	0	0	0	0	0	0	f
1183	89	Corps_Cav	Corps Cav		Durosnel	France	1	4	1	0	0	0	0	0	3	0	0	0	0	0	2	f
1184	89	Corps_Artillery	Corps Artillery			France	1	4	1	0	0	0	0	0	3	0	0	0	0	0	2	f
1185	89	2eme_Division.63e_Ligne	63e Ligne			France	2	1	5	700	1	0	0	0	5	0	0	0	0	0	0	f
1186	89	Corps_Artillery.Heavy_Bty	Heavy Bty				4	4	0	0	0	0	0	0	4	0	0	0	8	1	2	f
1187	89	1eme_Division.16e_Legere	16e Legere			France	2	4	6	2700	1	0	0	0	4	0	0	0	0	0	0	f
1188	89	1eme_Division.44e_Ligne	44e Ligne			France	2	1	5	1700	1	0	0	0	5	0	0	0	0	0	0	f
1189	89	1eme_Division	1eme Division		Desjardin	France	1	4	1	0	0	0	0	0	3	0	0	0	0	0	2	f
1190	89	2eme_Division.24e_Ligne	24e Ligne			France	2	4	5	1800	1	0	0	0	5	0	0	0	0	0	0	f
1191	89	2eme_Division.7e_Legere	7e Legere			France	2	4	6	1800	1	0	0	0	4	0	0	0	0	0	0	f
1192	89	2eme_Division	2eme Division		Bierre	France	1	4	1	0	0	0	0	0	3	0	0	0	0	0	2	f
1193	89	2eme_Division.Hesse_Darmstadt	Hesse Darmstadt			Hesse	2	1	1	800	1	0	0	0	4	0	0	0	0	0	0	f
1194	89	2eme_Division.Allied_Nassau	Allied Nassau			Nassau	2	1	5	400	1	0	0	0	4	0	0	0	0	0	0	f
1195	90	Supply_Train	Supply Train			France	1	3	1	0	0	0	0	0	3	0	0	0	0	0	2	f
1196	90	Supply_Train.Supply_Escort_Detachment	Supply Escort Detachment				5	5	6	300	1	2	4	0	6	50	3	0	0	0	0	f
1197	91	2nd_Div.3rd_special_regt_von_X	3rd special regt von X				2	1	8	1800	2	0	0	0	5	0	0	0	0	0	0	f
1198	91	2nd_Div.1st_Regt_of_Death	1st Regt of Death	with data			2	4	3	1800	1	0	0	0	5	0	0	0	0	0	0	f
1199	91	2nd_Div.Devils_Bde_as_such	Devils Bde as such	as such six much as such		gotta break this	2	4	4	1800	3	0	0	0	5	0	0	0	0	0	0	f
1200	91	2nd_Duvussion.NZ_Brugade_from_NZ	NZ Brugade from NZ				2	4	7	1800	1	0	0	0	5	0	0	0	0	0	0	f
1201	91	2nd_Duvussion	2nd Duvussion				1	3	1	0	0	0	0	0	3	0	0	0	0	0	2	f
1202	91	7th_Div.4th_Bn	4th Bn				2	4	3	1800	1	0	0	0	5	0	0	0	0	0	0	f
1203	91	7th_Div.1st_Bn	1st Bn				2	4	3	1800	1	0	0	0	5	0	0	0	0	0	0	f
1204	91	6th_Division	6th Division				1	3	1	0	0	0	0	0	3	0	0	0	0	0	2	f
1205	91	6th_Division.2nd_Regt	2nd Regt				2	4	3	1800	1	0	0	0	5	0	0	0	0	0	0	f
1206	91	6th_Division.1st_Regt	1st Regt				2	4	3	1800	1	0	0	0	5	0	0	0	0	0	0	f
1207	91	7th_Div	7th Div				1	3	1	0	0	0	0	0	3	0	0	0	0	0	2	f
1208	91	2nd_Div.2nd_Regt	2nd Regt				2	4	3	1800	1	0	0	0	5	0	0	0	0	0	0	f
1209	91	2nd_Div.1st_Regt	1st Regt				2	4	3	1800	1	0	0	0	5	0	0	0	0	0	0	f
1210	91	2nd_Div	2nd Div				1	3	1	0	0	0	0	0	3	0	0	0	0	0	2	f
1211	91	1st_Div.3rd_special_regt	3rd special regt				2	4	3	1800	1	0	0	0	5	0	0	0	0	0	0	f
1212	91	1st_Div.2nd_Regt	2nd Regt			France	2	4	3	1800	1	0	0	0	6	0	0	0	0	0	0	f
1213	91	1st_Div.1st_Regt	1st Regt				2	4	3	1800	1	0	0	0	5	0	0	0	0	0	0	f
1214	91	1st_Div	1st Div				1	3	1	0	0	0	0	0	3	0	0	0	0	0	2	f
1281	94	Division_de_cavalerie_de_la_Garde.Mamelouks_de_la_Garde_imperiale	Mamelouks de la Garde impériale			Egypt	3	4	0	0	0	0	0	0	3	100	2	1	0	0	0	f
1276	94	Infanterie_de_la_garde.Bde_Dorsenne	Bde Dorsenne	1°/2° Rgt. de Grenadiers à pied de la Garde impériale		France	2	4	5	1600	1	0	0	0	1	0	0	0	0	0	0	f
1280	94	Division_de_cavalerie_de_la_Garde.Brigade_Dahlmann	Brigade Dahlmann	1° Rgt. de chasseurs à cheval de la Garde impériale		France	3	4	0	0	0	0	0	0	3	600	3	1	0	0	0	f
1282	94	Division_de_cavalerie_de_la_Garde.Brigade_Jacquin	Brigade Jacquin	1° Rgt. de la gendarmerie d’élite		France	3	4	0	0	0	0	0	0	3	200	8	1	0	0	0	f
1278	94	Division_de_cavalerie_de_la_Garde	Division de cavalerie de la Garde		Walther		1	3	1	0	0	0	0	0	2	0	0	0	0	0	2	f
1283	94	Artillerie	Artillerie			France	1	3	1	0	0	0	0	0	3	0	0	0	0	0	2	f
1279	94	Division_de_cavalerie_de_la_Garde.Brigade_de_Vieille_Garde_Lepic	Brigade de Vieille Garde Lepic	Grenadiers à cheval de la Garde impériale		France	3	4	0	0	0	0	0	0	3	900	8	1	0	0	0	f
1284	94	Artillerie.Horse_Bty_1.Horse_Bty_3	Horse Bty 3	1° Co. 6e d’Art. à cheval		France	4	4	0	0	0	0	0	0	4	0	0	0	8	3	2	t
1289	94	Artillerie.Horse_Bty_2	Horse Bty 2	2° Co. d’Art. à cheval		France	4	1	0	0	0	0	0	0	4	0	0	0	9	3	2	t
1288	94	Artillerie.Horse_Bty_1	Horse Bty 1	1° Co. d’Art. à cheval		France	4	4	0	0	0	0	0	0	4	0	0	0	9	3	2	t
1290	94	Artillerie.Foot_Bty_1	Foot Bty 1	2° Co. 1° d’Art. de Pied		France	4	4	0	0	0	0	0	0	4	0	0	0	8	3	2	f
1291	94	Artillerie.Foot_Bty_2	Foot Bty 2	6° Co. 1° d’Art. de Pied		France	4	1	0	0	0	0	0	0	4	0	0	0	8	3	2	f
4	1	Infantry_Division	Infantry Division		Lefebvre	France	1	3	1	0	0	0	0	0	2	0	0	0	0	0	2	f
1297	102	1st_Div.Horse_Bty	Horse Bty	Cavalry battery armed with four 6-pounder guns and two howitzers		Austria	4	4	0	0	0	0	0	0	4	0	0	0	8	3	3	t
1292	102	1st_Div	1st Div		von Loudon	Austria	1	3	1	0	0	0	0	0	3	0	0	0	0	0	2	f
1293	102	2nd_Div	2nd Div		von Hessen-Homburg	Austria	1	3	1	0	0	0	0	0	3	0	0	0	0	0	2	f
1300	102	2nd_Div.Reserve_Bde	Reserve Bde	Froon IR #54 (two additional fusilier battalions from this regiment that had not been at Haslach-Jungingen) Erzherzog Karl IR #3 (the grenadier battalion from this regiment) Auersperg IR #24 (the grenadier battalion from this regiment) Cuirassier Regt Erzherzog Franz #2 (two squadrons)		Austria	2	4	3	4000	1	0	0	0	5	300	1	2	0	0	0	f
1298	102	2nd_Div.Avantgarde	Avantgarde	Erbach IR #42 (thee fusilier battalions and one grenadier battalion) Cuirassier Regt Erzherzog Franz #2 (two squadrons)		Austria	2	4	3	3000	1	0	0	0	5	0	0	0	0	0	0	f
1295	102	1st_Div.Centre_Bde	Centre Bde	GM Genedegh Karl Riese IR #15 (four fusilier battalions, somewhat reduced from action at Haslach-Jungingen) Erzherzog Maximilien IR #35 (four fusilier battalions) Cuirassier Regt Hohenzollern #8 (two squadrons) Uhlanen-Regt Schwarzenberg #2 (one squadron of approx 150 men)		Austria	2	4	3	3600	1	0	0	0	5	400	1	3	0	0	0	f
1294	102	1st_Div.Avantgarde	Avantgarde	Erzherzog Ludwig IR #8 (three fusilier and one grenadier battalions, reduced strength from casualties at Haslach-Jungingen) Hussar Regt Blankenstein #6 (two squadrons)		Austria	2	4	3	3400	1	0	0	0	5	300	2	3	0	0	0	f
1296	102	1st_Div.Reserve_Bde	Reserve Bde	Froon IR #54 (two fusilier battalions that had suffered greatly at Haslach-Jungingen) Froon IR #54 (one grenadier battalion only lightly engaged at Haslach-Jungingen) Josef Colloredo IR #57 (one grenadier battalion) Cuirassier Regt Hohenzollern #8 (two squadrons)		Austria	2	4	3	3100	1	0	0	0	5	300	1	2	0	0	0	f
1299	102	2nd_Div.Center_Bde	Center Bde	Erzherzog Karl IR #3 (four fusilier battalions) Erzherzog Auersperg #24 (four fusilier battalions) Cuirassier Regt Erzherzog Franz #2 (one-and-a-half squadrons)		Austria	2	4	3	6000	1	0	0	0	5	200	1	2	0	0	0	f
1310	101	Cav_Bde.10e_Chasseur	10e Chasseur			France	3	4	0	0	0	0	0	0	3	140	3	4	0	0	0	f
1301	101	2eme_Division	2eme Division		Louis Henri Loison	France	1	3	1	0	0	0	0	0	3	0	0	0	0	0	2	f
1307	101	4eme_Dragoon_Division.19e_Dragoon_Regt	19e Dragoon Regt			France	3	4	0	0	0	0	0	0	3	290	5	4	0	0	0	f
1302	101	3eme_Division	3eme Division		Jean-Pierre Firmin Malher	France	1	3	1	0	0	0	0	0	3	0	0	0	0	0	2	f
1306	101	4eme_Dragoon_Division.18e_Dragoon_Regt	18e Dragoon Regt			France	3	4	0	0	0	0	0	0	3	300	5	4	0	0	0	f
1311	101	Artillery_Reserve.1e_Regt_Foot_Hv	1e Regt Foot Hv	1st Regt of Foot Artillery (two companies armed with four 12-pound)		France	4	4	0	0	0	0	0	0	4	0	0	0	4	1	3	f
1303	101	Cav_Bde	Cav Bde		Colbert-Chabanais	France	1	3	1	0	0	0	0	0	3	0	0	0	0	0	2	f
1312	101	Artillery_Reserve.1e_Regt_Foot	1e Regt Foot	1st Regt of Foot Artillery (five 8-pound, and two 4-pound cannons and one howitzer, 331 men)		France	4	4	0	0	0	0	0	0	4	0	0	0	8	3	3	f
1304	101	Artillery_Reserve	Artillery Reserve		Colonel Jean Nicolas Seroux	France	1	3	1	0	0	0	0	0	3	0	0	0	0	0	2	f
1305	101	4eme_Dragoon_Division	4eme Dragoon Division		Laplanche	France	1	3	1	0	0	0	0	0	3	0	0	0	0	0	2	f
1308	101	4eme_Dragoon_Division.25e_Dragoon_Regt	25e Dragoon Regt			France	3	4	0	0	0	0	0	0	3	240	5	4	0	0	0	f
1315	101	2eme_Division.Bde_Roguet	Bde Roguet	69th Line Infantry Regiment (two battalion, 1,698 men) 76th Line Infantry Regiment (three battalions, 1,789 men)		France	2	4	5	3400	1	0	0	0	4	0	0	0	0	0	0	f
1314	101	2eme_Division.Bde_Villatte	Bde Villatte	6th Light Infantry Regiment (two battalions, 1,728 men) 39th Line Infantry Regiment (two battalions, 1,633 men)		France	2	4	5	3400	1	0	0	0	4	0	0	0	0	0	0	f
1313	101	Artillery_Reserve.2e_Regt_Horse_Bty	2e Regt Horse Bty	2nd Regt of Horse Artillery (two sections of the 1st company armed with two 8-pound cannons and two howitzers, 65 men)		France	4	4	0	0	0	0	0	0	4	0	0	0	4	3	3	t
1309	101	Cav_Bde.3e_Hussar	3e Hussar			France	3	4	0	0	0	0	0	0	3	150	2	3	0	0	0	f
1215	12	Adv_Guard	Adv Guard	Blucher own	Blucher	Prussia	1	3	1	0	0	0	0	0	3	0	0	0	0	0	2	f
1218	12	3rd_Division	3rd Division		von Schmettau	Prussia	1	3	1	0	0	0	0	0	3	0	0	0	0	0	2	f
1217	12	2nd_Div	2nd Div		Wartensleben	Prussia	1	3	1	0	0	0	0	0	3	0	0	0	0	0	2	f
1216	12	1st_Div	1st Div		Pr Wiliam of Orange	Prussia	1	3	1	0	0	0	0	0	3	0	0	0	0	0	2	f
1219	12	Adv_Guard.Lt_Bde_Oswald	Lt Bde Oswald	Weimar Fusilier Battalion Greiffenberg Fusilier Battalion # 4 Oswald Fusilier Battalion # 14 Kloch Fusilier Battalion # 18		Prussia	2	4	9	2300	1	3	0	4	4	0	0	0	6	3	3	f
1221	12	Cav_Bde_Blucher	Cav Bde Blucher	Bluchers cav bde as part of the advance guard	Blucher	Prussia	1	3	1	0	0	0	0	0	3	0	0	0	0	0	2	f
1223	12	Cav_Bde_Blucher.Blucher_Hussar_Regt_Nr_8	Blucher Hussar Regt Nr 8			Prussia	3	4	0	0	0	0	0	0	3	1500	2	3	0	0	0	f
1224	12	Cav_Bde_Blucher.Irwing_Dragoon_Nr_3	Irwing Dragoon Nr 3			Prussia	3	4	0	0	0	0	0	0	3	600	5	4	0	0	0	f
1222	12	Cav_Bde_Blucher.Wurttemberg_Hussars_Nr_4	Württemberg Hussars Nr 4	Württemberg Hussar Regiment # 4		Prussia	3	4	0	0	0	0	0	0	3	1500	2	3	0	0	0	f
1259	93	Reserve_Cavalry	Reserve Cavalry			Prussia	1	3	1	0	0	0	0	0	3	0	0	0	0	0	2	f
1243	92	Corps_de_Bataille.1st_Bde	1st Bde	Borstell Grenadier Battalion Schenck Infantry Regiment # 9, two battalions Winning Infantry Regiment # 23, two battalions		Prussia	2	4	1	4400	1	2	2	0	4	0	0	0	0	0	0	f
1244	92	Corps_de_Bataille.2nd_Bde	2nd Bde	Hellmann Grenadier Battalion Treuenfels Infantry Regiment # 29, two battalions Strachwitz Infantry Regiment # 43, two battalions		Prussia	2	4	1	4400	1	2	2	0	4	0	0	0	0	0	0	f
1232	12	2nd_Div.Kurrassier_Bde_von_Quitzow	Kurrassier Bde von Quitzow	Quitzow Cuirassier Regiment # 6, five squadrons Reitzenstein Cuirassier Regiment # 7, five squadrons		Prussia	3	4	0	0	0	0	0	0	3	1800	1	2	0	0	0	f
1236	12	3rd_Division.Cav_Bde_von_Irwing	Cav Bde von Irwing	Königin Dragoon Regiment # 5, ten squadrons Graumann Horse Artillery Battery, six guns		Prussia	3	4	0	0	0	0	0	0	3	1500	5	4	6	4	0	f
1225	12	Cav_Bde_Blucher.Schorlemmer	Schorlemmer	Schorlemmer Horse Bty		Prussia	4	4	0	0	0	0	0	0	4	0	0	0	8	3	3	t
180	8	4e_Dragoon_Div.Bde_Laplanche	Bde Laplanche	18th Dragoon Regiment, 1st, 2nd, and 3rd squadrons 19th Dragoon Regiment, 1st, 2nd, and 3rd squadrons		France	3	1	0	0	0	0	0	0	3	1200	5	5	0	0	0	f
1229	12	1st_Div.Willmann	Willmann	Willmann Horse Bty		Prussia	4	4	0	0	0	0	0	0	4	0	0	0	6	4	2	t
1235	12	3rd_Division.Bde_von_Schimonsky	Bde von Schimonsky	Krafft Grenadier Battalion Malschitsky Infantry Regiment # 28, two battalions Schimonsky Infantry Regiment # 40, two battalions		Prussia	2	4	1	4500	1	3	0	2	4	0	0	0	6	3	3	f
1241	92	Adv_Guard.Bde_von_Wobeser	Bde von Wobeser	Ernst Fusilier Battalion # 19 One Foot Jäger company Wobeser Dragoon Regiment # 14, five squadrons Lehmann Horse Artillery Battery # 4 (-), four 4-pound guns		Prussia	2	4	9	800	1	3	0	1	4	750	5	4	4	4	2	f
1231	12	2nd_Div.Bde_von_Renouard	Bde von Renouard	Alt-Braun Grenadier Battalion Prince Louis Infantry Regiment # 20, two battalions Brunswick Infantry Regiment # 21, two battalions		Prussia	2	4	1	4500	1	2	2	0	4	0	0	0	6	3	3	f
1233	12	2nd_Div.Merkatz	Merkatz	Merkatz Horse Artillery Bty		Prussia	4	4	0	0	0	0	0	0	4	0	0	0	6	4	2	t
1240	92	Adv_Guard.Horse_Bty_Nr_12	Horse Bty Nr 12			Prussia	4	4	0	0	0	0	0	0	4	0	0	0	8	4	3	t
1228	12	1st_Div.Cav_Bde_Prinz_Wilhelm	Cav Bde Prinz Wilhelm	Leib Carabinier Regiment # 12, five squadrons Garde du Corps Cuirassier Regiment # 14, five squadrons		Prussia	3	4	0	0	0	0	0	0	3	1500	1	2	0	0	0	f
1237	92	Adv_Guard	Adv Guard	part of the OOB, but they didnt make it to the actual battle	von Winning	Prussia	1	3	1	0	0	0	0	0	3	0	0	0	0	0	2	f
1230	12	2nd_Div.Bde_von_Wedel	Bde von Wedel	Hanstein Grenadier Battalion Renouard Infantry Regiment # 3, two battalions Kleist Infantry Regiment # 5, two battalions Wilkins Foot Artillery battery, six 8-pound guns		Prussia	2	4	1	4500	1	2	2	0	4	0	0	0	6	3	3	f
1234	12	3rd_Division.Bde_von_Alvensleben	Bde von Alvensleben	Schack Grenadier Battalion Alvensleben Infantry Regiment # 33, two battalions Prince Heinrich Infantry Regiment # 35, two battalions		Prussia	2	4	1	4500	1	3	0	2	4	0	0	0	6	3	3	f
1238	92	Adv_Guard.Bde_von_Winning	Bde von Winning	Kaiserlingk Fusilier Battalion # 1 Bila Fusilier Battalion # 2 Tschammer Infantry Regiment # 27, two battalions Two Foot Jäger companies		Prussia	2	4	9	3600	1	3	0	2	4	0	0	0	8	3	3	f
1227	12	1st_Div.Bde_von_Lutzow	Bde von Lützow	Knebel Grenadier Battalion Möllendorf Infantry Regiment # 25, two battalions Wartensleben Infantry Regiment # 59, two battalions		Prussia	2	4	1	4500	1	2	2	0	4	0	0	0	6	3	3	f
1239	92	Adv_Guard.Bty_Nr_19	Bty Nr 19			Prussia	4	4	0	0	0	0	0	0	4	0	0	0	8	3	3	f
231	10	2nd_Div.Boguslawsky_Fusilers	Boguslawsky Fusilers			Prussia	2	4	9	800	1	0	2	2	5	0	0	0	0	0	0	f
1242	92	Corps_de_Bataille	Corps de Bataille		General Karl August, Grand Duke of Saxe-Weimar-Eisenach	Prussia	1	3	1	0	0	0	0	0	4	0	0	0	0	0	2	f
1226	12	1st_Div.Bde_Prinz_Henry	Bde Prinz Henry	Rheinbaben Grenadier Battalion Prince Ferdinand Infantry Regiment # 34, two battalions Puttkammer Infantry Regiment # 36, two battalions		Prussia	2	4	1	4500	1	2	2	0	4	0	0	0	6	3	3	f
1248	92	Corps_de_Bataille.Bailliodz_Cuirassier_Nr_5	Bailliodz Cuirassier Nr 5			Prussia	3	4	0	0	0	0	0	0	3	800	1	2	0	0	0	f
1247	92	Corps_de_Bataille.3rd_Bde	3rd Bde	Sobbe Fusilier Battalion # 18 Wedell Infantry Regiment # 10, two battalions Tschepe Infantry Regiment # 37, two battalions		Prussia	2	4	1	4400	1	0	0	1	4	0	0	0	0	0	0	f
1249	92	Corps_de_Bataille.Katte_Dragoon_Regt_Nr_4	Katte Dragoon Regt Nr 4			Prussia	3	4	0	0	0	0	0	0	3	800	5	4	0	0	0	f
1251	92	Corps_Artillery	Corps Artillery			Prussia	1	3	1	0	0	0	0	0	3	0	0	0	0	0	2	f
1252	92	Corps_Artillery.Kirchfeld_Nr_16.Schaefer_Nr_17	Schaefer Nr 17			Prussia	4	4	0	0	0	0	0	0	4	0	0	0	8	3	3	f
1254	92	Corps_Artillery.Kirchfeld_Nr_16	Kirchfeld Nr 16			Prussia	4	4	0	0	0	0	0	0	4	0	0	0	8	3	3	f
1253	92	Corps_Artillery.Kirchfeld_Nr_16.Schaefer_Nr_17.Kirchfeld_Nr_16.Horse_Bty_Nr_11	Horse Bty Nr 11			Prussia	4	4	0	0	0	0	0	0	4	0	0	0	4	3	3	t
1255	93	Adv_Guard	Adv Guard		General-Major Johann von Hinrichs	Prussia	1	3	1	0	0	0	0	0	3	0	0	0	0	0	2	f
1256	93	New_Division					1	3	1	0	0	0	0	0	3	0	0	0	0	0	2	f
1257	93	1st_Div	1st Div		von Natzmer	Prussia	1	3	1	0	0	0	0	0	3	0	0	0	0	0	2	f
1258	93	2nd_Div	2nd Div		von Larisch	Prussia	1	3	1	0	0	0	0	0	3	0	0	0	0	0	2	f
1265	93	1st_Div.Grenadier_Bde	Grenadier Bde	Schmeling Grenadier Battalion Crety Grenadier Battalion		Prussia	2	4	1	1800	1	0	0	0	2	0	0	0	0	0	0	f
1318	101	3eme_Division.Bde_de_Marcognet	Bde de Marcognet	25th Light Infantry Regiment (three battalions, 1,540 men) 27th Line Infantry Regiment (two battalions, 1,347 men)		France	2	4	5	2900	1	0	0	0	4	0	0	0	0	0	0	f
1271	93	Reserve_Cavalry.Dragoons	Dragoons	Hertzberg Dragoon Regiment # 9, four squadrons Katte Dragoon Regiment # 10, four squadrons		Prussia	3	4	0	0	0	0	0	0	3	1200	5	4	0	0	0	f
1260	93	Adv_Guard.Fusilier_Bde	Fusilier Bde	Borstell Fusilier Battalion # 9 Knorr Fusilier Battalion # 12 Hinrichs Fusilier Battalion # 17			2	4	9	2700	1	0	0	-3	4	0	0	0	0	0	0	f
1317	101	2eme_Division.Foot_Bty	Foot Bty	One foot company armed with three 8-pound cannons and one howitzer		France	4	4	0	0	0	0	0	0	4	0	0	0	4	3	3	f
1266	93	1st_Div.Musketeer_Bde	Musketeer Bde	Treskow Infantry Regiment # 17, two battalions Kauffberg Infantry Regiment # 51, two battalions Natzmer Infantry Regiment # 54, two battalions		Prussia	2	4	1	5400	1	0	3	0	4	0	0	0	0	0	0	f
1261	93	Adv_Guard.Dragoons	Dragoons	Hertzberg Dragoon Regiment # 9, one squadron Katte Dragoon Regiment # 10, one squadron		Prussia	3	4	0	0	0	0	0	0	3	300	5	4	0	0	0	f
1269	93	2nd_Div.2nd_Line	2nd Line	Jung-Larisch Infantry Regiment # 53, two battalions Manstein Infantry Regiment # 55, two battalions		Prussia	2	4	1	3600	1	0	2	0	4	0	0	0	0	0	0	f
1267	93	1st_Div.Foot_Bti	Foot Bti			Prussia	4	4	0	0	0	0	0	0	4	0	0	0	12	3	3	f
1262	93	Adv_Guard.Usedom_Hussar_Nr_10	Usedom Hussar Nr 10			Prussia	3	4	0	0	0	0	0	0	3	300	0	0	0	0	0	f
1270	93	2nd_Div.Foot_Bty	Foot Bty			Prussia	4	4	0	0	0	0	0	0	4	0	0	0	12	3	3	f
1268	93	2nd_Div.1st_Line	1st Line	Vieregg Grenadier Battalion Kalckreuth Infantry Regiment # 4, two battalions		Prussia	2	4	1	1800	1	0	1	0	4	0	0	0	0	0	0	f
1263	93	Adv_Guard.Horse_Bty	Horse Bty			Prussia	4	4	0	0	0	0	0	0	4	0	0	0	2	4	4	t
1319	101	3eme_Division.Bde_Delabassee	Bde Delabassée	50th Line Infantry Regiment (two battalions, 1,547 men) 59th Line Infantry Regiment (two battalions, 1,621 men)		France	2	4	5	3200	1	0	0	0	4	0	0	0	0	0	0	f
1272	93	Reserve_Cavalry.Usedom_Hussar_Nr_10	Usedom Hussar Nr 10			Prussia	3	4	0	0	0	0	0	0	3	1200	2	4	0	0	0	f
1316	101	2eme_Division.Foot_Bty.Horse_Bty	Horse Bty	One horse artillery section armed with one 4-pound cannon and one howitzer, total 89 men		France	4	4	0	0	0	0	0	0	4	0	0	0	2	4	3	t
1321	101	3eme_Division.Mxed_Foot_Bty	Mxed Foot Bty	One foot company armed with one 12-pound, four 8-pound and one 4-pound cannons, 65 men			4	4	0	0	0	0	0	0	4	0	0	0	8	3	3	f
1273	93	Reserve_Cavalry.Horse_Bty	Horse Bty			Prussia	4	4	0	0	0	0	0	0	4	0	0	0	6	4	3	t
\.


--
-- Name: force_unit_id_seq; Type: SEQUENCE SET; Schema: public; Owner: steve
--

SELECT pg_catalog.setval('force_unit_id_seq', 1321, true);


--
-- PostgreSQL database dump complete
--

