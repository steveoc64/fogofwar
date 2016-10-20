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
-- Data for Name: cmd_action; Type: TABLE DATA; Schema: public; Owner: steve
--

COPY cmd_action (id, descr, chance, rank, level, attach, cav, gun, sk, bayonet, not_engaged, engaged, repulsed, defeated) FROM stdin;
1	Move Commander	1	1	3	t	t	t	t	t	t	t	t	f
2	Cavalry Charge	3	1	4	f	t	f	f	f	t	t	f	f
3	Skirmisher Screen	1	1	4	f	f	f	f	t	t	t	t	f
4	Recall Skirmishers	2	1	4	f	f	f	t	f	t	t	f	f
5	Cavalry Dismount	2	2	4	f	t	f	f	f	t	t	f	f
6	Cavalry Remount	3	2	4	f	t	f	f	f	t	t	f	f
7	Deploy Guns	3	1	3	f	f	t	f	f	t	f	f	f
8	Relocate Guns	3	2	3	f	f	t	f	f	t	f	f	f
9	Retire Guns	3	1	3	f	f	t	f	f	t	t	t	f
10	Cold Steel!	3	1	4	f	f	f	f	t	f	t	f	f
11	Fire!	2	1	4	f	f	f	f	t	f	t	f	f
12	Fall Back	1	1	3	f	t	f	t	t	f	t	t	t
13	Sauve Qui Peut!	3	2	2	f	t	t	t	t	t	t	t	t
14	Last Stand!	4	2	3	f	f	t	f	t	f	t	t	t
15	Form Bde Square	2	2	3	f	f	t	f	t	t	t	f	f
16	Redeploy under Fire	4	2	3	f	t	t	t	t	f	t	f	f
17	Change Formation / Facing	2	1	3	f	t	f	f	t	t	f	t	f
18	Halt!	2	2	3	f	t	t	t	t	t	t	f	f
19	Rally the Troops	3	2	3	f	t	t	t	t	t	f	t	t
20	Emergency Rally!	4	2	3	f	t	t	t	t	f	t	t	t
21	Detach Unit	2	2	3	f	t	t	t	t	t	f	f	f
22	Advance to Contact	2	2	3	f	f	f	t	t	t	f	f	f
23	Advance!	1	1	4	f	f	f	t	t	f	t	f	f
24	Prepare Defence	2	2	4	f	f	t	t	t	t	f	t	f
25	Bombardment	2	1	3	f	f	t	f	f	t	f	f	f
\.


--
-- Name: cmd_action_id_seq; Type: SEQUENCE SET; Schema: public; Owner: steve
--

SELECT pg_catalog.setval('cmd_action_id_seq', 1, false);


--
-- PostgreSQL database dump complete
--

