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
-- Data for Name: drill; Type: TABLE DATA; Schema: public; Owner: steve
--

COPY drill (id, name, ranks, flankers, elite_coy, third_rank, open_order, line, mixed, att_col, close_col, oblique, square, mob, control, speed, wline) FROM stdin;
1	Linear	3	f	f	f	f	t	f	f	t	t	t	f	8	2	t
2	Green Conscript	3	f	f	f	f	t	f	f	t	f	f	t	4	1	t
3	Basic Training	3	f	f	t	f	t	f	t	t	f	f	f	5	2	t
4	Prussian Reformed	3	f	f	t	f	t	t	t	f	f	t	f	6	2	t
5	French Drilled	3	f	t	f	f	t	t	t	t	f	t	f	8	3	t
6	French Legere	3	f	t	f	t	t	t	t	t	f	t	f	8	3	t
7	British Drilled	2	t	f	f	f	t	t	t	f	t	t	f	9	2	t
8	Irregular Light Infantry	2	f	f	f	t	t	f	f	t	f	f	t	3	3	t
9	Drilled Light Infantry	2	f	t	f	t	t	f	f	f	t	t	f	7	4	t
\.


--
-- Name: drill_id_seq; Type: SEQUENCE SET; Schema: public; Owner: steve
--

SELECT pg_catalog.setval('drill_id_seq', 1, false);


--
-- PostgreSQL database dump complete
--

