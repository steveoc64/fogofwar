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
4	1	t	f	France	IV Corps	Soult	2		3	3	3
5	1	t	f	France	V Corps	Lannes	2		2	1	3
6	1	t	f	France	VI Corps	Ney	2		2	3	2
8	1	t	f	France	Cavalry Reserve	Murat	2		3	2	3
9	1	t	f	France	Supply		4		4	3	2
10	1	f	t	Prussia	Army Grp South	Hohenlohe	1		4	3	2
11	1	f	t	Prussia	Advanced Guard	Ferdinand	3		4	4	4
12	1	f	t	Prussia	Army Grp North	Duke of Brunswick	2		4	3	4
13	1	f	t	Prussia	Guard Reserve	Kalkreuth	3		3	4	1
14	1	f	t	Prussia	Supply Train		3		4	3	4
3	1	t	f	France	III Corps	Davout	2		1	3	2
1	1	t	f	France	Imperial Guard	Napoleon	2		1	1	1
2	1	t	f	France	I Corps	General Bernadotte	2		3	3	2
7	1	t	f	France	VII Corps	Augereau	2		2	2	2
16	6	t	f	redland	II Corp	2nd Commander	2		3	3	3
\.


--
-- Name: force_id_seq; Type: SEQUENCE SET; Schema: public; Owner: steve
--

SELECT pg_catalog.setval('force_id_seq', 26, true);


--
-- PostgreSQL database dump complete
--

