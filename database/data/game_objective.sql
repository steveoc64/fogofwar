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
-- Data for Name: game_objective; Type: TABLE DATA; Schema: public; Owner: steve
--

COPY game_objective (id, game_id, name, x, y, vp_per_turn, red_vp, blue_vp, current_owner) FROM stdin;
\.


--
-- Name: game_objective_id_seq; Type: SEQUENCE SET; Schema: public; Owner: steve
--

SELECT pg_catalog.setval('game_objective_id_seq', 1, false);


--
-- PostgreSQL database dump complete
--

