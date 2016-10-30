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
1723	40	4	3eme_Division.27e_Legere	27e Legere		Drouet	10	France	2	2	4	6	1	1	f	f	f	f	f	f	f	1500	0	0	f	f	1	2	2	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	4	f	2	0
1783	44	4	3rd_Division.Cav_Bde_von_Irwing	Cav Bde von Irwing	Königin Dragoon Regiment # 5, ten squadrons Graumann Horse Artillery Battery, six guns		10	Prussia	3	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	1500	0	0	0	5	4	6	0	f	f	f	0	4	f	2	3
2829	127	21	1st_Div.von_Schimonsky	von Schimonsky			10	Prussia	2	2	4	1	1	1	f	f	f	f	f	f	f	3400	0	0	f	f	1	2	1	0	f	0	0	4	0	0	0	0	0	0	2	0	f	f	f	0	4	f	2	3
2816	127	21	2nd_Div	2nd Div		Zechwitz	10	Prussia	1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
2832	127	21	2nd_Div.Boguslawsky_Fusilers	Boguslawsky Fusilers			10	Prussia	2	2	4	9	1	1	f	f	f	f	f	f	f	800	0	0	f	f	1	2	2	2	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
2818	127	21	2nd_Div.Cav_Bde_von_Kochitsky	Cav Bde von Kochitsky			10	Saxony	3	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	200	0	0	0	1	3	0	0	f	f	f	0	0	f	2	0
1719	40	4	1eme_Division	1eme Division		de l'Eltang	10	France	1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
1717	40	4	1eme_Division.32e_Ligne	32e Ligne		de l'Eltang	10	France	2	2	4	5	1	1	f	f	f	f	f	f	f	2000	0	0	f	f	1	0	0	0	f	0	0	4	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1725	40	4	1eme_Division.9e_Legere	9e Legere		de l'Eltang	10	France	2	2	4	6	1	1	f	f	f	f	f	f	f	2600	0	0	f	f	1	2	0	0	f	0	0	4	0	0	0	0	0	0	0	0	f	f	f	0	4	f	2	0
1781	44	4	1st_Div.Bde_von_Lutzow	Bde von Lützow	Knebel Grenadier Battalion Möllendorf Infantry Regiment # 25, two battalions Wartensleben Infantry Regiment # 59, two battalions		10	Prussia	2	2	4	1	1	1	f	f	f	f	f	f	f	4500	0	0	f	f	1	2	2	0	f	0	0	4	0	0	0	0	0	0	6	0	f	f	f	0	3	f	2	3
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
2357	88	15	1st_Div.Reserve_Bde	Reserve Bde	Froon IR #54 (two fusilier battalions that had suffered greatly at Haslach-Jungingen) Froon IR #54 (one grenadier battalion only lightly engaged at Haslach-Jungingen) Josef Colloredo IR #57 (one grenadier battalion) Cuirassier Regt Hohenzollern #8 (two squadrons)		10	Austria	2	2	4	3	1	1	f	f	f	f	f	f	f	3100	0	0	f	f	1	0	0	0	f	0	0	5	300	0	0	0	1	2	0	0	f	f	f	0	0	f	2	0
2358	88	15	1st_Div.Centre_Bde	Centre Bde	GM Genedegh Karl Riese IR #15 (four fusilier battalions, somewhat reduced from action at Haslach-Jungingen) Erzherzog Maximilien IR #35 (four fusilier battalions) Cuirassier Regt Hohenzollern #8 (two squadrons) Uhlanen-Regt Schwarzenberg #2 (one squadron of approx 150 men)		10	Austria	2	2	4	3	1	1	f	f	f	f	f	f	f	3600	0	0	f	f	1	0	0	0	f	0	0	5	400	0	0	0	1	3	0	0	f	f	f	0	0	f	2	0
2359	88	15	1st_Div.Avantgarde	Avantgarde	Erzherzog Ludwig IR #8 (three fusilier and one grenadier battalions, reduced strength from casualties at Haslach-Jungingen) Hussar Regt Blankenstein #6 (two squadrons)		10	Austria	2	2	4	3	1	1	f	f	f	f	f	f	f	3400	0	0	f	f	1	0	0	0	f	0	0	5	300	0	0	0	2	3	0	0	f	f	f	0	0	f	2	0
2360	88	15	2nd_Div	2nd Div		von Hessen-Homburg	10	Austria	1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
2361	88	15	1st_Div	1st Div		von Loudon	10	Austria	1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
2632	116	21	1eme_Division	1eme Division		Suchet	10	France	1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
2337	87	15	4eme_Dragoon_Division.25e_Dragoon_Regt	25e Dragoon Regt			10	France	3	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	240	0	0	0	5	4	0	0	f	f	f	0	0	f	2	0
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
1666	37	4	Adv_Guard_Div	Adv Guard Div		Ferdinand	10	Prussia	1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
1667	37	4	Adv_Guard_Div.Bde_von_Pelet	Bde von Pelet	Rabenau # 13 Pelet # 14 Rühle # 15 Fusiliers, Masars and Valentin Jager 		10	Prussia	2	2	4	9	1	1	f	f	f	f	f	f	f	2400	0	0	f	f	1	0	0	2	f	0	0	4	0	0	0	0	0	0	6	0	f	f	f	0	3	f	2	3
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

SELECT pg_catalog.setval('unit_id_seq', 2907, true);


--
-- PostgreSQL database dump complete
--

