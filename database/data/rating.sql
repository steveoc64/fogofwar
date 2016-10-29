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
-- Data for Name: rating; Type: TABLE DATA; Schema: public; Owner: steve
--

COPY rating (id, name, code, shock, form_close, form_engage, sk_close, attack_superior, attack_guns, fire_bonus, melee_bonus, ammo) FROM stdin;
1	Guard	Guard	t	t	t	t	t	t	1	2	10
2	Grenadier	Grend	t	t	t	t	t	t	1	2	9
3	Elite	Elite	f	t	t	t	t	t	1	1	8
8	Landwehr	Landw	f	f	f	f	f	f	-1	-1	5
9	Militia	Milit	f	f	f	f	f	f	0	-1	7
10	Rabble	Mob	t	f	f	f	t	f	-2	-2	2
5	Regular Line	Reglr	f	f	t	f	f	t	0	0	7
7	Conscript	Consr	f	f	f	f	f	f	-1	-1	6
6	Reserve Line	2ndLn	f	f	f	f	f	f	-1	0	6
4	Crack Line	Crack	f	f	t	t	t	t	1	1	7
\.


--
-- Name: rating_id_seq; Type: SEQUENCE SET; Schema: public; Owner: steve
--

SELECT pg_catalog.setval('rating_id_seq', 1, false);


--
-- PostgreSQL database dump complete
--

