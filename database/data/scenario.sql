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
-- Data for Name: scenario; Type: TABLE DATA; Schema: public; Owner: steve
--

COPY scenario (id, campaign_id, author_id, created, forked_from, name, descr, notes, year, public, latlon, red_team, red_brief, blue_team, blue_brief, review) FROM stdin;
4	0	2	2016-10-12 23:21:45.213973+10:30	0	Leipzig	Napoleon vs The Rest of the World as he makes yet another miraculous comeback after the disasters in Russia. change		1813	t	\N					f
5	0	2	2016-10-12 23:21:45.213973+10:30	0	Waterloo	Napoleon vs Wellington, after he makes yet another miraculous comeback after escaping from the Island of Elba.		1815	t	\N					f
1	0	1	2016-10-12 23:21:45.213973+10:30	0	Jena Auerstadt	Napoleon's drives deep into Prussia.	The twin battles of Jena and Auerstedt (older name: Auerstädt) were fought on 14 October 1806 on the plateau west of the river Saale in today's Germany, between the forces of Napoleon I of France and Frederick William III of Prussia. The decisive defeat suffered by the Prussian Army subjugated the Kingdom of Prussia to the French Empire until the Sixth Coalition was formed in 1812.\n\nBoth armies were split into separate parts. The Prussian Army was in a very poor state. Brunswick was 71 years old while his field commanders were in their 60s. The Prussian army was still using tactics and training of Frederick The Great. Its greatest weakness was its staff organization. Most of the divisions were poorly organized and did not communicate well with each other. The Prussians had three forces:\n\n49,800 under Karl Wilhelm Ferdinand, Duke of Brunswick\n38,000 under Friedrich Ludwig, Fürst zu Hohenlohe-Ingelfingen\n15,000 under Ernst von Rüchel\n\nThe Grand Armée loved their Emperor and their generals. The army was very experienced and was very well led, with a good mix of older, more experienced Marshals, and younger, upcoming Marshals. Napoleon's main force at Jena consisted of about 53,000 men in total:\n\nNicolas Jean de Dieu Soult's IV Corps\nJean Lannes' V Corps\nMichel Ney's VI Corps\nPierre Augereau's VII Corps\nThe cavalry of Joachim Murat\nFurther north, in the vicinity of Auerstedt, the French forces were Jean-Baptiste Bernadotte's I Corps (20,000 strong) and Louis Nicolas Davout's III Corps (27,000)	1806	t	\N	France - Napoleon	Advance on a wide front with dispersed Corps.\n\nLocate the part of the Prussian Army, then converge Corps to attain local superiority.	Prussia - Frederick William III	Marche in goode order to meet the French, where upon the Army shall give battle, and put an ende to the ambitions of that so-called  "Great"  amateur soldier.	f
\.


--
-- Name: scenario_id_seq; Type: SEQUENCE SET; Schema: public; Owner: steve
--

SELECT pg_catalog.setval('scenario_id_seq', 12, true);


--
-- PostgreSQL database dump complete
--

