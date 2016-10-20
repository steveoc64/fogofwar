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
-- Data for Name: cmd_level; Type: TABLE DATA; Schema: public; Owner: steve
--

COPY cmd_level (id, name) FROM stdin;
1	Army
2	Corps
3	Division
4	Brigade
5	Battalion
6	Company
\.


--
-- Name: cmd_level_id_seq; Type: SEQUENCE SET; Schema: public; Owner: steve
--

SELECT pg_catalog.setval('cmd_level_id_seq', 1, false);


--
-- PostgreSQL database dump complete
--

