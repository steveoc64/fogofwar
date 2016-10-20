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
-- Data for Name: cmd_rating; Type: TABLE DATA; Schema: public; Owner: steve
--

COPY cmd_rating (id, name, effect) FROM stdin;
1	Magnificent	2
2	Highly Efficient	1
3	Competent	0
4	Doddering Fool	-1
5	Blithering Idiot	-2
\.


--
-- Name: cmd_rating_id_seq; Type: SEQUENCE SET; Schema: public; Owner: steve
--

SELECT pg_catalog.setval('cmd_rating_id_seq', 1, false);


--
-- PostgreSQL database dump complete
--

