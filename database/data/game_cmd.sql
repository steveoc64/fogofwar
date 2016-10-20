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
-- Data for Name: game_cmd; Type: TABLE DATA; Schema: public; Owner: steve
--

COPY game_cmd (id, game_id, red_team, blue_team, nation, name, commander_name, level, descr, rating, inspiration, condition, player_id, vp) FROM stdin;
\.


--
-- Name: game_cmd_id_seq; Type: SEQUENCE SET; Schema: public; Owner: steve
--

SELECT pg_catalog.setval('game_cmd_id_seq', 1, false);


--
-- PostgreSQL database dump complete
--

