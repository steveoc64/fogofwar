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
1128	1	14	Supply_Train	Supply Train		von Schulze	10	Prussia	1	2	6	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
1129	1	14	Supply_Train.Guard_Detachment	Guard Detachment			10		5	2	6	8	1	1	\N	\N	\N	\N	\N	\N	\N	300	0	0	\N	\N	1	2	4	0	\N	0	0	10	60	0	0	0	12	7	0	0	\N	\N	\N	0	0	f	2	0
1130	2	14	2eme_Division.Md_Foot_Bty	Md Foot Bty			10		4	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	8	0	\N	\N	\N	0	3	f	2	3
1131	2	14	1eme_Division.Md_Foot_Bty	Md Foot Bty			10		4	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	8	0	\N	\N	\N	0	3	f	2	2
1132	2	14	3eme_Division.Md_Foot_Bty	Md Foot Bty			10		4	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	8	0	\N	\N	\N	0	3	f	2	2
1133	2	14	2eme_Division	2eme Division		Leval	10	France	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
1134	2	14	2eme_Division.28e_Ligne	28e Ligne			10	France	2	2	1	5	1	1	\N	\N	\N	\N	\N	\N	\N	1400	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
1135	2	14	1eme_Division.35e_Ligne	35e Ligne			10	France	2	2	4	5	1	1	\N	\N	\N	\N	\N	\N	\N	1400	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
1136	2	14	3eme_Division.Corsican_Legere_Copy	Corsican Legere_Copy			10	France/Corsica	2	2	1	6	1	1	\N	\N	\N	\N	\N	\N	\N	1300	0	0	\N	\N	1	2	0	1	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
1137	2	14	2eme_Division.46e_Ligne	46e Ligne			10	France	2	2	1	5	1	1	\N	\N	\N	\N	\N	\N	\N	1400	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
1138	2	14	1eme_Division.43e_Ligne	43e Ligne			10	France	2	2	1	5	1	1	\N	\N	\N	\N	\N	\N	\N	1400	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
1139	2	14	2eme_Division.24e_Legere	24e Legere			10	France	2	2	1	6	1	1	\N	\N	\N	\N	\N	\N	\N	2000	0	0	\N	\N	1	0	0	0	\N	0	0	4	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
1140	2	14	2eme_Division.4e_Ligne	4e Ligne			10	France	2	2	1	5	1	1	\N	\N	\N	\N	\N	\N	\N	1400	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
1141	2	14	1eme_Division	1eme Division		St Hilaire	10	France	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
1142	2	14	3eme_Division.26e_Legere	26e Legere			10	France	2	2	4	6	1	1	\N	\N	\N	\N	\N	\N	\N	1600	0	0	\N	\N	1	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
1143	2	14	1eme_Division.10e_Legere	10e Legere			10	France	2	2	4	6	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	4	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
1144	2	14	2eme_Division.57e_Ligne	57e Ligne			10	France	2	2	1	5	1	1	\N	\N	\N	\N	\N	\N	\N	1700	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
1145	2	14	3eme_Division.18e_Ligne	18e Ligne			10	France	2	2	4	5	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	4	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
1146	2	14	Corps_Cavaly.22e_Chasseur	22e Chasseur			10	France	3	2	1	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	600	0	0	0	3	4	0	0	\N	\N	\N	0	0	f	2	0
1147	2	14	1eme_Division.55e_Ligne	55e Ligne			10	France	2	2	1	5	1	1	\N	\N	\N	\N	\N	\N	\N	1400	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
1148	2	14	Corps_Cavaly	Corps Cavaly		Guyot	10	France	1	2	4	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
1149	2	14	3eme_Division	3eme Division		LeGrand	10	France	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
1150	2	14	3eme_Division.75e_Ligne	75e Ligne			10	France	2	2	4	5	1	1	\N	\N	\N	\N	\N	\N	\N	1700	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
1151	2	14	3eme_Division.Po_Legere	Po Legere			10	France/Italy	2	2	4	6	1	1	\N	\N	\N	\N	\N	\N	\N	1000	0	0	\N	\N	1	2	2	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
1152	2	14	Corps_Artillery.Heavy_Bty	Heavy Bty			10		4	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	8	0	\N	\N	\N	0	1	f	2	3
1153	2	14	Corps_Artillery	Corps Artillery			10	France	1	2	5	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
1154	2	14	Corps_Cavaly.11e_Chasseur	11e Chasseur			10	France	3	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	600	0	0	0	3	4	0	0	\N	\N	\N	0	0	f	2	0
1155	3	14	2eme_Division.Md_Foot_Bty	Md Foot Bty			10		4	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	8	0	\N	\N	\N	0	3	f	2	3
1156	3	14	1eme_Division.Md_Foot_Bty	Md Foot Bty			10		4	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	8	0	\N	\N	\N	0	3	f	2	3
1157	3	14	Cav_Bde	Cav Bde		Trelliard	10	France	1	2	4	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
1158	3	14	Cav_Bde.10e_Hussar	10e Hussar			10	France	3	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	600	0	0	0	2	3	0	0	\N	\N	\N	0	0	f	2	0
1159	3	14	Cav_Bde.9e_Hussar_Copy	9e Hussar_Copy			10	France	3	2	1	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	600	0	0	0	2	3	0	0	\N	\N	\N	0	0	f	2	0
1160	3	14	Corps_Artillery	Corps Artillery		Careil	10	France	1	2	5	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
1161	3	14	Corps_Artillery.Heavy_Foot	Heavy Foot			10		4	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	8	0	\N	\N	\N	0	1	f	2	2
1162	3	14	1eme_Division	1eme Division		Suchet	10	France	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
1163	3	14	1eme_Division.17e_Legere	17e Legere			10	France	2	2	4	6	1	1	\N	\N	\N	\N	\N	\N	\N	2100	0	0	\N	\N	1	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
1164	3	14	1eme_Division.34e_Ligne	34e Ligne			10	France	2	2	4	5	1	1	\N	\N	\N	\N	\N	\N	\N	2500	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
1165	3	14	1eme_Division.40e_Ligne	40e Ligne			10	France	2	2	4	5	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
1166	3	14	1eme_Division.64e_Ligne	64e Ligne			10	France	2	2	1	5	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
1167	3	14	1eme_Division.88e_Ligne	88e Ligne			10	France	2	2	1	5	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
1168	3	14	2eme_Division	2eme Division		Gazan	10	France	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
1169	3	14	2eme_Division.21e_Legere	21e Legere			10	France	2	2	4	6	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	1	0	0	0	\N	\N	\N	0	0	f	2	0
1170	3	14	2eme_Division.28e_Legere	28e Legere			10	France	2	2	4	6	1	1	\N	\N	\N	\N	\N	\N	\N	900	0	0	\N	\N	1	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
1171	3	14	2eme_Division.100e_Ligne	100e Ligne			10	France	2	2	4	3	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
1172	3	14	2eme_Division.103e_Ligne	103e Ligne			10	France	2	2	4	3	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
1173	4	14	Cav_Bde.9e_Hussar	9e Hussar			10	France	3	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	600	0	0	0	2	3	0	0	\N	\N	\N	0	0	f	2	0
1174	4	14	1eme_Division.39e_Ligne	39e Ligne			10	France	2	2	4	5	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
1175	4	14	1eme_Division.69e_Ligne	69e Ligne			10	France	2	2	1	5	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
1176	4	14	Cav_Bde.10e_Chasseur	10e Chasseur			10	France	3	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	600	0	0	0	3	4	0	0	\N	\N	\N	0	0	f	2	0
1177	4	14	1eme_Division.76e_Ligne	76e Ligne			10	France	2	2	1	5	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
1178	4	14	Corps_Artillery	Corps Artillery			10	France	1	2	4	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
1179	4	14	2eme_Division.59e_Ligne	59e Ligne			10	France	2	2	1	5	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
1180	4	14	Corps_Artillery.1e_Heavy_Bty	1e Heavy Bty			10		4	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	8	0	\N	\N	\N	0	1	f	2	2
1181	4	14	Corps_Artillery.2e_Heavy_Bty	2e Heavy Bty			10		4	2	1	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	8	0	\N	\N	\N	0	1	f	2	2
1182	4	14	2eme_Division	2eme Division		Gardanne	10	France	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
1183	4	14	1eme_Division	1eme Division		Marchand	10	France	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
1184	4	14	Cav_Bde	Cav Bde		Charbanais	10	France	1	2	4	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
1185	4	14	2eme_Division.50e_Ligne	50e Ligne			10	France	2	2	1	5	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
1186	4	14	2eme_Division.27e_Ligne	27e Ligne			10	France	2	2	1	5	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
1187	4	14	1eme_Division.6e_Legere	6e Legere			10	France	2	2	4	6	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	4	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
1188	4	14	2eme_Division.25e_Legere	25e Legere			10	France	2	2	4	6	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	4	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
1189	5	14	Corps_Artillery	Corps Artillery			10	France	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
1190	5	14	1e_Cuirassier_Div	1e Cuirassier Div		Nansouty	10	France	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
1191	5	14	1e_Dragoon_Div	1e Dragoon Div		Klein	10	France	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
1192	5	14	2e_Cuirassier_Div	2e Cuirassier Div		d'Hautpoul	10	France	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
1193	5	14	2e_Dragoon_Div	2e Dragoon Div		Grouchy	10	France	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
1194	5	14	2e_Cuirassier_Div.Bde_Verdiere	Bde Verdiere			10	France	3	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	600	0	0	0	1	4	0	0	\N	\N	\N	0	0	f	2	0
1195	5	14	3e_Dragoon_Div	3e Dragoon Div		Beaumont	10	France	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
1196	5	14	4e_Dragoon_Div	4e Dragoon Div		Sahut	10	France	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
1197	5	14	2e_Cuirassier_Div.Bde_StSulpice	Bde St.Sulpice			10	France	3	2	1	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	600	0	0	0	1	4	0	0	\N	\N	\N	0	0	f	2	0
1198	5	14	Light_Div	Light Div		Lasalle	10	France	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
1199	5	14	Light_Div.Milhaud_1e_Hussar	Milhaud 1e Hussar			10	France	3	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	600	0	0	0	2	3	0	0	\N	\N	\N	0	0	f	2	0
1200	5	14	Light_Div.Bde_Lasalle_5_7e_Hussar	Bde Lasalle 5/7e Hussar			10	France	3	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	600	0	0	0	2	3	0	0	\N	\N	\N	0	0	f	2	0
1201	5	14	2e_Dragoon_Div.Bde_Roget	Bde Roget			10	France	3	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	900	0	0	0	5	5	0	0	\N	\N	\N	0	0	f	2	0
1202	5	14	1e_Cuirassier_Div.Bde_Defrance	Bde Defrance			10	France	3	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	600	0	0	0	9	2	0	0	\N	\N	\N	0	0	f	2	0
1203	5	14	2e_Dragoon_Div.Bde_Milet	Bde Milet			10	France	3	2	1	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	600	0	0	0	5	5	0	0	\N	\N	\N	0	0	f	2	0
1204	5	14	1e_Cuirassier_Div.Bde_Housaye	Bde Housaye			10	France	3	2	1	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	1300	0	0	0	1	2	0	0	\N	\N	\N	0	0	f	2	0
1205	5	14	1e_Dragoon_Div.Bde_Fenerolz	Bde Fenerolz			10	France	3	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	600	0	0	0	5	4	0	0	\N	\N	\N	0	0	f	2	0
1206	5	14	4e_Dragoon_Div.Bde_Laplanche	Bde Laplanche			10	France	3	2	1	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	1200	0	0	0	5	5	0	0	\N	\N	\N	0	0	f	2	0
1207	5	14	1e_Dragoon_Div.Bde_Picard	Bde Picard			10	France	3	2	1	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	600	0	0	0	5	4	0	0	\N	\N	\N	0	0	f	2	0
1208	5	14	4e_Dragoon_Div.Bde_Margaron	Bde Margaron			10	France	3	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	1200	0	0	0	5	5	0	0	\N	\N	\N	0	0	f	2	0
1209	5	14	3e_Dragoon_Div.Bde_Boye	Bde Boye			10	France	3	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	900	0	0	0	5	5	0	0	\N	\N	\N	0	0	f	2	0
1210	5	14	3e_Dragoon_Div.Bde_Maubourg	Bde Maubourg			10	France	3	2	1	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	600	0	0	0	5	5	0	0	\N	\N	\N	0	0	f	2	0
1211	5	14	Corps_Artillery.1e_Horse	1e Horse			10		4	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	8	0	\N	\N	\N	0	3	t	2	2
1212	5	14	Corps_Artillery.2e_Horse	2e Horse			10		4	2	1	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	8	0	\N	\N	\N	0	3	t	2	2
1213	6	14	2nd_Div.Horse_Bty	Horse Bty			10	Saxony	4	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	8	0	\N	\N	\N	0	3	f	2	3
1214	6	14	2nd_Div.von_Burgsdorf	von Burgsdorf			10	Saxony	2	2	4	1	1	1	\N	\N	\N	\N	\N	\N	\N	3400	0	0	\N	\N	1	0	1	0	\N	0	0	4	0	0	0	0	0	0	1	0	\N	\N	\N	0	4	f	2	3
1215	6	14	2nd_Div.von_Dyherrn	von Dyherrn			10	Saxony	2	2	4	3	1	1	\N	\N	\N	\N	\N	\N	\N	4200	0	0	\N	\N	1	0	1	0	\N	0	0	4	0	0	0	0	0	0	2	0	\N	\N	\N	0	4	f	2	3
1216	6	14	1st_Div.Horse_Bty	Horse Bty			10	Prussia	4	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	8	0	\N	\N	\N	0	3	f	2	3
1217	6	14	Reserve_Div.Prittwitz_Grenadier_Bde	Prittwitz Grenadier Bde			10	Prussia	2	2	4	1	1	1	\N	\N	\N	\N	\N	\N	\N	3300	0	0	\N	\N	1	0	0	2	\N	0	0	4	0	0	0	0	0	0	2	0	\N	\N	\N	0	4	f	2	3
1218	6	14	Reserve_Div.Cerrini_Grenadier_Bde	Cerrini Grenadier Bde			10	Prussia	2	2	4	1	1	1	\N	\N	\N	\N	\N	\N	\N	4200	0	0	\N	\N	1	0	0	2	\N	0	0	4	0	0	0	0	0	0	2	0	\N	\N	\N	0	4	f	2	3
1219	6	14	1st_Div.von_Schimonsky	von Schimonsky			10	Prussia	2	2	4	1	1	1	\N	\N	\N	\N	\N	\N	\N	3400	0	0	\N	\N	1	0	1	0	\N	0	0	4	0	0	0	0	0	0	2	0	\N	\N	\N	0	4	f	2	3
1220	6	14	Reserve_Div.Md_Foot_Bty	Md Foot Bty			10	Prussia	4	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	8	0	\N	\N	\N	0	3	f	2	4
1221	6	14	3rd_Div	3rd Div		Tauentzein	10	Prussia	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
1222	6	14	3rd_Div.Cav_Bde_Prince_Clement	Cav Bde Prince Clement			10	Prussia	3	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	700	0	0	0	2	4	0	0	\N	\N	\N	0	0	f	2	0
1223	6	14	3rd_Div.Rosen_Fusilers	Rosen Fusilers			10	Prussia	2	2	4	9	1	1	\N	\N	\N	\N	\N	\N	\N	400	0	0	\N	\N	1	0	0	2	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
1224	6	14	3rd_Div.von_Schoeneberg	von Schöneberg			10	Saxony	2	2	4	1	1	1	\N	\N	\N	\N	\N	\N	\N	3400	0	0	\N	\N	1	0	1	0	\N	0	0	5	0	0	0	0	0	0	2	0	\N	\N	\N	0	4	f	2	4
1225	6	14	3rd_Div.von_Zweiffel	von Zweiffel			10	Prussia	2	2	4	1	1	1	\N	\N	\N	\N	\N	\N	\N	3400	0	0	\N	\N	1	0	1	0	\N	0	0	4	0	0	0	0	0	0	2	0	\N	\N	\N	0	4	f	2	0
1226	6	14	1st_Div	1st Div		Grawert	10	Prussia	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
1227	6	14	3rd_Div.Lt_Bty	Lt Bty			10	Prussia	4	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	6	0	\N	\N	\N	0	4	f	2	3
1228	6	14	Reserve_Div.Cav_Bde_von_Krafft	Cav Bde von Krafft			10	Prussia	3	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	900	0	0	0	12	3	0	0	\N	\N	\N	0	0	f	2	0
1229	6	14	1st_Div.von_Mueffling	von Müffling			10	Prussia	2	2	4	1	1	1	\N	\N	\N	\N	\N	\N	\N	3600	0	0	\N	\N	1	0	1	0	\N	0	0	4	0	0	0	0	0	0	2	0	\N	\N	\N	0	4	f	2	3
1230	6	14	Reserve_Div	Reserve Div		Prittwitz	10	Prussia	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
1231	6	14	Reserve_Div.Heavy_Bty	Heavy Bty			10	Prussia	4	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	8	0	\N	\N	\N	0	1	f	2	3
1232	6	14	1st_Div.Heavy_Bty	Heavy Bty			10	Prussia	4	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	8	0	\N	\N	\N	0	1	f	2	4
1233	6	14	1st_Div.Bde_Henkel	Bde Henkel			10	Prussia	3	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	900	0	0	0	5	3	0	0	\N	\N	\N	0	0	f	2	0
1234	6	14	2nd_Div.Boguslawsky_Fusilers	Boguslawsky Fusilers			10	Prussia	2	2	4	9	1	1	\N	\N	\N	\N	\N	\N	\N	800	0	0	\N	\N	1	0	2	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
1235	6	14	2nd_Div	2nd Div		Zechwitz	10	Prussia	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
1236	6	14	1st_Div.Erichsen_Fusilers	Erichsen Fusilers			10		2	2	4	9	1	1	\N	\N	\N	\N	\N	\N	\N	700	0	0	\N	\N	1	0	0	1	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
1237	6	14	2nd_Div.Cav_Bde_von_Kochitsky	Cav Bde von Kochitsky			10	Saxony	3	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	200	0	0	0	1	3	0	0	\N	\N	\N	0	0	f	2	0
1238	6	14	2nd_Div.Heavy_Bty	Heavy Bty			10	Saxony	4	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	8	0	\N	\N	\N	0	1	f	2	3
1239	7	14	Adv_Guard_Div.Saxon_Hussar_von_Truetzschler	Saxon Hussar von Trützschler	Saxon Hussar Regiment, eight squadrons		10	Saxony	3	2	1	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	1200	0	0	0	2	4	0	0	\N	\N	\N	0	0	f	2	0
1240	7	14	Adv_Guard_Div.Cav_Bde_von_Schimmelpfennig	Cav Bde von Schimmelpfennig	Schimmelpfennig Hussar Regiment # 6, ten squadrons		10	Prussia	3	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	1500	0	0	0	2	4	6	0	\N	\N	\N	0	3	f	2	3
1241	7	14	Adv_Guard_Div.Bde_von_Pelet	Bde von Pelet	Rabenau # 13 Pelet # 14 Rühle # 15 Fusiliers, Masars and Valentin Jager 		10	Prussia	2	2	4	9	1	1	\N	\N	\N	\N	\N	\N	\N	2400	0	0	\N	\N	1	0	0	2	\N	0	0	4	0	0	0	0	0	0	6	0	\N	\N	\N	0	3	f	2	3
1242	7	14	Adv_Guard_Div.Bde_Belvilaqua	Bde Belvilaqua	Combined Bns from IR 49,  Prinz Clemens (saxon), and Kurfurst (saxon)		10	Prussia/Saxony	2	2	4	1	1	1	\N	\N	\N	\N	\N	\N	\N	5100	0	0	\N	\N	1	0	1	0	\N	0	0	5	0	0	0	0	0	0	6	0	\N	\N	\N	0	4	f	2	0
1243	7	14	Adv_Guard_Div	Adv Guard Div		Ferdinand	10	Prussia	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
1244	9	14	2nd_Div.von_Malschitsky_Grenadiers	von Malschitsky Grenadiers			10	Prussia	2	2	4	1	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	1	\N	0	0	4	0	0	0	0	0	0	2	0	\N	\N	\N	0	4	f	2	1
1245	9	14	2nd_Div.Md_Foot_Bty	Md Foot Bty			10	Prussia	4	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	8	0	\N	\N	\N	0	3	f	2	1
1246	9	14	1st_Div.Md_Foot_Bty	Md Foot Bty			10	Prussia	4	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	8	0	\N	\N	\N	0	3	f	2	1
1247	9	14	2nd_Div.Pirch_Regt_Musketeer	Pirch Regt Musketeer			10	Prussia	2	2	1	1	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	1	\N	0	0	4	0	0	0	0	0	0	2	0	\N	\N	\N	0	4	f	2	1
1248	9	14	2nd_Div.Arnim_Regt_Musketeer	Arnim Regt Musketeer			10	Prussia	2	2	1	1	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	1	\N	0	0	4	0	0	0	0	0	0	2	0	\N	\N	\N	0	4	f	2	1
1249	9	14	2nd_Div.Zenge_Regt_Musketeer	Zenge Regt Musketeer			10	Prussia	2	2	1	1	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	1	\N	0	0	4	0	0	0	0	0	0	2	0	\N	\N	\N	0	4	f	2	1
1250	9	14	2nd_Div.von_Zenge_Grenadiers	von Zenge Grenadiers			10	Prussia	2	2	1	1	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	1	\N	0	0	4	0	0	0	0	0	0	2	0	\N	\N	\N	0	4	f	2	1
1251	9	14	1st_Div.Guard_Bde_von_Hirschfeld	Guard Bde von Hirschfeld			10	Prussia	2	2	1	1	1	1	\N	\N	\N	\N	\N	\N	\N	2400	0	0	\N	\N	1	0	0	1	\N	0	0	2	0	0	0	0	0	0	2	0	\N	\N	\N	0	4	f	2	1
1252	9	14	1st_Div.Guard_Bde_von_Pletz	Guard Bde von Pletz			10	Prussia	2	2	4	1	1	1	\N	\N	\N	\N	\N	\N	\N	2400	0	0	\N	\N	1	0	0	1	\N	0	0	2	0	0	0	0	0	0	2	0	\N	\N	\N	0	4	f	2	1
1253	9	14	1st_Div	1st Div		Kuhnheim	10	Prussia	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
1254	9	14	1st_Div.Garde_du_Corps_Cavalry	Garde du Corps Cavalry			10	Prussia	3	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	600	0	0	0	1	1	0	0	\N	\N	\N	0	0	f	2	0
1255	9	14	1st_Div.Beeren_Cuirassier	Beeren Cuirassier			10	Prussia	3	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	400	0	0	0	1	2	0	0	\N	\N	\N	0	0	f	2	0
1256	9	14	2nd_Div	2nd Div		von Arnim	10	Prussia	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
1257	10	14	3eme_Division.Md_Foot_Bty	Md Foot Bty			10		4	2	1	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	8	0	\N	\N	\N	0	3	f	2	2
1258	10	14	2eme_Division.Md_Foot_Bty	Md Foot Bty			10		4	2	1	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	8	0	\N	\N	\N	0	3	f	2	2
1259	10	14	Corps_Artillery.Md_Foot_Bty	Md Foot Bty			10		4	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	8	0	\N	\N	\N	0	3	f	2	2
1260	10	14	1eme_Division.Md_Foot_Bty	Md Foot Bty			10		4	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	8	0	\N	\N	\N	0	3	f	2	2
1261	10	14	1eme_Division.13e_Legere	13e Legere			10	France	2	2	4	6	1	1	\N	\N	\N	\N	\N	\N	\N	1400	0	0	\N	\N	1	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
1262	10	14	1eme_Division	1eme Division		Morand	10	France	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
1263	10	14	2eme_Division.108e_Ligne	108e Ligne			10	France	2	2	1	5	1	1	\N	\N	\N	\N	\N	\N	\N	1600	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
1264	10	14	1eme_Division.51e_Ligne	51e Ligne			10	France	2	2	1	5	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
1265	10	14	1eme_Division.17e_Ligne	17e Ligne			10	France	2	2	4	5	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
1266	10	14	1eme_Division.61e_Ligne	61e Ligne			10	France	2	2	1	5	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
1267	10	14	1eme_Division.30e_Ligne	30e Ligne			10	France	2	2	1	5	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
1268	10	14	2eme_Division	2eme Division		Friant	10	France	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
1269	10	14	2eme_Division.33e_Ligne	33e Ligne			10	France	2	2	1	5	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
1270	10	14	2eme_Division.48e_Ligne	48e Ligne			10	France	2	2	1	5	1	1	\N	\N	\N	\N	\N	\N	\N	1400	0	0	\N	\N	1	0	0	0	\N	0	0	1	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
1271	10	14	2eme_Division.111e_Ligne	111e Ligne			10	France	2	2	1	5	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
1272	10	14	Cav_Bde	Cav Bde		Viallanes	10	France	1	2	4	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
1273	10	14	3eme_Division	3eme Division		Gudin	10	France	1	2	1	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
1274	10	14	3eme_Division.12e_Ligne	12e Ligne			10	France	2	2	1	5	1	1	\N	\N	\N	\N	\N	\N	\N	1300	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
1275	10	14	3eme_Division.21e_Ligne	21e Ligne			10	France	2	2	1	5	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
1276	10	14	3eme_Division.25e_Ligne	25e Ligne			10	France	2	2	1	5	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
1277	10	14	3eme_Division.85e_Ligne	85e Ligne			10	France	2	2	1	5	1	1	\N	\N	\N	\N	\N	\N	\N	1600	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
1278	10	14	Cav_Bde.1e_Chasseur	1e Chasseur			10	France	3	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	600	0	0	0	3	3	0	0	\N	\N	\N	0	0	f	2	0
1279	10	14	Cav_Bde.2e_Chasseur	2e Chasseur			10	France	3	2	1	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	600	0	0	0	3	3	0	0	\N	\N	\N	0	0	f	2	0
1280	10	14	Corps_Artillery	Corps Artillery		Hannicque	10	France	1	2	4	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
1281	11	14	Guard_Artillery.Guard_Foot_Artillery	Guard Foot Artillery			10		4	2	1	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	24	0	\N	\N	\N	0	3	f	2	1
1282	11	14	Infantry_Division.1e_Grenadiers	1e Grenadiers			10	France	2	2	4	5	1	1	\N	\N	\N	\N	\N	\N	\N	2400	0	0	\N	\N	1	0	0	0	\N	0	0	1	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
1283	11	14	Infantry_Division.2e_Grenadiers	2e Grenadiers			10	France	2	2	1	5	1	1	\N	\N	\N	\N	\N	\N	\N	2400	0	0	\N	\N	1	0	0	0	\N	0	0	1	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
1284	11	14	Guard_Artillery.Army_Artillery_Park	Army Artillery Park			10		4	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	16	0	\N	\N	\N	0	1	f	2	2
1285	11	14	Cavalry_Division.Chasseurs_a_Cheval	Chasseurs a Cheval			10	France	3	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	600	0	0	0	3	1	0	0	\N	\N	\N	0	0	f	2	0
1286	11	14	Infantry_Division.1e_Chasseurs	1e Chasseurs			10	France	2	2	1	6	1	1	\N	\N	\N	\N	\N	\N	\N	2400	0	0	\N	\N	1	0	0	0	\N	0	0	1	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
1287	11	14	Cavalry_Division.Grenadier_a_Cheval	Grenadier a Cheval			10	France	3	2	1	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	400	0	0	0	8	1	0	0	\N	\N	\N	0	0	f	2	0
1288	11	14	Guard_Artillery	Guard Artillery		de Lamartiniére	10	France	1	2	4	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	2	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
1289	11	14	Infantry_Division.2e_Chasseurs_Copy	2e Chasseurs_Copy			10	France	2	2	1	6	1	1	\N	\N	\N	\N	\N	\N	\N	2400	0	0	\N	\N	1	0	0	0	\N	0	0	1	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
1290	11	14	Infantry_Division	Infantry Division		Lefebvre	10	France	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
1291	11	14	Infantry_Division.Foot_Dragoons	Foot Dragoons			10	France	2	2	1	6	1	1	\N	\N	\N	\N	\N	\N	\N	2400	0	0	\N	\N	1	0	0	0	\N	0	0	1	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
1292	11	14	Cavalry_Division	Cavalry Division		Bessieres	10	France	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	1	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
1293	11	14	Guard_Artillery.Guard_Horse_Bty	Guard Horse Bty			10		4	2	1	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	8	0	\N	\N	\N	0	4	t	2	1
1294	12	14	2eme_Division.Md_Foot_Bty_Copy	Md Foot Bty_Copy			10		4	2	1	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	0	0	0	0	0	0	0	8	0	\N	\N	\N	0	3	f	2	3
1295	12	14	3eme_Division.Md_Foot_Bty	Md Foot Bty			10		4	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	0	0	0	0	0	0	0	8	0	\N	\N	\N	0	3	f	2	3
1296	12	14	3eme_Division.27e_Legere	27e Legere		Drouet	10	France	2	2	4	6	1	1	\N	\N	\N	\N	\N	\N	\N	1500	0	0	\N	\N	1	0	2	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	4	f	2	0
1297	12	14	Artillery_Reserve.Md_Foot_Bty	Md Foot Bty			10		4	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	8	0	\N	\N	\N	0	3	f	2	2
1298	12	14	2eme_Division.Md_Foot_Bty	Md Foot Bty			10		4	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	0	0	0	0	0	0	0	8	0	\N	\N	\N	0	3	f	2	3
1299	12	14	1eme_Division.Md_Foot_Bty	Md Foot Bty			10		4	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	0	0	0	0	0	0	0	8	0	\N	\N	\N	0	3	f	2	3
1300	12	14	1eme_Division.9e_Legere	9e Legere		de l'Eltang	10	France	2	2	4	6	1	1	\N	\N	\N	\N	\N	\N	\N	2600	0	0	\N	\N	1	2	0	0	\N	0	0	4	0	0	0	0	0	0	0	0	\N	\N	\N	0	4	f	2	0
1301	12	14	2eme_Division.45e_Ligne	45e Ligne		Rivaud	10	France	2	2	4	5	1	1	\N	\N	\N	\N	\N	\N	\N	2000	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
1302	12	14	2eme_Division.54e_Ligne	54e Ligne		Rivaud	10	France	2	2	4	5	1	1	\N	\N	\N	\N	\N	\N	\N	2000	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
1303	12	14	2eme_Division	2eme Division		Rivaud	10	France	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
1304	12	14	1eme_Division.32e_Ligne	32e Ligne		de l'Eltang	10	France	2	2	4	5	1	1	\N	\N	\N	\N	\N	\N	\N	2000	0	0	\N	\N	1	0	0	0	\N	0	0	4	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
1305	12	14	1eme_Division	1eme Division		de l'Eltang	10	France	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
1306	12	14	1eme_Division.96e_Ligne	96e Ligne		de l'Eltang	10	France	2	2	4	5	1	1	\N	\N	\N	\N	\N	\N	\N	2000	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
1307	12	14	2eme_Division.4e_Legere	4e Legere		Rivaud	10	France	2	2	4	6	1	1	\N	\N	\N	\N	\N	\N	\N	2000	0	0	\N	\N	1	0	1	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
1308	12	14	Cav_Reserve	Cav Reserve		Tilley	10	France	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
1309	12	14	Cav_Reserve.2e_Hussar	2e Hussar			10	France	3	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	300	0	0	0	2	3	0	0	\N	\N	\N	0	0	f	2	0
1310	12	14	Cav_Reserve.4e_Hussar	4e Hussar			10	France	3	2	1	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	422	0	0	0	2	4	0	0	\N	\N	\N	0	0	f	2	0
1311	12	14	Artillery_Reserve	Artillery Reserve		Eble	10	France	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
1312	12	14	3eme_Division	3eme Division		Drouet	10	France	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
1313	12	14	3eme_Division.95e_Ligne	95e Ligne		Drouet	10	France	2	2	4	5	1	1	\N	\N	\N	\N	\N	\N	\N	2600	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
1314	12	14	3eme_Division.94e_Ligne	94e Ligne		Drouet	10	France	2	2	4	5	1	1	\N	\N	\N	\N	\N	\N	\N	1500	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
1315	13	14	2eme_Division.24e_Ligne	24e Ligne			10	France	2	2	4	5	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
1316	13	14	2eme_Division.Md_Foot_Bty	Md Foot Bty			10		4	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	8	0	\N	\N	\N	0	3	f	2	3
1317	13	14	1eme_Division.Md_Foot_Bty	Md Foot Bty			10		4	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	8	0	\N	\N	\N	0	3	f	2	3
1318	13	14	Corps_Cav.7e_Chasseur	7e Chasseur			10	France	3	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	600	0	0	0	3	4	0	0	\N	\N	\N	0	0	f	2	0
1319	13	14	1eme_Division.105e_Ligne	105e Ligne			10	France	2	2	1	3	1	1	\N	\N	\N	\N	\N	\N	\N	1700	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
1320	13	14	Corps_Cav.20e_Chasseur	20e Chasseur			10	France	3	2	1	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	600	0	0	0	3	4	0	0	\N	\N	\N	0	0	f	2	0
1321	13	14	1eme_Division.14e_Ligne	14e Ligne			10	France	2	2	4	5	1	1	\N	\N	\N	\N	\N	\N	\N	700	0	0	\N	\N	1	0	0	0	\N	0	0	4	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
1322	13	14	Corps_Cav	Corps Cav		Durosnel	10	France	1	2	4	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
1323	13	14	Corps_Artillery	Corps Artillery			10	France	1	2	4	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
1324	13	14	2eme_Division.63e_Ligne	63e Ligne			10	France	2	2	1	5	1	1	\N	\N	\N	\N	\N	\N	\N	700	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
1325	13	14	Corps_Artillery.Heavy_Bty	Heavy Bty			10		4	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	8	0	\N	\N	\N	0	1	f	2	2
1326	13	14	1eme_Division.16e_Legere	16e Legere			10	France	2	2	4	6	1	1	\N	\N	\N	\N	\N	\N	\N	2700	0	0	\N	\N	1	0	0	0	\N	0	0	4	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
1327	13	14	1eme_Division.44e_Ligne	44e Ligne			10	France	2	2	1	5	1	1	\N	\N	\N	\N	\N	\N	\N	1700	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
1328	13	14	1eme_Division	1eme Division		Desjardin	10	France	1	2	4	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
1329	13	14	2eme_Division.7e_Legere	7e Legere			10	France	2	2	4	6	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	4	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
1330	13	14	2eme_Division	2eme Division		Bierre	10	France	1	2	4	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
1331	13	14	2eme_Division.Hesse_Darmstadt	Hesse Darmstadt			10	Hesse	2	2	1	1	1	1	\N	\N	\N	\N	\N	\N	\N	800	0	0	\N	\N	1	0	0	0	\N	0	0	4	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
1332	13	14	2eme_Division.Allied_Nassau	Allied Nassau			10	Nassau	2	2	1	5	1	1	\N	\N	\N	\N	\N	\N	\N	400	0	0	\N	\N	1	0	0	0	\N	0	0	4	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
1333	14	14	Supply_Train	Supply Train			10	France	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
1334	14	14	Supply_Train.Supply_Escort_Detachment	Supply Escort Detachment			10		5	2	5	6	1	1	\N	\N	\N	\N	\N	\N	\N	300	0	0	\N	\N	1	2	4	0	\N	0	0	6	50	0	0	0	3	0	0	0	\N	\N	\N	0	0	f	2	0
1335	15	14	2nd_Div.3rd_special_regt_von_X	3rd special regt von X			10		2	2	1	8	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	2	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
1336	15	14	2nd_Div.1st_Regt_of_Death	1st Regt of Death	with data		10		2	2	4	3	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
1337	15	14	2nd_Div.Devils_Bde_as_such	Devils Bde as such	as such six much as such		10	gotta break this	2	2	4	4	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	3	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
1338	15	14	2nd_Duvussion.NZ_Brugade_from_NZ	NZ Brugade from NZ			10		2	2	4	7	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
1339	15	14	2nd_Duvussion	2nd Duvussion			10		1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
1340	15	14	7th_Div.4th_Bn	4th Bn			10		2	2	4	3	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
1341	15	14	7th_Div.1st_Bn	1st Bn			10		2	2	4	3	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
1342	15	14	6th_Division	6th Division			10		1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
1343	15	14	6th_Division.2nd_Regt	2nd Regt			10		2	2	4	3	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
1344	15	14	6th_Division.1st_Regt	1st Regt			10		2	2	4	3	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
1345	15	14	7th_Div	7th Div			10		1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
1346	15	14	2nd_Div.2nd_Regt	2nd Regt			10		2	2	4	3	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
1347	15	14	2nd_Div.1st_Regt	1st Regt			10		2	2	4	3	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
1348	15	14	2nd_Div	2nd Div			10		1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
1349	15	14	1st_Div.3rd_special_regt	3rd special regt			10		2	2	4	3	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
1350	15	14	1st_Div.2nd_Regt	2nd Regt			10	France	2	2	4	3	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	6	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
1351	15	14	1st_Div.1st_Regt	1st Regt			10		2	2	4	3	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
1352	15	14	1st_Div	1st Div			10		1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
1353	16	1	Supply_Train	Supply Train		von Schulze	10	Prussia	1	2	6	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
1354	16	1	Supply_Train.Guard_Detachment	Guard Detachment			10		5	2	6	8	1	1	\N	\N	\N	\N	\N	\N	\N	300	0	0	\N	\N	1	2	4	0	\N	0	0	10	60	0	0	0	12	7	0	0	\N	\N	\N	0	0	f	2	0
1355	17	1	2eme_Division	2eme Division		Leval	10	France	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
1356	17	1	2eme_Division.28e_Ligne	28e Ligne			10	France	2	2	1	5	1	1	\N	\N	\N	\N	\N	\N	\N	1400	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
1357	17	1	1eme_Division.35e_Ligne	35e Ligne			10	France	2	2	4	5	1	1	\N	\N	\N	\N	\N	\N	\N	1400	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
1358	17	1	3eme_Division.Corsican_Legere_Copy	Corsican Legere_Copy			10	France/Corsica	2	2	1	6	1	1	\N	\N	\N	\N	\N	\N	\N	1300	0	0	\N	\N	1	2	0	1	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
1359	17	1	2eme_Division.46e_Ligne	46e Ligne			10	France	2	2	1	5	1	1	\N	\N	\N	\N	\N	\N	\N	1400	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
1360	17	1	1eme_Division.43e_Ligne	43e Ligne			10	France	2	2	1	5	1	1	\N	\N	\N	\N	\N	\N	\N	1400	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
1361	17	1	2eme_Division.24e_Legere	24e Legere			10	France	2	2	1	6	1	1	\N	\N	\N	\N	\N	\N	\N	2000	0	0	\N	\N	1	0	0	0	\N	0	0	4	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
1362	17	1	2eme_Division.4e_Ligne	4e Ligne			10	France	2	2	1	5	1	1	\N	\N	\N	\N	\N	\N	\N	1400	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
1363	17	1	1eme_Division	1eme Division		St Hilaire	10	France	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
1364	17	1	3eme_Division.26e_Legere	26e Legere			10	France	2	2	4	6	1	1	\N	\N	\N	\N	\N	\N	\N	1600	0	0	\N	\N	1	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
1365	17	1	1eme_Division.10e_Legere	10e Legere			10	France	2	2	4	6	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	4	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
1366	17	1	2eme_Division.57e_Ligne	57e Ligne			10	France	2	2	1	5	1	1	\N	\N	\N	\N	\N	\N	\N	1700	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
1367	17	1	3eme_Division.18e_Ligne	18e Ligne			10	France	2	2	4	5	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	4	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
1368	17	1	Corps_Cavaly.22e_Chasseur	22e Chasseur			10	France	3	2	1	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	600	0	0	0	3	4	0	0	\N	\N	\N	0	0	f	2	0
1369	17	1	1eme_Division.55e_Ligne	55e Ligne			10	France	2	2	1	5	1	1	\N	\N	\N	\N	\N	\N	\N	1400	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
1370	17	1	Corps_Cavaly	Corps Cavaly		Guyot	10	France	1	2	4	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
1371	17	1	3eme_Division	3eme Division		LeGrand	10	France	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
1372	17	1	3eme_Division.75e_Ligne	75e Ligne			10	France	2	2	4	5	1	1	\N	\N	\N	\N	\N	\N	\N	1700	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
1373	17	1	3eme_Division.Po_Legere	Po Legere			10	France/Italy	2	2	4	6	1	1	\N	\N	\N	\N	\N	\N	\N	1000	0	0	\N	\N	1	2	2	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
1374	17	1	Corps_Artillery.Heavy_Bty	Heavy Bty			10		4	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	8	0	\N	\N	\N	0	1	f	2	3
1375	17	1	Corps_Artillery	Corps Artillery			10	France	1	2	5	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
1376	17	1	Corps_Cavaly.11e_Chasseur	11e Chasseur			10	France	3	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	600	0	0	0	3	4	0	0	\N	\N	\N	0	0	f	2	0
1377	17	1	3eme_Division.Md_Foot_Bty	Md Foot Bty			10		4	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	8	0	\N	\N	\N	0	3	f	2	2
1378	17	1	1eme_Division.Md_Foot_Bty	Md Foot Bty			10		4	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	8	0	\N	\N	\N	0	3	f	2	2
1379	17	1	2eme_Division.Md_Foot_Bty	Md Foot Bty			10		4	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	8	0	\N	\N	\N	0	3	f	2	3
1380	18	1	Cav_Bde	Cav Bde		Trelliard	10	France	1	2	4	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
1381	18	1	Cav_Bde.10e_Hussar	10e Hussar			10	France	3	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	600	0	0	0	2	3	0	0	\N	\N	\N	0	0	f	2	0
1382	18	1	Cav_Bde.9e_Hussar_Copy	9e Hussar_Copy			10	France	3	2	1	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	600	0	0	0	2	3	0	0	\N	\N	\N	0	0	f	2	0
1383	18	1	Corps_Artillery	Corps Artillery		Careil	10	France	1	2	5	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
1384	18	1	Corps_Artillery.Heavy_Foot	Heavy Foot			10		4	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	8	0	\N	\N	\N	0	1	f	2	2
1385	18	1	1eme_Division	1eme Division		Suchet	10	France	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
1386	18	1	1eme_Division.34e_Ligne	34e Ligne			10	France	2	2	4	5	1	1	\N	\N	\N	\N	\N	\N	\N	2500	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
1387	18	1	1eme_Division.40e_Ligne	40e Ligne			10	France	2	2	4	5	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
1388	18	1	1eme_Division.64e_Ligne	64e Ligne			10	France	2	2	1	5	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
1389	18	1	1eme_Division.88e_Ligne	88e Ligne			10	France	2	2	1	5	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
1390	18	1	1eme_Division.17e_Legere	17e Legere			10	France	2	2	4	6	1	1	\N	\N	\N	\N	\N	\N	\N	2100	0	0	\N	\N	1	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
1391	18	1	2eme_Division	2eme Division		Gazan	10	France	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
1392	18	1	2eme_Division.28e_Legere	28e Legere			10	France	2	2	4	6	1	1	\N	\N	\N	\N	\N	\N	\N	900	0	0	\N	\N	1	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
1393	18	1	2eme_Division.100e_Ligne	100e Ligne			10	France	2	2	4	3	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
1394	18	1	2eme_Division.103e_Ligne	103e Ligne			10	France	2	2	4	3	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
1395	18	1	2eme_Division.21e_Legere	21e Legere			10	France	2	2	4	6	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	1	0	0	0	\N	\N	\N	0	0	f	2	0
1396	18	1	1eme_Division.Md_Foot_Bty	Md Foot Bty			10		4	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	8	0	\N	\N	\N	0	3	f	2	3
1397	18	1	2eme_Division.Md_Foot_Bty	Md Foot Bty			10		4	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	8	0	\N	\N	\N	0	3	f	2	3
1398	19	1	Cav_Bde.9e_Hussar	9e Hussar			10	France	3	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	600	0	0	0	2	3	0	0	\N	\N	\N	0	0	f	2	0
1399	19	1	1eme_Division.39e_Ligne	39e Ligne			10	France	2	2	4	5	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
1400	19	1	1eme_Division.69e_Ligne	69e Ligne			10	France	2	2	1	5	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
1401	19	1	Cav_Bde.10e_Chasseur	10e Chasseur			10	France	3	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	600	0	0	0	3	4	0	0	\N	\N	\N	0	0	f	2	0
1402	19	1	1eme_Division.76e_Ligne	76e Ligne			10	France	2	2	1	5	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
1403	19	1	Corps_Artillery	Corps Artillery			10	France	1	2	4	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
1404	19	1	2eme_Division.59e_Ligne	59e Ligne			10	France	2	2	1	5	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
1405	19	1	Corps_Artillery.1e_Heavy_Bty	1e Heavy Bty			10		4	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	8	0	\N	\N	\N	0	1	f	2	2
1406	19	1	Corps_Artillery.2e_Heavy_Bty	2e Heavy Bty			10		4	2	1	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	8	0	\N	\N	\N	0	1	f	2	2
1407	19	1	2eme_Division	2eme Division		Gardanne	10	France	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
1408	19	1	1eme_Division	1eme Division		Marchand	10	France	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
1409	19	1	Cav_Bde	Cav Bde		Charbanais	10	France	1	2	4	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
1410	19	1	2eme_Division.50e_Ligne	50e Ligne			10	France	2	2	1	5	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
1411	19	1	2eme_Division.27e_Ligne	27e Ligne			10	France	2	2	1	5	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
1412	19	1	1eme_Division.6e_Legere	6e Legere			10	France	2	2	4	6	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	4	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
1413	19	1	2eme_Division.25e_Legere	25e Legere			10	France	2	2	4	6	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	4	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
1414	20	1	Corps_Artillery	Corps Artillery			10	France	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
1415	20	1	1e_Cuirassier_Div	1e Cuirassier Div		Nansouty	10	France	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
1416	20	1	1e_Dragoon_Div	1e Dragoon Div		Klein	10	France	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
1417	20	1	2e_Cuirassier_Div	2e Cuirassier Div		d'Hautpoul	10	France	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
1418	20	1	2e_Dragoon_Div	2e Dragoon Div		Grouchy	10	France	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
1419	20	1	2e_Cuirassier_Div.Bde_Verdiere	Bde Verdiere			10	France	3	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	600	0	0	0	1	4	0	0	\N	\N	\N	0	0	f	2	0
1420	20	1	3e_Dragoon_Div	3e Dragoon Div		Beaumont	10	France	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
1421	20	1	4e_Dragoon_Div	4e Dragoon Div		Sahut	10	France	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
1422	20	1	2e_Cuirassier_Div.Bde_StSulpice	Bde St.Sulpice			10	France	3	2	1	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	600	0	0	0	1	4	0	0	\N	\N	\N	0	0	f	2	0
1423	20	1	Light_Div	Light Div		Lasalle	10	France	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
1424	20	1	Light_Div.Milhaud_1e_Hussar	Milhaud 1e Hussar			10	France	3	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	600	0	0	0	2	3	0	0	\N	\N	\N	0	0	f	2	0
1425	20	1	Light_Div.Bde_Lasalle_5_7e_Hussar	Bde Lasalle 5/7e Hussar			10	France	3	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	600	0	0	0	2	3	0	0	\N	\N	\N	0	0	f	2	0
1426	20	1	2e_Dragoon_Div.Bde_Roget	Bde Roget			10	France	3	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	900	0	0	0	5	5	0	0	\N	\N	\N	0	0	f	2	0
1427	20	1	1e_Cuirassier_Div.Bde_Defrance	Bde Defrance			10	France	3	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	600	0	0	0	9	2	0	0	\N	\N	\N	0	0	f	2	0
1428	20	1	2e_Dragoon_Div.Bde_Milet	Bde Milet			10	France	3	2	1	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	600	0	0	0	5	5	0	0	\N	\N	\N	0	0	f	2	0
1429	20	1	1e_Cuirassier_Div.Bde_Housaye	Bde Housaye			10	France	3	2	1	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	1300	0	0	0	1	2	0	0	\N	\N	\N	0	0	f	2	0
1430	20	1	1e_Dragoon_Div.Bde_Fenerolz	Bde Fenerolz			10	France	3	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	600	0	0	0	5	4	0	0	\N	\N	\N	0	0	f	2	0
1431	20	1	4e_Dragoon_Div.Bde_Laplanche	Bde Laplanche			10	France	3	2	1	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	1200	0	0	0	5	5	0	0	\N	\N	\N	0	0	f	2	0
1432	20	1	1e_Dragoon_Div.Bde_Picard	Bde Picard			10	France	3	2	1	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	600	0	0	0	5	4	0	0	\N	\N	\N	0	0	f	2	0
1433	20	1	4e_Dragoon_Div.Bde_Margaron	Bde Margaron			10	France	3	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	1200	0	0	0	5	5	0	0	\N	\N	\N	0	0	f	2	0
1434	20	1	3e_Dragoon_Div.Bde_Boye	Bde Boye			10	France	3	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	900	0	0	0	5	5	0	0	\N	\N	\N	0	0	f	2	0
1435	20	1	3e_Dragoon_Div.Bde_Maubourg	Bde Maubourg			10	France	3	2	1	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	600	0	0	0	5	5	0	0	\N	\N	\N	0	0	f	2	0
1436	20	1	Corps_Artillery.1e_Horse	1e Horse			10		4	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	8	0	\N	\N	\N	0	3	t	2	2
1437	20	1	Corps_Artillery.2e_Horse	2e Horse			10		4	2	1	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	8	0	\N	\N	\N	0	3	t	2	2
1438	21	1	3rd_Div	3rd Div		Tauentzein	10	Prussia	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
1439	21	1	3rd_Div.Cav_Bde_Prince_Clement	Cav Bde Prince Clement			10	Prussia	3	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	700	0	0	0	2	4	0	0	\N	\N	\N	0	0	f	2	0
1440	21	1	3rd_Div.Rosen_Fusilers	Rosen Fusilers			10	Prussia	2	2	4	9	1	1	\N	\N	\N	\N	\N	\N	\N	400	0	0	\N	\N	1	0	0	2	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
1441	21	1	1st_Div	1st Div		Grawert	10	Prussia	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
1442	21	1	Reserve_Div.Cav_Bde_von_Krafft	Cav Bde von Krafft			10	Prussia	3	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	900	0	0	0	12	3	0	0	\N	\N	\N	0	0	f	2	0
1443	21	1	Reserve_Div	Reserve Div		Prittwitz	10	Prussia	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
1444	21	1	Reserve_Div.Heavy_Bty	Heavy Bty			10	Prussia	4	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	8	0	\N	\N	\N	0	1	f	2	3
1445	21	1	1st_Div.Heavy_Bty	Heavy Bty			10	Prussia	4	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	8	0	\N	\N	\N	0	1	f	2	4
1446	21	1	1st_Div.Bde_Henkel	Bde Henkel			10	Prussia	3	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	900	0	0	0	5	3	0	0	\N	\N	\N	0	0	f	2	0
1447	21	1	2nd_Div.Boguslawsky_Fusilers	Boguslawsky Fusilers			10	Prussia	2	2	4	9	1	1	\N	\N	\N	\N	\N	\N	\N	800	0	0	\N	\N	1	0	2	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
1448	21	1	2nd_Div	2nd Div		Zechwitz	10	Prussia	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
1449	21	1	1st_Div.Erichsen_Fusilers	Erichsen Fusilers			10		2	2	4	9	1	1	\N	\N	\N	\N	\N	\N	\N	700	0	0	\N	\N	1	0	0	1	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
1450	21	1	2nd_Div.Cav_Bde_von_Kochitsky	Cav Bde von Kochitsky			10	Saxony	3	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	200	0	0	0	1	3	0	0	\N	\N	\N	0	0	f	2	0
1451	21	1	3rd_Div.von_Schoeneberg	von Schöneberg			10	Saxony	2	2	4	1	1	1	\N	\N	\N	\N	\N	\N	\N	3400	0	0	\N	\N	1	0	1	0	\N	0	0	5	0	0	0	0	0	0	2	0	\N	\N	\N	0	4	f	2	4
1452	21	1	3rd_Div.von_Zweiffel	von Zweiffel			10	Prussia	2	2	4	1	1	1	\N	\N	\N	\N	\N	\N	\N	3400	0	0	\N	\N	1	0	1	0	\N	0	0	4	0	0	0	0	0	0	2	0	\N	\N	\N	0	4	f	2	0
1453	21	1	3rd_Div.Lt_Bty	Lt Bty			10	Prussia	4	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	6	0	\N	\N	\N	0	4	f	2	3
1454	21	1	1st_Div.von_Mueffling	von Müffling			10	Prussia	2	2	4	1	1	1	\N	\N	\N	\N	\N	\N	\N	3600	0	0	\N	\N	1	0	1	0	\N	0	0	4	0	0	0	0	0	0	2	0	\N	\N	\N	0	4	f	2	3
1455	21	1	2nd_Div.Heavy_Bty	Heavy Bty			10	Saxony	4	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	8	0	\N	\N	\N	0	1	f	2	3
1456	21	1	Reserve_Div.Md_Foot_Bty	Md Foot Bty			10	Prussia	4	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	8	0	\N	\N	\N	0	3	f	2	4
1457	21	1	1st_Div.von_Schimonsky	von Schimonsky			10	Prussia	2	2	4	1	1	1	\N	\N	\N	\N	\N	\N	\N	3400	0	0	\N	\N	1	0	1	0	\N	0	0	4	0	0	0	0	0	0	2	0	\N	\N	\N	0	4	f	2	3
1458	21	1	Reserve_Div.Cerrini_Grenadier_Bde	Cerrini Grenadier Bde			10	Prussia	2	2	4	1	1	1	\N	\N	\N	\N	\N	\N	\N	4200	0	0	\N	\N	1	0	0	2	\N	0	0	4	0	0	0	0	0	0	2	0	\N	\N	\N	0	4	f	2	3
1459	21	1	Reserve_Div.Prittwitz_Grenadier_Bde	Prittwitz Grenadier Bde			10	Prussia	2	2	4	1	1	1	\N	\N	\N	\N	\N	\N	\N	3300	0	0	\N	\N	1	0	0	2	\N	0	0	4	0	0	0	0	0	0	2	0	\N	\N	\N	0	4	f	2	3
1460	21	1	1st_Div.Horse_Bty	Horse Bty			10	Prussia	4	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	8	0	\N	\N	\N	0	3	f	2	3
1461	21	1	2nd_Div.von_Dyherrn	von Dyherrn			10	Saxony	2	2	4	3	1	1	\N	\N	\N	\N	\N	\N	\N	4200	0	0	\N	\N	1	0	1	0	\N	0	0	4	0	0	0	0	0	0	2	0	\N	\N	\N	0	4	f	2	3
1462	21	1	2nd_Div.von_Burgsdorf	von Burgsdorf			10	Saxony	2	2	4	1	1	1	\N	\N	\N	\N	\N	\N	\N	3400	0	0	\N	\N	1	0	1	0	\N	0	0	4	0	0	0	0	0	0	1	0	\N	\N	\N	0	4	f	2	3
1463	21	1	2nd_Div.Horse_Bty	Horse Bty			10	Saxony	4	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	8	0	\N	\N	\N	0	3	f	2	3
1464	22	1	Adv_Guard_Div	Adv Guard Div		Ferdinand	10	Prussia	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
1465	22	1	Adv_Guard_Div.Bde_von_Pelet	Bde von Pelet	Rabenau # 13 Pelet # 14 Rühle # 15 Fusiliers, Masars and Valentin Jager 		10	Prussia	2	2	4	9	1	1	\N	\N	\N	\N	\N	\N	\N	2400	0	0	\N	\N	1	0	0	2	\N	0	0	4	0	0	0	0	0	0	6	0	\N	\N	\N	0	3	f	2	3
1466	22	1	Adv_Guard_Div.Cav_Bde_von_Schimmelpfennig	Cav Bde von Schimmelpfennig	Schimmelpfennig Hussar Regiment # 6, ten squadrons		10	Prussia	3	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	1500	0	0	0	2	4	6	0	\N	\N	\N	0	3	f	2	3
1467	22	1	Adv_Guard_Div.Bde_Belvilaqua	Bde Belvilaqua	Combined Bns from IR 49,  Prinz Clemens (saxon), and Kurfurst (saxon)		10	Prussia/Saxony	2	2	4	1	1	1	\N	\N	\N	\N	\N	\N	\N	5100	0	0	\N	\N	1	0	1	0	\N	0	0	5	0	0	0	0	0	0	6	0	\N	\N	\N	0	4	f	2	0
1468	22	1	Adv_Guard_Div.Saxon_Hussar_von_Truetzschler	Saxon Hussar von Trützschler	Saxon Hussar Regiment, eight squadrons		10	Saxony	3	2	1	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	1200	0	0	0	2	4	0	0	\N	\N	\N	0	0	f	2	0
1469	24	1	1st_Div	1st Div		Kuhnheim	10	Prussia	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
1470	24	1	1st_Div.Garde_du_Corps_Cavalry	Garde du Corps Cavalry			10	Prussia	3	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	600	0	0	0	1	1	0	0	\N	\N	\N	0	0	f	2	0
1471	24	1	1st_Div.Beeren_Cuirassier	Beeren Cuirassier			10	Prussia	3	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	400	0	0	0	1	2	0	0	\N	\N	\N	0	0	f	2	0
1472	24	1	2nd_Div	2nd Div		von Arnim	10	Prussia	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
1473	24	1	1st_Div.Guard_Bde_von_Pletz	Guard Bde von Pletz			10	Prussia	2	2	4	1	1	1	\N	\N	\N	\N	\N	\N	\N	2400	0	0	\N	\N	1	0	0	1	\N	0	0	2	0	0	0	0	0	0	2	0	\N	\N	\N	0	4	f	2	1
1474	24	1	1st_Div.Guard_Bde_von_Hirschfeld	Guard Bde von Hirschfeld			10	Prussia	2	2	1	1	1	1	\N	\N	\N	\N	\N	\N	\N	2400	0	0	\N	\N	1	0	0	1	\N	0	0	2	0	0	0	0	0	0	2	0	\N	\N	\N	0	4	f	2	1
1475	24	1	2nd_Div.von_Zenge_Grenadiers	von Zenge Grenadiers			10	Prussia	2	2	1	1	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	1	\N	0	0	4	0	0	0	0	0	0	2	0	\N	\N	\N	0	4	f	2	1
1476	24	1	2nd_Div.Zenge_Regt_Musketeer	Zenge Regt Musketeer			10	Prussia	2	2	1	1	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	1	\N	0	0	4	0	0	0	0	0	0	2	0	\N	\N	\N	0	4	f	2	1
1477	24	1	2nd_Div.Arnim_Regt_Musketeer	Arnim Regt Musketeer			10	Prussia	2	2	1	1	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	1	\N	0	0	4	0	0	0	0	0	0	2	0	\N	\N	\N	0	4	f	2	1
1478	24	1	2nd_Div.Pirch_Regt_Musketeer	Pirch Regt Musketeer			10	Prussia	2	2	1	1	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	1	\N	0	0	4	0	0	0	0	0	0	2	0	\N	\N	\N	0	4	f	2	1
1479	24	1	1st_Div.Md_Foot_Bty	Md Foot Bty			10	Prussia	4	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	8	0	\N	\N	\N	0	3	f	2	1
1480	24	1	2nd_Div.Md_Foot_Bty	Md Foot Bty			10	Prussia	4	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	8	0	\N	\N	\N	0	3	f	2	1
1481	24	1	2nd_Div.von_Malschitsky_Grenadiers	von Malschitsky Grenadiers			10	Prussia	2	2	4	1	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	1	\N	0	0	4	0	0	0	0	0	0	2	0	\N	\N	\N	0	4	f	2	1
1482	25	1	1eme_Division.13e_Legere	13e Legere			10	France	2	2	4	6	1	1	\N	\N	\N	\N	\N	\N	\N	1400	0	0	\N	\N	1	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
1483	25	1	1eme_Division	1eme Division		Morand	10	France	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
1484	25	1	2eme_Division.108e_Ligne	108e Ligne			10	France	2	2	1	5	1	1	\N	\N	\N	\N	\N	\N	\N	1600	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
1485	25	1	1eme_Division.51e_Ligne	51e Ligne			10	France	2	2	1	5	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
1486	25	1	1eme_Division.17e_Ligne	17e Ligne			10	France	2	2	4	5	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
1487	25	1	1eme_Division.61e_Ligne	61e Ligne			10	France	2	2	1	5	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
1488	25	1	1eme_Division.30e_Ligne	30e Ligne			10	France	2	2	1	5	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
1489	25	1	2eme_Division	2eme Division		Friant	10	France	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
1490	25	1	2eme_Division.33e_Ligne	33e Ligne			10	France	2	2	1	5	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
1491	25	1	2eme_Division.111e_Ligne	111e Ligne			10	France	2	2	1	5	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
1492	25	1	Cav_Bde	Cav Bde		Viallanes	10	France	1	2	4	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
1493	25	1	3eme_Division	3eme Division		Gudin	10	France	1	2	1	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
1494	25	1	3eme_Division.12e_Ligne	12e Ligne			10	France	2	2	1	5	1	1	\N	\N	\N	\N	\N	\N	\N	1300	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
1495	25	1	3eme_Division.21e_Ligne	21e Ligne			10	France	2	2	1	5	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
1496	25	1	3eme_Division.25e_Ligne	25e Ligne			10	France	2	2	1	5	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
1497	25	1	3eme_Division.85e_Ligne	85e Ligne			10	France	2	2	1	5	1	1	\N	\N	\N	\N	\N	\N	\N	1600	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
1498	25	1	Cav_Bde.1e_Chasseur	1e Chasseur			10	France	3	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	600	0	0	0	3	3	0	0	\N	\N	\N	0	0	f	2	0
1499	25	1	Cav_Bde.2e_Chasseur	2e Chasseur			10	France	3	2	1	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	600	0	0	0	3	3	0	0	\N	\N	\N	0	0	f	2	0
1500	25	1	Corps_Artillery	Corps Artillery		Hannicque	10	France	1	2	4	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
1501	25	1	2eme_Division.48e_Ligne	48e Ligne			10	France	2	2	1	5	1	1	\N	\N	\N	\N	\N	\N	\N	1400	0	0	\N	\N	1	0	0	0	\N	0	0	1	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
1502	25	1	1eme_Division.Md_Foot_Bty	Md Foot Bty			10		4	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	8	0	\N	\N	\N	0	3	f	2	2
1503	25	1	Corps_Artillery.Md_Foot_Bty	Md Foot Bty			10		4	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	8	0	\N	\N	\N	0	3	f	2	2
1504	25	1	2eme_Division.Md_Foot_Bty	Md Foot Bty			10		4	2	1	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	8	0	\N	\N	\N	0	3	f	2	2
1505	25	1	3eme_Division.Md_Foot_Bty	Md Foot Bty			10		4	2	1	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	8	0	\N	\N	\N	0	3	f	2	2
1506	26	1	Infantry_Division.1e_Grenadiers	1e Grenadiers			10	France	2	2	4	5	1	1	\N	\N	\N	\N	\N	\N	\N	2400	0	0	\N	\N	1	0	0	0	\N	0	0	1	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
1507	26	1	Infantry_Division.2e_Grenadiers	2e Grenadiers			10	France	2	2	1	5	1	1	\N	\N	\N	\N	\N	\N	\N	2400	0	0	\N	\N	1	0	0	0	\N	0	0	1	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
1508	26	1	Guard_Artillery.Army_Artillery_Park	Army Artillery Park			10		4	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	16	0	\N	\N	\N	0	1	f	2	2
1509	26	1	Cavalry_Division.Chasseurs_a_Cheval	Chasseurs a Cheval			10	France	3	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	600	0	0	0	3	1	0	0	\N	\N	\N	0	0	f	2	0
1510	26	1	Infantry_Division.1e_Chasseurs	1e Chasseurs			10	France	2	2	1	6	1	1	\N	\N	\N	\N	\N	\N	\N	2400	0	0	\N	\N	1	0	0	0	\N	0	0	1	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
1511	26	1	Cavalry_Division.Grenadier_a_Cheval	Grenadier a Cheval			10	France	3	2	1	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	400	0	0	0	8	1	0	0	\N	\N	\N	0	0	f	2	0
1512	26	1	Guard_Artillery	Guard Artillery		de Lamartiniére	10	France	1	2	4	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	2	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
1513	26	1	Infantry_Division.2e_Chasseurs_Copy	2e Chasseurs_Copy			10	France	2	2	1	6	1	1	\N	\N	\N	\N	\N	\N	\N	2400	0	0	\N	\N	1	0	0	0	\N	0	0	1	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
1514	26	1	Infantry_Division	Infantry Division		Lefebvre	10	France	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
1515	26	1	Infantry_Division.Foot_Dragoons	Foot Dragoons			10	France	2	2	1	6	1	1	\N	\N	\N	\N	\N	\N	\N	2400	0	0	\N	\N	1	0	0	0	\N	0	0	1	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
1516	26	1	Cavalry_Division	Cavalry Division		Bessieres	10	France	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	1	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
1517	26	1	Guard_Artillery.Guard_Horse_Bty	Guard Horse Bty			10		4	2	1	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	8	0	\N	\N	\N	0	4	t	2	1
1518	26	1	Guard_Artillery.Guard_Foot_Artillery	Guard Foot Artillery			10		4	2	1	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	24	0	\N	\N	\N	0	3	f	2	1
1519	27	1	Cav_Reserve	Cav Reserve		Tilley	10	France	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
1520	27	1	Cav_Reserve.2e_Hussar	2e Hussar			10	France	3	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	300	0	0	0	2	3	0	0	\N	\N	\N	0	0	f	2	0
1521	27	1	Cav_Reserve.4e_Hussar	4e Hussar			10	France	3	2	1	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	422	0	0	0	2	4	0	0	\N	\N	\N	0	0	f	2	0
1522	27	1	Artillery_Reserve	Artillery Reserve		Eble	10	France	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
1523	27	1	3eme_Division	3eme Division		Drouet	10	France	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
1524	27	1	3eme_Division.95e_Ligne	95e Ligne		Drouet	10	France	2	2	4	5	1	1	\N	\N	\N	\N	\N	\N	\N	2600	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
1525	27	1	3eme_Division.94e_Ligne	94e Ligne		Drouet	10	France	2	2	4	5	1	1	\N	\N	\N	\N	\N	\N	\N	1500	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
1526	27	1	2eme_Division.45e_Ligne	45e Ligne		Rivaud	10	France	2	2	4	5	1	1	\N	\N	\N	\N	\N	\N	\N	2000	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
1527	27	1	2eme_Division.54e_Ligne	54e Ligne		Rivaud	10	France	2	2	4	5	1	1	\N	\N	\N	\N	\N	\N	\N	2000	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
1528	27	1	1eme_Division.32e_Ligne	32e Ligne		de l'Eltang	10	France	2	2	4	5	1	1	\N	\N	\N	\N	\N	\N	\N	2000	0	0	\N	\N	1	0	0	0	\N	0	0	4	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
1529	27	1	1eme_Division.96e_Ligne	96e Ligne		de l'Eltang	10	France	2	2	4	5	1	1	\N	\N	\N	\N	\N	\N	\N	2000	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
1530	27	1	1eme_Division	1eme Division		de l'Eltang	10	France	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
1531	27	1	2eme_Division.4e_Legere	4e Legere		Rivaud	10	France	2	2	4	6	1	1	\N	\N	\N	\N	\N	\N	\N	2000	0	0	\N	\N	1	0	1	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
1532	27	1	2eme_Division	2eme Division		Rivaud	10	France	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
1533	27	1	Artillery_Reserve.Md_Foot_Bty	Md Foot Bty			10		4	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	8	0	\N	\N	\N	0	3	f	2	2
1534	27	1	3eme_Division.27e_Legere	27e Legere		Drouet	10	France	2	2	4	6	1	1	\N	\N	\N	\N	\N	\N	\N	1500	0	0	\N	\N	1	0	2	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	4	f	2	0
1535	27	1	3eme_Division.Md_Foot_Bty	Md Foot Bty			10		4	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	0	0	0	0	0	0	0	8	0	\N	\N	\N	0	3	f	2	3
1536	27	1	1eme_Division.9e_Legere	9e Legere		de l'Eltang	10	France	2	2	4	6	1	1	\N	\N	\N	\N	\N	\N	\N	2600	0	0	\N	\N	1	2	0	0	\N	0	0	4	0	0	0	0	0	0	0	0	\N	\N	\N	0	4	f	2	0
1537	27	1	1eme_Division.Md_Foot_Bty	Md Foot Bty			10		4	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	0	0	0	0	0	0	0	8	0	\N	\N	\N	0	3	f	2	3
1538	27	1	2eme_Division.Md_Foot_Bty	Md Foot Bty			10		4	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	0	0	0	0	0	0	0	8	0	\N	\N	\N	0	3	f	2	3
1539	27	1	2eme_Division.Md_Foot_Bty_Copy	Md Foot Bty_Copy			10		4	2	1	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	0	0	0	0	0	0	0	8	0	\N	\N	\N	0	3	f	2	3
1540	28	1	Corps_Cav.7e_Chasseur	7e Chasseur			10	France	3	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	600	0	0	0	3	4	0	0	\N	\N	\N	0	0	f	2	0
1541	28	1	1eme_Division.105e_Ligne	105e Ligne			10	France	2	2	1	3	1	1	\N	\N	\N	\N	\N	\N	\N	1700	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
1542	28	1	Corps_Cav.20e_Chasseur	20e Chasseur			10	France	3	2	1	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	600	0	0	0	3	4	0	0	\N	\N	\N	0	0	f	2	0
1543	28	1	1eme_Division.14e_Ligne	14e Ligne			10	France	2	2	4	5	1	1	\N	\N	\N	\N	\N	\N	\N	700	0	0	\N	\N	1	0	0	0	\N	0	0	4	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
1544	28	1	Corps_Cav	Corps Cav		Durosnel	10	France	1	2	4	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
1545	28	1	Corps_Artillery	Corps Artillery			10	France	1	2	4	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
1546	28	1	2eme_Division.63e_Ligne	63e Ligne			10	France	2	2	1	5	1	1	\N	\N	\N	\N	\N	\N	\N	700	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
1547	28	1	Corps_Artillery.Heavy_Bty	Heavy Bty			10		4	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	8	0	\N	\N	\N	0	1	f	2	2
1548	28	1	1eme_Division.16e_Legere	16e Legere			10	France	2	2	4	6	1	1	\N	\N	\N	\N	\N	\N	\N	2700	0	0	\N	\N	1	0	0	0	\N	0	0	4	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
1549	28	1	1eme_Division.44e_Ligne	44e Ligne			10	France	2	2	1	5	1	1	\N	\N	\N	\N	\N	\N	\N	1700	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
1550	28	1	1eme_Division	1eme Division		Desjardin	10	France	1	2	4	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
1551	28	1	2eme_Division.24e_Ligne	24e Ligne			10	France	2	2	4	5	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
1552	28	1	2eme_Division.7e_Legere	7e Legere			10	France	2	2	4	6	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	4	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
1553	28	1	2eme_Division	2eme Division		Bierre	10	France	1	2	4	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
1554	28	1	2eme_Division.Hesse_Darmstadt	Hesse Darmstadt			10	Hesse	2	2	1	1	1	1	\N	\N	\N	\N	\N	\N	\N	800	0	0	\N	\N	1	0	0	0	\N	0	0	4	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
1555	28	1	2eme_Division.Allied_Nassau	Allied Nassau			10	Nassau	2	2	1	5	1	1	\N	\N	\N	\N	\N	\N	\N	400	0	0	\N	\N	1	0	0	0	\N	0	0	4	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
1556	28	1	1eme_Division.Md_Foot_Bty	Md Foot Bty			10		4	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	8	0	\N	\N	\N	0	3	f	2	3
1557	28	1	2eme_Division.Md_Foot_Bty	Md Foot Bty			10		4	2	4	0	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	4	0	0	0	0	0	0	8	0	\N	\N	\N	0	3	f	2	3
1558	29	1	Supply_Train	Supply Train			10	France	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
1559	29	1	Supply_Train.Supply_Escort_Detachment	Supply Escort Detachment			10		5	2	5	6	1	1	\N	\N	\N	\N	\N	\N	\N	300	0	0	\N	\N	1	2	4	0	\N	0	0	6	50	0	0	0	3	0	0	0	\N	\N	\N	0	0	f	2	0
1560	30	1	1st_Div.3rd_special_regt	3rd special regt			10		2	2	4	3	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
1561	30	1	1st_Div	1st Div			10		1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
1562	30	1	2nd_Div.1st_Regt_of_Death	1st Regt of Death	with data		10		2	2	4	3	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
1563	30	1	1st_Div.1st_Regt	1st Regt			10		2	2	4	3	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
1564	30	1	2nd_Div	2nd Div			10		1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
1565	30	1	1st_Div.2nd_Regt	2nd Regt			10	France	2	2	4	3	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	6	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
1566	30	1	2nd_Div.1st_Regt	1st Regt			10		2	2	4	3	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
1567	30	1	2nd_Div.2nd_Regt	2nd Regt			10		2	2	4	3	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
1568	30	1	6th_Division	6th Division			10		1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
1569	30	1	6th_Division.2nd_Regt	2nd Regt			10		2	2	4	3	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
1570	30	1	7th_Div	7th Div			10		1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
1571	30	1	6th_Division.1st_Regt	1st Regt			10		2	2	4	3	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
1572	30	1	7th_Div.1st_Bn	1st Bn			10		2	2	4	3	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
1573	30	1	7th_Div.4th_Bn	4th Bn			10		2	2	4	3	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
1574	30	1	2nd_Duvussion	2nd Duvussion			10		1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
1575	30	1	2nd_Duvussion.NZ_Brugade_from_NZ	NZ Brugade from NZ			10		2	2	4	7	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	1	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
1576	30	1	2nd_Div.Devils_Bde_as_such	Devils Bde as such	as such six much as such		10	gotta break this	2	2	4	4	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	3	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
1577	30	1	2nd_Div.3rd_special_regt_von_X	3rd special regt von X			10		2	2	1	8	1	1	\N	\N	\N	\N	\N	\N	\N	1800	0	0	\N	\N	2	0	0	0	\N	0	0	5	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	0
1578	31	4	6th_Div	6th Div			10	Norman	1	2	3	1	1	1	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	\N	0	0	0	0	\N	0	0	3	0	0	0	0	0	0	0	0	\N	\N	\N	0	0	f	2	2
1579	31	4	6th_Div.44th_Light_Fusilier	44th Light Fusilier			10	Norman	2	2	4	4	1	1	\N	\N	\N	\N	\N	\N	\N	2200	0	0	\N	\N	1	3	0	1	\N	0	0	4	0	0	0	0	0	0	2	0	\N	\N	\N	0	4	f	2	0
1580	31	4	6th_Div.Devil_Bde	Devil Bde	oeu		10		5	2	6	9	1	1	\N	\N	\N	\N	\N	\N	\N	200	0	0	\N	\N	1	2	1	1	\N	0	0	3	80	0	0	0	10	0	0	0	\N	\N	\N	0	0	f	2	0
\.


--
-- Name: unit_id_seq; Type: SEQUENCE SET; Schema: public; Owner: steve
--

SELECT pg_catalog.setval('unit_id_seq', 1580, true);


--
-- PostgreSQL database dump complete
--

