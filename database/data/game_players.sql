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
4	1	f	t	t
4	2	t	f	t
4	12	f	t	t
20	13	t	f	t
20	1	f	t	t
21	1	f	t	t
21	2	t	f	t
22	1	t	f	t
22	14	f	t	t
19	12	t	f	t
19	1	f	t	t
25	13	t	f	f
25	1	f	t	t
26	2	t	f	f
26	12	t	f	t
26	1	f	t	f
24	1	t	f	t
24	13	f	t	t
27	12	t	f	t
27	2	t	f	t
27	1	f	t	t
\.


--
-- PostgreSQL database dump complete
--

