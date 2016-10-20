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
987	76	6th_Div	6th Div			Norman	1	3	1	0	0	0	0	0	3	0	0	0	0	0	2	f
247	13	1st_Div	1st Div		Kuhnheim	Prussia	1	3	1	0	0	0	0	0	3	0	0	0	0	0	2	f
226	10	1st_Div.Heavy_Bty	Heavy Bty			Prussia	4	4	0	0	0	0	0	0	4	0	0	0	8	1	4	f
250	13	1st_Div.Garde_du_Corps_Cavalry	Garde du Corps Cavalry			Prussia	3	4	0	0	0	0	0	0	3	600	1	1	0	0	0	f
225	10	1st_Div.Bde_Henkel	Bde Henkel			Prussia	3	4	0	0	0	0	0	0	3	900	5	3	0	0	0	f
231	10	2nd_Div.Boguslawsky_Fusilers	Boguslawsky Fusilers			Prussia	2	4	9	800	1	0	2	0	5	0	0	0	0	0	0	f
251	13	1st_Div.Beeren_Cuirassier	Beeren Cuirassier			Prussia	3	4	0	0	0	0	0	0	3	400	1	2	0	0	0	f
988	76	6th_Div.44th_Light_Fusilier	44th Light Fusilier			Norman	2	4	4	2200	1	3	0	1	4	0	0	0	2	4	0	f
228	10	2nd_Div	2nd Div		Zechwitz	Prussia	1	3	1	0	0	0	0	0	4	0	0	0	0	0	2	f
224	10	1st_Div.Erichsen_Fusilers	Erichsen Fusilers				2	4	9	700	1	0	0	1	5	0	0	0	0	0	0	f
253	13	2nd_Div	2nd Div		von Arnim	Prussia	1	3	1	0	0	0	0	0	4	0	0	0	0	0	2	f
989	76	6th_Div.Devil_Bde	Devil Bde	oeu			5	6	9	200	1	2	1	1	3	80	10	0	0	0	0	f
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
4	1	Infantry_Division	Infantry Division		Lefebvre	France	1	3	1	0	0	0	0	0	3	0	0	0	0	0	2	f
46	1	Infantry_Division.Foot_Dragoons	Foot Dragoons			France	2	1	6	2400	1	0	0	0	1	0	0	0	0	0	0	f
5	1	Cavalry_Division	Cavalry Division		Bessieres	France	1	3	1	0	0	0	0	0	1	0	0	0	0	0	2	f
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
180	8	4e_Dragoon_Div.Bde_Laplanche	Bde Laplanche			France	3	1	0	0	0	0	0	0	3	1200	5	5	0	0	0	f
172	8	1e_Dragoon_Div.Bde_Picard	Bde Picard			France	3	1	0	0	0	0	0	0	3	600	5	4	0	0	0	f
179	8	4e_Dragoon_Div.Bde_Margaron	Bde Margaron			France	3	4	0	0	0	0	0	0	3	1200	5	5	0	0	0	f
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
537	46	Supply_Train	Supply Train		von Schulze	Prussia	1	6	1	0	0	0	0	0	5	0	0	0	0	0	2	f
538	46	Supply_Train.Guard_Detachment	Guard Detachment				5	6	8	300	1	2	4	0	10	60	12	7	0	0	0	f
539	47	2eme_Division.Md_Foot_Bty	Md Foot Bty				4	4	0	0	0	0	0	0	4	0	0	0	8	3	3	f
540	47	1eme_Division.Md_Foot_Bty	Md Foot Bty				4	4	0	0	0	0	0	0	4	0	0	0	8	3	2	f
541	47	3eme_Division.Md_Foot_Bty	Md Foot Bty				4	4	0	0	0	0	0	0	4	0	0	0	8	3	2	f
542	47	2eme_Division	2eme Division		Leval	France	1	3	1	0	0	0	0	0	3	0	0	0	0	0	2	f
543	47	2eme_Division.28e_Ligne	28e Ligne			France	2	1	5	1400	1	0	0	0	5	0	0	0	0	0	0	f
544	47	1eme_Division.35e_Ligne	35e Ligne			France	2	4	5	1400	1	0	0	0	5	0	0	0	0	0	0	f
545	47	3eme_Division.Corsican_Legere_Copy	Corsican Legere_Copy			France/Corsica	2	1	6	1300	1	2	0	1	3	0	0	0	0	0	0	f
546	47	2eme_Division.46e_Ligne	46e Ligne			France	2	1	5	1400	1	0	0	0	5	0	0	0	0	0	0	f
547	47	1eme_Division.43e_Ligne	43e Ligne			France	2	1	5	1400	1	0	0	0	5	0	0	0	0	0	0	f
548	47	2eme_Division.24e_Legere	24e Legere			France	2	1	6	2000	1	0	0	0	4	0	0	0	0	0	0	f
549	47	2eme_Division.4e_Ligne	4e Ligne			France	2	1	5	1400	1	0	0	0	5	0	0	0	0	0	0	f
550	47	1eme_Division	1eme Division		St Hilaire	France	1	3	1	0	0	0	0	0	3	0	0	0	0	0	2	f
551	47	3eme_Division.26e_Legere	26e Legere			France	2	4	6	1600	1	0	0	0	3	0	0	0	0	0	0	f
552	47	1eme_Division.10e_Legere	10e Legere			France	2	4	6	1800	1	0	0	0	4	0	0	0	0	0	0	f
553	47	2eme_Division.57e_Ligne	57e Ligne			France	2	1	5	1700	1	0	0	0	5	0	0	0	0	0	0	f
554	47	3eme_Division.18e_Ligne	18e Ligne			France	2	4	5	1800	1	0	0	0	4	0	0	0	0	0	0	f
555	47	Corps_Cavaly.22e_Chasseur	22e Chasseur			France	3	1	0	0	0	0	0	0	3	600	3	4	0	0	0	f
556	47	1eme_Division.55e_Ligne	55e Ligne			France	2	1	5	1400	1	0	0	0	5	0	0	0	0	0	0	f
557	47	Corps_Cavaly	Corps Cavaly		Guyot	France	1	4	1	0	0	0	0	0	3	0	0	0	0	0	2	f
558	47	3eme_Division	3eme Division		LeGrand	France	1	3	1	0	0	0	0	0	3	0	0	0	0	0	2	f
559	47	3eme_Division.75e_Ligne	75e Ligne			France	2	4	5	1700	1	0	0	0	5	0	0	0	0	0	0	f
560	47	3eme_Division.Po_Legere	Po Legere			France/Italy	2	4	6	1000	1	2	2	0	3	0	0	0	0	0	0	f
561	47	Corps_Artillery.Heavy_Bty	Heavy Bty				4	4	0	0	0	0	0	0	4	0	0	0	8	1	3	f
562	47	Corps_Artillery	Corps Artillery			France	1	5	1	0	0	0	0	0	3	0	0	0	0	0	2	f
563	47	Corps_Cavaly.11e_Chasseur	11e Chasseur			France	3	4	0	0	0	0	0	0	3	600	3	4	0	0	0	f
564	48	2eme_Division.Md_Foot_Bty	Md Foot Bty				4	4	0	0	0	0	0	0	4	0	0	0	8	3	3	f
565	48	1eme_Division.Md_Foot_Bty	Md Foot Bty				4	4	0	0	0	0	0	0	4	0	0	0	8	3	3	f
566	48	Cav_Bde	Cav Bde		Trelliard	France	1	4	1	0	0	0	0	0	3	0	0	0	0	0	2	f
567	48	Cav_Bde.10e_Hussar	10e Hussar			France	3	4	0	0	0	0	0	0	3	600	2	3	0	0	0	f
568	48	Cav_Bde.9e_Hussar_Copy	9e Hussar_Copy			France	3	1	0	0	0	0	0	0	3	600	2	3	0	0	0	f
569	48	Corps_Artillery	Corps Artillery		Careil	France	1	5	1	0	0	0	0	0	3	0	0	0	0	0	2	f
570	48	Corps_Artillery.Heavy_Foot	Heavy Foot				4	4	0	0	0	0	0	0	4	0	0	0	8	1	2	f
571	48	1eme_Division	1eme Division		Suchet	France	1	3	1	0	0	0	0	0	3	0	0	0	0	0	2	f
572	48	1eme_Division.17e_Legere	17e Legere			France	2	4	6	2100	1	0	0	0	3	0	0	0	0	0	0	f
573	48	1eme_Division.34e_Ligne	34e Ligne			France	2	4	5	2500	1	0	0	0	5	0	0	0	0	0	0	f
574	48	1eme_Division.40e_Ligne	40e Ligne			France	2	4	5	1800	1	0	0	0	5	0	0	0	0	0	0	f
575	48	1eme_Division.64e_Ligne	64e Ligne			France	2	1	5	1800	1	0	0	0	5	0	0	0	0	0	0	f
576	48	1eme_Division.88e_Ligne	88e Ligne			France	2	1	5	1800	1	0	0	0	5	0	0	0	0	0	0	f
577	48	2eme_Division	2eme Division		Gazan	France	1	3	1	0	0	0	0	0	3	0	0	0	0	0	2	f
578	48	2eme_Division.21e_Legere	21e Legere			France	2	4	6	1800	1	0	0	0	5	0	1	0	0	0	0	f
579	48	2eme_Division.28e_Legere	28e Legere			France	2	4	6	900	1	0	0	0	3	0	0	0	0	0	0	f
580	48	2eme_Division.100e_Ligne	100e Ligne			France	2	4	3	1800	1	0	0	0	5	0	0	0	0	0	0	f
581	48	2eme_Division.103e_Ligne	103e Ligne			France	2	4	3	1800	1	0	0	0	5	0	0	0	0	0	0	f
582	49	Cav_Bde.9e_Hussar	9e Hussar			France	3	4	0	0	0	0	0	0	3	600	2	3	0	0	0	f
583	49	1eme_Division.39e_Ligne	39e Ligne			France	2	4	5	1800	1	0	0	0	5	0	0	0	0	0	0	f
584	49	1eme_Division.69e_Ligne	69e Ligne			France	2	1	5	1800	1	0	0	0	5	0	0	0	0	0	0	f
585	49	Cav_Bde.10e_Chasseur	10e Chasseur			France	3	4	0	0	0	0	0	0	3	600	3	4	0	0	0	f
586	49	1eme_Division.76e_Ligne	76e Ligne			France	2	1	5	1800	1	0	0	0	5	0	0	0	0	0	0	f
587	49	Corps_Artillery	Corps Artillery			France	1	4	1	0	0	0	0	0	3	0	0	0	0	0	2	f
588	49	2eme_Division.59e_Ligne	59e Ligne			France	2	1	5	1800	1	0	0	0	5	0	0	0	0	0	0	f
589	49	Corps_Artillery.1e_Heavy_Bty	1e Heavy Bty				4	4	0	0	0	0	0	0	4	0	0	0	8	1	2	f
590	49	Corps_Artillery.2e_Heavy_Bty	2e Heavy Bty				4	1	0	0	0	0	0	0	4	0	0	0	8	1	2	f
591	49	2eme_Division	2eme Division		Gardanne	France	1	3	1	0	0	0	0	0	3	0	0	0	0	0	2	f
592	49	1eme_Division	1eme Division		Marchand	France	1	3	1	0	0	0	0	0	3	0	0	0	0	0	2	f
593	49	Cav_Bde	Cav Bde		Charbanais	France	1	4	1	0	0	0	0	0	3	0	0	0	0	0	2	f
594	49	2eme_Division.50e_Ligne	50e Ligne			France	2	1	5	1800	1	0	0	0	5	0	0	0	0	0	0	f
595	49	2eme_Division.27e_Ligne	27e Ligne			France	2	1	5	1800	1	0	0	0	5	0	0	0	0	0	0	f
596	49	1eme_Division.6e_Legere	6e Legere			France	2	4	6	1800	1	0	0	0	4	0	0	0	0	0	0	f
597	49	2eme_Division.25e_Legere	25e Legere			France	2	4	6	1800	1	0	0	0	4	0	0	0	0	0	0	f
598	50	Corps_Artillery	Corps Artillery			France	1	3	1	0	0	0	0	0	3	0	0	0	0	0	2	f
599	50	1e_Cuirassier_Div	1e Cuirassier Div		Nansouty	France	1	3	1	0	0	0	0	0	3	0	0	0	0	0	2	f
600	50	1e_Dragoon_Div	1e Dragoon Div		Klein	France	1	3	1	0	0	0	0	0	3	0	0	0	0	0	2	f
601	50	2e_Cuirassier_Div	2e Cuirassier Div		d'Hautpoul	France	1	3	1	0	0	0	0	0	3	0	0	0	0	0	2	f
602	50	2e_Dragoon_Div	2e Dragoon Div		Grouchy	France	1	3	1	0	0	0	0	0	3	0	0	0	0	0	2	f
603	50	2e_Cuirassier_Div.Bde_Verdiere	Bde Verdiere			France	3	4	0	0	0	0	0	0	3	600	1	4	0	0	0	f
604	50	3e_Dragoon_Div	3e Dragoon Div		Beaumont	France	1	3	1	0	0	0	0	0	3	0	0	0	0	0	2	f
605	50	4e_Dragoon_Div	4e Dragoon Div		Sahut	France	1	3	1	0	0	0	0	0	3	0	0	0	0	0	2	f
606	50	2e_Cuirassier_Div.Bde_StSulpice	Bde St.Sulpice			France	3	1	0	0	0	0	0	0	3	600	1	4	0	0	0	f
607	50	Light_Div	Light Div		Lasalle	France	1	3	1	0	0	0	0	0	3	0	0	0	0	0	2	f
608	50	Light_Div.Milhaud_1e_Hussar	Milhaud 1e Hussar			France	3	4	0	0	0	0	0	0	3	600	2	3	0	0	0	f
609	50	Light_Div.Bde_Lasalle_5_7e_Hussar	Bde Lasalle 5/7e Hussar			France	3	4	0	0	0	0	0	0	3	600	2	3	0	0	0	f
610	50	2e_Dragoon_Div.Bde_Roget	Bde Roget			France	3	4	0	0	0	0	0	0	3	900	5	5	0	0	0	f
611	50	1e_Cuirassier_Div.Bde_Defrance	Bde Defrance			France	3	4	0	0	0	0	0	0	3	600	9	2	0	0	0	f
612	50	2e_Dragoon_Div.Bde_Milet	Bde Milet			France	3	1	0	0	0	0	0	0	3	600	5	5	0	0	0	f
613	50	1e_Cuirassier_Div.Bde_Housaye	Bde Housaye			France	3	1	0	0	0	0	0	0	3	1300	1	2	0	0	0	f
614	50	1e_Dragoon_Div.Bde_Fenerolz	Bde Fenerolz			France	3	4	0	0	0	0	0	0	3	600	5	4	0	0	0	f
615	50	4e_Dragoon_Div.Bde_Laplanche	Bde Laplanche			France	3	1	0	0	0	0	0	0	3	1200	5	5	0	0	0	f
616	50	1e_Dragoon_Div.Bde_Picard	Bde Picard			France	3	1	0	0	0	0	0	0	3	600	5	4	0	0	0	f
617	50	4e_Dragoon_Div.Bde_Margaron	Bde Margaron			France	3	4	0	0	0	0	0	0	3	1200	5	5	0	0	0	f
618	50	3e_Dragoon_Div.Bde_Boye	Bde Boye			France	3	4	0	0	0	0	0	0	3	900	5	5	0	0	0	f
619	50	3e_Dragoon_Div.Bde_Maubourg	Bde Maubourg			France	3	1	0	0	0	0	0	0	3	600	5	5	0	0	0	f
620	50	Corps_Artillery.1e_Horse	1e Horse				4	4	0	0	0	0	0	0	4	0	0	0	8	3	2	t
621	50	Corps_Artillery.2e_Horse	2e Horse				4	1	0	0	0	0	0	0	4	0	0	0	8	3	2	t
622	51	2nd_Div.Horse_Bty	Horse Bty			Saxony	4	4	0	0	0	0	0	0	4	0	0	0	8	3	3	f
623	51	2nd_Div.von_Burgsdorf	von Burgsdorf			Saxony	2	4	1	3400	1	0	1	0	4	0	0	0	1	4	3	f
624	51	2nd_Div.von_Dyherrn	von Dyherrn			Saxony	2	4	3	4200	1	0	1	0	4	0	0	0	2	4	3	f
625	51	1st_Div.Horse_Bty	Horse Bty			Prussia	4	4	0	0	0	0	0	0	4	0	0	0	8	3	3	f
626	51	Reserve_Div.Prittwitz_Grenadier_Bde	Prittwitz Grenadier Bde			Prussia	2	4	1	3300	1	0	0	2	4	0	0	0	2	4	3	f
627	51	Reserve_Div.Cerrini_Grenadier_Bde	Cerrini Grenadier Bde			Prussia	2	4	1	4200	1	0	0	2	4	0	0	0	2	4	3	f
628	51	1st_Div.von_Schimonsky	von Schimonsky			Prussia	2	4	1	3400	1	0	1	0	4	0	0	0	2	4	3	f
629	51	Reserve_Div.Md_Foot_Bty	Md Foot Bty			Prussia	4	4	0	0	0	0	0	0	4	0	0	0	8	3	4	f
630	51	3rd_Div	3rd Div		Tauentzein	Prussia	1	3	1	0	0	0	0	0	3	0	0	0	0	0	2	f
631	51	3rd_Div.Cav_Bde_Prince_Clement	Cav Bde Prince Clement			Prussia	3	4	0	0	0	0	0	0	3	700	2	4	0	0	0	f
632	51	3rd_Div.Rosen_Fusilers	Rosen Fusilers			Prussia	2	4	9	400	1	0	0	2	5	0	0	0	0	0	0	f
633	51	3rd_Div.von_Schoeneberg	von Schöneberg			Saxony	2	4	1	3400	1	0	1	0	5	0	0	0	2	4	4	f
634	51	3rd_Div.von_Zweiffel	von Zweiffel			Prussia	2	4	1	3400	1	0	1	0	4	0	0	0	2	4	0	f
635	51	1st_Div	1st Div		Grawert	Prussia	1	3	1	0	0	0	0	0	4	0	0	0	0	0	2	f
636	51	3rd_Div.Lt_Bty	Lt Bty			Prussia	4	4	0	0	0	0	0	0	4	0	0	0	6	4	3	f
637	51	Reserve_Div.Cav_Bde_von_Krafft	Cav Bde von Krafft			Prussia	3	4	0	0	0	0	0	0	3	900	12	3	0	0	0	f
638	51	1st_Div.von_Mueffling	von Müffling			Prussia	2	4	1	3600	1	0	1	0	4	0	0	0	2	4	3	f
639	51	Reserve_Div	Reserve Div		Prittwitz	Prussia	1	3	1	0	0	0	0	0	4	0	0	0	0	0	2	f
640	51	Reserve_Div.Heavy_Bty	Heavy Bty			Prussia	4	4	0	0	0	0	0	0	4	0	0	0	8	1	3	f
641	51	1st_Div.Heavy_Bty	Heavy Bty			Prussia	4	4	0	0	0	0	0	0	4	0	0	0	8	1	4	f
642	51	1st_Div.Bde_Henkel	Bde Henkel			Prussia	3	4	0	0	0	0	0	0	3	900	5	3	0	0	0	f
643	51	2nd_Div.Boguslawsky_Fusilers	Boguslawsky Fusilers			Prussia	2	4	9	800	1	0	2	0	5	0	0	0	0	0	0	f
644	51	2nd_Div	2nd Div		Zechwitz	Prussia	1	3	1	0	0	0	0	0	4	0	0	0	0	0	2	f
645	51	1st_Div.Erichsen_Fusilers	Erichsen Fusilers				2	4	9	700	1	0	0	1	5	0	0	0	0	0	0	f
646	51	2nd_Div.Cav_Bde_von_Kochitsky	Cav Bde von Kochitsky			Saxony	3	4	0	0	0	0	0	0	3	200	1	3	0	0	0	f
647	51	2nd_Div.Heavy_Bty	Heavy Bty			Saxony	4	4	0	0	0	0	0	0	4	0	0	0	8	1	3	f
648	52	Adv_Guard_Div.Saxon_Hussar_von_Truetzschler	Saxon Hussar von Trützschler	Saxon Hussar Regiment, eight squadrons		Saxony	3	1	0	0	0	0	0	0	3	1200	2	4	0	0	0	f
649	52	Adv_Guard_Div.Cav_Bde_von_Schimmelpfennig	Cav Bde von Schimmelpfennig	Schimmelpfennig Hussar Regiment # 6, ten squadrons		Prussia	3	4	0	0	0	0	0	0	3	1500	2	4	6	3	3	f
650	52	Adv_Guard_Div.Bde_von_Pelet	Bde von Pelet	Rabenau # 13 Pelet # 14 Rühle # 15 Fusiliers, Masars and Valentin Jager 		Prussia	2	4	9	2400	1	0	0	2	4	0	0	0	6	3	3	f
651	52	Adv_Guard_Div.Bde_Belvilaqua	Bde Belvilaqua	Combined Bns from IR 49,  Prinz Clemens (saxon), and Kurfurst (saxon)		Prussia/Saxony	2	4	1	5100	1	0	1	0	5	0	0	0	6	4	0	f
652	52	Adv_Guard_Div	Adv Guard Div		Ferdinand	Prussia	1	3	1	0	0	0	0	0	3	0	0	0	0	0	2	f
653	54	2nd_Div.von_Malschitsky_Grenadiers	von Malschitsky Grenadiers			Prussia	2	4	1	1800	1	0	0	1	4	0	0	0	2	4	1	f
654	54	2nd_Div.Md_Foot_Bty	Md Foot Bty			Prussia	4	4	0	0	0	0	0	0	4	0	0	0	8	3	1	f
655	54	1st_Div.Md_Foot_Bty	Md Foot Bty			Prussia	4	4	0	0	0	0	0	0	4	0	0	0	8	3	1	f
656	54	2nd_Div.Pirch_Regt_Musketeer	Pirch Regt Musketeer			Prussia	2	1	1	1800	1	0	0	1	4	0	0	0	2	4	1	f
657	54	2nd_Div.Arnim_Regt_Musketeer	Arnim Regt Musketeer			Prussia	2	1	1	1800	1	0	0	1	4	0	0	0	2	4	1	f
658	54	2nd_Div.Zenge_Regt_Musketeer	Zenge Regt Musketeer			Prussia	2	1	1	1800	1	0	0	1	4	0	0	0	2	4	1	f
659	54	2nd_Div.von_Zenge_Grenadiers	von Zenge Grenadiers			Prussia	2	1	1	1800	1	0	0	1	4	0	0	0	2	4	1	f
660	54	1st_Div.Guard_Bde_von_Hirschfeld	Guard Bde von Hirschfeld			Prussia	2	1	1	2400	1	0	0	1	2	0	0	0	2	4	1	f
661	54	1st_Div.Guard_Bde_von_Pletz	Guard Bde von Pletz			Prussia	2	4	1	2400	1	0	0	1	2	0	0	0	2	4	1	f
662	54	1st_Div	1st Div		Kuhnheim	Prussia	1	3	1	0	0	0	0	0	3	0	0	0	0	0	2	f
663	54	1st_Div.Garde_du_Corps_Cavalry	Garde du Corps Cavalry			Prussia	3	4	0	0	0	0	0	0	3	600	1	1	0	0	0	f
664	54	1st_Div.Beeren_Cuirassier	Beeren Cuirassier			Prussia	3	4	0	0	0	0	0	0	3	400	1	2	0	0	0	f
665	54	2nd_Div	2nd Div		von Arnim	Prussia	1	3	1	0	0	0	0	0	4	0	0	0	0	0	2	f
666	55	3eme_Division.Md_Foot_Bty	Md Foot Bty				4	1	0	0	0	0	0	0	4	0	0	0	8	3	2	f
667	55	2eme_Division.Md_Foot_Bty	Md Foot Bty				4	1	0	0	0	0	0	0	4	0	0	0	8	3	2	f
668	55	Corps_Artillery.Md_Foot_Bty	Md Foot Bty				4	4	0	0	0	0	0	0	4	0	0	0	8	3	2	f
669	55	1eme_Division.Md_Foot_Bty	Md Foot Bty				4	4	0	0	0	0	0	0	4	0	0	0	8	3	2	f
670	55	1eme_Division.13e_Legere	13e Legere			France	2	4	6	1400	1	0	0	0	3	0	0	0	0	0	0	f
671	55	1eme_Division	1eme Division		Morand	France	1	3	1	0	0	0	0	0	3	0	0	0	0	0	2	f
672	55	2eme_Division.108e_Ligne	108e Ligne			France	2	1	5	1600	1	0	0	0	5	0	0	0	0	0	0	f
673	55	1eme_Division.51e_Ligne	51e Ligne			France	2	1	5	1800	1	0	0	0	5	0	0	0	0	0	0	f
674	55	1eme_Division.17e_Ligne	17e Ligne			France	2	4	5	1800	1	0	0	0	5	0	0	0	0	0	0	f
675	55	1eme_Division.61e_Ligne	61e Ligne			France	2	1	5	1800	1	0	0	0	5	0	0	0	0	0	0	f
676	55	1eme_Division.30e_Ligne	30e Ligne			France	2	1	5	1800	1	0	0	0	5	0	0	0	0	0	0	f
677	55	2eme_Division	2eme Division		Friant	France	1	3	1	0	0	0	0	0	3	0	0	0	0	0	2	f
678	55	2eme_Division.33e_Ligne	33e Ligne			France	2	1	5	1800	1	0	0	0	5	0	0	0	0	0	0	f
679	55	2eme_Division.48e_Ligne	48e Ligne			France	2	1	5	1400	1	0	0	0	1	0	0	0	0	0	0	f
680	55	2eme_Division.111e_Ligne	111e Ligne			France	2	1	5	1800	1	0	0	0	5	0	0	0	0	0	0	f
681	55	Cav_Bde	Cav Bde		Viallanes	France	1	4	1	0	0	0	0	0	3	0	0	0	0	0	2	f
682	55	3eme_Division	3eme Division		Gudin	France	1	1	1	0	0	0	0	0	3	0	0	0	0	0	2	f
683	55	3eme_Division.12e_Ligne	12e Ligne			France	2	1	5	1300	1	0	0	0	5	0	0	0	0	0	0	f
684	55	3eme_Division.21e_Ligne	21e Ligne			France	2	1	5	1800	1	0	0	0	5	0	0	0	0	0	0	f
685	55	3eme_Division.25e_Ligne	25e Ligne			France	2	1	5	1800	1	0	0	0	5	0	0	0	0	0	0	f
686	55	3eme_Division.85e_Ligne	85e Ligne			France	2	1	5	1600	1	0	0	0	5	0	0	0	0	0	0	f
687	55	Cav_Bde.1e_Chasseur	1e Chasseur			France	3	4	0	0	0	0	0	0	3	600	3	3	0	0	0	f
688	55	Cav_Bde.2e_Chasseur	2e Chasseur			France	3	1	0	0	0	0	0	0	3	600	3	3	0	0	0	f
689	55	Corps_Artillery	Corps Artillery		Hannicque	France	1	4	1	0	0	0	0	0	3	0	0	0	0	0	2	f
737	58	2eme_Division.24e_Ligne	24e Ligne			France	2	4	5	1800	1	0	0	0	5	0	0	0	0	0	0	f
690	56	Guard_Artillery.Guard_Foot_Artillery	Guard Foot Artillery				4	1	0	0	0	0	0	0	4	0	0	0	24	3	1	f
691	56	Infantry_Division.1e_Grenadiers	1e Grenadiers			France	2	4	5	2400	1	0	0	0	1	0	0	0	0	0	0	f
692	56	Infantry_Division.2e_Grenadiers	2e Grenadiers			France	2	1	5	2400	1	0	0	0	1	0	0	0	0	0	0	f
693	56	Guard_Artillery.Army_Artillery_Park	Army Artillery Park				4	4	0	0	0	0	0	0	4	0	0	0	16	1	2	f
694	56	Cavalry_Division.Chasseurs_a_Cheval	Chasseurs a Cheval			France	3	4	0	0	0	0	0	0	3	600	3	1	0	0	0	f
695	56	Infantry_Division.1e_Chasseurs	1e Chasseurs			France	2	1	6	2400	1	0	0	0	1	0	0	0	0	0	0	f
696	56	Cavalry_Division.Grenadier_a_Cheval	Grenadier a Cheval			France	3	1	0	0	0	0	0	0	3	400	8	1	0	0	0	f
697	56	Guard_Artillery	Guard Artillery		de Lamartiniére	France	1	4	1	0	0	0	0	0	2	0	0	0	0	0	2	f
698	56	Infantry_Division.2e_Chasseurs_Copy	2e Chasseurs_Copy			France	2	1	6	2400	1	0	0	0	1	0	0	0	0	0	0	f
699	56	Infantry_Division	Infantry Division		Lefebvre	France	1	3	1	0	0	0	0	0	3	0	0	0	0	0	2	f
700	56	Infantry_Division.Foot_Dragoons	Foot Dragoons			France	2	1	6	2400	1	0	0	0	1	0	0	0	0	0	0	f
701	56	Cavalry_Division	Cavalry Division		Bessieres	France	1	3	1	0	0	0	0	0	1	0	0	0	0	0	2	f
702	56	Guard_Artillery.Guard_Horse_Bty	Guard Horse Bty				4	1	0	0	0	0	0	0	4	0	0	0	8	4	1	t
703	57	2eme_Division.Md_Foot_Bty_Copy	Md Foot Bty_Copy				4	1	0	0	0	0	0	0	0	0	0	0	8	3	3	f
704	57	3eme_Division.Md_Foot_Bty	Md Foot Bty				4	4	0	0	0	0	0	0	0	0	0	0	8	3	3	f
705	57	3eme_Division.27e_Legere	27e Legere		Drouet	France	2	4	6	1500	1	0	2	0	5	0	0	0	0	4	0	f
706	57	Artillery_Reserve.Md_Foot_Bty	Md Foot Bty				4	4	0	0	0	0	0	0	4	0	0	0	8	3	2	f
707	57	2eme_Division.Md_Foot_Bty	Md Foot Bty				4	4	0	0	0	0	0	0	0	0	0	0	8	3	3	f
708	57	1eme_Division.Md_Foot_Bty	Md Foot Bty				4	4	0	0	0	0	0	0	0	0	0	0	8	3	3	f
709	57	1eme_Division.9e_Legere	9e Legere		de l'Eltang	France	2	4	6	2600	1	2	0	0	4	0	0	0	0	4	0	f
710	57	2eme_Division.45e_Ligne	45e Ligne		Rivaud	France	2	4	5	2000	1	0	0	0	5	0	0	0	0	0	0	f
711	57	2eme_Division.54e_Ligne	54e Ligne		Rivaud	France	2	4	5	2000	1	0	0	0	5	0	0	0	0	0	0	f
712	57	2eme_Division	2eme Division		Rivaud	France	1	3	1	0	0	0	0	0	3	0	0	0	0	0	2	f
713	57	1eme_Division.32e_Ligne	32e Ligne		de l'Eltang	France	2	4	5	2000	1	0	0	0	4	0	0	0	0	0	0	f
714	57	1eme_Division	1eme Division		de l'Eltang	France	1	3	1	0	0	0	0	0	3	0	0	0	0	0	2	f
715	57	1eme_Division.96e_Ligne	96e Ligne		de l'Eltang	France	2	4	5	2000	1	0	0	0	5	0	0	0	0	0	0	f
716	57	2eme_Division.4e_Legere	4e Legere		Rivaud	France	2	4	6	2000	1	0	1	0	5	0	0	0	0	0	0	f
717	57	Cav_Reserve	Cav Reserve		Tilley	France	1	3	1	0	0	0	0	0	3	0	0	0	0	0	2	f
718	57	Cav_Reserve.2e_Hussar	2e Hussar			France	3	4	0	0	0	0	0	0	3	300	2	3	0	0	0	f
719	57	Cav_Reserve.4e_Hussar	4e Hussar			France	3	1	0	0	0	0	0	0	3	422	2	4	0	0	0	f
720	57	Artillery_Reserve	Artillery Reserve		Eble	France	1	3	1	0	0	0	0	0	3	0	0	0	0	0	2	f
721	57	3eme_Division	3eme Division		Drouet	France	1	3	1	0	0	0	0	0	4	0	0	0	0	0	2	f
722	57	3eme_Division.95e_Ligne	95e Ligne		Drouet	France	2	4	5	2600	1	0	0	0	5	0	0	0	0	0	0	f
723	57	3eme_Division.94e_Ligne	94e Ligne		Drouet	France	2	4	5	1500	1	0	0	0	5	0	0	0	0	0	0	f
724	58	2eme_Division.Md_Foot_Bty	Md Foot Bty				4	4	0	0	0	0	0	0	4	0	0	0	8	3	3	f
725	58	1eme_Division.Md_Foot_Bty	Md Foot Bty				4	4	0	0	0	0	0	0	4	0	0	0	8	3	3	f
726	58	Corps_Cav.7e_Chasseur	7e Chasseur			France	3	4	0	0	0	0	0	0	3	600	3	4	0	0	0	f
727	58	1eme_Division.105e_Ligne	105e Ligne			France	2	1	3	1700	1	0	0	0	5	0	0	0	0	0	0	f
728	58	Corps_Cav.20e_Chasseur	20e Chasseur			France	3	1	0	0	0	0	0	0	3	600	3	4	0	0	0	f
729	58	1eme_Division.14e_Ligne	14e Ligne			France	2	4	5	700	1	0	0	0	4	0	0	0	0	0	0	f
730	58	Corps_Cav	Corps Cav		Durosnel	France	1	4	1	0	0	0	0	0	3	0	0	0	0	0	2	f
731	58	Corps_Artillery	Corps Artillery			France	1	4	1	0	0	0	0	0	3	0	0	0	0	0	2	f
732	58	2eme_Division.63e_Ligne	63e Ligne			France	2	1	5	700	1	0	0	0	5	0	0	0	0	0	0	f
733	58	Corps_Artillery.Heavy_Bty	Heavy Bty				4	4	0	0	0	0	0	0	4	0	0	0	8	1	2	f
734	58	1eme_Division.16e_Legere	16e Legere			France	2	4	6	2700	1	0	0	0	4	0	0	0	0	0	0	f
735	58	1eme_Division.44e_Ligne	44e Ligne			France	2	1	5	1700	1	0	0	0	5	0	0	0	0	0	0	f
736	58	1eme_Division	1eme Division		Desjardin	France	1	4	1	0	0	0	0	0	3	0	0	0	0	0	2	f
738	58	2eme_Division.7e_Legere	7e Legere			France	2	4	6	1800	1	0	0	0	4	0	0	0	0	0	0	f
739	58	2eme_Division	2eme Division		Bierre	France	1	4	1	0	0	0	0	0	3	0	0	0	0	0	2	f
740	58	2eme_Division.Hesse_Darmstadt	Hesse Darmstadt			Hesse	2	1	1	800	1	0	0	0	4	0	0	0	0	0	0	f
741	58	2eme_Division.Allied_Nassau	Allied Nassau			Nassau	2	1	5	400	1	0	0	0	4	0	0	0	0	0	0	f
742	59	Supply_Train	Supply Train			France	1	3	1	0	0	0	0	0	3	0	0	0	0	0	2	f
743	59	Supply_Train.Supply_Escort_Detachment	Supply Escort Detachment				5	5	6	300	1	2	4	0	6	50	3	0	0	0	0	f
744	60	2nd_Div.3rd_special_regt_von_X	3rd special regt von X				2	1	8	1800	2	0	0	0	5	0	0	0	0	0	0	f
745	60	2nd_Div.1st_Regt_of_Death	1st Regt of Death	with data			2	4	3	1800	1	0	0	0	5	0	0	0	0	0	0	f
746	60	2nd_Div.Devils_Bde_as_such	Devils Bde as such	as such six much as such		gotta break this	2	4	4	1800	3	0	0	0	5	0	0	0	0	0	0	f
747	60	2nd_Duvussion.NZ_Brugade_from_NZ	NZ Brugade from NZ				2	4	7	1800	1	0	0	0	5	0	0	0	0	0	0	f
748	60	2nd_Duvussion	2nd Duvussion				1	3	1	0	0	0	0	0	3	0	0	0	0	0	2	f
749	60	7th_Div.4th_Bn	4th Bn				2	4	3	1800	1	0	0	0	5	0	0	0	0	0	0	f
750	60	7th_Div.1st_Bn	1st Bn				2	4	3	1800	1	0	0	0	5	0	0	0	0	0	0	f
751	60	6th_Division	6th Division				1	3	1	0	0	0	0	0	3	0	0	0	0	0	2	f
752	60	6th_Division.2nd_Regt	2nd Regt				2	4	3	1800	1	0	0	0	5	0	0	0	0	0	0	f
753	60	6th_Division.1st_Regt	1st Regt				2	4	3	1800	1	0	0	0	5	0	0	0	0	0	0	f
754	60	7th_Div	7th Div				1	3	1	0	0	0	0	0	3	0	0	0	0	0	2	f
755	60	2nd_Div.2nd_Regt	2nd Regt				2	4	3	1800	1	0	0	0	5	0	0	0	0	0	0	f
756	60	2nd_Div.1st_Regt	1st Regt				2	4	3	1800	1	0	0	0	5	0	0	0	0	0	0	f
757	60	2nd_Div	2nd Div				1	3	1	0	0	0	0	0	3	0	0	0	0	0	2	f
758	60	1st_Div.3rd_special_regt	3rd special regt				2	4	3	1800	1	0	0	0	5	0	0	0	0	0	0	f
759	60	1st_Div.2nd_Regt	2nd Regt			France	2	4	3	1800	1	0	0	0	6	0	0	0	0	0	0	f
760	60	1st_Div.1st_Regt	1st Regt				2	4	3	1800	1	0	0	0	5	0	0	0	0	0	0	f
761	60	1st_Div	1st Div				1	3	1	0	0	0	0	0	3	0	0	0	0	0	2	f
\.


--
-- Name: force_unit_id_seq; Type: SEQUENCE SET; Schema: public; Owner: steve
--

SELECT pg_catalog.setval('force_unit_id_seq', 1214, true);


--
-- PostgreSQL database dump complete
--

