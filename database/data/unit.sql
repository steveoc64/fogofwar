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
1747	42	4	Supply_Train	Supply Train			10	France	1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
1783	44	4	3rd_Division.Cav_Bde_von_Irwing	Cav Bde von Irwing	Königin Dragoon Regiment # 5, ten squadrons Graumann Horse Artillery Battery, six guns		10	Prussia	3	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	1500	0	0	0	5	4	6	0	f	f	f	0	4	f	2	0
1889	3	6	2eme_Division	2eme Division		Louis Henri Loison	10	France	1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
1890	3	6	3eme_Division	3eme Division		Jean-Pierre Firmin Malher	10	France	1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
1893	3	6	4eme_Dragoon_Division.25e_Dragoon_Regt	25e Dragoon Regt			10	France	3	3	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	240	4	0	0	5	4	0	0	f	f	f	0	0	f	2	0
1891	3	6	Artillery_Reserve.1e_Regt_Foot_Hv	1e Regt Foot Hv	1st Regt of Foot Artillery (two companies armed with four 12-pound)		10	France	4	3	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	4	1	f	f	f	0	1	f	2	3
1892	3	6	Cav_Bde	Cav Bde		Colbert-Chabanais	10	France	1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
1905	3	6	2eme_Division.Foot_Bty.Horse_Bty	Horse Bty	One horse artillery section armed with one 4-pound cannon and one howitzer, total 89 men		10	France	4	3	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	2	1	f	f	f	0	4	t	2	3
1906	3	6	3eme_Division.Bde_Delabassee	Bde Delabassée	50th Line Infantry Regiment (two battalions, 1,547 men) 59th Line Infantry Regiment (two battalions, 1,621 men)		10	France	2	3	4	5	1	1	f	f	f	f	f	f	f	3200	192	0	f	f	1	0	0	0	f	0	0	4	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1907	3	6	3eme_Division.Mxed_Foot_Bty	Mxed Foot Bty	One foot company armed with one 12-pound, four 8-pound and one 4-pound cannons, 65 men		10		4	3	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	8	1	f	f	f	0	3	f	2	3
1902	3	6	2eme_Division.Bde_Villatte	Bde Villatte	6th Light Infantry Regiment (two battalions, 1,728 men) 39th Line Infantry Regiment (two battalions, 1,633 men)		10	France	2	3	4	5	1	1	f	f	f	f	f	f	f	3400	1088	0	f	f	1	0	0	0	f	0	0	4	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1900	3	6	4eme_Dragoon_Division.19e_Dragoon_Regt	19e Dragoon Regt			10	France	3	3	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	290	2	0	0	5	4	0	0	f	f	f	0	0	f	2	0
1901	3	6	Cav_Bde.10e_Chasseur	10e Chasseur			10	France	3	3	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	140	4	0	0	3	4	0	0	f	f	f	0	0	f	2	0
1916	4	6	2nd_Div	2nd Div		von Hessen-Homburg	10	Austria	1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
1903	3	6	2eme_Division.Bde_Roguet	Bde Roguet	69th Line Infantry Regiment (two battalion, 1,698 men) 76th Line Infantry Regiment (three battalions, 1,789 men)		10	France	2	3	4	5	1	1	f	f	f	f	f	f	f	3400	1496	0	f	f	1	0	0	0	f	0	0	4	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1895	3	6	4eme_Dragoon_Division	4eme Dragoon Division		Laplanche	10	France	1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
1897	3	6	4eme_Dragoon_Division.18e_Dragoon_Regt	18e Dragoon Regt			10	France	3	3	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	300	6	0	0	5	4	0	0	f	f	f	0	0	f	2	0
1896	3	6	Artillery_Reserve.2e_Regt_Horse_Bty	2e Regt Horse Bty	2nd Regt of Horse Artillery (two sections of the 1st company armed with two 8-pound cannons and two howitzers, 65 men)		10	France	4	3	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	4	1	f	f	f	0	3	t	2	3
1917	4	6	1st_Div	1st Div		von Loudon	10	Austria	1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
1894	3	6	Artillery_Reserve	Artillery Reserve		Colonel Jean Nicolas Seroux	10	France	1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
1160	3	14	Corps_Artillery	Corps Artillery		Careil	10	France	1	2	5	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
1161	3	14	Corps_Artillery.Heavy_Foot	Heavy Foot			10		4	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	8	0	f	f	f	0	1	f	2	2
1162	3	14	1eme_Division	1eme Division		Suchet	10	France	1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
1163	3	14	1eme_Division.17e_Legere	17e Legere			10	France	2	2	4	6	1	1	f	f	f	f	f	f	f	2100	0	0	f	f	1	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1164	3	14	1eme_Division.34e_Ligne	34e Ligne			10	France	2	2	4	5	1	1	f	f	f	f	f	f	f	2500	0	0	f	f	1	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1165	3	14	1eme_Division.40e_Ligne	40e Ligne			10	France	2	2	4	5	1	1	f	f	f	f	f	f	f	1800	0	0	f	f	1	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1166	3	14	1eme_Division.64e_Ligne	64e Ligne			10	France	2	2	1	5	1	1	f	f	f	f	f	f	f	1800	0	0	f	f	1	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1167	3	14	1eme_Division.88e_Ligne	88e Ligne			10	France	2	2	1	5	1	1	f	f	f	f	f	f	f	1800	0	0	f	f	1	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1168	3	14	2eme_Division	2eme Division		Gazan	10	France	1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
1169	3	14	2eme_Division.21e_Legere	21e Legere			10	France	2	2	4	6	1	1	f	f	f	f	f	f	f	1800	0	0	f	f	1	0	0	0	f	0	0	5	0	0	0	0	1	0	0	0	f	f	f	0	0	f	2	0
1170	3	14	2eme_Division.28e_Legere	28e Legere			10	France	2	2	4	6	1	1	f	f	f	f	f	f	f	900	0	0	f	f	1	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1171	3	14	2eme_Division.100e_Ligne	100e Ligne			10	France	2	2	4	3	1	1	f	f	f	f	f	f	f	1800	0	0	f	f	1	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1172	3	14	2eme_Division.103e_Ligne	103e Ligne			10	France	2	2	4	3	1	1	f	f	f	f	f	f	f	1800	0	0	f	f	1	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1173	4	14	Cav_Bde.9e_Hussar	9e Hussar			10	France	3	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	600	0	0	0	2	3	0	0	f	f	f	0	0	f	2	0
1174	4	14	1eme_Division.39e_Ligne	39e Ligne			10	France	2	2	4	5	1	1	f	f	f	f	f	f	f	1800	0	0	f	f	1	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1175	4	14	1eme_Division.69e_Ligne	69e Ligne			10	France	2	2	1	5	1	1	f	f	f	f	f	f	f	1800	0	0	f	f	1	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1904	3	6	2eme_Division.Foot_Bty	Foot Bty	One foot company armed with three 8-pound cannons and one howitzer		10	France	4	3	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	4	3	f	f	f	0	3	f	2	3
1913	4	6	1st_Div.Reserve_Bde	Reserve Bde	Froon IR #54 (two fusilier battalions that had suffered greatly at Haslach-Jungingen) Froon IR #54 (one grenadier battalion only lightly engaged at Haslach-Jungingen) Josef Colloredo IR #57 (one grenadier battalion) Cuirassier Regt Hohenzollern #8 (two squadrons)		10	Austria	2	2	4	3	1	1	f	f	f	f	f	f	f	4000	0	0	f	f	1	0	0	0	f	0	0	4	300	0	0	0	1	2	0	0	f	f	f	0	0	f	2	0
1908	3	6	3eme_Division.Bde_de_Marcognet	Bde de Marcognet	25th Light Infantry Regiment (three battalions, 1,540 men) 27th Line Infantry Regiment (two battalions, 1,347 men)		10	France	2	3	4	5	1	1	f	f	f	f	f	f	f	2900	174	0	f	f	1	0	0	0	f	0	0	4	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1914	4	6	1st_Div.Centre_Bde	Centre Bde	GM Genedegh Karl Riese IR #15 (four fusilier battalions, somewhat reduced from action at Haslach-Jungingen) Erzherzog Maximilien IR #35 (four fusilier battalions) Cuirassier Regt Hohenzollern #8 (two squadrons) Uhlanen-Regt Schwarzenberg #2 (one squadron of approx 150 men)		10	Austria	2	2	4	3	1	1	f	f	f	f	f	f	f	3600	0	0	f	f	1	0	0	0	f	0	0	5	400	0	0	0	1	3	0	0	f	f	f	0	0	f	2	0
1176	4	14	Cav_Bde.10e_Chasseur	10e Chasseur			10	France	3	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	600	0	0	0	3	4	0	0	f	f	f	0	0	f	2	0
1177	4	14	1eme_Division.76e_Ligne	76e Ligne			10	France	2	2	1	5	1	1	f	f	f	f	f	f	f	1800	0	0	f	f	1	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1910	4	6	2nd_Div.Center_Bde	Center Bde	Erzherzog Karl IR #3 (four fusilier battalions) Erzherzog Auersperg #24 (four fusilier battalions) Cuirassier Regt Erzherzog Franz #2 (one-and-a-half squadrons)		10	Austria	2	2	4	3	1	1	f	f	f	f	f	f	f	6000	0	0	f	f	1	0	0	0	f	0	0	5	200	0	0	0	1	2	0	0	f	f	f	0	0	f	2	0
1909	4	6	2nd_Div.Reserve_Bde	Reserve Bde	Froon IR #54 (two additional fusilier battalions from this regiment that had not been at Haslach-Jungingen) Erzherzog Karl IR #3 (the grenadier battalion from this regiment) Auersperg IR #24 (the grenadier battalion from this regiment) Cuirassier Regt Erzherzog Franz #2 (two squadrons)		10	Austria	2	2	4	3	1	1	f	f	f	f	f	f	f	4000	0	0	f	f	1	0	0	0	f	0	0	5	300	0	0	0	1	2	0	0	f	f	f	0	0	f	2	0
1899	3	6	Artillery_Reserve.1e_Regt_Foot	1e Regt Foot	1st Regt of Foot Artillery (five 8-pound, and two 4-pound cannons and one howitzer, 331 men)		10	France	4	3	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	8	1	f	f	f	0	3	f	2	3
1898	3	6	Cav_Bde.3e_Hussar	3e Hussar			10	France	3	3	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	150	3	0	0	2	3	0	0	f	f	f	0	0	f	2	0
1915	4	6	1st_Div.Avantgarde	Avantgarde	Erzherzog Ludwig IR #8 (three fusilier and one grenadier battalions, reduced strength from casualties at Haslach-Jungingen) Hussar Regt Blankenstein #6 (two squadrons)		10	Austria	2	2	4	3	1	1	f	f	f	f	f	f	f	3400	0	0	f	f	1	0	0	0	f	0	0	5	300	0	0	0	2	3	0	0	f	f	f	0	0	f	2	0
1912	4	6	1st_Div.Horse_Bty	Horse Bty	Cavalry battery armed with four 6-pounder guns and two howitzers		10	Austria	4	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	8	0	f	f	f	0	3	t	2	3
1911	4	6	2nd_Div.Avantgarde	Avantgarde	Erbach IR #42 (thee fusilier battalions and one grenadier battalion) Cuirassier Regt Erzherzog Franz #2 (two squadrons)		10	Austria	2	2	4	3	1	1	f	f	f	f	f	f	f	3000	0	0	f	f	1	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1647	36	4	2e_Cuirassier_Div.Bde_Verdiere	Bde Verdiere			10	France	3	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	600	0	0	0	1	4	0	0	f	f	f	0	0	f	2	0
1665	36	4	4e_Dragoon_Div.Bde_Laplanche	Bde Laplanche	18th Dragoon Regiment, 1st, 2nd, and 3rd squadrons 19th Dragoon Regiment, 1st, 2nd, and 3rd squadrons		10	France	3	2	1	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	1200	0	0	0	5	5	0	0	f	f	f	0	0	f	2	0
1663	36	4	Corps_Artillery.1e_Horse	1e Horse			10		4	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	8	0	f	f	f	0	3	t	2	2
1719	40	4	1eme_Division	1eme Division		de l'Eltang	10	France	1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
1717	40	4	1eme_Division.32e_Ligne	32e Ligne		de l'Eltang	10	France	2	2	4	5	1	1	f	f	f	f	f	f	f	2000	0	0	f	f	1	0	0	0	f	0	0	4	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1725	40	4	1eme_Division.9e_Legere	9e Legere		de l'Eltang	10	France	2	2	4	6	1	1	f	f	f	f	f	f	f	2600	0	0	f	f	1	2	0	0	f	0	0	4	0	0	0	0	0	0	0	0	f	f	f	0	4	f	2	0
1591	33	4	1eme_Division	1eme Division		St Hilaire	10	France	1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
1585	33	4	1eme_Division.35e_Ligne	35e Ligne			10	France	2	2	4	5	1	1	f	f	f	f	f	f	f	1400	0	0	f	f	1	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1781	44	4	1st_Div.Bde_von_Lutzow	Bde von Lützow	Knebel Grenadier Battalion Möllendorf Infantry Regiment # 25, two battalions Wartensleben Infantry Regiment # 59, two battalions		10	Prussia	2	2	4	1	1	1	f	f	f	f	f	f	f	4500	0	0	f	f	1	2	2	0	f	0	0	4	0	0	0	0	0	0	6	0	f	f	f	0	3	f	2	3
1178	4	14	Corps_Artillery	Corps Artillery			10	France	1	2	4	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
1179	4	14	2eme_Division.59e_Ligne	59e Ligne			10	France	2	2	1	5	1	1	f	f	f	f	f	f	f	1800	0	0	f	f	1	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1180	4	14	Corps_Artillery.1e_Heavy_Bty	1e Heavy Bty			10		4	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	8	0	f	f	f	0	1	f	2	2
1181	4	14	Corps_Artillery.2e_Heavy_Bty	2e Heavy Bty			10		4	2	1	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	8	0	f	f	f	0	1	f	2	2
1182	4	14	2eme_Division	2eme Division		Gardanne	10	France	1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
1183	4	14	1eme_Division	1eme Division		Marchand	10	France	1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
1145	2	14	3eme_Division.18e_Ligne	18e Ligne			10	France	2	2	4	5	1	1	f	f	f	f	f	f	f	1800	0	0	f	f	1	0	0	0	f	0	0	4	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1146	2	14	Corps_Cavaly.22e_Chasseur	22e Chasseur			10	France	3	2	1	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	600	0	0	0	3	4	0	0	f	f	f	0	0	f	2	0
1147	2	14	1eme_Division.55e_Ligne	55e Ligne			10	France	2	2	1	5	1	1	f	f	f	f	f	f	f	1400	0	0	f	f	1	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1256	9	14	2nd_Div	2nd Div		von Arnim	10	Prussia	1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
1651	36	4	Light_Div	Light Div		Lasalle	10	France	1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
1653	36	4	Light_Div.Bde_Lasalle_5_7e_Hussar	Bde Lasalle 5/7e Hussar			10	France	3	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	600	0	0	0	2	3	0	0	f	f	f	0	0	f	2	0
1652	36	4	Light_Div.Milhaud_1e_Hussar	Milhaud 1e Hussar			10	France	3	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	600	0	0	0	2	3	0	0	f	f	f	0	0	f	2	0
1655	36	4	1e_Cuirassier_Div.Bde_Defrance	Bde Defrance			10	France	3	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	600	0	0	0	9	2	0	0	f	f	f	0	0	f	2	0
1657	36	4	1e_Cuirassier_Div.Bde_Housaye	Bde Housaye			10	France	3	2	1	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	1300	0	0	0	1	2	0	0	f	f	f	0	0	f	2	0
1658	36	4	1e_Dragoon_Div.Bde_Fenerolz	Bde Fenerolz			10	France	3	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	600	0	0	0	5	4	0	0	f	f	f	0	0	f	2	0
1659	36	4	1e_Dragoon_Div.Bde_Picard	Bde Picard			10	France	3	2	1	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	600	0	0	0	5	4	0	0	f	f	f	0	0	f	2	0
1650	36	4	2e_Cuirassier_Div.Bde_StSulpice	Bde St.Sulpice			10	France	3	2	1	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	600	0	0	0	1	4	0	0	f	f	f	0	0	f	2	0
1656	36	4	2e_Dragoon_Div.Bde_Milet	Bde Milet			10	France	3	2	1	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	600	0	0	0	5	5	0	0	f	f	f	0	0	f	2	0
1654	36	4	2e_Dragoon_Div.Bde_Roget	Bde Roget			10	France	3	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	900	0	0	0	5	5	0	0	f	f	f	0	0	f	2	0
1661	36	4	3e_Dragoon_Div.Bde_Boye	Bde Boye			10	France	3	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	900	0	0	0	5	5	0	0	f	f	f	0	0	f	2	0
1662	36	4	3e_Dragoon_Div.Bde_Maubourg	Bde Maubourg			10	France	3	2	1	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	600	0	0	0	5	5	0	0	f	f	f	0	0	f	2	0
1649	36	4	4e_Dragoon_Div	4e Dragoon Div		Sahut	10	France	1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
1660	36	4	4e_Dragoon_Div.Bde_Margaron	Bde Margaron	17th Dragoon Regiment, 1st, 2nd, and 3rd squadrons 27th Dragoon Regiment, 1st, 2nd, and 3rd squadrons		10	France	3	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	1200	0	0	0	5	5	0	0	f	f	f	0	0	f	2	0
1211	5	14	Corps_Artillery.1e_Horse	1e Horse			10		4	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	8	0	f	f	f	0	3	t	2	2
1212	5	14	Corps_Artillery.2e_Horse	2e Horse			10		4	2	1	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	8	0	f	f	f	0	3	t	2	2
1666	37	4	Adv_Guard_Div	Adv Guard Div		Ferdinand	10	Prussia	1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
1667	37	4	Adv_Guard_Div.Bde_von_Pelet	Bde von Pelet	Rabenau # 13 Pelet # 14 Rühle # 15 Fusiliers, Masars and Valentin Jager 		10	Prussia	2	2	4	9	1	1	f	f	f	f	f	f	f	2400	0	0	f	f	1	0	0	2	f	0	0	4	0	0	0	0	0	0	6	0	f	f	f	0	3	f	2	3
1696	39	4	Infantry_Division.2e_Grenadiers	2e Grenadiers			10	France	2	2	1	5	1	1	f	f	f	f	f	f	f	2400	0	0	f	f	1	0	0	0	f	0	0	1	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1348	15	14	2nd_Div	2nd Div			10		1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
1671	38	4	1eme_Division.13e_Legere	13e Legere			10	France	2	3	4	6	1	1	f	f	f	f	f	f	f	1400	28	0	f	f	1	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1790	45	4	3rd_Div.Rosen_Fusilers	Rosen Fusilers			10	Prussia	2	2	4	9	1	1	f	f	f	f	f	f	f	400	0	0	f	f	1	0	0	2	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1808	45	4	Reserve_Div.Prittwitz_Grenadier_Bde	Prittwitz Grenadier Bde			10	Prussia	2	2	4	1	1	1	f	f	f	f	f	f	f	3300	0	0	f	f	1	0	0	2	f	0	0	4	0	0	0	0	0	0	2	0	f	f	f	0	4	f	2	3
1844	48	4	New_Division				10		1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
1708	40	4	Cav_Reserve	Cav Reserve		Tilley	10	France	1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
1612	34	4	Corps_Artillery.Heavy_Foot	Heavy Foot			10		4	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	8	0	f	f	f	0	1	f	2	2
1633	35	4	Corps_Artillery.1e_Heavy_Bty	1e Heavy Bty			10		4	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	8	0	f	f	f	0	1	f	2	2
1784	44	4	1st_Div.Cav_Bde_Prinz_Wilhelm	Cav Bde Prinz Wilhelm	Leib Carabinier Regiment # 12, five squadrons Garde du Corps Cuirassier Regiment # 14, five squadrons		10	Prussia	3	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	1500	0	0	0	1	2	0	0	f	f	f	0	0	f	2	0
1785	44	4	2nd_Div.Kurrassier_Bde_von_Quitzow	Kurrassier Bde von Quitzow	Quitzow Cuirassier Regiment # 6, five squadrons Reitzenstein Cuirassier Regiment # 7, five squadrons		10	Prussia	3	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	1800	0	0	0	1	2	0	0	f	f	f	0	0	f	2	0
1786	44	4	3rd_Division.Bde_von_Alvensleben	Bde von Alvensleben	Schack Grenadier Battalion Alvensleben Infantry Regiment # 33, two battalions Prince Heinrich Infantry Regiment # 35, two battalions		10	Prussia	2	2	4	1	1	1	f	f	f	f	f	f	f	4500	0	0	f	f	1	3	0	2	f	0	0	4	0	0	0	0	0	0	6	0	f	f	f	0	3	f	2	3
1791	45	4	1st_Div	1st Div		Grawert	10	Prussia	1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
1809	45	4	1st_Div.Horse_Bty	Horse Bty			10	Prussia	4	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	8	0	f	f	f	0	3	f	2	3
1810	45	4	2nd_Div.von_Dyherrn	von Dyherrn			10	Saxony	2	2	4	3	1	1	f	f	f	f	f	f	f	4200	0	0	f	f	1	0	1	0	f	0	0	4	0	0	0	0	0	0	2	0	f	f	f	0	4	f	2	3
1789	45	4	3rd_Div.Cav_Bde_Prince_Clement	Cav Bde Prince Clement			10	Prussia	3	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	700	0	0	0	2	4	0	0	f	f	f	0	0	f	2	0
1339	15	14	2nd_Duvussion	2nd Duvussion			10		1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
1144	2	14	2eme_Division.57e_Ligne	57e Ligne			10	France	2	2	1	5	1	1	f	f	f	f	f	f	f	1700	0	0	f	f	1	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1817	46	4	Adv_Guard.Bde_von_Wobeser	Bde von Wobeser	Ernst Fusilier Battalion # 19 One Foot Jäger company Wobeser Dragoon Regiment # 14, five squadrons Lehmann Horse Artillery Battery # 4 (-), four 4-pound guns		10	Prussia	2	2	4	9	1	1	f	f	f	f	f	f	f	800	0	0	f	f	1	3	0	1	f	0	0	4	750	0	0	0	5	4	4	0	f	f	f	0	4	f	2	2
1816	46	4	Corps_de_Bataille	Corps de Bataille		General Karl August, Grand Duke of Saxe-Weimar-Eisenach	10	Prussia	1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
1759	43	4	7th_Div	7th Div			10		1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
1762	43	4	7th_Div.4th_Bn	4th Bn			10		2	2	4	3	1	1	f	f	f	f	f	f	f	1800	0	0	f	f	1	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1841	47	4	2nd_Div.von_Malschitsky_Grenadiers	von Malschitsky Grenadiers			10	Prussia	2	2	4	1	1	1	f	f	f	f	f	f	f	1800	72	0	f	f	1	0	0	1	f	0	0	4	0	0	0	0	0	0	2	0	f	f	f	0	4	f	2	1
1843	48	4	Adv_Guard	Adv Guard		General-Major Johann von Hinrichs	10	Prussia	1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
1842	48	4	Reserve_Cavalry	Reserve Cavalry			10	Prussia	1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
1756	43	4	2nd_Div.2nd_Regt	2nd Regt			10		2	2	4	3	1	1	f	f	f	f	f	f	f	1800	0	0	f	f	1	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1763	43	4	2nd_Duvussion	2nd Duvussion			10		1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
1757	43	4	6th_Division	6th Division			10		1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
1760	43	4	6th_Division.1st_Regt	1st Regt			10		2	2	4	3	1	1	f	f	f	f	f	f	f	1800	0	0	f	f	1	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1787	44	4	1st_Div.Willmann	Willmann	Willmann Horse Bty		10	Prussia	4	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	6	0	f	f	f	0	4	t	2	2
1210	5	14	3e_Dragoon_Div.Bde_Maubourg	Bde Maubourg			10	France	3	2	1	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	600	0	0	0	5	5	0	0	f	f	f	0	0	f	2	0
1244	9	14	2nd_Div.von_Malschitsky_Grenadiers	von Malschitsky Grenadiers			10	Prussia	2	2	4	1	1	1	f	f	f	f	f	f	f	1800	0	0	f	f	1	0	0	1	f	0	0	4	0	0	0	0	0	0	2	0	f	f	f	0	4	f	2	1
1758	43	4	6th_Division.2nd_Regt	2nd Regt			10		2	2	4	3	1	1	f	f	f	f	f	f	f	1800	0	0	f	f	1	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1822	46	4	Corps_de_Bataille.1st_Bde	1st Bde	Borstell Grenadier Battalion Schenck Infantry Regiment # 9, two battalions Winning Infantry Regiment # 23, two battalions		10	Prussia	2	2	4	1	1	1	f	f	f	f	f	f	f	4400	0	0	f	f	1	2	2	0	f	0	0	4	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1780	44	4	2nd_Div.Bde_von_Wedel	Bde von Wedel	Hanstein Grenadier Battalion Renouard Infantry Regiment # 3, two battalions Kleist Infantry Regiment # 5, two battalions Wilkins Foot Artillery battery, six 8-pound guns		10	Prussia	2	2	4	1	1	1	f	f	f	f	f	f	f	4500	0	0	f	f	1	2	2	0	f	0	0	4	0	0	0	0	0	0	6	0	f	f	f	0	3	f	2	3
1774	44	4	Cav_Bde_Blucher	Cav Bde Blucher	Bluchers cav bde as part of the advance guard	Blucher	10	Prussia	1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
1773	44	4	Cav_Bde_Blucher.Blucher_Hussar_Regt_Nr_8	Blucher Hussar Regt Nr 8			10	Prussia	3	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	1500	0	0	0	2	3	0	0	f	f	f	0	0	f	2	0
1775	44	4	Cav_Bde_Blucher.Irwing_Dragoon_Nr_3	Irwing Dragoon Nr 3			10	Prussia	3	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	600	0	0	0	5	4	0	0	f	f	f	0	0	f	2	0
1812	45	4	2nd_Div.Horse_Bty	Horse Bty			10	Saxony	4	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	8	0	f	f	f	0	3	f	2	3
1779	44	4	1st_Div.Bde_Prinz_Henry	Bde Prinz Henry	Rheinbaben Grenadier Battalion Prince Ferdinand Infantry Regiment # 34, two battalions Puttkammer Infantry Regiment # 36, two battalions		10	Prussia	2	2	4	1	1	1	f	f	f	f	f	f	f	4500	0	0	f	f	1	2	2	0	f	0	0	4	0	0	0	0	0	0	6	0	f	f	f	0	3	f	2	3
1777	44	4	2nd_Div.Bde_von_Renouard	Bde von Renouard	Alt-Braun Grenadier Battalion Prince Louis Infantry Regiment # 20, two battalions Brunswick Infantry Regiment # 21, two battalions		10	Prussia	2	2	4	1	1	1	f	f	f	f	f	f	f	4500	0	0	f	f	1	2	2	0	f	0	0	4	0	0	0	0	0	0	6	0	f	f	f	0	3	f	2	3
1827	46	4	Corps_Artillery	Corps Artillery			10	Prussia	1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
1803	45	4	1st_Div.von_Mueffling	von Müffling			10	Prussia	2	2	4	1	1	1	f	f	f	f	f	f	f	3600	0	0	f	f	1	0	1	0	f	0	0	4	0	0	0	0	0	0	2	0	f	f	f	0	4	f	2	3
1802	45	4	3rd_Div.Lt_Bty	Lt Bty			10	Prussia	4	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	6	0	f	f	f	0	4	f	2	3
1801	45	4	3rd_Div.von_Zweiffel	von Zweiffel			10	Prussia	2	2	4	1	1	1	f	f	f	f	f	f	f	3400	0	0	f	f	1	0	1	0	f	0	0	4	0	0	0	0	0	0	2	0	f	f	f	0	4	f	2	0
1806	45	4	1st_Div.von_Schimonsky	von Schimonsky			10	Prussia	2	2	4	1	1	1	f	f	f	f	f	f	f	3400	0	0	f	f	1	0	1	0	f	0	0	4	0	0	0	0	0	0	2	0	f	f	f	0	4	f	2	3
1804	45	4	2nd_Div.Heavy_Bty	Heavy Bty			10	Saxony	4	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	8	0	f	f	f	0	1	f	2	3
1807	45	4	Reserve_Div.Cerrini_Grenadier_Bde	Cerrini Grenadier Bde			10	Prussia	2	2	4	1	1	1	f	f	f	f	f	f	f	4200	0	0	f	f	1	0	0	2	f	0	0	4	0	0	0	0	0	0	2	0	f	f	f	0	4	f	2	3
1805	45	4	Reserve_Div.Md_Foot_Bty	Md Foot Bty			10	Prussia	4	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	8	0	f	f	f	0	3	f	2	4
1148	2	14	Corps_Cavaly	Corps Cavaly		Guyot	10	France	1	2	4	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
1149	2	14	3eme_Division	3eme Division		LeGrand	10	France	1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
1150	2	14	3eme_Division.75e_Ligne	75e Ligne			10	France	2	2	4	5	1	1	f	f	f	f	f	f	f	1700	0	0	f	f	1	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1151	2	14	3eme_Division.Po_Legere	Po Legere			10	France/Italy	2	2	4	6	1	1	f	f	f	f	f	f	f	1000	0	0	f	f	1	2	2	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1152	2	14	Corps_Artillery.Heavy_Bty	Heavy Bty			10		4	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	8	0	f	f	f	0	1	f	2	3
1153	2	14	Corps_Artillery	Corps Artillery			10	France	1	2	5	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
1154	2	14	Corps_Cavaly.11e_Chasseur	11e Chasseur			10	France	3	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	600	0	0	0	3	4	0	0	f	f	f	0	0	f	2	0
1155	3	14	2eme_Division.Md_Foot_Bty	Md Foot Bty			10		4	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	8	0	f	f	f	0	3	f	2	3
1156	3	14	1eme_Division.Md_Foot_Bty	Md Foot Bty			10		4	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	8	0	f	f	f	0	3	f	2	3
1157	3	14	Cav_Bde	Cav Bde		Trelliard	10	France	1	2	4	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
1158	3	14	Cav_Bde.10e_Hussar	10e Hussar			10	France	3	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	600	0	0	0	2	3	0	0	f	f	f	0	0	f	2	0
1159	3	14	Cav_Bde.9e_Hussar_Copy	9e Hussar_Copy			10	France	3	2	1	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	600	0	0	0	2	3	0	0	f	f	f	0	0	f	2	0
1272	10	14	Cav_Bde	Cav Bde		Viallanes	10	France	1	2	4	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
1342	15	14	6th_Division	6th Division			10		1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
1684	38	4	3eme_Division.21e_Ligne	21e Ligne			10	France	2	3	1	5	1	1	f	f	f	f	f	f	f	1800	54	0	f	f	1	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1818	46	4	Adv_Guard.Bde_von_Winning	Bde von Winning	Kaiserlingk Fusilier Battalion # 1 Bila Fusilier Battalion # 2 Tschammer Infantry Regiment # 27, two battalions Two Foot Jäger companies		10	Prussia	2	2	4	9	1	1	f	f	f	f	f	f	f	3600	0	0	f	f	1	3	0	2	f	0	0	4	0	0	0	0	0	0	8	0	f	f	f	0	3	f	2	3
1819	46	4	Adv_Guard.Bty_Nr_19	Bty Nr 19			10	Prussia	4	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	8	0	f	f	f	0	3	f	2	3
1828	46	4	Corps_Artillery.Kirchfeld_Nr_16	Kirchfeld Nr 16			10	Prussia	4	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	8	0	f	f	f	0	3	f	2	3
1825	46	4	Corps_Artillery.Kirchfeld_Nr_16.Schaefer_Nr_17	Schaefer Nr 17			10	Prussia	4	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	8	0	f	f	f	0	3	f	2	3
1820	46	4	Corps_de_Bataille.2nd_Bde	2nd Bde	Hellmann Grenadier Battalion Treuenfels Infantry Regiment # 29, two battalions Strachwitz Infantry Regiment # 43, two battalions		10	Prussia	2	2	4	1	1	1	f	f	f	f	f	f	f	4400	0	0	f	f	1	2	2	0	f	0	0	4	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1814	46	4	Corps_de_Bataille.3rd_Bde	3rd Bde	Sobbe Fusilier Battalion # 18 Wedell Infantry Regiment # 10, two battalions Tschepe Infantry Regiment # 37, two battalions		10	Prussia	2	2	4	1	1	1	f	f	f	f	f	f	f	4400	0	0	f	f	1	0	0	1	f	0	0	4	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1824	46	4	Corps_de_Bataille.Bailliodz_Cuirassier_Nr_5	Bailliodz Cuirassier Nr 5			10	Prussia	3	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	800	0	0	0	1	2	0	0	f	f	f	0	0	f	2	0
1823	46	4	Corps_de_Bataille.Katte_Dragoon_Regt_Nr_4	Katte Dragoon Regt Nr 4			10	Prussia	3	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	800	0	0	0	5	4	0	0	f	f	f	0	0	f	2	0
1796	45	4	1st_Div.Bde_Henkel	Bde Henkel			10	Prussia	3	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	900	0	0	0	5	3	0	0	f	f	f	0	0	f	2	0
1798	45	4	1st_Div.Erichsen_Fusilers	Erichsen Fusilers			10		2	2	4	9	1	1	f	f	f	f	f	f	f	700	0	0	f	f	1	0	0	1	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1795	45	4	1st_Div.Heavy_Bty	Heavy Bty			10	Prussia	4	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	8	0	f	f	f	0	1	f	2	4
1797	45	4	2nd_Div	2nd Div		Zechwitz	10	Prussia	1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
1813	45	4	2nd_Div.Boguslawsky_Fusilers	Boguslawsky Fusilers			10	Prussia	2	2	4	9	1	1	f	f	f	f	f	f	f	800	0	0	f	f	1	0	2	2	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1799	45	4	2nd_Div.Cav_Bde_von_Kochitsky	Cav Bde von Kochitsky			10	Saxony	3	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	200	0	0	0	1	3	0	0	f	f	f	0	0	f	2	0
1811	45	4	2nd_Div.von_Burgsdorf	von Burgsdorf			10	Saxony	2	2	4	1	1	1	f	f	f	f	f	f	f	3400	0	0	f	f	1	0	1	0	f	0	0	4	0	0	0	0	0	0	1	0	f	f	f	0	4	f	2	3
1800	45	4	3rd_Div.von_Schoeneberg	von Schöneberg			10	Saxony	2	2	4	1	1	1	f	f	f	f	f	f	f	3400	0	0	f	f	1	0	1	0	f	0	0	5	0	0	0	0	0	0	2	0	f	f	f	0	4	f	2	4
1793	45	4	Reserve_Div	Reserve Div		Prittwitz	10	Prussia	1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
1792	45	4	Reserve_Div.Cav_Bde_von_Krafft	Cav Bde von Krafft			10	Prussia	3	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	900	0	0	0	12	3	0	0	f	f	f	0	0	f	2	0
1794	45	4	Reserve_Div.Heavy_Bty	Heavy Bty			10	Prussia	4	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	8	0	f	f	f	0	1	f	2	3
1829	47	4	1st_Div	1st Div		Kuhnheim	10	Prussia	1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
1831	47	4	1st_Div.Beeren_Cuirassier	Beeren Cuirassier			10	Prussia	3	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	400	0	0	0	1	2	0	0	f	f	f	0	0	f	2	0
1830	47	4	1st_Div.Garde_du_Corps_Cavalry	Garde du Corps Cavalry			10	Prussia	3	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	600	0	0	0	1	1	0	0	f	f	f	0	0	f	2	0
1833	47	4	1st_Div.Guard_Bde_von_Pletz	Guard Bde von Pletz			10	Prussia	2	2	4	1	1	1	f	f	f	f	f	f	f	2400	0	0	f	f	1	0	0	1	f	0	0	2	0	0	0	0	0	0	2	0	f	f	f	0	4	f	2	1
1832	47	4	2nd_Div	2nd Div		von Arnim	10	Prussia	1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
1815	46	4	Adv_Guard	Adv Guard	part of the OOB, but they didnt make it to the actual battle	von Winning	10	Prussia	1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
1821	46	4	Adv_Guard.Horse_Bty_Nr_12	Horse Bty Nr 12			10	Prussia	4	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	8	0	f	f	f	0	4	t	2	3
1826	46	4	Corps_Artillery.Kirchfeld_Nr_16.Schaefer_Nr_17.Kirchfeld_Nr_16.Horse_Bty_Nr_11	Horse Bty Nr 11			10	Prussia	4	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	4	0	f	f	f	0	3	t	2	3
1184	4	14	Cav_Bde	Cav Bde		Charbanais	10	France	1	2	4	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
1185	4	14	2eme_Division.50e_Ligne	50e Ligne			10	France	2	2	1	5	1	1	f	f	f	f	f	f	f	1800	0	0	f	f	1	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1186	4	14	2eme_Division.27e_Ligne	27e Ligne			10	France	2	2	1	5	1	1	f	f	f	f	f	f	f	1800	0	0	f	f	1	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1187	4	14	1eme_Division.6e_Legere	6e Legere			10	France	2	2	4	6	1	1	f	f	f	f	f	f	f	1800	0	0	f	f	1	0	0	0	f	0	0	4	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1188	4	14	2eme_Division.25e_Legere	25e Legere			10	France	2	2	4	6	1	1	f	f	f	f	f	f	f	1800	0	0	f	f	1	0	0	0	f	0	0	4	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1189	5	14	Corps_Artillery	Corps Artillery			10	France	1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
1190	5	14	1e_Cuirassier_Div	1e Cuirassier Div		Nansouty	10	France	1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
1191	5	14	1e_Dragoon_Div	1e Dragoon Div		Klein	10	France	1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
1192	5	14	2e_Cuirassier_Div	2e Cuirassier Div		d'Hautpoul	10	France	1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
1193	5	14	2e_Dragoon_Div	2e Dragoon Div		Grouchy	10	France	1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
1194	5	14	2e_Cuirassier_Div.Bde_Verdiere	Bde Verdiere			10	France	3	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	600	0	0	0	1	4	0	0	f	f	f	0	0	f	2	0
1195	5	14	3e_Dragoon_Div	3e Dragoon Div		Beaumont	10	France	1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
1196	5	14	4e_Dragoon_Div	4e Dragoon Div		Sahut	10	France	1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
1197	5	14	2e_Cuirassier_Div.Bde_StSulpice	Bde St.Sulpice			10	France	3	2	1	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	600	0	0	0	1	4	0	0	f	f	f	0	0	f	2	0
1198	5	14	Light_Div	Light Div		Lasalle	10	France	1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
1199	5	14	Light_Div.Milhaud_1e_Hussar	Milhaud 1e Hussar			10	France	3	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	600	0	0	0	2	3	0	0	f	f	f	0	0	f	2	0
1200	5	14	Light_Div.Bde_Lasalle_5_7e_Hussar	Bde Lasalle 5/7e Hussar			10	France	3	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	600	0	0	0	2	3	0	0	f	f	f	0	0	f	2	0
1201	5	14	2e_Dragoon_Div.Bde_Roget	Bde Roget			10	France	3	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	900	0	0	0	5	5	0	0	f	f	f	0	0	f	2	0
1855	48	4	Adv_Guard.Horse_Bty	Horse Bty			10	Prussia	4	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	2	0	f	f	f	0	4	t	2	4
1859	48	4	Reserve_Cavalry.Horse_Bty	Horse Bty			10	Prussia	4	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	6	0	f	f	f	0	4	t	2	3
1202	5	14	1e_Cuirassier_Div.Bde_Defrance	Bde Defrance			10	France	3	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	600	0	0	0	9	2	0	0	f	f	f	0	0	f	2	0
1203	5	14	2e_Dragoon_Div.Bde_Milet	Bde Milet			10	France	3	2	1	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	600	0	0	0	5	5	0	0	f	f	f	0	0	f	2	0
1204	5	14	1e_Cuirassier_Div.Bde_Housaye	Bde Housaye			10	France	3	2	1	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	1300	0	0	0	1	2	0	0	f	f	f	0	0	f	2	0
1205	5	14	1e_Dragoon_Div.Bde_Fenerolz	Bde Fenerolz			10	France	3	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	600	0	0	0	5	4	0	0	f	f	f	0	0	f	2	0
1206	5	14	4e_Dragoon_Div.Bde_Laplanche	Bde Laplanche			10	France	3	2	1	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	1200	0	0	0	5	5	0	0	f	f	f	0	0	f	2	0
1207	5	14	1e_Dragoon_Div.Bde_Picard	Bde Picard			10	France	3	2	1	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	600	0	0	0	5	4	0	0	f	f	f	0	0	f	2	0
1208	5	14	4e_Dragoon_Div.Bde_Margaron	Bde Margaron			10	France	3	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	1200	0	0	0	5	5	0	0	f	f	f	0	0	f	2	0
1209	5	14	3e_Dragoon_Div.Bde_Boye	Bde Boye			10	France	3	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	900	0	0	0	5	5	0	0	f	f	f	0	0	f	2	0
1214	6	14	2nd_Div.von_Burgsdorf	von Burgsdorf			10	Saxony	2	2	4	1	1	1	f	f	f	f	f	f	f	3400	0	0	f	f	1	0	1	0	f	0	0	4	0	0	0	0	0	0	1	0	f	f	f	0	4	f	2	3
1215	6	14	2nd_Div.von_Dyherrn	von Dyherrn			10	Saxony	2	2	4	3	1	1	f	f	f	f	f	f	f	4200	0	0	f	f	1	0	1	0	f	0	0	4	0	0	0	0	0	0	2	0	f	f	f	0	4	f	2	3
1216	6	14	1st_Div.Horse_Bty	Horse Bty			10	Prussia	4	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	8	0	f	f	f	0	3	f	2	3
1217	6	14	Reserve_Div.Prittwitz_Grenadier_Bde	Prittwitz Grenadier Bde			10	Prussia	2	2	4	1	1	1	f	f	f	f	f	f	f	3300	0	0	f	f	1	0	0	2	f	0	0	4	0	0	0	0	0	0	2	0	f	f	f	0	4	f	2	3
1218	6	14	Reserve_Div.Cerrini_Grenadier_Bde	Cerrini Grenadier Bde			10	Prussia	2	2	4	1	1	1	f	f	f	f	f	f	f	4200	0	0	f	f	1	0	0	2	f	0	0	4	0	0	0	0	0	0	2	0	f	f	f	0	4	f	2	3
1219	6	14	1st_Div.von_Schimonsky	von Schimonsky			10	Prussia	2	2	4	1	1	1	f	f	f	f	f	f	f	3400	0	0	f	f	1	0	1	0	f	0	0	4	0	0	0	0	0	0	2	0	f	f	f	0	4	f	2	3
1220	6	14	Reserve_Div.Md_Foot_Bty	Md Foot Bty			10	Prussia	4	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	8	0	f	f	f	0	3	f	2	4
1221	6	14	3rd_Div	3rd Div		Tauentzein	10	Prussia	1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
1222	6	14	3rd_Div.Cav_Bde_Prince_Clement	Cav Bde Prince Clement			10	Prussia	3	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	700	0	0	0	2	4	0	0	f	f	f	0	0	f	2	0
1223	6	14	3rd_Div.Rosen_Fusilers	Rosen Fusilers			10	Prussia	2	2	4	9	1	1	f	f	f	f	f	f	f	400	0	0	f	f	1	0	0	2	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1224	6	14	3rd_Div.von_Schoeneberg	von Schöneberg			10	Saxony	2	2	4	1	1	1	f	f	f	f	f	f	f	3400	0	0	f	f	1	0	1	0	f	0	0	5	0	0	0	0	0	0	2	0	f	f	f	0	4	f	2	4
1225	6	14	3rd_Div.von_Zweiffel	von Zweiffel			10	Prussia	2	2	4	1	1	1	f	f	f	f	f	f	f	3400	0	0	f	f	1	0	1	0	f	0	0	4	0	0	0	0	0	0	2	0	f	f	f	0	4	f	2	0
1226	6	14	1st_Div	1st Div		Grawert	10	Prussia	1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
1227	6	14	3rd_Div.Lt_Bty	Lt Bty			10	Prussia	4	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	6	0	f	f	f	0	4	f	2	3
1228	6	14	Reserve_Div.Cav_Bde_von_Krafft	Cav Bde von Krafft			10	Prussia	3	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	900	0	0	0	12	3	0	0	f	f	f	0	0	f	2	0
1229	6	14	1st_Div.von_Mueffling	von Müffling			10	Prussia	2	2	4	1	1	1	f	f	f	f	f	f	f	3600	0	0	f	f	1	0	1	0	f	0	0	4	0	0	0	0	0	0	2	0	f	f	f	0	4	f	2	3
1230	6	14	Reserve_Div	Reserve Div		Prittwitz	10	Prussia	1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
1231	6	14	Reserve_Div.Heavy_Bty	Heavy Bty			10	Prussia	4	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	8	0	f	f	f	0	1	f	2	3
1232	6	14	1st_Div.Heavy_Bty	Heavy Bty			10	Prussia	4	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	8	0	f	f	f	0	1	f	2	4
1233	6	14	1st_Div.Bde_Henkel	Bde Henkel			10	Prussia	3	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	900	0	0	0	5	3	0	0	f	f	f	0	0	f	2	0
1234	6	14	2nd_Div.Boguslawsky_Fusilers	Boguslawsky Fusilers			10	Prussia	2	2	4	9	1	1	f	f	f	f	f	f	f	800	0	0	f	f	1	0	2	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1235	6	14	2nd_Div	2nd Div		Zechwitz	10	Prussia	1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
1236	6	14	1st_Div.Erichsen_Fusilers	Erichsen Fusilers			10		2	2	4	9	1	1	f	f	f	f	f	f	f	700	0	0	f	f	1	0	0	1	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1237	6	14	2nd_Div.Cav_Bde_von_Kochitsky	Cav Bde von Kochitsky			10	Saxony	3	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	200	0	0	0	1	3	0	0	f	f	f	0	0	f	2	0
1238	6	14	2nd_Div.Heavy_Bty	Heavy Bty			10	Saxony	4	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	8	0	f	f	f	0	1	f	2	3
1239	7	14	Adv_Guard_Div.Saxon_Hussar_von_Truetzschler	Saxon Hussar von Trützschler	Saxon Hussar Regiment, eight squadrons		10	Saxony	3	2	1	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	1200	0	0	0	2	4	0	0	f	f	f	0	0	f	2	0
1240	7	14	Adv_Guard_Div.Cav_Bde_von_Schimmelpfennig	Cav Bde von Schimmelpfennig	Schimmelpfennig Hussar Regiment # 6, ten squadrons		10	Prussia	3	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	1500	0	0	0	2	4	6	0	f	f	f	0	3	f	2	3
1241	7	14	Adv_Guard_Div.Bde_von_Pelet	Bde von Pelet	Rabenau # 13 Pelet # 14 Rühle # 15 Fusiliers, Masars and Valentin Jager 		10	Prussia	2	2	4	9	1	1	f	f	f	f	f	f	f	2400	0	0	f	f	1	0	0	2	f	0	0	4	0	0	0	0	0	0	6	0	f	f	f	0	3	f	2	3
1242	7	14	Adv_Guard_Div.Bde_Belvilaqua	Bde Belvilaqua	Combined Bns from IR 49,  Prinz Clemens (saxon), and Kurfurst (saxon)		10	Prussia/Saxony	2	2	4	1	1	1	f	f	f	f	f	f	f	5100	0	0	f	f	1	0	1	0	f	0	0	5	0	0	0	0	0	0	6	0	f	f	f	0	4	f	2	0
1243	7	14	Adv_Guard_Div	Adv Guard Div		Ferdinand	10	Prussia	1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
1245	9	14	2nd_Div.Md_Foot_Bty	Md Foot Bty			10	Prussia	4	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	8	0	f	f	f	0	3	f	2	1
1246	9	14	1st_Div.Md_Foot_Bty	Md Foot Bty			10	Prussia	4	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	8	0	f	f	f	0	3	f	2	1
1247	9	14	2nd_Div.Pirch_Regt_Musketeer	Pirch Regt Musketeer			10	Prussia	2	2	1	1	1	1	f	f	f	f	f	f	f	1800	0	0	f	f	1	0	0	1	f	0	0	4	0	0	0	0	0	0	2	0	f	f	f	0	4	f	2	1
1248	9	14	2nd_Div.Arnim_Regt_Musketeer	Arnim Regt Musketeer			10	Prussia	2	2	1	1	1	1	f	f	f	f	f	f	f	1800	0	0	f	f	1	0	0	1	f	0	0	4	0	0	0	0	0	0	2	0	f	f	f	0	4	f	2	1
1249	9	14	2nd_Div.Zenge_Regt_Musketeer	Zenge Regt Musketeer			10	Prussia	2	2	1	1	1	1	f	f	f	f	f	f	f	1800	0	0	f	f	1	0	0	1	f	0	0	4	0	0	0	0	0	0	2	0	f	f	f	0	4	f	2	1
1250	9	14	2nd_Div.von_Zenge_Grenadiers	von Zenge Grenadiers			10	Prussia	2	2	1	1	1	1	f	f	f	f	f	f	f	1800	0	0	f	f	1	0	0	1	f	0	0	4	0	0	0	0	0	0	2	0	f	f	f	0	4	f	2	1
1251	9	14	1st_Div.Guard_Bde_von_Hirschfeld	Guard Bde von Hirschfeld			10	Prussia	2	2	1	1	1	1	f	f	f	f	f	f	f	2400	0	0	f	f	1	0	0	1	f	0	0	2	0	0	0	0	0	0	2	0	f	f	f	0	4	f	2	1
1252	9	14	1st_Div.Guard_Bde_von_Pletz	Guard Bde von Pletz			10	Prussia	2	2	4	1	1	1	f	f	f	f	f	f	f	2400	0	0	f	f	1	0	0	1	f	0	0	2	0	0	0	0	0	0	2	0	f	f	f	0	4	f	2	1
1253	9	14	1st_Div	1st Div		Kuhnheim	10	Prussia	1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
1254	9	14	1st_Div.Garde_du_Corps_Cavalry	Garde du Corps Cavalry			10	Prussia	3	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	600	0	0	0	1	1	0	0	f	f	f	0	0	f	2	0
1255	9	14	1st_Div.Beeren_Cuirassier	Beeren Cuirassier			10	Prussia	3	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	400	0	0	0	1	2	0	0	f	f	f	0	0	f	2	0
1257	10	14	3eme_Division.Md_Foot_Bty	Md Foot Bty			10		4	2	1	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	8	0	f	f	f	0	3	f	2	2
1258	10	14	2eme_Division.Md_Foot_Bty	Md Foot Bty			10		4	2	1	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	8	0	f	f	f	0	3	f	2	2
1259	10	14	Corps_Artillery.Md_Foot_Bty	Md Foot Bty			10		4	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	8	0	f	f	f	0	3	f	2	2
1260	10	14	1eme_Division.Md_Foot_Bty	Md Foot Bty			10		4	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	8	0	f	f	f	0	3	f	2	2
1261	10	14	1eme_Division.13e_Legere	13e Legere			10	France	2	2	4	6	1	1	f	f	f	f	f	f	f	1400	0	0	f	f	1	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1262	10	14	1eme_Division	1eme Division		Morand	10	France	1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
1263	10	14	2eme_Division.108e_Ligne	108e Ligne			10	France	2	2	1	5	1	1	f	f	f	f	f	f	f	1600	0	0	f	f	1	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1264	10	14	1eme_Division.51e_Ligne	51e Ligne			10	France	2	2	1	5	1	1	f	f	f	f	f	f	f	1800	0	0	f	f	1	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1265	10	14	1eme_Division.17e_Ligne	17e Ligne			10	France	2	2	4	5	1	1	f	f	f	f	f	f	f	1800	0	0	f	f	1	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1266	10	14	1eme_Division.61e_Ligne	61e Ligne			10	France	2	2	1	5	1	1	f	f	f	f	f	f	f	1800	0	0	f	f	1	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1267	10	14	1eme_Division.30e_Ligne	30e Ligne			10	France	2	2	1	5	1	1	f	f	f	f	f	f	f	1800	0	0	f	f	1	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1268	10	14	2eme_Division	2eme Division		Friant	10	France	1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
1269	10	14	2eme_Division.33e_Ligne	33e Ligne			10	France	2	2	1	5	1	1	f	f	f	f	f	f	f	1800	0	0	f	f	1	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1270	10	14	2eme_Division.48e_Ligne	48e Ligne			10	France	2	2	1	5	1	1	f	f	f	f	f	f	f	1400	0	0	f	f	1	0	0	0	f	0	0	1	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1271	10	14	2eme_Division.111e_Ligne	111e Ligne			10	France	2	2	1	5	1	1	f	f	f	f	f	f	f	1800	0	0	f	f	1	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1213	6	14	2nd_Div.Horse_Bty	Horse Bty			10	Saxony	4	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	8	0	f	f	f	0	3	f	2	3
1273	10	14	3eme_Division	3eme Division		Gudin	10	France	1	2	1	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
1274	10	14	3eme_Division.12e_Ligne	12e Ligne			10	France	2	2	1	5	1	1	f	f	f	f	f	f	f	1300	0	0	f	f	1	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1275	10	14	3eme_Division.21e_Ligne	21e Ligne			10	France	2	2	1	5	1	1	f	f	f	f	f	f	f	1800	0	0	f	f	1	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1276	10	14	3eme_Division.25e_Ligne	25e Ligne			10	France	2	2	1	5	1	1	f	f	f	f	f	f	f	1800	0	0	f	f	1	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1277	10	14	3eme_Division.85e_Ligne	85e Ligne			10	France	2	2	1	5	1	1	f	f	f	f	f	f	f	1600	0	0	f	f	1	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1278	10	14	Cav_Bde.1e_Chasseur	1e Chasseur			10	France	3	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	600	0	0	0	3	3	0	0	f	f	f	0	0	f	2	0
1279	10	14	Cav_Bde.2e_Chasseur	2e Chasseur			10	France	3	2	1	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	600	0	0	0	3	3	0	0	f	f	f	0	0	f	2	0
1280	10	14	Corps_Artillery	Corps Artillery		Hannicque	10	France	1	2	4	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
1281	11	14	Guard_Artillery.Guard_Foot_Artillery	Guard Foot Artillery			10		4	2	1	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	24	0	f	f	f	0	3	f	2	1
1282	11	14	Infantry_Division.1e_Grenadiers	1e Grenadiers			10	France	2	2	4	5	1	1	f	f	f	f	f	f	f	2400	0	0	f	f	1	0	0	0	f	0	0	1	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1283	11	14	Infantry_Division.2e_Grenadiers	2e Grenadiers			10	France	2	2	1	5	1	1	f	f	f	f	f	f	f	2400	0	0	f	f	1	0	0	0	f	0	0	1	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1284	11	14	Guard_Artillery.Army_Artillery_Park	Army Artillery Park			10		4	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	16	0	f	f	f	0	1	f	2	2
1285	11	14	Cavalry_Division.Chasseurs_a_Cheval	Chasseurs a Cheval			10	France	3	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	600	0	0	0	3	1	0	0	f	f	f	0	0	f	2	0
1286	11	14	Infantry_Division.1e_Chasseurs	1e Chasseurs			10	France	2	2	1	6	1	1	f	f	f	f	f	f	f	2400	0	0	f	f	1	0	0	0	f	0	0	1	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1287	11	14	Cavalry_Division.Grenadier_a_Cheval	Grenadier a Cheval			10	France	3	2	1	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	400	0	0	0	8	1	0	0	f	f	f	0	0	f	2	0
1288	11	14	Guard_Artillery	Guard Artillery		de Lamartiniére	10	France	1	2	4	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	2	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
1289	11	14	Infantry_Division.2e_Chasseurs_Copy	2e Chasseurs_Copy			10	France	2	2	1	6	1	1	f	f	f	f	f	f	f	2400	0	0	f	f	1	0	0	0	f	0	0	1	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1290	11	14	Infantry_Division	Infantry Division		Lefebvre	10	France	1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
1291	11	14	Infantry_Division.Foot_Dragoons	Foot Dragoons			10	France	2	2	1	6	1	1	f	f	f	f	f	f	f	2400	0	0	f	f	1	0	0	0	f	0	0	1	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1292	11	14	Cavalry_Division	Cavalry Division		Bessieres	10	France	1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	1	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
1294	12	14	2eme_Division.Md_Foot_Bty_Copy	Md Foot Bty_Copy			10		4	2	1	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	0	0	0	0	0	0	0	8	0	f	f	f	0	3	f	2	3
1295	12	14	3eme_Division.Md_Foot_Bty	Md Foot Bty			10		4	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	0	0	0	0	0	0	0	8	0	f	f	f	0	3	f	2	3
1296	12	14	3eme_Division.27e_Legere	27e Legere		Drouet	10	France	2	2	4	6	1	1	f	f	f	f	f	f	f	1500	0	0	f	f	1	0	2	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	4	f	2	0
1297	12	14	Artillery_Reserve.Md_Foot_Bty	Md Foot Bty			10		4	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	8	0	f	f	f	0	3	f	2	2
1298	12	14	2eme_Division.Md_Foot_Bty	Md Foot Bty			10		4	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	0	0	0	0	0	0	0	8	0	f	f	f	0	3	f	2	3
1299	12	14	1eme_Division.Md_Foot_Bty	Md Foot Bty			10		4	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	0	0	0	0	0	0	0	8	0	f	f	f	0	3	f	2	3
1300	12	14	1eme_Division.9e_Legere	9e Legere		de l'Eltang	10	France	2	2	4	6	1	1	f	f	f	f	f	f	f	2600	0	0	f	f	1	2	0	0	f	0	0	4	0	0	0	0	0	0	0	0	f	f	f	0	4	f	2	0
1301	12	14	2eme_Division.45e_Ligne	45e Ligne		Rivaud	10	France	2	2	4	5	1	1	f	f	f	f	f	f	f	2000	0	0	f	f	1	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1302	12	14	2eme_Division.54e_Ligne	54e Ligne		Rivaud	10	France	2	2	4	5	1	1	f	f	f	f	f	f	f	2000	0	0	f	f	1	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1303	12	14	2eme_Division	2eme Division		Rivaud	10	France	1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
1304	12	14	1eme_Division.32e_Ligne	32e Ligne		de l'Eltang	10	France	2	2	4	5	1	1	f	f	f	f	f	f	f	2000	0	0	f	f	1	0	0	0	f	0	0	4	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1305	12	14	1eme_Division	1eme Division		de l'Eltang	10	France	1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
1307	12	14	2eme_Division.4e_Legere	4e Legere		Rivaud	10	France	2	2	4	6	1	1	f	f	f	f	f	f	f	2000	0	0	f	f	1	0	1	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1308	12	14	Cav_Reserve	Cav Reserve		Tilley	10	France	1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
1309	12	14	Cav_Reserve.2e_Hussar	2e Hussar			10	France	3	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	300	0	0	0	2	3	0	0	f	f	f	0	0	f	2	0
1310	12	14	Cav_Reserve.4e_Hussar	4e Hussar			10	France	3	2	1	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	422	0	0	0	2	4	0	0	f	f	f	0	0	f	2	0
1311	12	14	Artillery_Reserve	Artillery Reserve		Eble	10	France	1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
1312	12	14	3eme_Division	3eme Division		Drouet	10	France	1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
1313	12	14	3eme_Division.95e_Ligne	95e Ligne		Drouet	10	France	2	2	4	5	1	1	f	f	f	f	f	f	f	2600	0	0	f	f	1	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1314	12	14	3eme_Division.94e_Ligne	94e Ligne		Drouet	10	France	2	2	4	5	1	1	f	f	f	f	f	f	f	1500	0	0	f	f	1	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1315	13	14	2eme_Division.24e_Ligne	24e Ligne			10	France	2	2	4	5	1	1	f	f	f	f	f	f	f	1800	0	0	f	f	1	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1316	13	14	2eme_Division.Md_Foot_Bty	Md Foot Bty			10		4	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	8	0	f	f	f	0	3	f	2	3
1317	13	14	1eme_Division.Md_Foot_Bty	Md Foot Bty			10		4	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	8	0	f	f	f	0	3	f	2	3
1318	13	14	Corps_Cav.7e_Chasseur	7e Chasseur			10	France	3	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	600	0	0	0	3	4	0	0	f	f	f	0	0	f	2	0
1319	13	14	1eme_Division.105e_Ligne	105e Ligne			10	France	2	2	1	3	1	1	f	f	f	f	f	f	f	1700	0	0	f	f	1	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1320	13	14	Corps_Cav.20e_Chasseur	20e Chasseur			10	France	3	2	1	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	600	0	0	0	3	4	0	0	f	f	f	0	0	f	2	0
1321	13	14	1eme_Division.14e_Ligne	14e Ligne			10	France	2	2	4	5	1	1	f	f	f	f	f	f	f	700	0	0	f	f	1	0	0	0	f	0	0	4	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1322	13	14	Corps_Cav	Corps Cav		Durosnel	10	France	1	2	4	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
1323	13	14	Corps_Artillery	Corps Artillery			10	France	1	2	4	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
1324	13	14	2eme_Division.63e_Ligne	63e Ligne			10	France	2	2	1	5	1	1	f	f	f	f	f	f	f	700	0	0	f	f	1	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1325	13	14	Corps_Artillery.Heavy_Bty	Heavy Bty			10		4	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	8	0	f	f	f	0	1	f	2	2
1326	13	14	1eme_Division.16e_Legere	16e Legere			10	France	2	2	4	6	1	1	f	f	f	f	f	f	f	2700	0	0	f	f	1	0	0	0	f	0	0	4	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1327	13	14	1eme_Division.44e_Ligne	44e Ligne			10	France	2	2	1	5	1	1	f	f	f	f	f	f	f	1700	0	0	f	f	1	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1328	13	14	1eme_Division	1eme Division		Desjardin	10	France	1	2	4	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
1329	13	14	2eme_Division.7e_Legere	7e Legere			10	France	2	2	4	6	1	1	f	f	f	f	f	f	f	1800	0	0	f	f	1	0	0	0	f	0	0	4	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1330	13	14	2eme_Division	2eme Division		Bierre	10	France	1	2	4	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
1331	13	14	2eme_Division.Hesse_Darmstadt	Hesse Darmstadt			10	Hesse	2	2	1	1	1	1	f	f	f	f	f	f	f	800	0	0	f	f	1	0	0	0	f	0	0	4	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1332	13	14	2eme_Division.Allied_Nassau	Allied Nassau			10	Nassau	2	2	1	5	1	1	f	f	f	f	f	f	f	400	0	0	f	f	1	0	0	0	f	0	0	4	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1333	14	14	Supply_Train	Supply Train			10	France	1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
1334	14	14	Supply_Train.Supply_Escort_Detachment	Supply Escort Detachment			10		5	2	5	6	1	1	f	f	f	f	f	f	f	300	0	0	f	f	1	2	4	0	f	0	0	6	50	0	0	0	3	0	0	0	f	f	f	0	0	f	2	0
1335	15	14	2nd_Div.3rd_special_regt_von_X	3rd special regt von X			10		2	2	1	8	1	1	f	f	f	f	f	f	f	1800	0	0	f	f	2	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1336	15	14	2nd_Div.1st_Regt_of_Death	1st Regt of Death	with data		10		2	2	4	3	1	1	f	f	f	f	f	f	f	1800	0	0	f	f	1	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1337	15	14	2nd_Div.Devils_Bde_as_such	Devils Bde as such	as such six much as such		10	gotta break this	2	2	4	4	1	1	f	f	f	f	f	f	f	1800	0	0	f	f	3	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1341	15	14	7th_Div.1st_Bn	1st Bn			10		2	2	4	3	1	1	f	f	f	f	f	f	f	1800	0	0	f	f	1	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1343	15	14	6th_Division.2nd_Regt	2nd Regt			10		2	2	4	3	1	1	f	f	f	f	f	f	f	1800	0	0	f	f	1	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1344	15	14	6th_Division.1st_Regt	1st Regt			10		2	2	4	3	1	1	f	f	f	f	f	f	f	1800	0	0	f	f	1	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1345	15	14	7th_Div	7th Div			10		1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
1346	15	14	2nd_Div.2nd_Regt	2nd Regt			10		2	2	4	3	1	1	f	f	f	f	f	f	f	1800	0	0	f	f	1	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1347	15	14	2nd_Div.1st_Regt	1st Regt			10		2	2	4	3	1	1	f	f	f	f	f	f	f	1800	0	0	f	f	1	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1128	1	14	Supply_Train	Supply Train		von Schulze	10	Prussia	1	2	6	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
1129	1	14	Supply_Train.Guard_Detachment	Guard Detachment			10		5	2	6	8	1	1	f	f	f	f	f	f	f	300	0	0	f	f	1	2	4	0	f	0	0	10	60	0	0	0	12	7	0	0	f	f	f	0	0	f	2	0
1130	2	14	2eme_Division.Md_Foot_Bty	Md Foot Bty			10		4	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	8	0	f	f	f	0	3	f	2	3
1131	2	14	1eme_Division.Md_Foot_Bty	Md Foot Bty			10		4	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	8	0	f	f	f	0	3	f	2	2
1132	2	14	3eme_Division.Md_Foot_Bty	Md Foot Bty			10		4	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	8	0	f	f	f	0	3	f	2	2
1133	2	14	2eme_Division	2eme Division		Leval	10	France	1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
1134	2	14	2eme_Division.28e_Ligne	28e Ligne			10	France	2	2	1	5	1	1	f	f	f	f	f	f	f	1400	0	0	f	f	1	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1135	2	14	1eme_Division.35e_Ligne	35e Ligne			10	France	2	2	4	5	1	1	f	f	f	f	f	f	f	1400	0	0	f	f	1	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1136	2	14	3eme_Division.Corsican_Legere_Copy	Corsican Legere_Copy			10	France/Corsica	2	2	1	6	1	1	f	f	f	f	f	f	f	1300	0	0	f	f	1	2	0	1	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1137	2	14	2eme_Division.46e_Ligne	46e Ligne			10	France	2	2	1	5	1	1	f	f	f	f	f	f	f	1400	0	0	f	f	1	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1138	2	14	1eme_Division.43e_Ligne	43e Ligne			10	France	2	2	1	5	1	1	f	f	f	f	f	f	f	1400	0	0	f	f	1	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1139	2	14	2eme_Division.24e_Legere	24e Legere			10	France	2	2	1	6	1	1	f	f	f	f	f	f	f	2000	0	0	f	f	1	0	0	0	f	0	0	4	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1140	2	14	2eme_Division.4e_Ligne	4e Ligne			10	France	2	2	1	5	1	1	f	f	f	f	f	f	f	1400	0	0	f	f	1	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1141	2	14	1eme_Division	1eme Division		St Hilaire	10	France	1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
1142	2	14	3eme_Division.26e_Legere	26e Legere			10	France	2	2	4	6	1	1	f	f	f	f	f	f	f	1600	0	0	f	f	1	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1143	2	14	1eme_Division.10e_Legere	10e Legere			10	France	2	2	4	6	1	1	f	f	f	f	f	f	f	1800	0	0	f	f	1	0	0	0	f	0	0	4	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1349	15	14	1st_Div.3rd_special_regt	3rd special regt			10		2	2	4	3	1	1	f	f	f	f	f	f	f	1800	0	0	f	f	1	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1350	15	14	1st_Div.2nd_Regt	2nd Regt			10	France	2	2	4	3	1	1	f	f	f	f	f	f	f	1800	0	0	f	f	1	0	0	0	f	0	0	6	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1351	15	14	1st_Div.1st_Regt	1st Regt			10		2	2	4	3	1	1	f	f	f	f	f	f	f	1800	0	0	f	f	1	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1352	15	14	1st_Div	1st Div			10		1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
1578	31	4	6th_Div	6th Div			10	Norman	1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
1579	31	4	6th_Div.44th_Light_Fusilier	44th Light Fusilier			10	Norman	2	2	4	4	1	1	f	f	f	f	f	f	f	2200	0	0	f	f	1	3	0	1	f	0	0	4	0	0	0	0	0	0	2	0	f	f	f	0	4	f	2	0
1580	31	4	6th_Div.Devil_Bde	Devil Bde	oeu		10		5	2	6	9	1	1	f	f	f	f	f	f	f	200	0	0	f	f	1	2	1	1	f	0	0	3	80	0	0	0	10	0	0	0	f	f	f	0	0	f	2	0
1587	33	4	2eme_Division.46e_Ligne	46e Ligne			10	France	2	2	1	5	1	1	f	f	f	f	f	f	f	1400	0	0	f	f	1	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1586	33	4	3eme_Division.Corsican_Legere_Copy	Corsican Legere_Copy			10	France/Corsica	2	2	1	6	1	1	f	f	f	f	f	f	f	1300	0	0	f	f	1	2	0	1	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1588	33	4	1eme_Division.43e_Ligne	43e Ligne			10	France	2	2	1	5	1	1	f	f	f	f	f	f	f	1400	0	0	f	f	1	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1589	33	4	2eme_Division.24e_Legere	24e Legere			10	France	2	2	1	6	1	1	f	f	f	f	f	f	f	2000	0	0	f	f	1	0	0	0	f	0	0	4	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1606	33	4	1eme_Division.Md_Foot_Bty	Md Foot Bty			10		4	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	8	0	f	f	f	0	3	f	2	2
1293	11	14	Guard_Artillery.Guard_Horse_Bty	Guard Horse Bty			10		4	2	1	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	8	0	f	f	f	0	4	t	2	1
1590	33	4	2eme_Division.4e_Ligne	4e Ligne			10	France	2	2	1	5	1	1	f	f	f	f	f	f	f	1400	0	0	f	f	1	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1594	33	4	2eme_Division.57e_Ligne	57e Ligne			10	France	2	2	1	5	1	1	f	f	f	f	f	f	f	1700	0	0	f	f	1	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1607	33	4	2eme_Division.Md_Foot_Bty	Md Foot Bty			10		4	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	8	0	f	f	f	0	3	f	2	3
1599	33	4	3eme_Division	3eme Division		LeGrand	10	France	1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
1595	33	4	3eme_Division.18e_Ligne	18e Ligne			10	France	2	2	4	5	1	1	f	f	f	f	f	f	f	1800	0	0	f	f	1	0	0	0	f	0	0	4	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1592	33	4	3eme_Division.26e_Legere	26e Legere			10	France	2	2	4	6	1	1	f	f	f	f	f	f	f	1600	0	0	f	f	1	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1600	33	4	3eme_Division.75e_Ligne	75e Ligne			10	France	2	2	4	5	1	1	f	f	f	f	f	f	f	1700	0	0	f	f	1	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1605	33	4	3eme_Division.Md_Foot_Bty	Md Foot Bty			10		4	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	8	0	f	f	f	0	3	f	2	2
1601	33	4	3eme_Division.Po_Legere	Po Legere			10	France/Italy	2	2	4	6	1	1	f	f	f	f	f	f	f	1000	0	0	f	f	1	2	2	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1603	33	4	Corps_Artillery	Corps Artillery			10	France	1	2	5	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
1602	33	4	Corps_Artillery.Heavy_Bty	Heavy Bty			10		4	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	8	0	f	f	f	0	1	f	2	3
1598	33	4	Corps_Cavaly	Corps Cavaly		Guyot	10	France	1	2	4	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
1604	33	4	Corps_Cavaly.11e_Chasseur	11e Chasseur			10	France	3	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	600	0	0	0	3	4	0	0	f	f	f	0	0	f	2	0
1596	33	4	Corps_Cavaly.22e_Chasseur	22e Chasseur			10	France	3	2	1	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	600	0	0	0	3	4	0	0	f	f	f	0	0	f	2	0
1613	34	4	1eme_Division	1eme Division		Suchet	10	France	1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
1618	34	4	1eme_Division.17e_Legere	17e Legere			10	France	2	2	4	6	1	1	f	f	f	f	f	f	f	2100	0	0	f	f	1	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1614	34	4	1eme_Division.34e_Ligne	34e Ligne			10	France	2	2	4	5	1	1	f	f	f	f	f	f	f	2500	0	0	f	f	1	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1615	34	4	1eme_Division.40e_Ligne	40e Ligne			10	France	2	2	4	5	1	1	f	f	f	f	f	f	f	1800	0	0	f	f	1	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1616	34	4	1eme_Division.64e_Ligne	64e Ligne			10	France	2	2	1	5	1	1	f	f	f	f	f	f	f	1800	0	0	f	f	1	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1617	34	4	1eme_Division.88e_Ligne	88e Ligne			10	France	2	2	1	5	1	1	f	f	f	f	f	f	f	1800	0	0	f	f	1	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1619	34	4	2eme_Division	2eme Division		Gazan	10	France	1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
1621	34	4	2eme_Division.100e_Ligne	100e Ligne			10	France	2	2	4	3	1	1	f	f	f	f	f	f	f	1800	0	0	f	f	1	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1622	34	4	2eme_Division.103e_Ligne	103e Ligne			10	France	2	2	4	3	1	1	f	f	f	f	f	f	f	1800	0	0	f	f	1	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1620	34	4	2eme_Division.28e_Legere	28e Legere			10	France	2	2	4	6	1	1	f	f	f	f	f	f	f	900	0	0	f	f	1	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1608	34	4	Cav_Bde	Cav Bde		Trelliard	10	France	1	2	4	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
1609	34	4	Cav_Bde.10e_Hussar	10e Hussar			10	France	3	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	600	0	0	0	2	3	0	0	f	f	f	0	0	f	2	0
1610	34	4	Cav_Bde.9e_Hussar_Copy	9e Hussar_Copy			10	France	3	2	1	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	600	0	0	0	2	3	0	0	f	f	f	0	0	f	2	0
1611	34	4	Corps_Artillery	Corps Artillery		Careil	10	France	1	2	5	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
1593	33	4	1eme_Division.10e_Legere	10e Legere			10	France	2	2	4	6	1	1	f	f	f	f	f	f	f	1800	0	0	f	f	1	0	0	0	f	0	0	4	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1597	33	4	1eme_Division.55e_Ligne	55e Ligne			10	France	2	2	1	5	1	1	f	f	f	f	f	f	f	1400	0	0	f	f	1	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1672	38	4	1eme_Division	1eme Division		Morand	10	France	1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
1675	38	4	1eme_Division.17e_Ligne	17e Ligne			10	France	2	3	4	5	1	1	f	f	f	f	f	f	f	1800	18	0	f	f	1	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1677	38	4	1eme_Division.30e_Ligne	30e Ligne			10	France	2	3	1	5	1	1	f	f	f	f	f	f	f	1800	36	0	f	f	1	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1674	38	4	1eme_Division.51e_Ligne	51e Ligne			10	France	2	3	1	5	1	1	f	f	f	f	f	f	f	1800	54	0	f	f	1	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1676	38	4	1eme_Division.61e_Ligne	61e Ligne			10	France	2	3	1	5	1	1	f	f	f	f	f	f	f	1800	90	0	f	f	1	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1678	38	4	2eme_Division	2eme Division		Friant	10	France	1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
1673	38	4	2eme_Division.108e_Ligne	108e Ligne			10	France	2	3	1	5	1	1	f	f	f	f	f	f	f	1600	96	0	f	f	1	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1680	38	4	2eme_Division.111e_Ligne	111e Ligne			10	France	2	3	1	5	1	1	f	f	f	f	f	f	f	1800	72	0	f	f	1	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1679	38	4	2eme_Division.33e_Ligne	33e Ligne			10	France	2	3	1	5	1	1	f	f	f	f	f	f	f	1800	108	0	f	f	1	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1682	38	4	3eme_Division	3eme Division		Gudin	10	France	1	2	1	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
1683	38	4	3eme_Division.12e_Ligne	12e Ligne			10	France	2	3	1	5	1	1	f	f	f	f	f	f	f	1300	13	0	f	f	1	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1685	38	4	3eme_Division.25e_Ligne	25e Ligne			10	France	2	3	1	5	1	1	f	f	f	f	f	f	f	1800	36	0	f	f	1	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1686	38	4	3eme_Division.85e_Ligne	85e Ligne			10	France	2	3	1	5	1	1	f	f	f	f	f	f	f	1600	16	0	f	f	1	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1681	38	4	Cav_Bde	Cav Bde		Viallanes	10	France	1	2	4	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
1687	38	4	Cav_Bde.1e_Chasseur	1e Chasseur			10	France	3	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	600	0	0	0	3	3	0	0	f	f	f	0	0	f	2	0
1688	38	4	Cav_Bde.2e_Chasseur	2e Chasseur			10	France	3	2	1	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	600	0	0	0	3	3	0	0	f	f	f	0	0	f	2	0
1624	34	4	1eme_Division.Md_Foot_Bty	Md Foot Bty			10		4	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	8	0	f	f	f	0	3	f	2	3
1623	34	4	2eme_Division.21e_Legere	21e Legere			10	France	2	2	4	6	1	1	f	f	f	f	f	f	f	1800	0	0	f	f	1	0	0	0	f	0	0	5	0	0	0	0	1	0	0	0	f	f	f	0	0	f	2	0
1625	34	4	2eme_Division.Md_Foot_Bty	Md Foot Bty			10		4	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	8	0	f	f	f	0	3	f	2	3
1627	35	4	1eme_Division.39e_Ligne	39e Ligne			10	France	2	2	4	5	1	1	f	f	f	f	f	f	f	1800	0	0	f	f	1	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1628	35	4	1eme_Division.69e_Ligne	69e Ligne			10	France	2	2	1	5	1	1	f	f	f	f	f	f	f	1800	0	0	f	f	1	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1630	35	4	1eme_Division.76e_Ligne	76e Ligne			10	France	2	2	1	5	1	1	f	f	f	f	f	f	f	1800	0	0	f	f	1	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1629	35	4	Cav_Bde.10e_Chasseur	10e Chasseur			10	France	3	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	600	0	0	0	3	4	0	0	f	f	f	0	0	f	2	0
1626	35	4	Cav_Bde.9e_Hussar	9e Hussar			10	France	3	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	600	0	0	0	2	3	0	0	f	f	f	0	0	f	2	0
1631	35	4	Corps_Artillery	Corps Artillery			10	France	1	2	4	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
1669	37	4	Adv_Guard_Div.Bde_Belvilaqua	Bde Belvilaqua	Combined Bns from IR 49,  Prinz Clemens (saxon), and Kurfurst (saxon)		10	Prussia/Saxony	2	2	4	1	1	1	f	f	f	f	f	f	f	5100	0	0	f	f	1	0	1	0	f	0	0	5	0	0	0	0	0	0	6	0	f	f	f	0	4	f	2	0
1668	37	4	Adv_Guard_Div.Cav_Bde_von_Schimmelpfennig	Cav Bde von Schimmelpfennig	Schimmelpfennig Hussar Regiment # 6, ten squadrons		10	Prussia	3	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	1500	0	0	0	2	4	6	0	f	f	f	0	3	f	2	3
1670	37	4	Adv_Guard_Div.Saxon_Hussar_von_Truetzschler	Saxon Hussar von Trützschler	Saxon Hussar Regiment, eight squadrons		10	Saxony	3	2	1	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	1200	0	0	0	2	4	0	0	f	f	f	0	0	f	2	0
1646	36	4	2e_Dragoon_Div	2e Dragoon Div		Grouchy	10	France	1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
1648	36	4	3e_Dragoon_Div	3e Dragoon Div		Beaumont	10	France	1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
1715	40	4	2eme_Division.45e_Ligne	45e Ligne		Rivaud	10	France	2	2	4	5	1	1	f	f	f	f	f	f	f	2000	0	0	f	f	1	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1720	40	4	2eme_Division.4e_Legere	4e Legere		Rivaud	10	France	2	2	4	6	1	1	f	f	f	f	f	f	f	2000	0	0	f	f	1	0	1	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1716	40	4	2eme_Division.54e_Ligne	54e Ligne		Rivaud	10	France	2	2	4	5	1	1	f	f	f	f	f	f	f	2000	0	0	f	f	1	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1712	40	4	3eme_Division	3eme Division		Drouet	10	France	1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
1723	40	4	3eme_Division.27e_Legere	27e Legere		Drouet	10	France	2	2	4	6	1	1	f	f	f	f	f	f	f	1500	0	0	f	f	1	0	2	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	4	f	2	0
1714	40	4	3eme_Division.94e_Ligne	94e Ligne		Drouet	10	France	2	2	4	5	1	1	f	f	f	f	f	f	f	1500	0	0	f	f	1	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1713	40	4	3eme_Division.95e_Ligne	95e Ligne		Drouet	10	France	2	2	4	5	1	1	f	f	f	f	f	f	f	2600	0	0	f	f	1	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1711	40	4	Artillery_Reserve	Artillery Reserve		Eble	10	France	1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
1722	40	4	Artillery_Reserve.Md_Foot_Bty	Md Foot Bty			10		4	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	8	0	f	f	f	0	3	f	2	2
1709	40	4	Cav_Reserve.2e_Hussar	2e Hussar			10	France	3	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	300	0	0	0	2	3	0	0	f	f	f	0	0	f	2	0
1710	40	4	Cav_Reserve.4e_Hussar	4e Hussar			10	France	3	2	1	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	422	0	0	0	2	4	0	0	f	f	f	0	0	f	2	0
1691	38	4	1eme_Division.Md_Foot_Bty	Md Foot Bty			10		4	3	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	8	1	f	f	f	0	3	f	2	2
1690	38	4	2eme_Division.48e_Ligne	48e Ligne			10	France	2	3	1	5	1	1	f	f	f	f	f	f	f	1400	84	0	f	f	1	0	0	0	f	0	0	1	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1693	38	4	2eme_Division.Md_Foot_Bty	Md Foot Bty			10		4	3	1	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	8	1	f	f	f	0	3	f	2	2
1694	38	4	3eme_Division.Md_Foot_Bty	Md Foot Bty			10		4	3	1	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	8	1	f	f	f	0	3	f	2	2
1689	38	4	Corps_Artillery	Corps Artillery		Hannicque	10	France	1	2	4	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
1692	38	4	Corps_Artillery.Md_Foot_Bty	Md Foot Bty			10		4	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	8	0	f	f	f	0	3	f	2	2
1705	39	4	Cavalry_Division	Cavalry Division		Bessieres	10	France	1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	1	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
1698	39	4	Cavalry_Division.Chasseurs_a_Cheval	Chasseurs a Cheval			10	France	3	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	600	0	0	0	3	1	0	0	f	f	f	0	0	f	2	0
1700	39	4	Cavalry_Division.Grenadier_a_Cheval	Grenadier a Cheval			10	France	3	2	1	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	400	0	0	0	8	1	0	0	f	f	f	0	0	f	2	0
1701	39	4	Guard_Artillery	Guard Artillery		de Lamartiniére	10	France	1	2	4	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	2	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
1697	39	4	Guard_Artillery.Army_Artillery_Park	Army Artillery Park			10		4	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	16	0	f	f	f	0	1	f	2	2
1707	39	4	Guard_Artillery.Guard_Foot_Artillery	Guard Foot Artillery			10		4	2	1	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	24	0	f	f	f	0	3	f	2	1
1703	39	4	Infantry_Division	Infantry Division		Lefebvre	10	France	1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
1699	39	4	Infantry_Division.1e_Chasseurs	1e Chasseurs			10	France	2	2	1	6	1	1	f	f	f	f	f	f	f	2400	0	0	f	f	1	0	0	0	f	0	0	1	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1695	39	4	Infantry_Division.1e_Grenadiers	1e Grenadiers			10	France	2	2	4	5	1	1	f	f	f	f	f	f	f	2400	0	0	f	f	1	0	0	0	f	0	0	1	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1702	39	4	Infantry_Division.2e_Chasseurs_Copy	2e Chasseurs_Copy			10	France	2	2	1	6	1	1	f	f	f	f	f	f	f	2400	0	0	f	f	1	0	0	0	f	0	0	1	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1704	39	4	Infantry_Division.Foot_Dragoons	Foot Dragoons			10	France	2	2	1	6	1	1	f	f	f	f	f	f	f	2400	0	0	f	f	1	0	0	0	f	0	0	1	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1761	43	4	7th_Div.1st_Bn	1st Bn			10		2	2	4	3	1	1	f	f	f	f	f	f	f	1800	0	0	f	f	1	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1718	40	4	1eme_Division.96e_Ligne	96e Ligne		de l'Eltang	10	France	2	2	4	5	1	1	f	f	f	f	f	f	f	2000	0	0	f	f	1	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1721	40	4	2eme_Division	2eme Division		Rivaud	10	France	1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
1728	40	4	2eme_Division.Md_Foot_Bty_Copy	Md Foot Bty_Copy			10		4	2	1	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	0	0	0	0	0	0	0	8	0	f	f	f	0	3	f	2	3
1306	12	14	1eme_Division.96e_Ligne	96e Ligne		de l'Eltang	10	France	2	2	4	5	1	1	f	f	f	f	f	f	f	2000	0	0	f	f	1	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1724	40	4	3eme_Division.Md_Foot_Bty	Md Foot Bty			10		4	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	0	0	0	0	0	0	0	8	0	f	f	f	0	3	f	2	3
1748	42	4	Supply_Train.Supply_Escort_Detachment	Supply Escort Detachment			10		5	2	5	6	1	1	f	f	f	f	f	f	f	300	0	0	f	f	1	2	4	0	f	0	0	6	50	0	0	0	3	0	0	0	f	f	f	0	0	f	2	0
1750	43	4	1st_Div	1st Div			10		1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
1752	43	4	1st_Div.1st_Regt	1st Regt			10		2	2	4	3	1	1	f	f	f	f	f	f	f	1800	0	0	f	f	1	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1754	43	4	1st_Div.2nd_Regt	2nd Regt			10	France	2	2	4	3	1	1	f	f	f	f	f	f	f	1800	0	0	f	f	1	0	0	0	f	0	0	6	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1749	43	4	1st_Div.3rd_special_regt	3rd special regt			10		2	2	4	3	1	1	f	f	f	f	f	f	f	1800	0	0	f	f	1	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1753	43	4	2nd_Div	2nd Div			10		1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
1755	43	4	2nd_Div.1st_Regt	1st Regt			10		2	2	4	3	1	1	f	f	f	f	f	f	f	1800	0	0	f	f	1	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1751	43	4	2nd_Div.1st_Regt_of_Death	1st Regt of Death	with data		10		2	2	4	3	1	1	f	f	f	f	f	f	f	1800	0	0	f	f	1	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1764	43	4	2nd_Duvussion.NZ_Brugade_from_NZ	NZ Brugade from NZ			10		2	2	4	7	1	1	f	f	f	f	f	f	f	1800	0	0	f	f	1	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1739	41	4	1eme_Division	1eme Division		Desjardin	10	France	1	2	4	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
1730	41	4	1eme_Division.105e_Ligne	105e Ligne			10	France	2	2	1	3	1	1	f	f	f	f	f	f	f	1700	0	0	f	f	1	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1732	41	4	1eme_Division.14e_Ligne	14e Ligne			10	France	2	2	4	5	1	1	f	f	f	f	f	f	f	700	0	0	f	f	1	0	0	0	f	0	0	4	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1737	41	4	1eme_Division.16e_Legere	16e Legere			10	France	2	2	4	6	1	1	f	f	f	f	f	f	f	2700	0	0	f	f	1	0	0	0	f	0	0	4	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1738	41	4	1eme_Division.44e_Ligne	44e Ligne			10	France	2	2	1	5	1	1	f	f	f	f	f	f	f	1700	0	0	f	f	1	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1745	41	4	1eme_Division.Md_Foot_Bty	Md Foot Bty			10		4	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	8	0	f	f	f	0	3	f	2	3
1742	41	4	2eme_Division	2eme Division		Bierre	10	France	1	2	4	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
1740	41	4	2eme_Division.24e_Ligne	24e Ligne			10	France	2	2	4	5	1	1	f	f	f	f	f	f	f	1800	0	0	f	f	1	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1735	41	4	2eme_Division.63e_Ligne	63e Ligne			10	France	2	2	1	5	1	1	f	f	f	f	f	f	f	700	0	0	f	f	1	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1741	41	4	2eme_Division.7e_Legere	7e Legere			10	France	2	2	4	6	1	1	f	f	f	f	f	f	f	1800	0	0	f	f	1	0	0	0	f	0	0	4	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1744	41	4	2eme_Division.Allied_Nassau	Allied Nassau			10	Nassau	2	2	1	5	1	1	f	f	f	f	f	f	f	400	0	0	f	f	1	0	0	0	f	0	0	4	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1743	41	4	2eme_Division.Hesse_Darmstadt	Hesse Darmstadt			10	Hesse	2	2	1	1	1	1	f	f	f	f	f	f	f	800	0	0	f	f	1	0	0	0	f	0	0	4	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1746	41	4	2eme_Division.Md_Foot_Bty	Md Foot Bty			10		4	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	8	0	f	f	f	0	3	f	2	3
1734	41	4	Corps_Artillery	Corps Artillery			10	France	1	2	4	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
1736	41	4	Corps_Artillery.Heavy_Bty	Heavy Bty			10		4	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	8	0	f	f	f	0	1	f	2	2
1733	41	4	Corps_Cav	Corps Cav		Durosnel	10	France	1	2	4	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
1731	41	4	Corps_Cav.20e_Chasseur	20e Chasseur			10	France	3	2	1	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	600	0	0	0	3	4	0	0	f	f	f	0	0	f	2	0
1729	41	4	Corps_Cav.7e_Chasseur	7e Chasseur			10	France	3	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	600	0	0	0	3	4	0	0	f	f	f	0	0	f	2	0
1726	40	4	1eme_Division.Md_Foot_Bty	Md Foot Bty			10		4	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	0	0	0	0	0	0	0	8	0	f	f	f	0	3	f	2	3
1727	40	4	2eme_Division.Md_Foot_Bty	Md Foot Bty			10		4	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	0	0	0	0	0	0	0	8	0	f	f	f	0	3	f	2	3
1766	43	4	2nd_Div.3rd_special_regt_von_X	3rd special regt von X			10		2	2	1	8	1	1	f	f	f	f	f	f	f	1800	0	0	f	f	2	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1338	15	14	2nd_Duvussion.NZ_Brugade_from_NZ	NZ Brugade from NZ			10		2	2	4	7	1	1	f	f	f	f	f	f	f	1800	0	0	f	f	1	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1340	15	14	7th_Div.4th_Bn	4th Bn			10		2	2	4	3	1	1	f	f	f	f	f	f	f	1800	0	0	f	f	1	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1765	43	4	2nd_Div.Devils_Bde_as_such	Devils Bde as such	as such six much as such		10	gotta break this	2	2	4	4	1	1	f	f	f	f	f	f	f	1800	0	0	f	f	3	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1768	44	4	1st_Div	1st Div		Pr Wiliam of Orange	10	Prussia	1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
1769	44	4	2nd_Div	2nd Div		Wartensleben	10	Prussia	1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
1778	44	4	2nd_Div.Merkatz	Merkatz	Merkatz Horse Artillery Bty		10	Prussia	4	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	6	0	f	f	f	0	4	t	2	2
1771	44	4	3rd_Division	3rd Division		von Schmettau	10	Prussia	1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
1782	44	4	3rd_Division.Bde_von_Schimonsky	Bde von Schimonsky	Krafft Grenadier Battalion Malschitsky Infantry Regiment # 28, two battalions Schimonsky Infantry Regiment # 40, two battalions		10	Prussia	2	2	4	1	1	1	f	f	f	f	f	f	f	4500	0	0	f	f	1	3	0	2	f	0	0	4	0	0	0	0	0	0	6	0	f	f	f	0	3	f	2	3
1767	44	4	Adv_Guard	Adv Guard	Blucher own	Blucher	10	Prussia	1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
1770	44	4	Adv_Guard.Lt_Bde_Oswald	Lt Bde Oswald	Weimar Fusilier Battalion Greiffenberg Fusilier Battalion # 4 Oswald Fusilier Battalion # 14 Kloch Fusilier Battalion # 18		10	Prussia	2	2	4	9	1	1	f	f	f	f	f	f	f	2300	0	0	f	f	1	3	0	4	f	0	0	4	0	0	0	0	0	0	6	0	f	f	f	0	3	f	2	3
1776	44	4	Cav_Bde_Blucher.Schorlemmer	Schorlemmer	Schorlemmer Horse Bty		10	Prussia	4	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	8	0	f	f	f	0	3	t	2	3
1772	44	4	Cav_Bde_Blucher.Wurttemberg_Hussars_Nr_4	Württemberg Hussars Nr 4	Württemberg Hussar Regiment # 4		10	Prussia	3	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	1500	0	0	0	2	3	0	0	f	f	f	0	0	f	2	0
1834	47	4	1st_Div.Guard_Bde_von_Hirschfeld	Guard Bde von Hirschfeld			10	Prussia	2	2	1	1	1	1	f	f	f	f	f	f	f	2400	0	0	f	f	1	0	0	1	f	0	0	2	0	0	0	0	0	0	2	0	f	f	f	0	4	f	2	1
1836	47	4	2nd_Div.Zenge_Regt_Musketeer	Zenge Regt Musketeer			10	Prussia	2	2	1	1	1	1	f	f	f	f	f	f	f	1800	54	0	f	f	1	0	0	1	f	0	0	4	0	0	0	0	0	0	2	0	f	f	f	0	4	f	2	1
1835	47	4	2nd_Div.von_Zenge_Grenadiers	von Zenge Grenadiers			10	Prussia	2	2	1	1	1	1	f	f	f	f	f	f	f	1800	108	0	f	f	1	0	0	1	f	0	0	4	0	0	0	0	0	0	2	0	f	f	f	0	4	f	2	1
1581	32	4	Supply_Train	Supply Train		von Schulze	10	Prussia	1	2	6	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
1851	48	4	1st_Div.Foot_Bti	Foot Bti			10	Prussia	4	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	12	0	f	f	f	0	3	f	2	3
1858	48	4	1st_Div.Grenadier_Bde	Grenadier Bde	Schmeling Grenadier Battalion Crety Grenadier Battalion		10	Prussia	2	2	4	1	1	1	f	f	f	f	f	f	f	1800	0	0	f	f	1	0	0	0	f	0	0	2	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1854	48	4	2nd_Div.1st_Line	1st Line	Vieregg Grenadier Battalion Kalckreuth Infantry Regiment # 4, two battalions		10	Prussia	2	2	4	1	1	1	f	f	f	f	f	f	f	1800	0	0	f	f	1	0	1	0	f	0	0	4	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1857	48	4	2nd_Div.2nd_Line	2nd Line	Jung-Larisch Infantry Regiment # 53, two battalions Manstein Infantry Regiment # 55, two battalions		10	Prussia	2	2	4	1	1	1	f	f	f	f	f	f	f	3600	0	0	f	f	1	0	2	0	f	0	0	4	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1853	48	4	2nd_Div.Foot_Bty	Foot Bty			10	Prussia	4	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	12	0	f	f	f	0	3	f	2	3
1852	48	4	Adv_Guard.Usedom_Hussar_Nr_10	Usedom Hussar Nr 10			10	Prussia	3	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	300	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1856	48	4	Reserve_Cavalry.Dragoons	Dragoons	Hertzberg Dragoon Regiment # 9, four squadrons Katte Dragoon Regiment # 10, four squadrons		10	Prussia	3	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	1200	0	0	0	5	4	0	0	f	f	f	0	0	f	2	0
1850	48	4	Reserve_Cavalry.Usedom_Hussar_Nr_10	Usedom Hussar Nr 10			10	Prussia	3	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	1200	0	0	0	2	4	0	0	f	f	f	0	0	f	2	0
1664	36	4	Corps_Artillery.2e_Horse	2e Horse			10		4	2	1	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	8	0	f	f	f	0	3	t	2	2
1706	39	4	Guard_Artillery.Guard_Horse_Bty	Guard Horse Bty			10		4	2	1	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	8	0	f	f	f	0	4	t	2	1
1641	35	4	2eme_Division.25e_Legere	25e Legere			10	France	2	2	4	6	1	1	f	f	f	f	f	f	f	1800	0	0	f	f	1	0	0	0	f	0	0	4	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1639	35	4	2eme_Division.27e_Ligne	27e Ligne			10	France	2	2	1	5	1	1	f	f	f	f	f	f	f	1800	0	0	f	f	1	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1638	35	4	2eme_Division.50e_Ligne	50e Ligne			10	France	2	2	1	5	1	1	f	f	f	f	f	f	f	1800	0	0	f	f	1	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1632	35	4	2eme_Division.59e_Ligne	59e Ligne			10	France	2	2	1	5	1	1	f	f	f	f	f	f	f	1800	0	0	f	f	1	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1637	35	4	Cav_Bde	Cav Bde		Charbanais	10	France	1	2	4	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
1634	35	4	Corps_Artillery.2e_Heavy_Bty	2e Heavy Bty			10		4	2	1	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	8	0	f	f	f	0	1	f	2	2
1839	47	4	1st_Div.Md_Foot_Bty	Md Foot Bty			10	Prussia	4	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	8	0	f	f	f	0	3	f	2	1
1837	47	4	2nd_Div.Arnim_Regt_Musketeer	Arnim Regt Musketeer			10	Prussia	2	2	1	1	1	1	f	f	f	f	f	f	f	1800	108	0	f	f	1	0	0	1	f	0	0	4	0	0	0	0	0	0	2	0	f	f	f	0	4	f	2	1
1840	47	4	2nd_Div.Md_Foot_Bty	Md Foot Bty			10	Prussia	4	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	4	0	0	0	0	0	0	8	1	f	f	f	0	3	f	2	1
1838	47	4	2nd_Div.Pirch_Regt_Musketeer	Pirch Regt Musketeer			10	Prussia	2	2	1	1	1	1	f	f	f	f	f	f	f	1800	90	0	f	f	1	0	0	1	f	0	0	4	0	0	0	0	0	0	2	0	f	f	f	0	4	f	2	1
1788	45	4	3rd_Div	3rd Div		Tauentzein	10	Prussia	1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
1582	32	4	Supply_Train.Guard_Detachment	Guard Detachment			10		5	2	6	8	1	1	f	f	f	f	f	f	f	300	0	0	f	f	1	2	4	0	f	0	0	10	60	0	0	0	12	7	0	0	f	f	f	0	0	f	2	0
1845	48	4	1st_Div	1st Div		von Natzmer	10	Prussia	1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
1848	48	4	1st_Div.Musketeer_Bde	Musketeer Bde	Treskow Infantry Regiment # 17, two battalions Kauffberg Infantry Regiment # 51, two battalions Natzmer Infantry Regiment # 54, two battalions		10	Prussia	2	2	4	1	1	1	f	f	f	f	f	f	f	5400	0	0	f	f	1	0	3	0	f	0	0	4	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1846	48	4	2nd_Div	2nd Div		von Larisch	10	Prussia	1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
1849	48	4	Adv_Guard.Dragoons	Dragoons	Hertzberg Dragoon Regiment # 9, one squadron Katte Dragoon Regiment # 10, one squadron		10	Prussia	3	2	4	0	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	300	0	0	0	5	4	0	0	f	f	f	0	0	f	2	0
1847	48	4	Adv_Guard.Fusilier_Bde	Fusilier Bde	Borstell Fusilier Battalion # 9 Knorr Fusilier Battalion # 12 Hinrichs Fusilier Battalion # 17		10		2	2	4	9	1	1	f	f	f	f	f	f	f	2700	0	0	f	f	1	0	0	-3	f	0	0	4	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1643	36	4	1e_Cuirassier_Div	1e Cuirassier Div		Nansouty	10	France	1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
1644	36	4	1e_Dragoon_Div	1e Dragoon Div		Klein	10	France	1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
1645	36	4	2e_Cuirassier_Div	2e Cuirassier Div		d'Hautpoul	10	France	1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
1642	36	4	Corps_Artillery	Corps Artillery			10	France	1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
1583	33	4	2eme_Division	2eme Division		Leval	10	France	1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
1584	33	4	2eme_Division.28e_Ligne	28e Ligne			10	France	2	2	1	5	1	1	f	f	f	f	f	f	f	1400	0	0	f	f	1	0	0	0	f	0	0	5	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1636	35	4	1eme_Division	1eme Division		Marchand	10	France	1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
1640	35	4	1eme_Division.6e_Legere	6e Legere			10	France	2	2	4	6	1	1	f	f	f	f	f	f	f	1800	0	0	f	f	1	0	0	0	f	0	0	4	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	0
1635	35	4	2eme_Division	2eme Division		Gardanne	10	France	1	2	3	1	1	1	f	f	f	f	f	f	f	0	0	0	f	f	0	0	0	0	f	0	0	3	0	0	0	0	0	0	0	0	f	f	f	0	0	f	2	2
\.


--
-- Name: unit_id_seq; Type: SEQUENCE SET; Schema: public; Owner: steve
--

SELECT pg_catalog.setval('unit_id_seq', 1917, true);


--
-- PostgreSQL database dump complete
--

