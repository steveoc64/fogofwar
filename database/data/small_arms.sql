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
-- Data for Name: small_arms; Type: TABLE DATA; Schema: public; Owner: steve
--

COPY small_arms (id, name, ranges, effects, covered) FROM stdin;
1	Muskets	{1,2,4,6}	{{15,20,20,30,30,40},{8,12,15,20,20,30},{4,8,8,15,15,20},{1,4,4,8,8,10}}	{{5,7,7,10,10,14},{3,5,5,7,7,10},{2,3,3,5,5,7},{1,2,2,3,3,4}}
2	Skirmishers	{1,2,4,6}	{{12,16,16,25,25,30},{6,12,15,16,16,20},{3,6,6,12,12,15},{1,3,3,6,6,8}}	{{3,4,5,8,10,18},{2,4,4,5,5,7},{1,2,2,4,4,5},{0,1,1,2,2,2}}
3	Rifles	{2,4,6,8}	{{8,12,15,20,20,24},{4,8,8,15,15,20},{2,4,4,8,8,10},{1,2,2,4,4,5}}	{{4,8,8,10,10,12},{2,4,4,8,8,10},{1,2,2,4,4,6},{0,1,1,2,2,3}}
\.


--
-- Name: small_arms_id_seq; Type: SEQUENCE SET; Schema: public; Owner: steve
--

SELECT pg_catalog.setval('small_arms_id_seq', 1, false);


--
-- PostgreSQL database dump complete
--

