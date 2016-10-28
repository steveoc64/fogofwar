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
-- Data for Name: game_players; Type: TABLE DATA; Schema: public; Owner: steve
--

COPY game_players (game_id, player_id, red_team, blue_team, accepted) FROM stdin;
4	1	\N	t	t
4	2	t	\N	t
\.


--
-- PostgreSQL database dump complete
--

