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
-- Data for Name: force; Type: TABLE DATA; Schema: public; Owner: steve
--

COPY force (id, scenario_id, red_team, blue_team, nation, name, commander_name, level, descr, rating, inspiration, condition) FROM stdin;
77	16	f	t	Prussia		Officer of Supply von Schulze	5		5	1	4
78	16	t	f	France		Soult	2		3	3	3
79	16	t	f	France		Lannes	2		2	1	3
80	16	t	f	France		Ney	2		2	3	2
81	16	t	f	France		Murat	2		3	2	3
82	16	f	t	Prussia		Hohenlohe	1		4	3	2
83	16	f	t	Prussia		Ferdinand	3		4	4	4
14	1	f	t	Prussia	Supply Train	Officer of Supply von Schulze	5		5	1	4
4	1	t	f	France	IV Corps	Soult	2		3	3	3
5	1	t	f	France	V Corps	Lannes	2		2	1	3
6	1	t	f	France	VI Corps	Ney	2		2	3	2
8	1	t	f	France	Cavalry Reserve	Murat	2		3	2	3
11	1	f	t	Prussia	Advanced Guard	Ferdinand	3		4	4	4
3	1	t	f	France	III Corps	Davout	2		1	3	2
1	1	t	f	France	Imperial Guard	Napoleon	2		1	1	1
2	1	t	f	France	I Corps	General Bernadotte	2		3	3	2
7	1	t	f	France	VII Corps	Augereau	2		2	2	2
16	6	t	f	redland	II Corp	2nd Commander	2		3	3	3
84	16	f	t	Prussia		Duke of Brunswick	2		4	3	4
85	16	f	t	Prussia		Kalkreuth	3		3	4	1
86	16	t	f	France		Davout	2		1	3	2
9	1	t	f	France	Supply	Supply Train	4		3	3	2
87	16	t	f	France		Napoleon	2		1	1	1
28	1	t	f	France	Test		2		3	3	3
88	16	t	f	France		General Bernadotte	2		3	3	2
89	16	t	f	France		Augereau	2		2	2	2
90	16	t	f	France		Supply Train	4		3	3	2
91	16	t	f	France			2		3	3	3
12	1	f	t	Prussia	Brunswick - North	Duke of Brunswick	2		4	3	4
10	1	f	t	Prussia	South - Hohenlohe	Hohenlohe	1		4	3	2
92	1	f	t	Prussia	Reserve - Ruchel	Ernst von Ruchel	2		3	3	3
13	1	f	t	Prussia	Reserve - Kalkreuth	Kalkreuth	3		4	4	1
93	1	f	t	Prussia	Wurttemburg	Eugene, Duke of Wurttemburg	2		3	3	3
95	17	t	f	France	Aile gauche Lasalle	Lasalle	2		2	2	3
96	17	t	f	France	Réserve de cavalerie	Murat	2		2	2	3
97	17	t	f	France	IVe Corps	Soult	2		2	3	3
98	17	t	f	France	VIIe Corps	Augereau	2		2	3	3
99	17	t	f	France	III° Corps	Davout	2		2	3	3
100	17	t	f	France	VIe Corps	Ney	2		2	3	3
94	17	t	f	France	Garde Impériale	Bessières	2		2	3	2
101	18	t	f	France	VI Corps	Marshal Michel Ney	2		2	3	3
102	18	f	t	Austria	Riesch Corps	FML Riesch	2		3	3	3
\.


--
-- Name: force_id_seq; Type: SEQUENCE SET; Schema: public; Owner: steve
--

SELECT pg_catalog.setval('force_id_seq', 105, true);


--
-- PostgreSQL database dump complete
--

