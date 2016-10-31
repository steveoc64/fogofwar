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
-- Data for Name: unit; Type: TABLE DATA; Schema: public; Owner: steve
--

COPY unit (id, cmd_id, game_id, path, name, descr, commander_name, commander_control, nation, utype, condition, cmd_level, drill, deploy_to, gt_formation, sk_out, woods, rough, cover, rflank, lflank, has_support, bayonets, bayonets_lost, bayonets_mstate, bayonets_moved, bayonets_fired, small_arms, elite_arms, lt_coy, jg_coy, rifles, lt_lost, lt_mstate, rating, sabres, sabres_lost, sabres_mstate, sabres_charged, cav_type, cav_rating, guns, guns_lost, guns_fired, guns_moved, guns_limbered, guns_mstate, gunnery_type, horse_guns, gun_max_condition, gun_condition) FROM stdin;
2542	110	19	2eme_Division	2eme Division		Louis Henri Loison	10	France	1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
2543	110	19	3eme_Division	3eme Division		Jean-Pierre Firmin Malher	10	France	1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
2544	110	19	Artillery_Reserve.1e_Regt_Foot_Hv	1e Regt Foot Hv	1st Regt of Foot Artillery (two companies armed with four 12-pound)		10	France	4	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	4	0	f	f	f	0	1	f	2	3
2627	116	21	Cav_Bde	Cav Bde		Trelliard	10	France	1	2	4	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
2592	113	20	2nd_Div.Center_Bde	Center Bde	Erzherzog Karl IR #3 (four fusilier battalions) Erzherzog Auersperg #24 (four fusilier battalions) Cuirassier Regt Erzherzog Franz #2 (one-and-a-half squadrons)		10	Austria	2	2	4	3	1	1	f	f	f	f	f	f	f	6000	0	0	f	f	1	0	0	0	f	0	0	5	200	0	0	0	1	2	0	0	f	f	f	0	0	f	2	0
2899	132	22	2nd_Div.Reserve_Bde	Reserve Bde	Froon IR #54 (two additional fusilier battalions from this regiment that had not been at Haslach-Jungingen) Erzherzog Karl IR #3 (the grenadier battalion from this regiment) Auersperg IR #24 (the grenadier battalion from this regiment) Cuirassier Regt Erzherzog Franz #2 (two squadrons)		10	Austria	2	2	4	3	1	1	f	f	f	f	f	f	f	4000	0	0	f	f	1	0	0	0	f	0	0	5	300	0	0	0	1	2	0	0	f	f	f	0	0	f	2	0
2599	113	20	1st_Div	1st Div		von Loudon	10	Austria	1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
2598	113	20	2nd_Div	2nd Div		von Hessen-Homburg	10	Austria	1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
2597	113	20	1st_Div.Avantgarde	Avantgarde	Erzherzog Ludwig IR #8 (three fusilier and one grenadier battalions, reduced strength from casualties at Haslach-Jungingen) Hussar Regt Blankenstein #6 (two squadrons)		10	Austria	2	4	4	3	1	1	f	f	f	f	f	f	f	3400	0	0	f	f	1	0	0	0	f	0	0	5	300	0	0	0	2	3	0	0	f	f	f	0	0	f	2	0
2545	110	19	Cav_Bde	Cav Bde		Colbert-Chabanais	10	France	1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
2546	110	19	4eme_Dragoon_Division.25e_Dragoon_Regt	25e Dragoon Regt			10	France	3	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	240	0	0	0	5	4	0	0	f	f	f	0	0	f	2	0
2596	113	20	1st_Div.Centre_Bde	Centre Bde	GM Genedegh Karl Riese IR #15 (four fusilier battalions, somewhat reduced from action at Haslach-Jungingen) Erzherzog Maximilien IR #35 (four fusilier battalions) Cuirassier Regt Hohenzollern #8 (two squadrons) Uhlanen-Regt Schwarzenberg #2 (one squadron of approx 150 men)		10	Austria	2	4	4	3	1	1	f	f	f	f	f	f	f	3600	0	0	f	f	1	0	0	0	f	0	0	5	400	0	0	0	1	3	0	0	f	f	f	0	0	f	2	0
2595	113	20	1st_Div.Reserve_Bde	Reserve Bde	Froon IR #54 (two fusilier battalions that had suffered greatly at Haslach-Jungingen) Froon IR #54 (one grenadier battalion only lightly engaged at Haslach-Jungingen) Josef Colloredo IR #57 (one grenadier battalion) Cuirassier Regt Hohenzollern #8 (two squadrons)		10	Austria	2	4	4	3	1	1	f	f	f	f	f	f	f	3100	0	0	f	f	1	0	0	0	f	0	0	5	300	0	0	0	1	2	0	0	f	f	f	0	0	f	2	0
2594	113	20	1st_Div.Horse_Bty	Horse Bty	Cavalry battery armed with four 6-pounder guns and two howitzers		10	Austria	4	4	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	8	0	f	f	f	0	3	t	2	3
2593	113	20	2nd_Div.Avantgarde	Avantgarde	Erbach IR #42 (thee fusilier battalions and one grenadier battalion) Cuirassier Regt Erzherzog Franz #2 (two squadrons)		10	Austria	2	2	4	3	1	1	f	f	f	f	f	f	f	3000	0	0	f	f	1	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
2907	132	22	1st_Div	1st Div		von Loudon	10	Austria	1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
2906	132	22	2nd_Div	2nd Div		von Hessen-Homburg	10	Austria	1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
2905	132	22	1st_Div.Avantgarde	Avantgarde	Erzherzog Ludwig IR #8 (three fusilier and one grenadier battalions, reduced strength from casualties at Haslach-Jungingen) Hussar Regt Blankenstein #6 (two squadrons)		10	Austria	2	2	4	3	1	1	f	f	f	f	f	f	f	3400	0	0	f	f	1	0	0	0	f	0	0	5	300	0	0	0	2	3	0	0	f	f	f	0	0	f	2	0
2641	116	21	2eme_Division.103e_Ligne	103e Ligne			10	France	2	2	4	3	1	1	f	f	f	f	f	f	f	1800	0	0	f	f	1	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
2642	116	21	2eme_Division.21e_Legere	21e Legere			10	France	2	2	4	6	1	1	f	f	f	f	f	f	f	1800	0	0	f	f	1	0	0	0	f	0	0	5	0	0	0	0	1	0	0	0	f	f	f	0	0	f	2	0
2639	116	21	2eme_Division.28e_Legere	28e Legere			10	France	2	2	4	6	1	1	f	f	f	f	f	f	f	900	0	0	f	f	1	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
2644	116	21	2eme_Division.Md_Foot_Bty	Md Foot Bty			10		4	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	8	0	f	f	f	0	3	f	2	3
2547	110	19	Artillery_Reserve	Artillery Reserve		Colonel Jean Nicolas Seroux	10	France	1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
2585	112	20	2eme_Division.Bde_Roguet	Bde Roguet	69th Line Infantry Regiment (two battalion, 1,698 men) 76th Line Infantry Regiment (three battalions, 1,789 men)		10	France	2	4	4	5	1	1	f	f	f	f	f	f	f	3400	0	0	f	f	1	0	0	0	f	0	0	4	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
2548	110	19	4eme_Dragoon_Division	4eme Dragoon Division		Laplanche	10	France	1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
2893	131	22	2eme_Division.Bde_Roguet	Bde Roguet	69th Line Infantry Regiment (two battalion, 1,698 men) 76th Line Infantry Regiment (three battalions, 1,789 men)		10	France	2	2	4	5	1	1	f	f	f	f	f	f	f	3400	0	0	f	f	1	0	0	0	f	0	0	4	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
2549	110	19	Artillery_Reserve.2e_Regt_Horse_Bty	2e Regt Horse Bty	2nd Regt of Horse Artillery (two sections of the 1st company armed with two 8-pound cannons and two howitzers, 65 men)		10	France	4	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	4	0	f	f	f	0	3	t	2	3
2550	110	19	4eme_Dragoon_Division.18e_Dragoon_Regt	18e Dragoon Regt			10	France	3	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	300	0	0	0	5	4	0	0	f	f	f	0	0	f	2	0
2551	110	19	Cav_Bde.3e_Hussar	3e Hussar			10	France	3	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	150	0	0	0	2	3	0	0	f	f	f	0	0	f	2	0
2879	131	22	2eme_Division	2eme Division		Louis Henri Loison	10	France	1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
2552	110	19	Artillery_Reserve.1e_Regt_Foot	1e Regt Foot	1st Regt of Foot Artillery (five 8-pound, and two 4-pound cannons and one howitzer, 331 men)		10	France	4	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	8	0	f	f	f	0	3	f	2	3
2904	132	22	1st_Div.Centre_Bde	Centre Bde	GM Genedegh Karl Riese IR #15 (four fusilier battalions, somewhat reduced from action at Haslach-Jungingen) Erzherzog Maximilien IR #35 (four fusilier battalions) Cuirassier Regt Hohenzollern #8 (two squadrons) Uhlanen-Regt Schwarzenberg #2 (one squadron of approx 150 men)		10	Austria	2	2	4	3	1	1	f	f	f	f	f	f	f	3600	0	0	f	f	1	0	0	0	f	0	0	5	400	0	0	0	1	3	0	0	f	f	f	0	0	f	2	0
2553	110	19	4eme_Dragoon_Division.19e_Dragoon_Regt	19e Dragoon Regt			10	France	3	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	290	0	0	0	5	4	0	0	f	f	f	0	0	f	2	0
2554	110	19	Cav_Bde.10e_Chasseur	10e Chasseur			10	France	3	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	140	0	0	0	3	4	0	0	f	f	f	0	0	f	2	0
2555	110	19	2eme_Division.Bde_Villatte	Bde Villatte	6th Light Infantry Regiment (two battalions, 1,728 men) 39th Line Infantry Regiment (two battalions, 1,633 men)		10	France	2	2	4	5	1	1	f	f	f	f	f	f	f	3400	0	0	f	f	1	0	0	0	f	0	0	4	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
2556	110	19	2eme_Division.Bde_Roguet	Bde Roguet	69th Line Infantry Regiment (two battalion, 1,698 men) 76th Line Infantry Regiment (three battalions, 1,789 men)		10	France	2	2	4	5	1	1	f	f	f	f	f	f	f	3400	0	0	f	f	1	0	0	0	f	0	0	4	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
2557	110	19	2eme_Division.Foot_Bty	Foot Bty	One foot company armed with three 8-pound cannons and one howitzer		10	France	4	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	4	0	f	f	f	0	3	f	2	3
2903	132	22	1st_Div.Reserve_Bde	Reserve Bde	Froon IR #54 (two fusilier battalions that had suffered greatly at Haslach-Jungingen) Froon IR #54 (one grenadier battalion only lightly engaged at Haslach-Jungingen) Josef Colloredo IR #57 (one grenadier battalion) Cuirassier Regt Hohenzollern #8 (two squadrons)		10	Austria	2	2	4	3	1	1	f	f	f	f	f	f	f	3100	0	0	f	f	1	0	0	0	f	0	0	5	300	0	0	0	1	2	0	0	f	f	f	0	0	f	2	0
2902	132	22	1st_Div.Horse_Bty	Horse Bty	Cavalry battery armed with four 6-pounder guns and two howitzers		10	Austria	4	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	8	0	f	f	f	0	3	t	2	3
2558	110	19	2eme_Division.Foot_Bty.Horse_Bty	Horse Bty	One horse artillery section armed with one 4-pound cannon and one howitzer, total 89 men		10	France	4	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	2	0	f	f	f	0	4	t	2	3
2901	132	22	2nd_Div.Avantgarde	Avantgarde	Erbach IR #42 (thee fusilier battalions and one grenadier battalion) Cuirassier Regt Erzherzog Franz #2 (two squadrons)		10	Austria	2	2	4	3	1	1	f	f	f	f	f	f	f	3000	0	0	f	f	1	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
2900	132	22	2nd_Div.Center_Bde	Center Bde	Erzherzog Karl IR #3 (four fusilier battalions) Erzherzog Auersperg #24 (four fusilier battalions) Cuirassier Regt Erzherzog Franz #2 (one-and-a-half squadrons)		10	Austria	2	2	4	3	1	1	f	f	f	f	f	f	f	6000	0	0	f	f	1	0	0	0	f	0	0	5	200	0	0	0	1	2	0	0	f	f	f	0	0	f	2	0
2559	110	19	3eme_Division.Bde_Delabassee	Bde Delabassée	50th Line Infantry Regiment (two battalions, 1,547 men) 59th Line Infantry Regiment (two battalions, 1,621 men)		10	France	2	2	4	5	1	1	f	f	f	f	f	f	f	3200	0	0	f	f	1	0	0	0	f	0	0	4	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
2898	131	22	3eme_Division.Bde_de_Marcognet	Bde de Marcognet	25th Light Infantry Regiment (three battalions, 1,540 men) 27th Line Infantry Regiment (two battalions, 1,347 men)		10	France	2	2	4	5	1	1	f	f	f	f	f	f	f	2900	0	0	f	f	1	0	0	0	f	0	0	4	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
2591	113	20	2nd_Div.Reserve_Bde	Reserve Bde	Froon IR #54 (two additional fusilier battalions from this regiment that had not been at Haslach-Jungingen) Erzherzog Karl IR #3 (the grenadier battalion from this regiment) Auersperg IR #24 (the grenadier battalion from this regiment) Cuirassier Regt Erzherzog Franz #2 (two squadrons)		10	Austria	2	2	4	3	1	1	f	f	f	f	f	f	f	4000	0	0	f	f	1	0	0	0	f	0	0	5	300	0	0	0	1	2	0	0	f	f	f	0	0	f	2	0
2560	110	19	3eme_Division.Mxed_Foot_Bty	Mxed Foot Bty	One foot company armed with one 12-pound, four 8-pound and one 4-pound cannons, 65 men		10		4	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	8	0	f	f	f	0	3	f	2	3
2590	112	20	3eme_Division.Bde_de_Marcognet	Bde de Marcognet	25th Light Infantry Regiment (three battalions, 1,540 men) 27th Line Infantry Regiment (two battalions, 1,347 men)		10	France	2	2	4	5	1	1	f	f	f	f	f	f	f	2900	0	0	f	f	1	0	0	0	f	0	0	4	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
2589	112	20	3eme_Division.Mxed_Foot_Bty	Mxed Foot Bty	One foot company armed with one 12-pound, four 8-pound and one 4-pound cannons, 65 men		10		4	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	8	0	f	f	f	0	3	f	2	3
2588	112	20	3eme_Division.Bde_Delabassee	Bde Delabassée	50th Line Infantry Regiment (two battalions, 1,547 men) 59th Line Infantry Regiment (two battalions, 1,621 men)		10	France	2	2	4	5	1	1	f	f	f	f	f	f	f	3200	0	0	f	f	1	0	0	0	f	0	0	4	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
2587	112	20	2eme_Division.Foot_Bty.Horse_Bty	Horse Bty	One horse artillery section armed with one 4-pound cannon and one howitzer, total 89 men		10	France	4	4	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	2	0	f	f	f	0	4	t	2	3
2586	112	20	2eme_Division.Foot_Bty	Foot Bty	One foot company armed with three 8-pound cannons and one howitzer		10	France	4	4	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	4	0	f	f	f	0	3	f	2	3
2584	112	20	2eme_Division.Bde_Villatte	Bde Villatte	6th Light Infantry Regiment (two battalions, 1,728 men) 39th Line Infantry Regiment (two battalions, 1,633 men)		10	France	2	4	4	5	1	1	f	f	f	f	f	f	f	3400	0	0	f	f	1	0	0	0	f	0	0	4	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
2583	112	20	Cav_Bde.10e_Chasseur	10e Chasseur			10	France	3	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	140	0	0	0	3	4	0	0	f	f	f	0	0	f	2	0
2582	112	20	4eme_Dragoon_Division.19e_Dragoon_Regt	19e Dragoon Regt			10	France	3	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	290	0	0	0	5	4	0	0	f	f	f	0	0	f	2	0
2581	112	20	Artillery_Reserve.1e_Regt_Foot	1e Regt Foot	1st Regt of Foot Artillery (five 8-pound, and two 4-pound cannons and one howitzer, 331 men)		10	France	4	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	8	0	f	f	f	0	3	f	2	3
2580	112	20	Cav_Bde.3e_Hussar	3e Hussar			10	France	3	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	150	0	0	0	2	3	0	0	f	f	f	0	0	f	2	0
2561	110	19	3eme_Division.Bde_de_Marcognet	Bde de Marcognet	25th Light Infantry Regiment (three battalions, 1,540 men) 27th Line Infantry Regiment (two battalions, 1,347 men)		10	France	2	2	4	5	1	1	f	f	f	f	f	f	f	2900	0	0	f	f	1	0	0	0	f	0	0	4	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
2579	112	20	4eme_Dragoon_Division.18e_Dragoon_Regt	18e Dragoon Regt			10	France	3	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	300	0	0	0	5	4	0	0	f	f	f	0	0	f	2	0
2578	112	20	Artillery_Reserve.2e_Regt_Horse_Bty	2e Regt Horse Bty	2nd Regt of Horse Artillery (two sections of the 1st company armed with two 8-pound cannons and two howitzers, 65 men)		10	France	4	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	4	0	f	f	f	0	3	t	2	3
2577	112	20	4eme_Dragoon_Division	4eme Dragoon Division		Laplanche	10	France	1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
2576	112	20	Artillery_Reserve	Artillery Reserve		Colonel Jean Nicolas Seroux	10	France	1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
2575	112	20	4eme_Dragoon_Division.25e_Dragoon_Regt	25e Dragoon Regt			10	France	3	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	240	0	0	0	5	4	0	0	f	f	f	0	0	f	2	0
2574	112	20	Cav_Bde	Cav Bde		Colbert-Chabanais	10	France	1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
2573	112	20	Artillery_Reserve.1e_Regt_Foot_Hv	1e Regt Foot Hv	1st Regt of Foot Artillery (two companies armed with four 12-pound)		10	France	4	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	4	0	f	f	f	0	1	f	2	3
2572	112	20	3eme_Division	3eme Division		Jean-Pierre Firmin Malher	10	France	1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
2571	112	20	2eme_Division	2eme Division		Louis Henri Loison	10	France	1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
2897	131	22	3eme_Division.Mxed_Foot_Bty	Mxed Foot Bty	One foot company armed with one 12-pound, four 8-pound and one 4-pound cannons, 65 men		10		4	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	8	0	f	f	f	0	3	f	2	3
2896	131	22	3eme_Division.Bde_Delabassee	Bde Delabassée	50th Line Infantry Regiment (two battalions, 1,547 men) 59th Line Infantry Regiment (two battalions, 1,621 men)		10	France	2	2	4	5	1	1	f	f	f	f	f	f	f	3200	0	0	f	f	1	0	0	0	f	0	0	4	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
2895	131	22	2eme_Division.Foot_Bty.Horse_Bty	Horse Bty	One horse artillery section armed with one 4-pound cannon and one howitzer, total 89 men		10	France	4	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	2	0	f	f	f	0	4	t	2	3
1674	38	4	1eme_Division.51e_Ligne	51e Ligne			10	France	2	3	1	5	1	1	f	f	f	f	f	f	f	1746	0	0	f	f	1	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1673	38	4	2eme_Division.108e_Ligne	108e Ligne			10	France	2	3	1	5	1	1	f	f	f	f	f	f	f	1504	0	0	f	f	1	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1680	38	4	2eme_Division.111e_Ligne	111e Ligne			10	France	2	3	1	5	1	1	f	f	f	f	f	f	f	1728	0	0	f	f	1	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1672	38	4	1eme_Division	1eme Division		Morand	10	France	1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
1675	38	4	1eme_Division.17e_Ligne	17e Ligne			10	France	2	3	4	5	1	1	f	f	f	f	f	f	f	1782	0	0	f	f	1	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1676	38	4	1eme_Division.61e_Ligne	61e Ligne			10	France	2	3	1	5	1	1	f	f	f	f	f	f	f	1710	0	0	f	f	1	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1678	38	4	2eme_Division	2eme Division		Friant	10	France	1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
1679	38	4	2eme_Division.33e_Ligne	33e Ligne			10	France	2	3	1	5	1	1	f	f	f	f	f	f	f	1692	0	0	f	f	1	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1682	38	4	3eme_Division	3eme Division		Gudin	10	France	1	2	1	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
1686	38	4	3eme_Division.85e_Ligne	85e Ligne			10	France	2	3	1	5	1	1	f	f	f	f	f	f	f	1584	0	0	f	f	1	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1681	38	4	Cav_Bde	Cav Bde		Viallanes	10	France	1	2	4	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
1690	38	4	2eme_Division.48e_Ligne	48e Ligne			10	France	2	3	1	5	1	1	f	f	f	f	f	f	f	1316	0	0	f	f	1	0	0	0	f	0	0	1	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
2562	111	19	2nd_Div.Reserve_Bde	Reserve Bde	Froon IR #54 (two additional fusilier battalions from this regiment that had not been at Haslach-Jungingen) Erzherzog Karl IR #3 (the grenadier battalion from this regiment) Auersperg IR #24 (the grenadier battalion from this regiment) Cuirassier Regt Erzherzog Franz #2 (two squadrons)		10	Austria	2	2	4	3	1	1	f	f	f	f	f	f	f	4000	0	0	f	f	1	0	0	0	f	0	0	5	300	0	0	0	1	2	0	0	f	f	f	0	0	f	2	0
1693	38	4	2eme_Division.Md_Foot_Bty	Md Foot Bty			10		4	3	1	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	7	0	f	f	f	0	3	f	2	2
1694	38	4	3eme_Division.Md_Foot_Bty	Md Foot Bty			10		4	3	1	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	7	0	f	f	f	0	3	f	2	2
2563	111	19	2nd_Div.Center_Bde	Center Bde	Erzherzog Karl IR #3 (four fusilier battalions) Erzherzog Auersperg #24 (four fusilier battalions) Cuirassier Regt Erzherzog Franz #2 (one-and-a-half squadrons)		10	Austria	2	2	4	3	1	1	f	f	f	f	f	f	f	6000	0	0	f	f	1	0	0	0	f	0	0	5	200	0	0	0	1	2	0	0	f	f	f	0	0	f	2	0
1689	38	4	Corps_Artillery	Corps Artillery		Hannicque	10	France	1	2	4	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
1692	38	4	Corps_Artillery.Md_Foot_Bty	Md Foot Bty			10		4	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	8	0	f	f	f	0	3	f	2	2
1718	40	4	1eme_Division.96e_Ligne	96e Ligne		de l'Eltang	10	France	2	2	4	5	1	1	f	f	f	f	f	f	f	2000	0	0	f	f	1	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1721	40	4	2eme_Division	2eme Division		Rivaud	10	France	1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
1715	40	4	2eme_Division.45e_Ligne	45e Ligne		Rivaud	10	France	2	2	4	5	1	1	f	f	f	f	f	f	f	2000	0	0	f	f	1	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1720	40	4	2eme_Division.4e_Legere	4e Legere		Rivaud	10	France	2	2	4	6	1	1	f	f	f	f	f	f	f	2000	0	0	f	f	1	2	1	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1716	40	4	2eme_Division.54e_Ligne	54e Ligne		Rivaud	10	France	2	2	4	5	1	1	f	f	f	f	f	f	f	2000	0	0	f	f	1	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1712	40	4	3eme_Division	3eme Division		Drouet	10	France	1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
1713	40	4	3eme_Division.95e_Ligne	95e Ligne		Drouet	10	France	2	2	4	5	1	1	f	f	f	f	f	f	f	2600	0	0	f	f	1	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1709	40	4	Cav_Reserve.2e_Hussar	2e Hussar			10	France	3	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	300	0	0	0	2	3	0	0	f	f	f	0	0	f	2	0
1710	40	4	Cav_Reserve.4e_Hussar	4e Hussar			10	France	3	2	1	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	422	0	0	0	2	4	0	0	f	f	f	0	0	f	2	0
1770	44	4	Adv_Guard.Lt_Bde_Oswald	Lt Bde Oswald	Weimar Fusilier Battalion Greiffenberg Fusilier Battalion # 4 Oswald Fusilier Battalion # 14 Kloch Fusilier Battalion # 18		10	Prussia	2	2	4	9	1	1	f	f	f	f	f	f	f	2300	0	0	f	f	1	3	0	4	f	0	0	4	0	0	0	0	0	0	6	0	f	f	f	0	3	f	2	3
1769	44	4	2nd_Div	2nd Div		Wartensleben	10	Prussia	1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
1771	44	4	3rd_Division	3rd Division		von Schmettau	10	Prussia	1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
1767	44	4	Adv_Guard	Adv Guard	Blucher own	Blucher	10	Prussia	1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
1776	44	4	Cav_Bde_Blucher.Schorlemmer	Schorlemmer	Schorlemmer Horse Bty		10	Prussia	4	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	8	0	f	f	f	0	3	t	2	3
1834	47	4	1st_Div.Guard_Bde_von_Hirschfeld	Guard Bde von Hirschfeld			10	Prussia	2	2	1	1	1	1	f	f	f	f	f	f	f	2400	0	0	f	f	1	0	0	1	f	0	0	2	0	0	0	0	0	0	2	0	f	f	f	0	4	f	2	1
1835	47	4	2nd_Div.von_Zenge_Grenadiers	von Zenge Grenadiers			10	Prussia	2	2	1	1	1	1	f	f	f	f	f	f	f	1692	0	0	f	f	1	0	0	1	f	0	0	4	0	0	0	0	0	0	2	0	f	f	f	0	4	f	2	1
2894	131	22	2eme_Division.Foot_Bty	Foot Bty	One foot company armed with three 8-pound cannons and one howitzer		10	France	4	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	4	0	f	f	f	0	3	f	2	3
2892	131	22	2eme_Division.Bde_Villatte	Bde Villatte	6th Light Infantry Regiment (two battalions, 1,728 men) 39th Line Infantry Regiment (two battalions, 1,633 men)		10	France	2	2	4	5	1	1	f	f	f	f	f	f	f	3400	0	0	f	f	1	0	0	0	f	0	0	4	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
2891	131	22	Cav_Bde.10e_Chasseur	10e Chasseur			10	France	3	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	140	0	0	0	3	4	0	0	f	f	f	0	0	f	2	0
2890	131	22	4eme_Dragoon_Division.19e_Dragoon_Regt	19e Dragoon Regt			10	France	3	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	290	0	0	0	5	4	0	0	f	f	f	0	0	f	2	0
2889	131	22	Artillery_Reserve.1e_Regt_Foot	1e Regt Foot	1st Regt of Foot Artillery (five 8-pound, and two 4-pound cannons and one howitzer, 331 men)		10	France	4	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	8	0	f	f	f	0	3	f	2	3
2888	131	22	Cav_Bde.3e_Hussar	3e Hussar			10	France	3	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	150	0	0	0	2	3	0	0	f	f	f	0	0	f	2	0
2564	111	19	2nd_Div.Avantgarde	Avantgarde	Erbach IR #42 (thee fusilier battalions and one grenadier battalion) Cuirassier Regt Erzherzog Franz #2 (two squadrons)		10	Austria	2	2	4	3	1	1	f	f	f	f	f	f	f	3000	0	0	f	f	1	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
2887	131	22	4eme_Dragoon_Division.18e_Dragoon_Regt	18e Dragoon Regt			10	France	3	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	300	0	0	0	5	4	0	0	f	f	f	0	0	f	2	0
2886	131	22	Artillery_Reserve.2e_Regt_Horse_Bty	2e Regt Horse Bty	2nd Regt of Horse Artillery (two sections of the 1st company armed with two 8-pound cannons and two howitzers, 65 men)		10	France	4	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	4	0	f	f	f	0	3	t	2	3
2885	131	22	4eme_Dragoon_Division	4eme Dragoon Division		Laplanche	10	France	1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
2884	131	22	Artillery_Reserve	Artillery Reserve		Colonel Jean Nicolas Seroux	10	France	1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
2883	131	22	4eme_Dragoon_Division.25e_Dragoon_Regt	25e Dragoon Regt			10	France	3	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	240	0	0	0	5	4	0	0	f	f	f	0	0	f	2	0
2882	131	22	Cav_Bde	Cav Bde		Colbert-Chabanais	10	France	1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
2881	131	22	Artillery_Reserve.1e_Regt_Foot_Hv	1e Regt Foot Hv	1st Regt of Foot Artillery (two companies armed with four 12-pound)		10	France	4	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	4	0	f	f	f	0	1	f	2	3
2880	131	22	3eme_Division	3eme Division		Jean-Pierre Firmin Malher	10	France	1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
2565	111	19	1st_Div.Horse_Bty	Horse Bty	Cavalry battery armed with four 6-pounder guns and two howitzers		10	Austria	4	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	8	0	f	f	f	0	3	t	2	3
2566	111	19	1st_Div.Reserve_Bde	Reserve Bde	Froon IR #54 (two fusilier battalions that had suffered greatly at Haslach-Jungingen) Froon IR #54 (one grenadier battalion only lightly engaged at Haslach-Jungingen) Josef Colloredo IR #57 (one grenadier battalion) Cuirassier Regt Hohenzollern #8 (two squadrons)		10	Austria	2	2	4	3	1	1	f	f	f	f	f	f	f	3100	0	0	f	f	1	0	0	0	f	0	0	5	300	0	0	0	1	2	0	0	f	f	f	0	0	f	2	0
2567	111	19	1st_Div.Centre_Bde	Centre Bde	GM Genedegh Karl Riese IR #15 (four fusilier battalions, somewhat reduced from action at Haslach-Jungingen) Erzherzog Maximilien IR #35 (four fusilier battalions) Cuirassier Regt Hohenzollern #8 (two squadrons) Uhlanen-Regt Schwarzenberg #2 (one squadron of approx 150 men)		10	Austria	2	2	4	3	1	1	f	f	f	f	f	f	f	3600	0	0	f	f	1	0	0	0	f	0	0	5	400	0	0	0	1	3	0	0	f	f	f	0	0	f	2	0
2568	111	19	1st_Div.Avantgarde	Avantgarde	Erzherzog Ludwig IR #8 (three fusilier and one grenadier battalions, reduced strength from casualties at Haslach-Jungingen) Hussar Regt Blankenstein #6 (two squadrons)		10	Austria	2	2	4	3	1	1	f	f	f	f	f	f	f	3400	0	0	f	f	1	0	0	0	f	0	0	5	300	0	0	0	2	3	0	0	f	f	f	0	0	f	2	0
2569	111	19	2nd_Div	2nd Div		von Hessen-Homburg	10	Austria	1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
2570	111	19	1st_Div	1st Div		von Loudon	10	Austria	1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
3034	144	24	2e_Cuirassier_Div.Bde_Verdiere	Bde Verdiere			10	France	3	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	600	0	0	0	1	4	0	0	f	f	f	0	0	f	2	0
3033	144	24	2e_Dragoon_Div	2e Dragoon Div		Grouchy	10	France	1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
3041	144	24	2e_Dragoon_Div.Bde_Roget	Bde Roget			10	France	3	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	900	0	0	0	5	5	0	0	f	f	f	0	0	f	2	0
3035	144	24	3e_Dragoon_Div	3e Dragoon Div		Beaumont	10	France	1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
3036	144	24	4e_Dragoon_Div	4e Dragoon Div		Sahut	10	France	1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
3029	144	24	Corps_Artillery	Corps Artillery			10	France	1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
3038	144	24	Light_Div	Light Div		Lasalle	10	France	1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
3039	144	24	Light_Div.Milhaud_1e_Hussar	Milhaud 1e Hussar			10	France	3	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	600	0	0	0	2	3	0	0	f	f	f	0	0	f	2	0
3000	142	24	1eme_Division	1eme Division		Suchet	10	France	1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
3005	142	24	1eme_Division.17e_Legere	17e Legere			10	France	2	2	4	6	1	1	f	f	f	f	f	f	f	2100	0	0	f	f	1	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
3001	142	24	1eme_Division.34e_Ligne	34e Ligne			10	France	2	2	4	5	1	1	f	f	f	f	f	f	f	2500	0	0	f	f	1	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
3002	142	24	1eme_Division.40e_Ligne	40e Ligne			10	France	2	2	4	5	1	1	f	f	f	f	f	f	f	1800	0	0	f	f	1	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
3003	142	24	1eme_Division.64e_Ligne	64e Ligne			10	France	2	2	1	5	1	1	f	f	f	f	f	f	f	1800	0	0	f	f	1	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
3004	142	24	1eme_Division.88e_Ligne	88e Ligne			10	France	2	2	1	5	1	1	f	f	f	f	f	f	f	1800	0	0	f	f	1	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
3011	142	24	1eme_Division.Md_Foot_Bty	Md Foot Bty			10		4	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	8	0	f	f	f	0	3	f	2	3
3006	142	24	2eme_Division	2eme Division		Gazan	10	France	1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
3008	142	24	2eme_Division.100e_Ligne	100e Ligne			10	France	2	2	4	3	1	1	f	f	f	f	f	f	f	1800	0	0	f	f	1	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
3009	142	24	2eme_Division.103e_Ligne	103e Ligne			10	France	2	2	4	3	1	1	f	f	f	f	f	f	f	1800	0	0	f	f	1	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
3010	142	24	2eme_Division.21e_Legere	21e Legere			10	France	2	2	4	6	1	1	f	f	f	f	f	f	f	1800	0	0	f	f	1	0	0	0	f	0	0	5	0	0	0	0	1	0	0	0	f	f	f	0	0	f	2	0
3007	142	24	2eme_Division.28e_Legere	28e Legere			10	France	2	2	4	6	1	1	f	f	f	f	f	f	f	900	0	0	f	f	1	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
3012	142	24	2eme_Division.Md_Foot_Bty	Md Foot Bty			10		4	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	8	0	f	f	f	0	3	f	2	3
2995	142	24	Cav_Bde	Cav Bde		Trelliard	10	France	1	2	4	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
2996	142	24	Cav_Bde.10e_Hussar	10e Hussar			10	France	3	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	600	0	0	0	2	3	0	0	f	f	f	0	0	f	2	0
2997	142	24	Cav_Bde.9e_Hussar_Copy	9e Hussar_Copy			10	France	3	2	1	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	600	0	0	0	2	3	0	0	f	f	f	0	0	f	2	0
2998	142	24	Corps_Artillery	Corps Artillery		Careil	10	France	1	2	5	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
2999	142	24	Corps_Artillery.Heavy_Foot	Heavy Foot			10		4	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	8	0	f	f	f	0	1	f	2	2
2968	140	24	Supply_Train	Supply Train		von Schulze	10	Prussia	1	2	6	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
2969	140	24	Supply_Train.Guard_Detachment	Guard Detachment			10		5	2	6	8	1	1	f	f	f	f	f	f	f	300	0	0	f	f	1	2	4	0	f	0	0	10	60	0	0	0	12	7	0	0	f	f	f	0	0	f	2	0
3031	144	24	1e_Dragoon_Div	1e Dragoon Div		Klein	10	France	1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
3032	144	24	2e_Cuirassier_Div	2e Cuirassier Div		d'Hautpoul	10	France	1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
3037	144	24	2e_Cuirassier_Div.Bde_StSulpice	Bde St.Sulpice			10	France	3	2	1	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	600	0	0	0	1	4	0	0	f	f	f	0	0	f	2	0
1723	40	4	3eme_Division.27e_Legere	27e Legere		Drouet	10	France	2	2	4	6	1	1	f	f	f	f	f	f	f	1500	0	0	f	f	1	2	2	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	4	f	2	0
1783	44	4	3rd_Division.Cav_Bde_von_Irwing	Cav Bde von Irwing	Königin Dragoon Regiment # 5, ten squadrons Graumann Horse Artillery Battery, six guns		10	Prussia	3	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	1500	0	0	0	5	4	6	0	f	f	f	0	4	f	2	3
2984	141	24	1eme_Division.55e_Ligne	55e Ligne			10	France	2	2	1	5	1	1	f	f	f	f	f	f	f	1400	0	0	f	f	1	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
2993	141	24	1eme_Division.Md_Foot_Bty	Md Foot Bty			10		4	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	8	0	f	f	f	0	3	f	2	2
2970	141	24	2eme_Division	2eme Division		Leval	10	France	1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
2976	141	24	2eme_Division.24e_Legere	24e Legere			10	France	2	2	1	6	1	1	f	f	f	f	f	f	f	2000	0	0	f	f	1	0	0	0	f	0	0	4	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
2971	141	24	2eme_Division.28e_Ligne	28e Ligne			10	France	2	2	1	5	1	1	f	f	f	f	f	f	f	1400	0	0	f	f	1	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
2974	141	24	2eme_Division.46e_Ligne	46e Ligne			10	France	2	2	1	5	1	1	f	f	f	f	f	f	f	1400	0	0	f	f	1	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
2977	141	24	2eme_Division.4e_Ligne	4e Ligne			10	France	2	2	1	5	1	1	f	f	f	f	f	f	f	1400	0	0	f	f	1	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
2981	141	24	2eme_Division.57e_Ligne	57e Ligne			10	France	2	2	1	5	1	1	f	f	f	f	f	f	f	1700	0	0	f	f	1	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
2994	141	24	2eme_Division.Md_Foot_Bty	Md Foot Bty			10		4	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	8	0	f	f	f	0	3	f	2	3
2986	141	24	3eme_Division	3eme Division		LeGrand	10	France	1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
2982	141	24	3eme_Division.18e_Ligne	18e Ligne			10	France	2	2	4	5	1	1	f	f	f	f	f	f	f	1800	0	0	f	f	1	0	0	0	f	0	0	4	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
2979	141	24	3eme_Division.26e_Legere	26e Legere			10	France	2	2	4	6	1	1	f	f	f	f	f	f	f	1600	0	0	f	f	1	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
2987	141	24	3eme_Division.75e_Ligne	75e Ligne			10	France	2	2	4	5	1	1	f	f	f	f	f	f	f	1700	0	0	f	f	1	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
2973	141	24	3eme_Division.Corsican_Legere_Copy	Corsican Legere_Copy			10	France/Corsica	2	2	1	6	1	1	f	f	f	f	f	f	f	1300	0	0	f	f	1	2	0	1	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
2992	141	24	3eme_Division.Md_Foot_Bty	Md Foot Bty			10		4	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	8	0	f	f	f	0	3	f	2	2
2988	141	24	3eme_Division.Po_Legere	Po Legere			10	France/Italy	2	2	4	6	1	1	f	f	f	f	f	f	f	1000	0	0	f	f	1	2	2	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
2990	141	24	Corps_Artillery	Corps Artillery			10	France	1	2	5	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
2989	141	24	Corps_Artillery.Heavy_Bty	Heavy Bty			10		4	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	8	0	f	f	f	0	1	f	2	3
2985	141	24	Corps_Cavaly	Corps Cavaly		Guyot	10	France	1	2	4	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
2829	127	21	1st_Div.von_Schimonsky	von Schimonsky			10	Prussia	2	2	4	1	1	1	f	f	f	f	f	f	f	3400	0	0	f	f	1	2	1	0	f	0	0	4	0	0	0	0	0	0	2	0	f	f	f	0	4	f	2	3
2816	127	21	2nd_Div	2nd Div		Zechwitz	10	Prussia	1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
2832	127	21	2nd_Div.Boguslawsky_Fusilers	Boguslawsky Fusilers			10	Prussia	2	2	4	9	1	1	f	f	f	f	f	f	f	800	0	0	f	f	1	2	2	2	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
2991	141	24	Corps_Cavaly.11e_Chasseur	11e Chasseur			10	France	3	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	600	0	0	0	3	4	0	0	f	f	f	0	0	f	2	0
2983	141	24	Corps_Cavaly.22e_Chasseur	22e Chasseur			10	France	3	2	1	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	600	0	0	0	3	4	0	0	f	f	f	0	0	f	2	0
3013	143	24	Cav_Bde.9e_Hussar	9e Hussar			10	France	3	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	600	0	0	0	2	3	0	0	f	f	f	0	0	f	2	0
2980	141	24	1eme_Division.10e_Legere	10e Legere			10	France	2	2	4	6	1	1	f	f	f	f	f	f	f	1800	0	0	f	f	1	0	0	0	f	0	0	4	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
2972	141	24	1eme_Division.35e_Ligne	35e Ligne			10	France	2	2	4	5	1	1	f	f	f	f	f	f	f	1400	0	0	f	f	1	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
2818	127	21	2nd_Div.Cav_Bde_von_Kochitsky	Cav Bde von Kochitsky			10	Saxony	3	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	200	0	0	0	1	3	0	0	f	f	f	0	0	f	2	0
2975	141	24	1eme_Division.43e_Ligne	43e Ligne			10	France	2	2	1	5	1	1	f	f	f	f	f	f	f	1400	0	0	f	f	1	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1719	40	4	1eme_Division	1eme Division		de l'Eltang	10	France	1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
1717	40	4	1eme_Division.32e_Ligne	32e Ligne		de l'Eltang	10	France	2	2	4	5	1	1	f	f	f	f	f	f	f	2000	0	0	f	f	1	0	0	0	f	0	0	4	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1725	40	4	1eme_Division.9e_Legere	9e Legere		de l'Eltang	10	France	2	2	4	6	1	1	f	f	f	f	f	f	f	2600	0	0	f	f	1	2	0	0	f	0	0	4	0	0	0	0	0	0	0	0	f	f	f	0	4	f	2	0
1781	44	4	1st_Div.Bde_von_Lutzow	Bde von Lützow	Knebel Grenadier Battalion Möllendorf Infantry Regiment # 25, two battalions Wartensleben Infantry Regiment # 59, two battalions		10	Prussia	2	2	4	1	1	1	f	f	f	f	f	f	f	4500	0	0	f	f	1	2	2	0	f	0	0	4	0	0	0	0	0	0	6	0	f	f	f	0	3	f	2	3
3082	147	24	Infantry_Division.1e_Grenadiers	1e Grenadiers			10	France	2	2	4	5	1	1	f	f	f	f	f	f	f	2400	0	0	f	f	1	0	0	0	f	0	0	1	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
3083	147	24	Infantry_Division.2e_Grenadiers	2e Grenadiers			10	France	2	2	1	5	1	1	f	f	f	f	f	f	f	2400	0	0	f	f	1	0	0	0	f	0	0	1	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
3023	143	24	1eme_Division	1eme Division		Marchand	10	France	1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
3014	143	24	1eme_Division.39e_Ligne	39e Ligne			10	France	2	2	4	5	1	1	f	f	f	f	f	f	f	1800	0	0	f	f	1	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
3015	143	24	1eme_Division.69e_Ligne	69e Ligne			10	France	2	2	1	5	1	1	f	f	f	f	f	f	f	1800	0	0	f	f	1	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
3027	143	24	1eme_Division.6e_Legere	6e Legere			10	France	2	2	4	6	1	1	f	f	f	f	f	f	f	1800	0	0	f	f	1	0	0	0	f	0	0	4	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
3017	143	24	1eme_Division.76e_Ligne	76e Ligne			10	France	2	2	1	5	1	1	f	f	f	f	f	f	f	1800	0	0	f	f	1	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
3022	143	24	2eme_Division	2eme Division		Gardanne	10	France	1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
3028	143	24	2eme_Division.25e_Legere	25e Legere			10	France	2	2	4	6	1	1	f	f	f	f	f	f	f	1800	0	0	f	f	1	0	0	0	f	0	0	4	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
3026	143	24	2eme_Division.27e_Ligne	27e Ligne			10	France	2	2	1	5	1	1	f	f	f	f	f	f	f	1800	0	0	f	f	1	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
3025	143	24	2eme_Division.50e_Ligne	50e Ligne			10	France	2	2	1	5	1	1	f	f	f	f	f	f	f	1800	0	0	f	f	1	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
3019	143	24	2eme_Division.59e_Ligne	59e Ligne			10	France	2	2	1	5	1	1	f	f	f	f	f	f	f	1800	0	0	f	f	1	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
3024	143	24	Cav_Bde	Cav Bde		Charbanais	10	France	1	2	4	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
3016	143	24	Cav_Bde.10e_Chasseur	10e Chasseur			10	France	3	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	600	0	0	0	3	4	0	0	f	f	f	0	0	f	2	0
3018	143	24	Corps_Artillery	Corps Artillery			10	France	1	2	4	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
3020	143	24	Corps_Artillery.1e_Heavy_Bty	1e Heavy Bty			10		4	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	8	0	f	f	f	0	1	f	2	2
3021	143	24	Corps_Artillery.2e_Heavy_Bty	2e Heavy Bty			10		4	2	1	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	8	0	f	f	f	0	1	f	2	2
3054	145	24	Adv_Guard_Div	Adv Guard Div		Ferdinand	10	Prussia	1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
3053	145	24	Adv_Guard_Div.Bde_Belvilaqua	Bde Belvilaqua	Combined Bns from IR 49,  Prinz Clemens (saxon), and Kurfurst (saxon)		10	Prussia/Saxony	2	2	4	1	1	1	f	f	f	f	f	f	f	5100	0	0	f	f	1	2	1	0	f	0	0	5	0	0	0	0	0	0	6	0	f	f	f	0	4	f	2	3
3055	145	24	Adv_Guard_Div.Bde_von_Pelet	Bde von Pelet	Rabenau # 13 Pelet # 14 Rühle # 15 Fusiliers, Masars and Valentin Jager 		10	Prussia	2	2	4	9	1	1	f	f	f	f	f	f	f	2400	0	0	f	f	1	0	0	2	f	0	0	4	0	0	0	0	0	0	6	0	f	f	f	0	3	f	2	3
3056	145	24	Adv_Guard_Div.Cav_Bde_von_Schimmelpfennig	Cav Bde von Schimmelpfennig	Schimmelpfennig Hussar Regiment # 6, ten squadrons		10	Prussia	3	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	1500	0	0	0	2	4	6	0	f	f	f	0	3	f	2	3
3057	145	24	Adv_Guard_Div.Saxon_Hussar_von_Truetzschler	Saxon Hussar von Trützschler	Saxon Hussar Regiment, eight squadrons		10	Saxony	3	2	1	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	1200	0	0	0	2	4	0	0	f	f	f	0	0	f	2	0
3087	147	24	Cavalry_Division.Grenadier_a_Cheval	Grenadier a Cheval			10	France	3	2	1	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	400	0	0	0	8	1	0	0	f	f	f	0	0	f	2	0
3084	147	24	Guard_Artillery.Army_Artillery_Park	Army Artillery Park			10		4	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	16	0	f	f	f	0	1	f	2	2
3086	147	24	Infantry_Division.1e_Chasseurs	1e Chasseurs			10	France	2	2	1	6	1	1	f	f	f	f	f	f	f	2400	0	0	f	f	1	0	0	0	f	0	0	1	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
2333	87	15	2eme_Division	2eme Division		Louis Henri Loison	10	France	1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
2334	87	15	3eme_Division	3eme Division		Jean-Pierre Firmin Malher	10	France	1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
2335	87	15	Artillery_Reserve.1e_Regt_Foot_Hv	1e Regt Foot Hv	1st Regt of Foot Artillery (two companies armed with four 12-pound)		10	France	4	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	4	0	f	f	f	0	1	f	2	3
2336	87	15	Cav_Bde	Cav Bde		Colbert-Chabanais	10	France	1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
2338	87	15	Artillery_Reserve	Artillery Reserve		Colonel Jean Nicolas Seroux	10	France	1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
2339	87	15	4eme_Dragoon_Division	4eme Dragoon Division		Laplanche	10	France	1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
2340	87	15	Artillery_Reserve.2e_Regt_Horse_Bty	2e Regt Horse Bty	2nd Regt of Horse Artillery (two sections of the 1st company armed with two 8-pound cannons and two howitzers, 65 men)		10	France	4	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	4	0	f	f	f	0	3	t	2	3
2343	87	15	Artillery_Reserve.1e_Regt_Foot	1e Regt Foot	1st Regt of Foot Artillery (five 8-pound, and two 4-pound cannons and one howitzer, 331 men)		10	France	4	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	8	0	f	f	f	0	3	f	2	3
2346	87	15	2eme_Division.Bde_Villatte	Bde Villatte	6th Light Infantry Regiment (two battalions, 1,728 men) 39th Line Infantry Regiment (two battalions, 1,633 men)		10	France	2	2	4	5	1	1	f	f	f	f	f	f	f	3400	0	0	f	f	1	0	0	0	f	0	0	4	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
2347	87	15	2eme_Division.Bde_Roguet	Bde Roguet	69th Line Infantry Regiment (two battalion, 1,698 men) 76th Line Infantry Regiment (three battalions, 1,789 men)		10	France	2	2	4	5	1	1	f	f	f	f	f	f	f	3400	0	0	f	f	1	0	0	0	f	0	0	4	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
2348	87	15	2eme_Division.Foot_Bty	Foot Bty	One foot company armed with three 8-pound cannons and one howitzer		10	France	4	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	4	0	f	f	f	0	3	f	2	3
2349	87	15	2eme_Division.Foot_Bty.Horse_Bty	Horse Bty	One horse artillery section armed with one 4-pound cannon and one howitzer, total 89 men		10	France	4	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	2	0	f	f	f	0	4	t	2	3
2350	87	15	3eme_Division.Bde_Delabassee	Bde Delabassée	50th Line Infantry Regiment (two battalions, 1,547 men) 59th Line Infantry Regiment (two battalions, 1,621 men)		10	France	2	2	4	5	1	1	f	f	f	f	f	f	f	3200	0	0	f	f	1	0	0	0	f	0	0	4	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
2351	87	15	3eme_Division.Mxed_Foot_Bty	Mxed Foot Bty	One foot company armed with one 12-pound, four 8-pound and one 4-pound cannons, 65 men		10		4	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	8	0	f	f	f	0	3	f	2	3
2352	87	15	3eme_Division.Bde_de_Marcognet	Bde de Marcognet	25th Light Infantry Regiment (three battalions, 1,540 men) 27th Line Infantry Regiment (two battalions, 1,347 men)		10	France	2	2	4	5	1	1	f	f	f	f	f	f	f	2900	0	0	f	f	1	0	0	0	f	0	0	4	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
2353	88	15	2nd_Div.Reserve_Bde	Reserve Bde	Froon IR #54 (two additional fusilier battalions from this regiment that had not been at Haslach-Jungingen) Erzherzog Karl IR #3 (the grenadier battalion from this regiment) Auersperg IR #24 (the grenadier battalion from this regiment) Cuirassier Regt Erzherzog Franz #2 (two squadrons)		10	Austria	2	2	4	3	1	1	f	f	f	f	f	f	f	4000	0	0	f	f	1	0	0	0	f	0	0	5	300	0	0	0	1	2	0	0	f	f	f	0	0	f	2	0
2354	88	15	2nd_Div.Center_Bde	Center Bde	Erzherzog Karl IR #3 (four fusilier battalions) Erzherzog Auersperg #24 (four fusilier battalions) Cuirassier Regt Erzherzog Franz #2 (one-and-a-half squadrons)		10	Austria	2	2	4	3	1	1	f	f	f	f	f	f	f	6000	0	0	f	f	1	0	0	0	f	0	0	5	200	0	0	0	1	2	0	0	f	f	f	0	0	f	2	0
2355	88	15	2nd_Div.Avantgarde	Avantgarde	Erbach IR #42 (thee fusilier battalions and one grenadier battalion) Cuirassier Regt Erzherzog Franz #2 (two squadrons)		10	Austria	2	2	4	3	1	1	f	f	f	f	f	f	f	3000	0	0	f	f	1	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
2356	88	15	1st_Div.Horse_Bty	Horse Bty	Cavalry battery armed with four 6-pounder guns and two howitzers		10	Austria	4	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	8	0	f	f	f	0	3	t	2	3
3043	144	24	2e_Dragoon_Div.Bde_Milet	Bde Milet			10	France	3	2	1	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	600	0	0	0	5	5	0	0	f	f	f	0	0	f	2	0
3047	144	24	4e_Dragoon_Div.Bde_Margaron	Bde Margaron	17th Dragoon Regiment, 1st, 2nd, and 3rd squadrons 27th Dragoon Regiment, 1st, 2nd, and 3rd squadrons		10	France	3	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	1200	0	0	0	5	5	0	0	f	f	f	0	0	f	2	0
3044	144	24	1e_Cuirassier_Div.Bde_Housaye	Bde Housaye			10	France	3	2	1	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	1300	0	0	0	1	2	0	0	f	f	f	0	0	f	2	0
3045	144	24	1e_Dragoon_Div.Bde_Fenerolz	Bde Fenerolz			10	France	3	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	600	0	0	0	5	4	0	0	f	f	f	0	0	f	2	0
3046	144	24	1e_Dragoon_Div.Bde_Picard	Bde Picard			10	France	3	2	1	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	600	0	0	0	5	4	0	0	f	f	f	0	0	f	2	0
2357	88	15	1st_Div.Reserve_Bde	Reserve Bde	Froon IR #54 (two fusilier battalions that had suffered greatly at Haslach-Jungingen) Froon IR #54 (one grenadier battalion only lightly engaged at Haslach-Jungingen) Josef Colloredo IR #57 (one grenadier battalion) Cuirassier Regt Hohenzollern #8 (two squadrons)		10	Austria	2	2	4	3	1	1	f	f	f	f	f	f	f	3100	0	0	f	f	1	0	0	0	f	0	0	5	300	0	0	0	1	2	0	0	f	f	f	0	0	f	2	0
2358	88	15	1st_Div.Centre_Bde	Centre Bde	GM Genedegh Karl Riese IR #15 (four fusilier battalions, somewhat reduced from action at Haslach-Jungingen) Erzherzog Maximilien IR #35 (four fusilier battalions) Cuirassier Regt Hohenzollern #8 (two squadrons) Uhlanen-Regt Schwarzenberg #2 (one squadron of approx 150 men)		10	Austria	2	2	4	3	1	1	f	f	f	f	f	f	f	3600	0	0	f	f	1	0	0	0	f	0	0	5	400	0	0	0	1	3	0	0	f	f	f	0	0	f	2	0
2359	88	15	1st_Div.Avantgarde	Avantgarde	Erzherzog Ludwig IR #8 (three fusilier and one grenadier battalions, reduced strength from casualties at Haslach-Jungingen) Hussar Regt Blankenstein #6 (two squadrons)		10	Austria	2	2	4	3	1	1	f	f	f	f	f	f	f	3400	0	0	f	f	1	0	0	0	f	0	0	5	300	0	0	0	2	3	0	0	f	f	f	0	0	f	2	0
2360	88	15	2nd_Div	2nd Div		von Hessen-Homburg	10	Austria	1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
2361	88	15	1st_Div	1st Div		von Loudon	10	Austria	1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
3059	146	24	1eme_Division	1eme Division		Morand	10	France	1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
3058	146	24	1eme_Division.13e_Legere	13e Legere			10	France	2	2	4	6	1	1	f	f	f	f	f	f	f	1400	0	0	f	f	1	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
3062	146	24	1eme_Division.17e_Ligne	17e Ligne			10	France	2	2	4	5	1	1	f	f	f	f	f	f	f	1800	0	0	f	f	1	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
3064	146	24	1eme_Division.30e_Ligne	30e Ligne			10	France	2	2	1	5	1	1	f	f	f	f	f	f	f	1800	0	0	f	f	1	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
3061	146	24	1eme_Division.51e_Ligne	51e Ligne			10	France	2	2	1	5	1	1	f	f	f	f	f	f	f	1800	0	0	f	f	1	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
3063	146	24	1eme_Division.61e_Ligne	61e Ligne			10	France	2	2	1	5	1	1	f	f	f	f	f	f	f	1800	0	0	f	f	1	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
3065	146	24	2eme_Division	2eme Division		Friant	10	France	1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
3060	146	24	2eme_Division.108e_Ligne	108e Ligne			10	France	2	2	1	5	1	1	f	f	f	f	f	f	f	1600	0	0	f	f	1	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
3067	146	24	2eme_Division.111e_Ligne	111e Ligne			10	France	2	2	1	5	1	1	f	f	f	f	f	f	f	1800	0	0	f	f	1	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
3066	146	24	2eme_Division.33e_Ligne	33e Ligne			10	France	2	2	1	5	1	1	f	f	f	f	f	f	f	1800	0	0	f	f	1	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
3077	146	24	2eme_Division.48e_Ligne	48e Ligne			10	France	2	2	1	5	1	1	f	f	f	f	f	f	f	1400	0	0	f	f	1	0	0	0	f	0	0	1	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
3069	146	24	3eme_Division	3eme Division		Gudin	10	France	1	2	1	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
3070	146	24	3eme_Division.12e_Ligne	12e Ligne			10	France	2	2	1	5	1	1	f	f	f	f	f	f	f	1300	0	0	f	f	1	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
3071	146	24	3eme_Division.21e_Ligne	21e Ligne			10	France	2	2	1	5	1	1	f	f	f	f	f	f	f	1800	0	0	f	f	1	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
3072	146	24	3eme_Division.25e_Ligne	25e Ligne			10	France	2	2	1	5	1	1	f	f	f	f	f	f	f	1800	0	0	f	f	1	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
3073	146	24	3eme_Division.85e_Ligne	85e Ligne			10	France	2	2	1	5	1	1	f	f	f	f	f	f	f	1600	0	0	f	f	1	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
3068	146	24	Cav_Bde	Cav Bde		Viallanes	10	France	1	2	4	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
3074	146	24	Cav_Bde.1e_Chasseur	1e Chasseur			10	France	3	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	600	0	0	0	3	3	0	0	f	f	f	0	0	f	2	0
3075	146	24	Cav_Bde.2e_Chasseur	2e Chasseur			10	France	3	2	1	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	600	0	0	0	3	3	0	0	f	f	f	0	0	f	2	0
3076	146	24	Corps_Artillery	Corps Artillery		Hannicque	10	France	1	2	4	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
3049	144	24	3e_Dragoon_Div.Bde_Maubourg	Bde Maubourg			10	France	3	2	1	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	600	0	0	0	5	5	0	0	f	f	f	0	0	f	2	0
3050	144	24	Corps_Artillery.1e_Horse	1e Horse			10		4	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	8	0	f	f	f	0	3	t	2	2
3051	144	24	Corps_Artillery.2e_Horse	2e Horse			10		4	2	1	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	8	0	f	f	f	0	3	t	2	2
2632	116	21	1eme_Division	1eme Division		Suchet	10	France	1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
2337	87	15	4eme_Dragoon_Division.25e_Dragoon_Regt	25e Dragoon Regt			10	France	3	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	240	0	0	0	5	4	0	0	f	f	f	0	0	f	2	0
3108	148	24	2eme_Division	2eme Division		Rivaud	10	France	1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
3102	148	24	2eme_Division.45e_Ligne	45e Ligne		Rivaud	10	France	2	2	4	5	1	1	f	f	f	f	f	f	f	2000	0	0	f	f	1	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
3107	148	24	2eme_Division.4e_Legere	4e Legere		Rivaud	10	France	2	2	4	6	1	1	f	f	f	f	f	f	f	2000	0	0	f	f	1	2	1	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
3103	148	24	2eme_Division.54e_Ligne	54e Ligne		Rivaud	10	France	2	2	4	5	1	1	f	f	f	f	f	f	f	2000	0	0	f	f	1	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
3113	148	24	2eme_Division.Md_Foot_Bty	Md Foot Bty			10		4	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	0	0	0	0	0	0	0	8	0	f	f	f	0	3	f	2	3
3114	148	24	2eme_Division.Md_Foot_Bty_Copy	Md Foot Bty_Copy			10		4	2	1	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	0	0	0	0	0	0	0	8	0	f	f	f	0	3	f	2	3
3099	148	24	3eme_Division	3eme Division		Drouet	10	France	1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
3115	148	24	3eme_Division.27e_Legere	27e Legere		Drouet	10	France	2	2	4	6	1	1	f	f	f	f	f	f	f	1500	0	0	f	f	1	2	2	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	4	f	2	0
3101	148	24	3eme_Division.94e_Ligne	94e Ligne		Drouet	10	France	2	2	4	5	1	1	f	f	f	f	f	f	f	1500	0	0	f	f	1	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
3100	148	24	3eme_Division.95e_Ligne	95e Ligne		Drouet	10	France	2	2	4	5	1	1	f	f	f	f	f	f	f	2600	0	0	f	f	1	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
3110	148	24	3eme_Division.Md_Foot_Bty	Md Foot Bty			10		4	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	0	0	0	0	0	0	0	8	0	f	f	f	0	3	f	2	3
3098	148	24	Artillery_Reserve	Artillery Reserve		Eble	10	France	1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
3109	148	24	Artillery_Reserve.Md_Foot_Bty	Md Foot Bty			10		4	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	8	0	f	f	f	0	3	f	2	2
3095	148	24	Cav_Reserve	Cav Reserve		Tilley	10	France	1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
3096	148	24	Cav_Reserve.2e_Hussar	2e Hussar			10	France	3	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	300	0	0	0	2	3	0	0	f	f	f	0	0	f	2	0
3097	148	24	Cav_Reserve.4e_Hussar	4e Hussar			10	France	3	2	1	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	422	0	0	0	2	4	0	0	f	f	f	0	0	f	2	0
3078	146	24	1eme_Division.Md_Foot_Bty	Md Foot Bty			10		4	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	8	0	f	f	f	0	3	f	2	2
3080	146	24	2eme_Division.Md_Foot_Bty	Md Foot Bty			10		4	2	1	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	8	0	f	f	f	0	3	f	2	2
3081	146	24	3eme_Division.Md_Foot_Bty	Md Foot Bty			10		4	2	1	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	8	0	f	f	f	0	3	f	2	2
3079	146	24	Corps_Artillery.Md_Foot_Bty	Md Foot Bty			10		4	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	8	0	f	f	f	0	3	f	2	2
3134	150	24	Supply_Train	Supply Train			10	France	1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
3135	150	24	Supply_Train.Supply_Escort_Detachment	Supply Escort Detachment			10		5	2	5	6	1	1	f	f	f	f	f	f	f	300	0	0	f	f	1	2	4	0	f	0	0	6	50	0	0	0	3	0	0	0	f	f	f	0	0	f	2	0
3156	152	24	1st_Div	1st Div		Pr Wiliam of Orange	10	Prussia	1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
3157	152	24	2nd_Div	2nd Div		Wartensleben	10	Prussia	1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
3154	152	24	3rd_Division.Cav_Bde_von_Irwing	Cav Bde von Irwing	Königin Dragoon Regiment # 5, ten squadrons Graumann Horse Artillery Battery, six guns		10	Prussia	3	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	1500	0	0	0	5	4	6	0	f	f	f	0	4	f	2	3
3155	152	24	Adv_Guard	Adv Guard	Blucher own	Blucher	10	Prussia	1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
3105	148	24	1eme_Division.96e_Ligne	96e Ligne		de l'Eltang	10	France	2	2	4	5	1	1	f	f	f	f	f	f	f	2000	0	0	f	f	1	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
3111	148	24	1eme_Division.9e_Legere	9e Legere		de l'Eltang	10	France	2	2	4	6	1	1	f	f	f	f	f	f	f	2600	0	0	f	f	1	2	0	0	f	0	0	4	0	0	0	0	0	0	0	0	f	f	f	0	4	f	2	0
3112	148	24	1eme_Division.Md_Foot_Bty	Md Foot Bty			10		4	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	0	0	0	0	0	0	0	8	0	f	f	f	0	3	f	2	3
1668	37	4	Adv_Guard_Div.Cav_Bde_von_Schimmelpfennig	Cav Bde von Schimmelpfennig	Schimmelpfennig Hussar Regiment # 6, ten squadrons		10	Prussia	3	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	1500	0	0	0	2	4	6	0	f	f	f	0	3	f	2	3
2628	116	21	Cav_Bde.10e_Hussar	10e Hussar			10	France	3	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	600	0	0	0	2	3	0	0	f	f	f	0	0	f	2	0
2629	116	21	Cav_Bde.9e_Hussar_Copy	9e Hussar_Copy			10	France	3	2	1	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	600	0	0	0	2	3	0	0	f	f	f	0	0	f	2	0
2341	87	15	4eme_Dragoon_Division.18e_Dragoon_Regt	18e Dragoon Regt			10	France	3	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	300	0	0	0	5	4	0	0	f	f	f	0	0	f	2	0
2342	87	15	Cav_Bde.3e_Hussar	3e Hussar			10	France	3	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	150	0	0	0	2	3	0	0	f	f	f	0	0	f	2	0
2344	87	15	4eme_Dragoon_Division.19e_Dragoon_Regt	19e Dragoon Regt			10	France	3	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	290	0	0	0	5	4	0	0	f	f	f	0	0	f	2	0
2345	87	15	Cav_Bde.10e_Chasseur	10e Chasseur			10	France	3	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	140	0	0	0	3	4	0	0	f	f	f	0	0	f	2	0
2630	116	21	Corps_Artillery	Corps Artillery		Careil	10	France	1	2	5	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
2631	116	21	Corps_Artillery.Heavy_Foot	Heavy Foot			10		4	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	8	0	f	f	f	0	1	f	2	2
2637	116	21	1eme_Division.17e_Legere	17e Legere			10	France	2	2	4	6	1	1	f	f	f	f	f	f	f	2100	0	0	f	f	1	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
2633	116	21	1eme_Division.34e_Ligne	34e Ligne			10	France	2	2	4	5	1	1	f	f	f	f	f	f	f	2500	0	0	f	f	1	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
2634	116	21	1eme_Division.40e_Ligne	40e Ligne			10	France	2	2	4	5	1	1	f	f	f	f	f	f	f	1800	0	0	f	f	1	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
2635	116	21	1eme_Division.64e_Ligne	64e Ligne			10	France	2	2	1	5	1	1	f	f	f	f	f	f	f	1800	0	0	f	f	1	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
2636	116	21	1eme_Division.88e_Ligne	88e Ligne			10	France	2	2	1	5	1	1	f	f	f	f	f	f	f	1800	0	0	f	f	1	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
2643	116	21	1eme_Division.Md_Foot_Bty	Md Foot Bty			10		4	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	8	0	f	f	f	0	3	f	2	3
2638	116	21	2eme_Division	2eme Division		Gazan	10	France	1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
2640	116	21	2eme_Division.100e_Ligne	100e Ligne			10	France	2	2	4	3	1	1	f	f	f	f	f	f	f	1800	0	0	f	f	1	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
2821	127	21	2nd_Div.Heavy_Bty	Heavy Bty			10	Saxony	4	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	8	0	f	f	f	0	1	f	2	3
2826	127	21	2nd_Div.Horse_Bty	Horse Bty			10	Saxony	4	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	8	0	f	f	f	0	3	f	2	3
2831	127	21	2nd_Div.von_Burgsdorf	von Burgsdorf			10	Saxony	2	2	4	1	1	1	f	f	f	f	f	f	f	3400	0	0	f	f	1	2	1	0	f	0	0	4	0	0	0	0	0	0	1	0	f	f	f	0	4	f	2	3
2830	127	21	2nd_Div.von_Dyherrn	von Dyherrn			10	Saxony	2	2	4	3	1	1	f	f	f	f	f	f	f	4200	0	0	f	f	1	2	1	0	f	0	0	4	0	0	0	0	0	0	2	0	f	f	f	0	4	f	2	3
2807	127	21	3rd_Div	3rd Div		Tauentzein	10	Prussia	1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
2808	127	21	3rd_Div.Cav_Bde_Prince_Clement	Cav Bde Prince Clement			10	Prussia	3	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	700	0	0	0	2	4	0	0	f	f	f	0	0	f	2	0
2820	127	21	3rd_Div.Lt_Bty	Lt Bty			10	Prussia	4	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	6	0	f	f	f	0	4	f	2	3
2809	127	21	3rd_Div.Rosen_Fusilers	Rosen Fusilers			10	Prussia	2	2	4	9	1	1	f	f	f	f	f	f	f	400	0	0	f	f	1	0	0	2	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
2819	127	21	3rd_Div.von_Schoeneberg	von Schöneberg			10	Saxony	2	2	4	1	1	1	f	f	f	f	f	f	f	3400	0	0	f	f	1	2	1	0	f	0	0	5	0	0	0	0	0	0	2	0	f	f	f	0	4	f	2	4
2828	127	21	3rd_Div.von_Zweiffel	von Zweiffel			10	Prussia	2	2	4	1	1	1	f	f	f	f	f	f	f	3400	0	0	f	f	1	2	1	0	f	0	0	4	0	0	0	0	0	0	2	0	f	f	f	0	4	f	2	3
2812	127	21	Reserve_Div	Reserve Div		Prittwitz	10	Prussia	1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
2811	127	21	Reserve_Div.Cav_Bde_von_Krafft	Cav Bde von Krafft			10	Prussia	3	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	900	0	0	0	12	3	0	0	f	f	f	0	0	f	2	0
2823	127	21	Reserve_Div.Cerrini_Grenadier_Bde	Cerrini Grenadier Bde			10	Prussia	2	2	4	1	1	1	f	f	f	f	f	f	f	4200	0	0	f	f	1	0	0	2	f	0	0	4	0	0	0	0	0	0	2	0	f	f	f	0	4	f	2	3
2813	127	21	Reserve_Div.Heavy_Bty	Heavy Bty			10	Prussia	4	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	8	0	f	f	f	0	1	f	2	3
2822	127	21	Reserve_Div.Md_Foot_Bty	Md Foot Bty			10	Prussia	4	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	8	0	f	f	f	0	3	f	2	4
2824	127	21	Reserve_Div.Prittwitz_Grenadier_Bde	Prittwitz Grenadier Bde			10	Prussia	2	2	4	1	1	1	f	f	f	f	f	f	f	3300	0	0	f	f	1	0	0	2	f	0	0	4	0	0	0	0	0	0	2	0	f	f	f	0	4	f	2	3
2810	127	21	1st_Div	1st Div		Grawert	10	Prussia	1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
2815	127	21	1st_Div.Bde_Henkel	Bde Henkel			10	Prussia	3	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	900	0	0	0	5	3	0	0	f	f	f	0	0	f	2	0
2817	127	21	1st_Div.Erichsen_Fusilers	Erichsen Fusilers			10		2	2	4	9	1	1	f	f	f	f	f	f	f	700	0	0	f	f	1	0	0	1	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
2814	127	21	1st_Div.Heavy_Bty	Heavy Bty			10	Prussia	4	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	8	0	f	f	f	0	1	f	2	4
2825	127	21	1st_Div.Horse_Bty	Horse Bty			10	Prussia	4	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	8	0	f	f	f	0	3	f	2	3
2827	127	21	1st_Div.von_Mueffling	von Müffling			10	Prussia	2	2	4	1	1	1	f	f	f	f	f	f	f	3600	0	0	f	f	1	2	1	0	f	0	0	4	0	0	0	0	0	0	2	0	f	f	f	0	4	f	2	3
1670	37	4	Adv_Guard_Div.Saxon_Hussar_von_Truetzschler	Saxon Hussar von Trützschler	Saxon Hussar Regiment, eight squadrons		10	Saxony	3	2	1	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	1200	0	0	0	2	4	0	0	f	f	f	0	0	f	2	0
3094	147	24	Infantry_Division	Infantry Division		Lefebvre	10	France	1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	2	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
3089	147	24	Infantry_Division.2e_Chasseurs	2e Chasseurs			10	France	2	2	1	6	1	1	f	f	f	f	f	f	f	2400	0	0	f	f	1	0	0	0	f	0	0	1	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
3090	147	24	Infantry_Division.Foot_Dragoons	Foot Dragoons			10	France	2	2	1	6	1	1	f	f	f	f	f	f	f	2400	0	0	f	f	1	0	0	0	f	0	0	1	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
3126	149	24	1eme_Division	1eme Division		Desjardin	10	France	1	2	4	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
3117	149	24	1eme_Division.105e_Ligne	105e Ligne			10	France	2	2	1	3	1	1	f	f	f	f	f	f	f	1700	0	0	f	f	1	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
3119	149	24	1eme_Division.14e_Ligne	14e Ligne			10	France	2	2	4	5	1	1	f	f	f	f	f	f	f	700	0	0	f	f	1	0	0	0	f	0	0	4	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
3124	149	24	1eme_Division.16e_Legere	16e Legere			10	France	2	2	4	6	1	1	f	f	f	f	f	f	f	2700	0	0	f	f	1	0	0	0	f	0	0	4	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
3125	149	24	1eme_Division.44e_Ligne	44e Ligne			10	France	2	2	1	5	1	1	f	f	f	f	f	f	f	1700	0	0	f	f	1	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
3132	149	24	1eme_Division.Md_Foot_Bty	Md Foot Bty			10		4	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	8	0	f	f	f	0	3	f	2	3
3129	149	24	2eme_Division	2eme Division		Bierre	10	France	1	2	4	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
3127	149	24	2eme_Division.24e_Ligne	24e Ligne			10	France	2	2	4	5	1	1	f	f	f	f	f	f	f	1800	0	0	f	f	1	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
3122	149	24	2eme_Division.63e_Ligne	63e Ligne			10	France	2	2	1	5	1	1	f	f	f	f	f	f	f	700	0	0	f	f	1	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
3128	149	24	2eme_Division.7e_Legere	7e Legere			10	France	2	2	4	6	1	1	f	f	f	f	f	f	f	1800	0	0	f	f	1	0	0	0	f	0	0	4	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
3131	149	24	2eme_Division.Allied_Nassau	Allied Nassau			10	Nassau	2	2	1	5	1	1	f	f	f	f	f	f	f	400	0	0	f	f	1	0	0	0	f	0	0	4	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
3130	149	24	2eme_Division.Hesse_Darmstadt	Hesse Darmstadt			10	Hesse	2	2	1	1	1	1	f	f	f	f	f	f	f	800	0	0	f	f	1	0	0	0	f	0	0	4	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
3121	149	24	Corps_Artillery	Corps Artillery			10	France	1	2	4	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
3123	149	24	Corps_Artillery.Heavy_Bty	Heavy Bty			10		4	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	8	0	f	f	f	0	1	f	2	2
3120	149	24	Corps_Cav	Corps Cav		Durosnel	10	France	1	2	4	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
3118	149	24	Corps_Cav.20e_Chasseur	20e Chasseur			10	France	3	2	1	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	600	0	0	0	3	4	0	0	f	f	f	0	0	f	2	0
3116	149	24	Corps_Cav.7e_Chasseur	7e Chasseur			10	France	3	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	600	0	0	0	3	4	0	0	f	f	f	0	0	f	2	0
3088	147	24	Guard_Artillery	Guard Artillery		de Lamartiniére	10	France	1	2	4	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	2	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
3093	147	24	Guard_Artillery.Guard_Foot_Artillery	Guard Foot Artillery			10		4	2	1	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	24	0	f	f	f	0	3	f	2	1
3092	147	24	Guard_Artillery.Guard_Horse_Bty	Guard Horse Bty			10		4	2	1	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	8	0	f	f	f	0	4	t	2	1
3140	151	24	2nd_Div	2nd Div			10		1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
3142	151	24	2nd_Div.1st_Regt	1st Regt			10		2	2	4	3	1	1	f	f	f	f	f	f	f	1800	0	0	f	f	1	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
3138	151	24	2nd_Div.1st_Regt_of_Death	1st Regt of Death	with data		10		2	2	4	3	1	1	f	f	f	f	f	f	f	1800	0	0	f	f	1	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
3143	151	24	2nd_Div.2nd_Regt	2nd Regt			10		2	2	4	3	1	1	f	f	f	f	f	f	f	1800	0	0	f	f	1	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
3153	151	24	2nd_Div.3rd_special_regt_von_X	3rd special regt von X			10		2	2	1	8	1	1	f	f	f	f	f	f	f	1800	0	0	f	f	2	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
3152	151	24	2nd_Div.Devils_Bde_as_such	Devils Bde as such	as such six much as such		10	gotta break this	2	2	4	4	1	1	f	f	f	f	f	f	f	1800	0	0	f	f	3	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
3150	151	24	2nd_Duvussion	2nd Duvussion			10		1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
3151	151	24	2nd_Duvussion.NZ_Brugade_from_NZ	NZ Brugade from NZ			10		2	2	4	7	1	1	f	f	f	f	f	f	f	1800	0	0	f	f	1	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
3144	151	24	6th_Division	6th Division			10		1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
3147	151	24	6th_Division.1st_Regt	1st Regt			10		2	2	4	3	1	1	f	f	f	f	f	f	f	1800	0	0	f	f	1	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
3145	151	24	6th_Division.2nd_Regt	2nd Regt			10		2	2	4	3	1	1	f	f	f	f	f	f	f	1800	0	0	f	f	1	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
3146	151	24	7th_Div	7th Div			10		1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
3148	151	24	7th_Div.1st_Bn	1st Bn			10		2	2	4	3	1	1	f	f	f	f	f	f	f	1800	0	0	f	f	1	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
3149	151	24	7th_Div.4th_Bn	4th Bn			10		2	2	4	3	1	1	f	f	f	f	f	f	f	1800	0	0	f	f	1	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
3133	149	24	2eme_Division.Md_Foot_Bty	Md Foot Bty			10		4	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	8	0	f	f	f	0	3	f	2	3
3178	153	24	1st_Div	1st Div		Grawert	10	Prussia	1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
3183	153	24	1st_Div.Bde_Henkel	Bde Henkel			10	Prussia	3	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	900	0	0	0	5	3	0	0	f	f	f	0	0	f	2	0
3185	153	24	1st_Div.Erichsen_Fusilers	Erichsen Fusilers			10		2	2	4	9	1	1	f	f	f	f	f	f	f	700	0	0	f	f	1	0	0	1	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
3182	153	24	1st_Div.Heavy_Bty	Heavy Bty			10	Prussia	4	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	8	0	f	f	f	0	1	f	2	4
3184	153	24	2nd_Div	2nd Div		Zechwitz	10	Prussia	1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
3186	153	24	2nd_Div.Cav_Bde_von_Kochitsky	Cav Bde von Kochitsky			10	Saxony	3	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	200	0	0	0	1	3	0	0	f	f	f	0	0	f	2	0
3175	153	24	3rd_Div	3rd Div		Tauentzein	10	Prussia	1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
3176	153	24	3rd_Div.Cav_Bde_Prince_Clement	Cav Bde Prince Clement			10	Prussia	3	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	700	0	0	0	2	4	0	0	f	f	f	0	0	f	2	0
3188	153	24	3rd_Div.Lt_Bty	Lt Bty			10	Prussia	4	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	6	0	f	f	f	0	4	f	2	3
3177	153	24	3rd_Div.Rosen_Fusilers	Rosen Fusilers			10	Prussia	2	2	4	9	1	1	f	f	f	f	f	f	f	400	0	0	f	f	1	0	0	2	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
3187	153	24	3rd_Div.von_Schoeneberg	von Schöneberg			10	Saxony	2	2	4	1	1	1	f	f	f	f	f	f	f	3400	0	0	f	f	1	2	1	0	f	0	0	5	0	0	0	0	0	0	2	0	f	f	f	0	4	f	2	4
3180	153	24	Reserve_Div	Reserve Div		Prittwitz	10	Prussia	1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
3179	153	24	Reserve_Div.Cav_Bde_von_Krafft	Cav Bde von Krafft			10	Prussia	3	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	900	0	0	0	12	3	0	0	f	f	f	0	0	f	2	0
3181	153	24	Reserve_Div.Heavy_Bty	Heavy Bty			10	Prussia	4	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	8	0	f	f	f	0	1	f	2	3
3137	151	24	1st_Div	1st Div			10		1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
3141	151	24	1st_Div.2nd_Regt	2nd Regt			10	France	2	2	4	3	1	1	f	f	f	f	f	f	f	1800	0	0	f	f	1	0	0	0	f	0	0	6	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
3136	151	24	1st_Div.3rd_special_regt	3rd special regt			10		2	2	4	3	1	1	f	f	f	f	f	f	f	1800	0	0	f	f	1	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
3165	152	24	2nd_Div.Bde_von_Renouard	Bde von Renouard	Alt-Braun Grenadier Battalion Prince Louis Infantry Regiment # 20, two battalions Brunswick Infantry Regiment # 21, two battalions		10	Prussia	2	2	4	1	1	1	f	f	f	f	f	f	f	4500	0	0	f	f	1	2	2	0	f	0	0	4	0	0	0	0	0	0	6	0	f	f	f	0	3	f	2	3
3172	152	24	2nd_Div.Kurrassier_Bde_von_Quitzow	Kurrassier Bde von Quitzow	Quitzow Cuirassier Regiment # 6, five squadrons Reitzenstein Cuirassier Regiment # 7, five squadrons		10	Prussia	3	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	1800	0	0	0	1	2	0	0	f	f	f	0	0	f	2	0
3166	152	24	2nd_Div.Merkatz	Merkatz	Merkatz Horse Artillery Bty		10	Prussia	4	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	6	0	f	f	f	0	4	t	2	2
3159	152	24	3rd_Division	3rd Division		von Schmettau	10	Prussia	1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
3173	152	24	3rd_Division.Bde_von_Alvensleben	Bde von Alvensleben	Schack Grenadier Battalion Alvensleben Infantry Regiment # 33, two battalions Prince Heinrich Infantry Regiment # 35, two battalions		10	Prussia	2	2	4	1	1	1	f	f	f	f	f	f	f	4500	0	0	f	f	1	3	0	2	f	0	0	4	0	0	0	0	0	0	6	0	f	f	f	0	3	f	2	3
3170	152	24	3rd_Division.Bde_von_Schimonsky	Bde von Schimonsky	Krafft Grenadier Battalion Malschitsky Infantry Regiment # 28, two battalions Schimonsky Infantry Regiment # 40, two battalions		10	Prussia	2	2	4	1	1	1	f	f	f	f	f	f	f	4500	0	0	f	f	1	3	0	2	f	0	0	4	0	0	0	0	0	0	6	0	f	f	f	0	3	f	2	3
3158	152	24	Adv_Guard.Lt_Bde_Oswald	Lt Bde Oswald	Weimar Fusilier Battalion Greiffenberg Fusilier Battalion # 4 Oswald Fusilier Battalion # 14 Kloch Fusilier Battalion # 18		10	Prussia	2	2	4	9	1	1	f	f	f	f	f	f	f	2300	0	0	f	f	1	3	0	4	f	0	0	4	0	0	0	0	0	0	6	0	f	f	f	0	3	f	2	3
3162	152	24	Cav_Bde_Blucher	Cav Bde Blucher	Bluchers cav bde as part of the advance guard	Blucher	10	Prussia	1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
3161	152	24	Cav_Bde_Blucher.Blucher_Hussar_Regt_Nr_8	Blucher Hussar Regt Nr 8			10	Prussia	3	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	1500	0	0	0	2	3	0	0	f	f	f	0	0	f	2	0
3163	152	24	Cav_Bde_Blucher.Irwing_Dragoon_Nr_3	Irwing Dragoon Nr 3			10	Prussia	3	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	600	0	0	0	5	4	0	0	f	f	f	0	0	f	2	0
3164	152	24	Cav_Bde_Blucher.Schorlemmer	Schorlemmer	Schorlemmer Horse Bty		10	Prussia	4	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	8	0	f	f	f	0	3	t	2	3
3160	152	24	Cav_Bde_Blucher.Wurttemberg_Hussars_Nr_4	Württemberg Hussars Nr 4	Württemberg Hussar Regiment # 4		10	Prussia	3	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	1500	0	0	0	2	3	0	0	f	f	f	0	0	f	2	0
3202	154	24	Adv_Guard	Adv Guard	part of the OOB, but they didnt make it to the actual battle	von Winning	10	Prussia	1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
3205	154	24	Adv_Guard.Bde_von_Winning	Bde von Winning	Kaiserlingk Fusilier Battalion # 1 Bila Fusilier Battalion # 2 Tschammer Infantry Regiment # 27, two battalions Two Foot Jäger companies		10	Prussia	2	2	4	9	1	1	f	f	f	f	f	f	f	3600	0	0	f	f	1	3	0	2	f	0	0	4	0	0	0	0	0	0	8	0	f	f	f	0	3	f	2	3
3204	154	24	Adv_Guard.Bde_von_Wobeser	Bde von Wobeser	Ernst Fusilier Battalion # 19 One Foot Jäger company Wobeser Dragoon Regiment # 14, five squadrons Lehmann Horse Artillery Battery # 4 (-), four 4-pound guns		10	Prussia	2	2	4	9	1	1	f	f	f	f	f	f	f	800	0	0	f	f	1	3	0	1	f	0	0	4	750	0	0	0	5	4	4	0	f	f	f	0	4	f	2	2
3206	154	24	Adv_Guard.Bty_Nr_19	Bty Nr 19			10	Prussia	4	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	8	0	f	f	f	0	3	f	2	3
3203	154	24	Corps_de_Bataille	Corps de Bataille		General Karl August, Grand Duke of Saxe-Weimar-Eisenach	10	Prussia	1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
3207	154	24	Corps_de_Bataille.2nd_Bde	2nd Bde	Hellmann Grenadier Battalion Treuenfels Infantry Regiment # 29, two battalions Strachwitz Infantry Regiment # 43, two battalions		10	Prussia	2	2	4	1	1	1	f	f	f	f	f	f	f	4400	0	0	f	f	1	2	2	0	f	0	0	4	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
3201	154	24	Corps_de_Bataille.3rd_Bde	3rd Bde	Sobbe Fusilier Battalion # 18 Wedell Infantry Regiment # 10, two battalions Tschepe Infantry Regiment # 37, two battalions		10	Prussia	2	2	4	1	1	1	f	f	f	f	f	f	f	4400	0	0	f	f	1	0	0	1	f	0	0	4	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
3169	152	24	1st_Div.Bde_von_Lutzow	Bde von Lützow	Knebel Grenadier Battalion Möllendorf Infantry Regiment # 25, two battalions Wartensleben Infantry Regiment # 59, two battalions		10	Prussia	2	2	4	1	1	1	f	f	f	f	f	f	f	4500	0	0	f	f	1	2	2	0	f	0	0	4	0	0	0	0	0	0	6	0	f	f	f	0	3	f	2	3
3171	152	24	1st_Div.Cav_Bde_Prinz_Wilhelm	Cav Bde Prinz Wilhelm	Leib Carabinier Regiment # 12, five squadrons Garde du Corps Cuirassier Regiment # 14, five squadrons		10	Prussia	3	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	1500	0	0	0	1	2	0	0	f	f	f	0	0	f	2	0
3174	152	24	1st_Div.Willmann	Willmann	Willmann Horse Bty		10	Prussia	4	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	6	0	f	f	f	0	4	t	2	2
3227	155	24	2nd_Div.Md_Foot_Bty	Md Foot Bty			10	Prussia	4	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	8	0	f	f	f	0	3	f	2	1
3225	155	24	2nd_Div.Pirch_Regt_Musketeer	Pirch Regt Musketeer			10	Prussia	2	2	1	1	1	1	f	f	f	f	f	f	f	1800	0	0	f	f	1	0	0	1	f	0	0	4	0	0	0	0	0	0	2	0	f	f	f	0	4	f	2	1
3222	155	24	2nd_Div.von_Zenge_Grenadiers	von Zenge Grenadiers			10	Prussia	2	2	1	1	1	1	f	f	f	f	f	f	f	1800	0	0	f	f	1	0	0	1	f	0	0	4	0	0	0	0	0	0	2	0	f	f	f	0	4	f	2	1
3193	153	24	1st_Div.Horse_Bty	Horse Bty			10	Prussia	4	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	8	0	f	f	f	0	3	f	2	3
3195	153	24	1st_Div.von_Mueffling	von Müffling			10	Prussia	2	2	4	1	1	1	f	f	f	f	f	f	f	3600	0	0	f	f	1	2	1	0	f	0	0	4	0	0	0	0	0	0	2	0	f	f	f	0	4	f	2	3
3200	153	24	2nd_Div.Boguslawsky_Fusilers	Boguslawsky Fusilers			10	Prussia	2	2	4	9	1	1	f	f	f	f	f	f	f	800	0	0	f	f	1	2	2	2	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
3189	153	24	2nd_Div.Heavy_Bty	Heavy Bty			10	Saxony	4	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	8	0	f	f	f	0	1	f	2	3
3194	153	24	2nd_Div.Horse_Bty	Horse Bty			10	Saxony	4	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	8	0	f	f	f	0	3	f	2	3
3198	153	24	2nd_Div.von_Dyherrn	von Dyherrn			10	Saxony	2	2	4	3	1	1	f	f	f	f	f	f	f	4200	0	0	f	f	1	2	1	0	f	0	0	4	0	0	0	0	0	0	2	0	f	f	f	0	4	f	2	3
3196	153	24	3rd_Div.von_Zweiffel	von Zweiffel			10	Prussia	2	2	4	1	1	1	f	f	f	f	f	f	f	3400	0	0	f	f	1	2	1	0	f	0	0	4	0	0	0	0	0	0	2	0	f	f	f	0	4	f	2	3
3191	153	24	Reserve_Div.Cerrini_Grenadier_Bde	Cerrini Grenadier Bde			10	Prussia	2	2	4	1	1	1	f	f	f	f	f	f	f	4200	0	0	f	f	1	0	0	2	f	0	0	4	0	0	0	0	0	0	2	0	f	f	f	0	4	f	2	3
3190	153	24	Reserve_Div.Md_Foot_Bty	Md Foot Bty			10	Prussia	4	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	8	0	f	f	f	0	3	f	2	4
3192	153	24	Reserve_Div.Prittwitz_Grenadier_Bde	Prittwitz Grenadier Bde			10	Prussia	2	2	4	1	1	1	f	f	f	f	f	f	f	3300	0	0	f	f	1	0	0	2	f	0	0	4	0	0	0	0	0	0	2	0	f	f	f	0	4	f	2	3
3216	155	24	1st_Div	1st Div		Kuhnheim	10	Prussia	1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
3218	155	24	1st_Div.Beeren_Cuirassier	Beeren Cuirassier			10	Prussia	3	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	400	0	0	0	1	2	0	0	f	f	f	0	0	f	2	0
3217	155	24	1st_Div.Garde_du_Corps_Cavalry	Garde du Corps Cavalry			10	Prussia	3	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	600	0	0	0	1	1	0	0	f	f	f	0	0	f	2	0
3221	155	24	1st_Div.Guard_Bde_von_Hirschfeld	Guard Bde von Hirschfeld			10	Prussia	2	2	1	1	1	1	f	f	f	f	f	f	f	2400	0	0	f	f	1	0	0	1	f	0	0	2	0	0	0	0	0	0	2	0	f	f	f	0	4	f	2	1
3220	155	24	1st_Div.Guard_Bde_von_Pletz	Guard Bde von Pletz			10	Prussia	2	2	4	1	1	1	f	f	f	f	f	f	f	2400	0	0	f	f	1	0	0	1	f	0	0	2	0	0	0	0	0	0	2	0	f	f	f	0	4	f	2	1
3226	155	24	1st_Div.Md_Foot_Bty	Md Foot Bty			10	Prussia	4	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	8	0	f	f	f	0	3	f	2	1
3219	155	24	2nd_Div	2nd Div		von Arnim	10	Prussia	1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
3224	155	24	2nd_Div.Arnim_Regt_Musketeer	Arnim Regt Musketeer			10	Prussia	2	2	1	1	1	1	f	f	f	f	f	f	f	1800	0	0	f	f	1	0	0	1	f	0	0	4	0	0	0	0	0	0	2	0	f	f	f	0	4	f	2	1
3223	155	24	2nd_Div.Zenge_Regt_Musketeer	Zenge Regt Musketeer			10	Prussia	2	2	1	1	1	1	f	f	f	f	f	f	f	1800	0	0	f	f	1	0	0	1	f	0	0	4	0	0	0	0	0	0	2	0	f	f	f	0	4	f	2	1
3228	155	24	2nd_Div.von_Malschitsky_Grenadiers	von Malschitsky Grenadiers			10	Prussia	2	2	4	1	1	1	f	f	f	f	f	f	f	1800	0	0	f	f	1	0	0	1	f	0	0	4	0	0	0	0	0	0	2	0	f	f	f	0	4	f	2	1
3197	153	24	1st_Div.von_Schimonsky	von Schimonsky			10	Prussia	2	2	4	1	1	1	f	f	f	f	f	f	f	3400	0	0	f	f	1	2	1	0	f	0	0	4	0	0	0	0	0	0	2	0	f	f	f	0	4	f	2	3
3199	153	24	2nd_Div.von_Burgsdorf	von Burgsdorf			10	Saxony	2	2	4	1	1	1	f	f	f	f	f	f	f	3400	0	0	f	f	1	2	1	0	f	0	0	4	0	0	0	0	0	0	1	0	f	f	f	0	4	f	2	3
3212	154	24	Corps_Artillery.Kirchfeld_Nr_16.Schaefer_Nr_17	Schaefer Nr 17			10	Prussia	4	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	8	0	f	f	f	0	3	f	2	3
3213	154	24	Corps_Artillery.Kirchfeld_Nr_16.Schaefer_Nr_17.Kirchfeld_Nr_16.Horse_Bty_Nr_11	Horse Bty Nr 11			10	Prussia	4	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	4	0	f	f	f	0	3	t	2	3
3209	154	24	Corps_de_Bataille.1st_Bde	1st Bde	Borstell Grenadier Battalion Schenck Infantry Regiment # 9, two battalions Winning Infantry Regiment # 23, two battalions		10	Prussia	2	2	4	1	1	1	f	f	f	f	f	f	f	4400	0	0	f	f	1	2	2	0	f	0	0	4	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
3211	154	24	Corps_de_Bataille.Bailliodz_Cuirassier_Nr_5	Bailliodz Cuirassier Nr 5			10	Prussia	3	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	800	0	0	0	1	2	0	0	f	f	f	0	0	f	2	0
3210	154	24	Corps_de_Bataille.Katte_Dragoon_Regt_Nr_4	Katte Dragoon Regt Nr 4			10	Prussia	3	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	800	0	0	0	5	4	0	0	f	f	f	0	0	f	2	0
3232	156	24	1st_Div	1st Div		von Natzmer	10	Prussia	1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
3238	156	24	1st_Div.Foot_Bti	Foot Bti			10	Prussia	4	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	12	0	f	f	f	0	3	f	2	3
3245	156	24	1st_Div.Grenadier_Bde	Grenadier Bde	Schmeling Grenadier Battalion Crety Grenadier Battalion		10	Prussia	2	2	4	1	1	1	f	f	f	f	f	f	f	1800	0	0	f	f	1	0	0	0	f	0	0	2	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
3235	156	24	1st_Div.Musketeer_Bde	Musketeer Bde	Treskow Infantry Regiment # 17, two battalions Kauffberg Infantry Regiment # 51, two battalions Natzmer Infantry Regiment # 54, two battalions		10	Prussia	2	2	4	1	1	1	f	f	f	f	f	f	f	5400	0	0	f	f	1	2	3	0	f	0	0	4	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
3233	156	24	2nd_Div	2nd Div		von Larisch	10	Prussia	1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
3241	156	24	2nd_Div.1st_Line	1st Line	Vieregg Grenadier Battalion Kalckreuth Infantry Regiment # 4, two battalions		10	Prussia	2	2	4	1	1	1	f	f	f	f	f	f	f	1800	0	0	f	f	1	2	1	0	f	0	0	4	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
3244	156	24	2nd_Div.2nd_Line	2nd Line	Jung-Larisch Infantry Regiment # 53, two battalions Manstein Infantry Regiment # 55, two battalions		10	Prussia	2	2	4	1	1	1	f	f	f	f	f	f	f	3600	0	0	f	f	1	2	2	0	f	0	0	4	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
3240	156	24	2nd_Div.Foot_Bty	Foot Bty			10	Prussia	4	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	12	0	f	f	f	0	3	f	2	3
3230	156	24	Adv_Guard	Adv Guard		General-Major Johann von Hinrichs	10	Prussia	1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
3236	156	24	Adv_Guard.Dragoons	Dragoons	Hertzberg Dragoon Regiment # 9, one squadron Katte Dragoon Regiment # 10, one squadron		10	Prussia	3	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	300	0	0	0	5	4	0	0	f	f	f	0	0	f	2	0
3234	156	24	Adv_Guard.Fusilier_Bde	Fusilier Bde	Borstell Fusilier Battalion # 9 Knorr Fusilier Battalion # 12 Hinrichs Fusilier Battalion # 17		10		2	2	4	9	1	1	f	f	f	f	f	f	f	2700	0	0	f	f	1	0	0	-3	f	0	0	4	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
3242	156	24	Adv_Guard.Horse_Bty	Horse Bty			10	Prussia	4	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	2	0	f	f	f	0	4	t	2	4
3239	156	24	Adv_Guard.Usedom_Hussar_Nr_10	Usedom Hussar Nr 10			10	Prussia	3	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	300	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
3231	156	24	New_Division				10		1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
3229	156	24	Reserve_Cavalry	Reserve Cavalry			10	Prussia	1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
3243	156	24	Reserve_Cavalry.Dragoons	Dragoons	Hertzberg Dragoon Regiment # 9, four squadrons Katte Dragoon Regiment # 10, four squadrons		10	Prussia	3	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	1200	0	0	0	5	4	0	0	f	f	f	0	0	f	2	0
3246	156	24	Reserve_Cavalry.Horse_Bty	Horse Bty			10	Prussia	4	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	6	0	f	f	f	0	4	t	2	3
3237	156	24	Reserve_Cavalry.Usedom_Hussar_Nr_10	Usedom Hussar Nr 10			10	Prussia	3	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	1200	0	0	0	2	4	0	0	f	f	f	0	0	f	2	0
3208	154	24	Adv_Guard.Horse_Bty_Nr_12	Horse Bty Nr 12			10	Prussia	4	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	8	0	f	f	f	0	4	t	2	3
3214	154	24	Corps_Artillery	Corps Artillery			10	Prussia	1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
3215	154	24	Corps_Artillery.Kirchfeld_Nr_16	Kirchfeld Nr 16			10	Prussia	4	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	8	0	f	f	f	0	3	f	2	3
3030	144	24	1e_Cuirassier_Div	1e Cuirassier Div		Nansouty	10	France	1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
2978	141	24	1eme_Division	1eme Division		St Hilaire	10	France	1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
3085	147	24	Cavalry_Division.Chasseurs_a_Cheval	Chasseurs a Cheval			10	France	3	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	600	0	0	0	3	1	0	0	f	f	f	0	0	f	2	0
3042	144	24	1e_Cuirassier_Div.Bde_Defrance	Bde Defrance			10	France	3	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	600	0	0	0	9	2	0	0	f	f	f	0	0	f	2	0
3048	144	24	3e_Dragoon_Div.Bde_Boye	Bde Boye			10	France	3	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	900	0	0	0	5	5	0	0	f	f	f	0	0	f	2	0
3052	144	24	4e_Dragoon_Div.Bde_Laplanche	Bde Laplanche	18th Dragoon Regiment, 1st, 2nd, and 3rd squadrons 19th Dragoon Regiment, 1st, 2nd, and 3rd squadrons		10	France	3	2	1	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	1200	0	0	0	5	5	0	0	f	f	f	0	0	f	2	0
3106	148	24	1eme_Division	1eme Division		de l'Eltang	10	France	1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
3167	152	24	1st_Div.Bde_Prinz_Henry	Bde Prinz Henry	Rheinbaben Grenadier Battalion Prince Ferdinand Infantry Regiment # 34, two battalions Puttkammer Infantry Regiment # 36, two battalions		10	Prussia	2	2	4	1	1	1	f	f	f	f	f	f	f	4500	0	0	f	f	1	2	2	0	f	0	0	4	0	0	0	0	0	0	6	0	f	f	f	0	3	f	2	3
3104	148	24	1eme_Division.32e_Ligne	32e Ligne		de l'Eltang	10	France	2	2	4	5	1	1	f	f	f	f	f	f	f	2000	0	0	f	f	1	0	0	0	f	0	0	4	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
3091	147	24	Cavalry_Division	Cavalry Division		Bessieres	10	France	1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	1	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
3139	151	24	1st_Div.1st_Regt	1st Regt			10		2	2	4	3	1	1	f	f	f	f	f	f	f	1800	0	0	f	f	1	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1666	37	4	Adv_Guard_Div	Adv Guard Div		Ferdinand	10	Prussia	1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
1667	37	4	Adv_Guard_Div.Bde_von_Pelet	Bde von Pelet	Rabenau # 13 Pelet # 14 Rühle # 15 Fusiliers, Masars and Valentin Jager 		10	Prussia	2	2	4	9	1	1	f	f	f	f	f	f	f	2400	0	0	f	f	1	0	0	2	f	0	0	4	0	0	0	0	0	0	6	0	f	f	f	0	3	f	2	3
3040	144	24	Light_Div.Bde_Lasalle_5_7e_Hussar	Bde Lasalle 5/7e Hussar			10	France	3	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	600	0	0	0	2	3	0	0	f	f	f	0	0	f	2	0
3168	152	24	2nd_Div.Bde_von_Wedel	Bde von Wedel	Hanstein Grenadier Battalion Renouard Infantry Regiment # 3, two battalions Kleist Infantry Regiment # 5, two battalions Wilkins Foot Artillery battery, six 8-pound guns		10	Prussia	2	2	4	1	1	1	f	f	f	f	f	f	f	4500	0	0	f	f	1	2	2	0	f	0	0	4	0	0	0	0	0	0	6	0	f	f	f	0	3	f	2	3
1671	38	4	1eme_Division.13e_Legere	13e Legere			10	France	2	3	4	6	1	1	f	f	f	f	f	f	f	1372	0	0	f	f	1	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1708	40	4	Cav_Reserve	Cav Reserve		Tilley	10	France	1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
1784	44	4	1st_Div.Cav_Bde_Prinz_Wilhelm	Cav Bde Prinz Wilhelm	Leib Carabinier Regiment # 12, five squadrons Garde du Corps Cuirassier Regiment # 14, five squadrons		10	Prussia	3	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	2	1500	0	0	0	1	2	0	0	f	f	f	0	0	f	2	0
1785	44	4	2nd_Div.Kurrassier_Bde_von_Quitzow	Kurrassier Bde von Quitzow	Quitzow Cuirassier Regiment # 6, five squadrons Reitzenstein Cuirassier Regiment # 7, five squadrons		10	Prussia	3	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	2	1800	0	0	0	1	2	0	0	f	f	f	0	0	f	2	0
1786	44	4	3rd_Division.Bde_von_Alvensleben	Bde von Alvensleben	Schack Grenadier Battalion Alvensleben Infantry Regiment # 33, two battalions Prince Heinrich Infantry Regiment # 35, two battalions		10	Prussia	2	2	4	1	1	1	f	f	f	f	f	f	f	4500	0	0	f	f	1	3	0	2	f	0	0	4	0	0	0	0	0	0	6	0	f	f	f	0	3	f	2	3
1841	47	4	2nd_Div.von_Malschitsky_Grenadiers	von Malschitsky Grenadiers			10	Prussia	2	2	4	1	1	1	f	f	f	f	f	f	f	1728	0	0	f	f	1	0	0	1	f	0	0	4	0	0	0	0	0	0	2	0	f	f	f	0	4	f	2	1
1787	44	4	1st_Div.Willmann	Willmann	Willmann Horse Bty		10	Prussia	4	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	6	0	f	f	f	0	4	t	2	2
1773	44	4	Cav_Bde_Blucher.Blucher_Hussar_Regt_Nr_8	Blucher Hussar Regt Nr 8			10	Prussia	3	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	1500	0	0	0	2	3	0	0	f	f	f	0	0	f	2	0
1775	44	4	Cav_Bde_Blucher.Irwing_Dragoon_Nr_3	Irwing Dragoon Nr 3			10	Prussia	3	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	600	0	0	0	5	4	0	0	f	f	f	0	0	f	2	0
1779	44	4	1st_Div.Bde_Prinz_Henry	Bde Prinz Henry	Rheinbaben Grenadier Battalion Prince Ferdinand Infantry Regiment # 34, two battalions Puttkammer Infantry Regiment # 36, two battalions		10	Prussia	2	2	4	1	1	1	f	f	f	f	f	f	f	4500	0	0	f	f	1	2	2	0	f	0	0	4	0	0	0	0	0	0	6	0	f	f	f	0	3	f	2	3
1777	44	4	2nd_Div.Bde_von_Renouard	Bde von Renouard	Alt-Braun Grenadier Battalion Prince Louis Infantry Regiment # 20, two battalions Brunswick Infantry Regiment # 21, two battalions		10	Prussia	2	2	4	1	1	1	f	f	f	f	f	f	f	4500	0	0	f	f	1	2	2	0	f	0	0	4	0	0	0	0	0	0	6	0	f	f	f	0	3	f	2	3
1780	44	4	2nd_Div.Bde_von_Wedel	Bde von Wedel	Hanstein Grenadier Battalion Renouard Infantry Regiment # 3, two battalions Kleist Infantry Regiment # 5, two battalions Wilkins Foot Artillery battery, six 8-pound guns		10	Prussia	2	2	4	1	1	1	f	f	f	f	f	f	f	4500	0	0	f	f	1	2	2	0	f	0	0	4	0	0	0	0	0	0	6	0	f	f	f	0	3	f	2	3
1774	44	4	Cav_Bde_Blucher	Cav Bde Blucher	Bluchers cav bde as part of the advance guard	Blucher	10	Prussia	1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
1684	38	4	3eme_Division.21e_Ligne	21e Ligne			10	France	2	3	1	5	1	1	f	f	f	f	f	f	f	1746	0	0	f	f	1	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1829	47	4	1st_Div	1st Div		Kuhnheim	10	Prussia	1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
1831	47	4	1st_Div.Beeren_Cuirassier	Beeren Cuirassier			10	Prussia	3	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	2	400	0	0	0	1	2	0	0	f	f	f	0	0	f	2	0
1832	47	4	2nd_Div	2nd Div		von Arnim	10	Prussia	1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
1830	47	4	1st_Div.Garde_du_Corps_Cavalry	Garde du Corps Cavalry			10	Prussia	3	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	1	600	0	0	0	1	1	0	0	f	f	f	0	0	f	2	0
1833	47	4	1st_Div.Guard_Bde_von_Pletz	Guard Bde von Pletz			10	Prussia	2	2	4	1	1	1	f	f	f	f	f	f	f	2400	0	0	f	f	1	0	0	1	f	0	0	2	0	0	0	0	0	0	2	0	f	f	f	0	4	f	2	1
1578	31	4	6th_Div	6th Div			10	Norman	1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
1579	31	4	6th_Div.44th_Light_Fusilier	44th Light Fusilier			10	Norman	2	2	4	4	1	1	f	f	f	f	f	f	f	2200	0	0	f	f	1	3	0	1	f	0	0	4	0	0	0	0	0	0	2	0	f	f	f	0	4	f	2	3
1580	31	4	6th_Div.Devil_Bde	Devil Bde	oeu		10		5	2	6	9	1	1	f	f	f	f	f	f	f	200	0	0	f	f	1	2	1	1	f	0	0	3	80	0	0	0	10	5	0	0	f	f	f	0	0	f	2	0
1669	37	4	Adv_Guard_Div.Bde_Belvilaqua	Bde Belvilaqua	Combined Bns from IR 49,  Prinz Clemens (saxon), and Kurfurst (saxon)		10	Prussia/Saxony	2	2	4	1	1	1	f	f	f	f	f	f	f	5100	0	0	f	f	1	2	1	0	f	0	0	5	0	0	0	0	0	0	6	0	f	f	f	0	4	f	2	3
1683	38	4	3eme_Division.12e_Ligne	12e Ligne			10	France	2	3	1	5	1	1	f	f	f	f	f	f	f	1287	0	0	f	f	1	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1685	38	4	3eme_Division.25e_Ligne	25e Ligne			10	France	2	3	1	5	1	1	f	f	f	f	f	f	f	1764	0	0	f	f	1	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1687	38	4	Cav_Bde.1e_Chasseur	1e Chasseur			10	France	3	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	600	0	0	0	3	3	0	0	f	f	f	0	0	f	2	0
1688	38	4	Cav_Bde.2e_Chasseur	2e Chasseur			10	France	3	2	1	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	600	0	0	0	3	3	0	0	f	f	f	0	0	f	2	0
1677	38	4	1eme_Division.30e_Ligne	30e Ligne			10	France	2	3	1	5	1	1	f	f	f	f	f	f	f	1764	0	0	f	f	1	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1714	40	4	3eme_Division.94e_Ligne	94e Ligne		Drouet	10	France	2	2	4	5	1	1	f	f	f	f	f	f	f	1500	0	0	f	f	1	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1711	40	4	Artillery_Reserve	Artillery Reserve		Eble	10	France	1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
1722	40	4	Artillery_Reserve.Md_Foot_Bty	Md Foot Bty			10		4	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	8	0	f	f	f	0	3	f	2	2
1691	38	4	1eme_Division.Md_Foot_Bty	Md Foot Bty			10		4	3	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	7	0	f	f	f	0	3	f	2	2
1726	40	4	1eme_Division.Md_Foot_Bty	Md Foot Bty			10		4	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	0	0	0	0	0	0	0	8	0	f	f	f	0	3	f	2	3
1727	40	4	2eme_Division.Md_Foot_Bty	Md Foot Bty			10		4	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	0	0	0	0	0	0	0	8	0	f	f	f	0	3	f	2	3
1728	40	4	2eme_Division.Md_Foot_Bty_Copy	Md Foot Bty_Copy			10		4	2	1	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	0	0	0	0	0	0	0	8	0	f	f	f	0	3	f	2	3
1724	40	4	3eme_Division.Md_Foot_Bty	Md Foot Bty			10		4	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	0	0	0	0	0	0	0	8	0	f	f	f	0	3	f	2	3
1772	44	4	Cav_Bde_Blucher.Wurttemberg_Hussars_Nr_4	Württemberg Hussars Nr 4	Württemberg Hussar Regiment # 4		10	Prussia	3	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	1500	0	0	0	2	3	0	0	f	f	f	0	0	f	2	0
1836	47	4	2nd_Div.Zenge_Regt_Musketeer	Zenge Regt Musketeer			10	Prussia	2	2	1	1	1	1	f	f	f	f	f	f	f	1746	0	0	f	f	1	0	0	1	f	0	0	4	0	0	0	0	0	0	2	0	f	f	f	0	4	f	2	1
1768	44	4	1st_Div	1st Div		Pr Wiliam of Orange	10	Prussia	1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
1778	44	4	2nd_Div.Merkatz	Merkatz	Merkatz Horse Artillery Bty		10	Prussia	4	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	6	0	f	f	f	0	4	t	2	2
1782	44	4	3rd_Division.Bde_von_Schimonsky	Bde von Schimonsky	Krafft Grenadier Battalion Malschitsky Infantry Regiment # 28, two battalions Schimonsky Infantry Regiment # 40, two battalions		10	Prussia	2	2	4	1	1	1	f	f	f	f	f	f	f	4500	0	0	f	f	1	3	0	2	f	0	0	4	0	0	0	0	0	0	6	0	f	f	f	0	3	f	2	3
1581	32	4	Supply_Train	Supply Train		von Schulze	10	Prussia	1	2	6	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
1839	47	4	1st_Div.Md_Foot_Bty	Md Foot Bty			10	Prussia	4	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	8	0	f	f	f	0	3	f	2	1
1837	47	4	2nd_Div.Arnim_Regt_Musketeer	Arnim Regt Musketeer			10	Prussia	2	2	1	1	1	1	f	f	f	f	f	f	f	1692	0	0	f	f	1	0	0	1	f	0	0	4	0	0	0	0	0	0	2	0	f	f	f	0	4	f	2	1
1840	47	4	2nd_Div.Md_Foot_Bty	Md Foot Bty			10	Prussia	4	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	7	0	f	f	f	0	3	f	2	1
1838	47	4	2nd_Div.Pirch_Regt_Musketeer	Pirch Regt Musketeer			10	Prussia	2	2	1	1	1	1	f	f	f	f	f	f	f	1710	0	0	f	f	1	0	0	1	f	0	0	4	0	0	0	0	0	0	2	0	f	f	f	0	4	f	2	1
1582	32	4	Supply_Train.Guard_Detachment	Guard Detachment			10		5	2	6	8	1	1	f	f	f	f	f	f	f	300	0	0	f	f	1	2	4	0	f	0	0	10	60	0	0	0	12	7	0	0	f	f	f	0	0	f	2	0
\.


--
-- Name: unit_id_seq; Type: SEQUENCE SET; Schema: public; Owner: steve
--

SELECT pg_catalog.setval('unit_id_seq', 3246, true);


--
-- PostgreSQL database dump complete
--

