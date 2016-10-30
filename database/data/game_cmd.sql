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

COPY game_cmd (id, game_id, start_turn, start_x, start_y, red_team, blue_team, nation, name, commander_name, level, descr, rating, inspiration, condition, player_id, player_ready, vp, cull) FROM stdin;
16	2	1	-1	-1	f	t	Prussia	Supply Train	Officer of Supply von Schulze	5		5	1	4	0	f	0	f
17	2	1	-1	-1	t	f	France	IV Corps	Soult	2		3	3	3	0	f	0	f
18	2	1	-1	-1	t	f	France	V Corps	Lannes	2		2	1	3	0	f	0	f
19	2	1	-1	-1	t	f	France	VI Corps	Ney	2		2	3	2	0	f	0	f
20	2	1	-1	-1	t	f	France	Cavalry Reserve	Murat	2		3	2	3	0	f	0	f
21	2	1	-1	-1	f	t	Prussia	Army Grp South	Hohenlohe	1		4	3	2	0	f	0	f
22	2	1	-1	-1	f	t	Prussia	Advanced Guard	Ferdinand	3		4	4	4	0	f	0	f
23	2	1	-1	-1	f	t	Prussia	Army Grp North	Duke of Brunswick	2		4	3	4	0	f	0	f
24	2	1	-1	-1	f	t	Prussia	Guard Reserve	Kalkreuth	3		3	4	1	0	f	0	f
25	2	1	-1	-1	t	f	France	III Corps	Davout	2		1	3	2	0	f	0	f
26	2	1	-1	-1	t	f	France	Imperial Guard	Napoleon	2		1	1	1	0	f	0	f
27	2	1	-1	-1	t	f	France	I Corps	General Bernadotte	2		3	3	2	0	f	0	f
28	2	1	-1	-1	t	f	France	VII Corps	Augereau	2		2	2	2	0	f	0	f
29	2	1	-1	-1	t	f	France	Supply	Supply Train	4		3	3	2	0	f	0	f
30	2	1	-1	-1	t	f	France	Test		2		3	3	3	0	f	0	f
131	22	1	4	7	t	f	France	VI Corps	Marshal Michel Ney	2		2	3	3	1	f	0	f
132	22	1	5	1	f	t	Austria	Riesch Corps	FML Riesch	2		3	3	3	14	f	0	f
116	21	1	8	2	t	f	France	V Corps	Lannes	2		2	1	3	2	f	0	f
127	21	1	0	5	f	t	Prussia	South - Hohenlohe	Hohenlohe	1		4	3	2	1	f	0	f
87	15	1	-1	-1	t	f	France	VI Corps	Marshal Michel Ney	2		2	3	3	0	f	0	f
88	15	1	-1	-1	f	t	Austria	Riesch Corps	FML Riesch	2		3	3	3	0	f	0	f
113	20	1	3	4	f	t	Austria	Riesch Corps	FML Riesch	2		3	3	3	1	f	0	f
112	20	1	8	0	t	f	France	VI Corps	Marshal Michel Ney	2		2	3	3	13	f	0	f
32	4	1	1	8	f	t	Prussia	Supply Train	Officer of Supply von Schulze	5		5	1	4	1	f	0	f
40	4	1	14	8	t	f	France	I Corps	General Bernadotte	2		3	3	2	2	f	0	f
38	4	1	11	1	t	f	France	III Corps	Davout	2		1	3	2	2	f	0	f
37	4	1	4	4	f	t	Prussia	Advanced Guard	Ferdinand	3		4	4	4	12	f	0	f
44	4	1	2	6	f	t	Prussia	Brunswick - North	Duke of Brunswick	2		4	3	4	12	f	0	f
47	4	1	4	9	f	t	Prussia	Reserve - Kalkreuth	Kalkreuth	3		4	4	1	12	f	0	f
110	19	1	-1	-1	t	f	France	VI Corps	Marshal Michel Ney	2		2	3	3	0	f	0	f
111	19	1	-1	-1	f	t	Austria	Riesch Corps	FML Riesch	2		3	3	3	0	f	0	f
\.


--
-- Name: game_cmd_id_seq; Type: SEQUENCE SET; Schema: public; Owner: steve
--

SELECT pg_catalog.setval('game_cmd_id_seq', 132, true);


--
-- PostgreSQL database dump complete
--

