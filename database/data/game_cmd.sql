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
-- Data for Name: game_cmd; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY game_cmd (id, game_id, red_team, blue_team, nation, name, cmdr_name, level, descr, rating, inspiration, condition) FROM stdin;
1	1	f	t	Prussia	Supply Train	Officer of Supply von Schulze	5		5	1	4
2	1	t	f	France	IV Corps	Soult	2		3	3	3
3	1	t	f	France	V Corps	Lannes	2		2	1	3
4	1	t	f	France	VI Corps	Ney	2		2	3	2
5	1	t	f	France	Cavalry Reserve	Murat	2		3	2	3
6	1	f	t	Prussia	Army Grp South	Hohenlohe	1		4	3	2
7	1	f	t	Prussia	Advanced Guard	Ferdinand	3		4	4	4
8	1	f	t	Prussia	Army Grp North	Duke of Brunswick	2		4	3	4
9	1	f	t	Prussia	Guard Reserve	Kalkreuth	3		3	4	1
10	1	t	f	France	III Corps	Davout	2		1	3	2
11	1	t	f	France	Imperial Guard	Napoleon	2		1	1	1
12	1	t	f	France	I Corps	General Bernadotte	2		3	3	2
13	1	t	f	France	VII Corps	Augereau	2		2	2	2
14	1	t	f	France	Supply	Supply Train	4		3	3	2
15	1	t	f	France	Test		2		3	3	3
16	5	f	t	Prussia	Supply Train	Officer of Supply von Schulze	5		5	1	4
17	5	t	f	France	IV Corps	Soult	2		3	3	3
18	5	t	f	France	V Corps	Lannes	2		2	1	3
19	5	t	f	France	VI Corps	Ney	2		2	3	2
20	5	t	f	France	Cavalry Reserve	Murat	2		3	2	3
21	5	f	t	Prussia	Army Grp South	Hohenlohe	1		4	3	2
22	5	f	t	Prussia	Advanced Guard	Ferdinand	3		4	4	4
23	5	f	t	Prussia	Army Grp North	Duke of Brunswick	2		4	3	4
24	5	f	t	Prussia	Guard Reserve	Kalkreuth	3		3	4	1
25	5	t	f	France	III Corps	Davout	2		1	3	2
26	5	t	f	France	Imperial Guard	Napoleon	2		1	1	1
27	5	t	f	France	I Corps	General Bernadotte	2		3	3	2
28	5	t	f	France	VII Corps	Augereau	2		2	2	2
29	5	t	f	France	Supply	Supply Train	4		3	3	2
30	5	t	f	France	Test		2		3	3	3
31	7	f	t	Prussia		Officer of Supply von Schulze	5		5	1	4
32	7	t	f	France		Soult	2		3	3	3
33	7	t	f	France		Lannes	2		2	1	3
34	7	t	f	France		Ney	2		2	3	2
35	7	t	f	France		Murat	2		3	2	3
36	7	f	t	Prussia		Hohenlohe	1		4	3	2
37	7	f	t	Prussia		Ferdinand	3		4	4	4
38	7	f	t	Prussia		Duke of Brunswick	2		4	3	4
39	7	f	t	Prussia		Kalkreuth	3		3	4	1
40	7	t	f	France		Davout	2		1	3	2
41	7	t	f	France		Napoleon	2		1	1	1
42	7	t	f	France		General Bernadotte	2		3	3	2
43	7	t	f	France		Augereau	2		2	2	2
44	7	t	f	France		Supply Train	4		3	3	2
45	7	t	f	France			2		3	3	3
46	8	f	t	Prussia	Supply Train	Officer of Supply von Schulze	5		5	1	4
47	8	t	f	France	IV Corps	Soult	2		3	3	3
48	8	t	f	France	V Corps	Lannes	2		2	1	3
49	8	t	f	France	VI Corps	Ney	2		2	3	2
50	8	t	f	France	Cavalry Reserve	Murat	2		3	2	3
51	8	f	t	Prussia	Army Grp South	Hohenlohe	1		4	3	2
52	8	f	t	Prussia	Advanced Guard	Ferdinand	3		4	4	4
53	8	f	t	Prussia	Army Grp North	Duke of Brunswick	2		4	3	4
54	8	f	t	Prussia	Guard Reserve	Kalkreuth	3		3	4	1
55	8	t	f	France	III Corps	Davout	2		1	3	2
56	8	t	f	France	Imperial Guard	Napoleon	2		1	1	1
57	8	t	f	France	I Corps	General Bernadotte	2		3	3	2
58	8	t	f	France	VII Corps	Augereau	2		2	2	2
59	8	t	f	France	Supply	Supply Train	4		3	3	2
60	8	t	f	France	Test		2		3	3	3
\.


--
-- Name: game_cmd_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('game_cmd_id_seq', 60, true);


--
-- PostgreSQL database dump complete
--

