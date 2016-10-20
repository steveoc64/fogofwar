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
-- Data for Name: game_cmd; Type: TABLE DATA; Schema: public; Owner: steve
--

COPY game_cmd (id, game_id, red_team, blue_team, nation, name, commander_name, level, descr, rating, inspiration, condition, player_id, disabled) FROM stdin;
1	1	f	t	Prussia		Officer of Supply von Schulze	5		5	1	4	\N	f
2	1	t	f	France		Soult	2		3	3	3	\N	f
3	1	t	f	France		Lannes	2		2	1	3	\N	f
4	1	t	f	France		Ney	2		2	3	2	\N	f
5	1	t	f	France		Murat	2		3	2	3	\N	f
6	1	f	t	Prussia		Hohenlohe	1		4	3	2	\N	f
7	1	f	t	Prussia		Ferdinand	3		4	4	4	\N	f
8	1	f	t	Prussia		Duke of Brunswick	2		4	3	4	\N	f
9	1	f	t	Prussia		Kalkreuth	3		3	4	1	\N	f
10	1	t	f	France		Davout	2		1	3	2	\N	f
11	1	t	f	France		Napoleon	2		1	1	1	\N	f
12	1	t	f	France		General Bernadotte	2		3	3	2	\N	f
13	1	t	f	France		Augereau	2		2	2	2	\N	f
14	1	t	f	France		Supply Train	4		3	3	2	\N	f
15	1	t	f	France			2		3	3	3	\N	f
16	2	f	t	Prussia	Supply Train	Officer of Supply von Schulze	5		5	1	4	\N	f
17	2	t	f	France	IV Corps	Soult	2		3	3	3	\N	f
18	2	t	f	France	V Corps	Lannes	2		2	1	3	\N	f
19	2	t	f	France	VI Corps	Ney	2		2	3	2	\N	f
20	2	t	f	France	Cavalry Reserve	Murat	2		3	2	3	\N	f
21	2	f	t	Prussia	Army Grp South	Hohenlohe	1		4	3	2	\N	f
22	2	f	t	Prussia	Advanced Guard	Ferdinand	3		4	4	4	\N	f
23	2	f	t	Prussia	Army Grp North	Duke of Brunswick	2		4	3	4	\N	f
24	2	f	t	Prussia	Guard Reserve	Kalkreuth	3		3	4	1	\N	f
25	2	t	f	France	III Corps	Davout	2		1	3	2	\N	f
26	2	t	f	France	Imperial Guard	Napoleon	2		1	1	1	\N	f
27	2	t	f	France	I Corps	General Bernadotte	2		3	3	2	\N	f
28	2	t	f	France	VII Corps	Augereau	2		2	2	2	\N	f
29	2	t	f	France	Supply	Supply Train	4		3	3	2	\N	f
30	2	t	f	France	Test		2		3	3	3	\N	f
31	3	t	f				2		3	3	3	\N	f
\.


--
-- Name: game_cmd_id_seq; Type: SEQUENCE SET; Schema: public; Owner: steve
--

SELECT pg_catalog.setval('game_cmd_id_seq', 31, true);


--
-- PostgreSQL database dump complete
--

