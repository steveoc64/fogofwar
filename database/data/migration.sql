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
-- Data for Name: migration; Type: TABLE DATA; Schema: public; Owner: steve
--

COPY migration (id, name, date) FROM stdin;
1	Add CheckList checks to the Game Table	2016-10-20 11:51:29.284986+10:30
\.


--
-- Name: migration_id_seq; Type: SEQUENCE SET; Schema: public; Owner: steve
--

SELECT pg_catalog.setval('migration_id_seq', 1, true);


--
-- PostgreSQL database dump complete
--

