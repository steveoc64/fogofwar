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

COPY game_cmd (id, game_id, red_team, blue_team, nation, name, commander_name, level, descr, rating, inspiration, condition, player_id, vp, cull, start_turn, start_x, start_y) FROM stdin;
16	2	f	t	Prussia	Supply Train	Officer of Supply von Schulze	5		5	1	4	0	0	f	1	-1	-1
17	2	t	f	France	IV Corps	Soult	2		3	3	3	0	0	f	1	-1	-1
18	2	t	f	France	V Corps	Lannes	2		2	1	3	0	0	f	1	-1	-1
19	2	t	f	France	VI Corps	Ney	2		2	3	2	0	0	f	1	-1	-1
20	2	t	f	France	Cavalry Reserve	Murat	2		3	2	3	0	0	f	1	-1	-1
21	2	f	t	Prussia	Army Grp South	Hohenlohe	1		4	3	2	0	0	f	1	-1	-1
22	2	f	t	Prussia	Advanced Guard	Ferdinand	3		4	4	4	0	0	f	1	-1	-1
23	2	f	t	Prussia	Army Grp North	Duke of Brunswick	2		4	3	4	0	0	f	1	-1	-1
24	2	f	t	Prussia	Guard Reserve	Kalkreuth	3		3	4	1	0	0	f	1	-1	-1
25	2	t	f	France	III Corps	Davout	2		1	3	2	0	0	f	1	-1	-1
26	2	t	f	France	Imperial Guard	Napoleon	2		1	1	1	0	0	f	1	-1	-1
27	2	t	f	France	I Corps	General Bernadotte	2		3	3	2	0	0	f	1	-1	-1
28	2	t	f	France	VII Corps	Augereau	2		2	2	2	0	0	f	1	-1	-1
29	2	t	f	France	Supply	Supply Train	4		3	3	2	0	0	f	1	-1	-1
30	2	t	f	France	Test		2		3	3	3	0	0	f	1	-1	-1
3	6	t	f	France	VI Corps	Marshal Michel Ney	2		2	3	3	1	0	f	1	-1	-1
4	6	f	t	Austria	Riesch Corps	FML Riesch	2		3	3	3	2	0	f	1	-1	-1
36	4	t	f	France	Cavalry Reserve	Murat	2		3	2	3	0	0	t	1	-1	-1
40	4	t	f	France	I Corps	General Bernadotte	2		3	3	2	0	0	t	1	-1	-1
38	4	t	f	France	III Corps	Davout	2		1	3	2	0	0	f	1	-1	-1
33	4	t	f	France	IV Corps	Soult	2		3	3	3	0	0	t	1	-1	-1
39	4	t	f	France	Imperial Guard	Napoleon	2		1	1	1	0	0	t	1	-1	-1
42	4	t	f	France	Supply	Supply Train	4		3	3	2	0	0	t	1	-1	-1
43	4	t	f	France	Test		2		3	3	3	0	0	f	1	-1	-1
34	4	t	f	France	V Corps	Lannes	2		2	1	3	1	0	f	4	-1	-1
35	4	t	f	France	VI Corps	Ney	2		2	3	2	0	0	f	1	-1	-1
41	4	t	f	France	VII Corps	Augereau	2		2	2	2	0	0	t	1	-1	-1
37	4	f	t	Prussia	Advanced Guard	Ferdinand	3		4	4	4	0	0	t	1	-1	-1
44	4	f	t	Prussia	Brunswick - North	Duke of Brunswick	2		4	3	4	0	0	f	1	-1	-1
47	4	f	t	Prussia	Reserve - Kalkreuth	Kalkreuth	3		4	4	1	0	0	f	1	-1	-1
46	4	f	t	Prussia	Reserve - Ruchel	Ernst von Ruchel	2		3	3	3	0	0	t	1	-1	-1
45	4	f	t	Prussia	South - Hohenlohe	Hohenlohe	1		4	3	2	0	0	t	1	-1	-1
32	4	f	t	Prussia	Supply Train	Officer of Supply von Schulze	5		5	1	4	0	0	f	1	-1	-1
48	4	f	t	Prussia	Wurttemburg	Eugene, Duke of Wurttemburg	2		3	3	3	0	0	t	1	-1	-1
\.


--
-- Name: game_cmd_id_seq; Type: SEQUENCE SET; Schema: public; Owner: steve
--

SELECT pg_catalog.setval('game_cmd_id_seq', 4, true);


--
-- PostgreSQL database dump complete
--

