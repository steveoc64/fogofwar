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

COPY game_players (game_id, player_id, red_team, blue_team, accepted, connected) FROM stdin;
4	12	f	t	t	f
22	14	f	t	t	f
19	12	t	f	t	f
25	13	t	f	f	f
26	12	t	f	t	f
24	13	f	t	t	f
20	13	t	f	t	f
20	1	f	t	t	f
27	2	t	f	t	t
27	12	t	f	t	t
27	1	f	t	t	t
4	2	t	f	t	f
21	2	t	f	t	f
26	2	t	f	f	f
4	1	f	t	t	f
21	1	f	t	t	f
22	1	t	f	t	f
19	1	f	t	t	f
25	1	f	t	t	f
26	1	f	t	f	f
24	1	t	f	t	f
\.


--
-- PostgreSQL database dump complete
--

