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

COPY game_objective (game_id, name, x, y, vp_per_turn, red_vp, blue_vp, current_owner) FROM stdin;
4	Hassenhausen	10	2	2	23	17	0
4	Poppel	3	6	0	14	14	0
4	Rehausen	9	9	1	24	18	0
6	The Abbey	6	3	1	20	20	0
6	The Bridge	5	6	1	20	20	0
6	Gottingen	4	0	1	20	20	0
\.


--
-- PostgreSQL database dump complete
--

