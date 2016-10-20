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
-- Data for Name: cav_type; Type: TABLE DATA; Schema: public; Owner: steve
--

COPY cav_type (id, name, weight, battle, lances, dragoon, cossack, dubious) FROM stdin;
1	Cuirassier	3	t	f	f	f	f
2	Hussar	1	t	f	f	f	f
3	Chasseur	1	f	f	t	f	f
4	Lancers	1	t	t	f	f	f
5	Dragoons	2	f	f	t	f	f
6	Cossack	1	f	t	f	t	f
7	Landwehr	2	f	t	f	f	t
8	Heavy Dragoons	3	t	f	f	f	f
9	Carabiniers	3	t	f	f	f	f
10	Mtd Jagers	1	f	f	t	f	f
11	Irregular	1	f	f	f	t	t
12	Lt Dragoons	1	f	f	t	f	f
\.


--
-- Name: cav_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: steve
--

SELECT pg_catalog.setval('cav_type_id_seq', 1, false);


--
-- PostgreSQL database dump complete
--

