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
-- Data for Name: utype; Type: TABLE DATA; Schema: public; Owner: steve
--

COPY utype (id, name) FROM stdin;
1	Command
2	Infantry Brigade
3	Cavalry Brigade
4	Artillery Battery
5	Other Detachment
\.


--
-- Name: utype_id_seq; Type: SEQUENCE SET; Schema: public; Owner: steve
--

SELECT pg_catalog.setval('utype_id_seq', 1, false);


--
-- PostgreSQL database dump complete
--

