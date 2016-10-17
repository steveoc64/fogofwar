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
-- Data for Name: game; Type: TABLE DATA; Schema: public; Owner: steve
--

COPY game (id, scenario_id, hosted_by, created, expires, turn, turn_limit, name, descr, notes, year, latlon, red_team, red_brief, blue_team, blue_brief) FROM stdin;
\.


--
-- Name: game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: steve
--

SELECT pg_catalog.setval('game_id_seq', 1, false);


--
-- PostgreSQL database dump complete
--

