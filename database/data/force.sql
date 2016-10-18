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

COPY force (id, scenario_id, red_team, blue_team, nation, name, cmdr_name, level, descr, rating, inspiration, condition) FROM stdin;
76	4	t	f				2		3	3	3
14	1	f	t	Prussia	Supply Train	Officer of Supply von Schulze	5		5	1	4
4	1	t	f	France	IV Corps	Soult	2		3	3	3
5	1	t	f	France	V Corps	Lannes	2		2	1	3
6	1	t	f	France	VI Corps	Ney	2		2	3	2
8	1	t	f	France	Cavalry Reserve	Murat	2		3	2	3
10	1	f	t	Prussia	Army Grp South	Hohenlohe	1		4	3	2
11	1	f	t	Prussia	Advanced Guard	Ferdinand	3		4	4	4
12	1	f	t	Prussia	Army Grp North	Duke of Brunswick	2		4	3	4
13	1	f	t	Prussia	Guard Reserve	Kalkreuth	3		3	4	1
3	1	t	f	France	III Corps	Davout	2		1	3	2
1	1	t	f	France	Imperial Guard	Napoleon	2		1	1	1
2	1	t	f	France	I Corps	General Bernadotte	2		3	3	2
7	1	t	f	France	VII Corps	Augereau	2		2	2	2
16	6	t	f	redland	II Corp	2nd Commander	2		3	3	3
9	1	t	f	France	Supply	Supply Train	4		3	3	2
28	1	t	f	France	Test		2		3	3	3
46	14	f	t	Prussia		Officer of Supply von Schulze	5		5	1	4
47	14	t	f	France		Soult	2		3	3	3
48	14	t	f	France		Lannes	2		2	1	3
49	14	t	f	France		Ney	2		2	3	2
50	14	t	f	France		Murat	2		3	2	3
51	14	f	t	Prussia		Hohenlohe	1		4	3	2
52	14	f	t	Prussia		Ferdinand	3		4	4	4
53	14	f	t	Prussia		Duke of Brunswick	2		4	3	4
54	14	f	t	Prussia		Kalkreuth	3		3	4	1
55	14	t	f	France		Davout	2		1	3	2
56	14	t	f	France		Napoleon	2		1	1	1
57	14	t	f	France		General Bernadotte	2		3	3	2
58	14	t	f	France		Augereau	2		2	2	2
59	14	t	f	France		Supply Train	4		3	3	2
60	14	t	f	France			2		3	3	3
\.


--
-- Name: force_id_seq; Type: SEQUENCE SET; Schema: public; Owner: steve
--

SELECT pg_catalog.setval('force_id_seq', 76, true);


--
-- PostgreSQL database dump complete
--

