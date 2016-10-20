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
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: steve
--

COPY orders (id, name, min_rank, objective, enemy_unit, friendly_unit) FROM stdin;
\.


--
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: steve
--

SELECT pg_catalog.setval('orders_id_seq', 1, false);


--
-- PostgreSQL database dump complete
--

