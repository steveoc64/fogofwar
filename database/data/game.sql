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

COPY game (id, scenario_id, hosted_by, created, expires, turn, turn_limit, name, descr, notes, year, latlon, red_team, red_brief, blue_team, blue_brief, table_x, table_y, grid_size, check_table, check_objectives, check_forces, check_players, start_date, check_connected) FROM stdin;
4	1	1	2016-10-20 23:03:08.180909+10:30	2016-10-24 10:30:00+10:30	1	14	Battle of Auerstadt	Northern sector only - Brunswick vs Davout	The twin battles of Jena and Auerstedt (older name: Auerstädt) were fought on 14 October 1806 on the plateau west of the river Saale in today's Germany, between the forces of Napoleon I of France and Frederick William III of Prussia. The decisive defeat suffered by the Prussian Army subjugated the Kingdom of Prussia to the French Empire until the Sixth Coalition was formed in 1812.\n\nBoth armies were split into separate parts. The Prussian Army was in a very poor state. Brunswick was 71 years old while his field commanders were in their 60s. The Prussian army was still using tactics and training of Frederick The Great. Its greatest weakness was its staff organization. Most of the divisions were poorly organized and did not communicate well with each other. The Prussians had three forces:\n\n49,800 under Karl Wilhelm Ferdinand, Duke of Brunswick\n38,000 under Friedrich Ludwig, Fürst zu Hohenlohe-Ingelfingen\n15,000 under Ernst von Rüchel\n\nThe Grand Armée loved their Emperor and their generals. The army was very experienced and was very well led, with a good mix of older, more experienced Marshals, and younger, upcoming Marshals. Napoleon's main force at Jena consisted of about 53,000 men in total:\n\nNicolas Jean de Dieu Soult's IV Corps\nJean Lannes' V Corps\nMichel Ney's VI Corps\nPierre Augereau's VII Corps\nThe cavalry of Joachim Murat\nFurther north, in the vicinity of Auerstedt, the French forces were Jean-Baptiste Bernadotte's I Corps (20,000 strong) and Louis Nicolas Davout's III Corps (27,000)	1806	\N	France - Napoleon	Advance on a wide front with dispersed Corps.\n\nLocate the part of the Prussian Army, then converge Corps to attain local superiority.	Prussia - Frederick William III	Marche in goode order to meet the French, where upon the Army shall give battle, and put an ende to the ambitions of that so-called  "Great"  amateur soldier.	8	5	6	t	t	t	t	2016-10-24 10:30:00+10:30	f
14	1	2	2016-10-26 01:04:56.994337+10:30	2016-10-26 01:04:56.994337+10:30	1	12	Jena Auerstadt	Napoleon's drives deep into Prussia.	The twin battles of Jena and Auerstedt (older name: Auerstädt) were fought on 14 October 1806 on the plateau west of the river Saale in today's Germany, between the forces of Napoleon I of France and Frederick William III of Prussia. The decisive defeat suffered by the Prussian Army subjugated the Kingdom of Prussia to the French Empire until the Sixth Coalition was formed in 1812.\n\nBoth armies were split into separate parts. The Prussian Army was in a very poor state. Brunswick was 71 years old while his field commanders were in their 60s. The Prussian army was still using tactics and training of Frederick The Great. Its greatest weakness was its staff organization. Most of the divisions were poorly organized and did not communicate well with each other. The Prussians had three forces:\n\n49,800 under Karl Wilhelm Ferdinand, Duke of Brunswick\n38,000 under Friedrich Ludwig, Fürst zu Hohenlohe-Ingelfingen\n15,000 under Ernst von Rüchel\n\nThe Grand Armée loved their Emperor and their generals. The army was very experienced and was very well led, with a good mix of older, more experienced Marshals, and younger, upcoming Marshals. Napoleon's main force at Jena consisted of about 53,000 men in total:\n\nNicolas Jean de Dieu Soult's IV Corps\nJean Lannes' V Corps\nMichel Ney's VI Corps\nPierre Augereau's VII Corps\nThe cavalry of Joachim Murat\nFurther north, in the vicinity of Auerstedt, the French forces were Jean-Baptiste Bernadotte's I Corps (20,000 strong) and Louis Nicolas Davout's III Corps (27,000)	1806	\N	France - Napoleon	Advance on a wide front with dispersed Corps.\n\nLocate the part of the Prussian Army, then converge Corps to attain local superiority.	Prussia - Frederick William III	Marche in goode order to meet the French, where upon the Army shall give battle, and put an ende to the ambitions of that so-called  "Great"  amateur soldier.	6	4	6	f	f	f	f	2016-10-26 01:04:56.994337+10:30	f
\.


--
-- Name: game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: steve
--

SELECT pg_catalog.setval('game_id_seq', 14, true);


--
-- PostgreSQL database dump complete
--

