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
-- Data for Name: condition; Type: TABLE DATA; Schema: public; Owner: steve
--

COPY condition (id, name, effect) FROM stdin;
1	Parade Order	2
2	Battle Ready	1
4	Tattered	-1
3	Ready	0
5	Wrecked	-3
\.


--
-- Name: condition_id_seq; Type: SEQUENCE SET; Schema: public; Owner: steve
--

SELECT pg_catalog.setval('condition_id_seq', 1, false);


--
-- PostgreSQL database dump complete
--

