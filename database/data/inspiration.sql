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
-- Data for Name: inspiration; Type: TABLE DATA; Schema: public; Owner: steve
--

COPY inspiration (id, name, effect) FROM stdin;
1	Charismatic	2
2	Dashing	1
3	Respected	0
4	Unlikable	-1
5	Detested	-2
\.


--
-- Name: inspiration_id_seq; Type: SEQUENCE SET; Schema: public; Owner: steve
--

SELECT pg_catalog.setval('inspiration_id_seq', 1, false);


--
-- PostgreSQL database dump complete
--

