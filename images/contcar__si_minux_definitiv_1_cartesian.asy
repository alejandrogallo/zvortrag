import atoms;
unitsize(1cm);

currentprojection=perspective(
  camera=(-0.274236460838132,12.6926928463237,22.8882405997367),
  up=(-0.00279141833153455,-0.0331322956423164,0.0117889668390955),
  target=(9.13004889686709,5.14148736042921,3.89269307054404),
  zoom=0.635242459631156,angle=35.1190936195292,
  viewportshift=(0.0443346299950911,0.0641124334257371),
  autoadjust=false
);

settings.prc       = false;
settings.render    = 10; //quality
settings.outformat = "pdf"; //output 
real bond_radius = 5;
real radius_scale = 0.5;
real max_bond_dist = 2.0;
real min_bond_dist = 0;

// - Atoms - {{{1
Atom ATOM_1 = Atom("C", (20.174914638, 11.647991502, 8.236373541));
Atom ATOM_2 = Atom("C", (1.257196766, 0.725842835, 0.513248376));
Atom ATOM_3 = Atom("C", (16.39073132, 9.463192413, 2.057976571));
Atom ATOM_4 = Atom("C", (2.518052611, 1.453798241, 2.572434195));
Atom ATOM_5 = Atom("C", (16.39073132, 5.094676614, 8.23599104));
Atom ATOM_6 = Atom("C", (2.518052611, 2.909913645, 0.513175982));
Atom ATOM_7 = Atom("C", (2.520661999, 2.909105525, 2.057048185));
Atom ATOM_8 = Atom("C", (3.787465963, 3.635174735, 2.570456632));
Atom ATOM_9 = Atom("C", (12.607485807, 11.647450564, 8.23599104));
Atom ATOM_10 = Atom("C", (3.779085494, 0.725740455, 0.513175982));
Atom ATOM_11 = Atom("C", (3.779690335, 0.728404311, 2.057048185));
Atom ATOM_12 = Atom("C", (5.041886746, 1.462454037, 2.570456632));
Atom ATOM_13 = Atom("C", (3.779690335, 2.182205064, 0.001063383));
Atom ATOM_14 = Atom("C", (5.041886746, 2.910934447, 0.521995933));
Atom ATOM_15 = Atom("C", (5.046670553, 2.913696378, 2.060294408));
Atom ATOM_16 = Atom("C", (6.315104186, 3.646026821, 2.578130215));
Atom ATOM_17 = Atom("C", (17.649093911, 10.189708337, 4.118377039));
Atom ATOM_18 = Atom("C", (3.78107201, 2.183002775, 4.631555813));
Atom ATOM_19 = Atom("C", (18.912071252, 10.918888589, 6.177327784));
Atom ATOM_20 = Atom("C", (5.040023303, 2.909858587, 6.691358224));
Atom ATOM_21 = Atom("C", (3.795799519, 3.622279678, 4.118203465));
Atom ATOM_22 = Atom("C", (5.050136456, 4.365180194, 4.631526353));
Atom ATOM_23 = Atom("C", (15.130065263, 4.3660396, 6.176419897));
Atom ATOM_24 = Atom("C", (6.300124355, 5.094103691, 6.691131866));
Atom ATOM_25 = Atom("C", (5.034886079, 1.476118637, 4.118203465));
Atom ATOM_26 = Atom("C", (6.305425314, 2.190955947, 4.631526353));
Atom ATOM_27 = Atom("C", (11.346134566, 10.920000324, 6.176419897));
Atom ATOM_28 = Atom("C", (7.561685578, 2.90901539, 6.691131866));
Atom ATOM_29 = Atom("C", (6.32315658, 3.650675873, 4.121090143));
Atom ATOM_30 = Atom("C", (7.593403789, 4.384053384, 4.638930369));
Atom ATOM_31 = Atom("C", (7.569064383, 4.370001023, 6.179590872));
Atom ATOM_32 = Atom("C", (8.824202214, 5.094655132, 6.696844827));
Atom ATOM_33 = Atom("C", (17.649093911, 7.279412778, 8.234156607));
Atom ATOM_34 = Atom("C", (3.78107201, 5.094340303, 0.514302678));
Atom ATOM_35 = Atom("C", (3.795799519, 5.090106077, 2.042383405));
Atom ATOM_36 = Atom("C", (5.050136456, 5.821705056, 2.57168908));
Atom ATOM_37 = Atom("C", (18.912071252, 9.463670241, 8.235317367));
Atom ATOM_38 = Atom("C", (5.040023303, 7.278625911, 0.512988046));
Atom ATOM_39 = Atom("C", (15.130065263, 7.278531113, 2.05753478));
Atom ATOM_40 = Atom("C", (6.300124355, 8.006494256, 2.572389513));
Atom ATOM_41 = Atom("C", (5.034886079, 4.374719008, 0.01896339));
Atom ATOM_42 = Atom("C", (6.305425314, 5.096963585, 0.52181082));
Atom ATOM_43 = Atom("C", (6.32315658, 5.102293061, 2.068193368));
Atom ATOM_44 = Atom("C", (7.593403789, 5.834976694, 2.587014888));
Atom ATOM_45 = Atom("C", (11.346134566, 9.463184855, 8.23666815));
Atom ATOM_46 = Atom("C", (7.561685578, 7.278131433, 0.512268525));
Atom ATOM_47 = Atom("C", (7.569064383, 7.282841211, 2.060212654));
Atom ATOM_48 = Atom("C", (8.824202214, 8.0120643, 2.571005095));
Atom ATOM_49 = Atom("C", (15.127676102, 5.819456457, 4.114977005));
Atom ATOM_50 = Atom("C", (6.301972623, 6.552715313, 4.633469299));
Atom ATOM_51 = Atom("C", (16.379490846, 6.550477042, 6.17695805));
Atom ATOM_52 = Atom("C", (7.54463552, 7.282506203, 6.706332221));
Atom ATOM_53 = Atom("C", (16.379490846, 8.007184358, 4.116862748));
Atom ATOM_54 = Atom("C", (7.54463552, 8.750292847, 4.630568382));
Atom ATOM_55 = Atom("C", (17.641653032, 8.736905374, 6.177924858));
Atom ATOM_56 = Atom("C", (8.819285042, 9.463527153, 6.691724031));
Atom ATOM_57 = Atom("C", (7.608673955, 5.845701313, 4.13353492));
Atom ATOM_58 = Atom("C", (8.816650842, 6.638821634, 4.694355661));
Atom ATOM_59 = Atom("C", (8.799895587, 6.574848494, 6.207454015));
Atom ATOM_60 = Atom("C", (10.063597352, 7.279414387, 6.732106585));
Atom ATOM_61 = Atom("C", (8.799895587, 8.044060047, 4.12967505));
Atom ATOM_62 = Atom("C", (10.063597352, 8.773562545, 4.619061934));
Atom ATOM_63 = Atom("C", (10.078943589, 8.736928983, 6.177941553));
Atom ATOM_64 = Atom("C", (11.337749165, 9.459105906, 6.688597738));
Atom ATOM_65 = Atom("C", (15.128704122, 11.644856285, 8.234156607));
Atom ATOM_66 = Atom("C", (6.302364171, 0.727333843, 0.514302678));
Atom ATOM_67 = Atom("C", (6.306060979, 0.742205353, 2.042383405));
Atom ATOM_68 = Atom("C", (7.566812797, 1.462693432, 2.57168908));
Atom ATOM_69 = Atom("C", (6.306060979, 2.172979326, 0.01896339));
Atom ATOM_70 = Atom("C", (7.566812797, 2.912176208, 0.52181082));
Atom ATOM_71 = Atom("C", (7.580293893, 2.924867195, 2.068193368));
Atom ATOM_72 = Atom("C", (8.849940185, 3.658591646, 2.587014888));
Atom ATOM_73 = Atom("C", (17.651815243, 11.646497847, 8.235317367));
Atom ATOM_74 = Atom("C", (8.823486643, 0.725474673, 0.512988046));
Atom ATOM_75 = Atom("C", (13.868426108, 9.463754399, 2.05753478));
Atom ATOM_76 = Atom("C", (10.083889695, 1.45281994, 2.572389513));
Atom ATOM_77 = Atom("C", (13.868426108, 5.094447418, 8.23666815));
Atom ATOM_78 = Atom("C", (10.083889695, 2.909545418, 0.512268525));
Atom ATOM_79 = Atom("C", (10.091657886, 2.913580761, 2.060212654));
Atom ATOM_80 = Atom("C", (11.35075257, 3.63595038, 2.571005095));
Atom ATOM_81 = Atom("C", (12.603635857, 10.191222737, 4.114977005));
Atom ATOM_82 = Atom("C", (8.825804382, 2.181310142, 4.633469299));
Atom ATOM_83 = Atom("C", (13.862625675, 10.909815729, 6.17695805));
Atom ATOM_84 = Atom("C", (10.079153328, 2.89259225, 6.706332221));
Atom ATOM_85 = Atom("C", (8.866863062, 3.666453687, 4.13353492));
Atom ATOM_86 = Atom("C", (10.157713895, 4.316032112, 4.694355661));
Atom ATOM_87 = Atom("C", (10.093933904, 4.33350821, 6.207454015));
Atom ATOM_88 = Atom("C", (11.335956797, 5.075623012, 6.732106585));
Atom ATOM_89 = Atom("C", (15.124171168, 10.181461988, 4.116862748));
Atom ATOM_90 = Atom("C", (11.3502938, 2.158698844, 4.630568382));
Atom ATOM_91 = Atom("C", (16.387209247, 10.909665913, 6.177924858));
Atom ATOM_92 = Atom("C", (12.605297638, 2.905960474, 6.691724031));
Atom ATOM_93 = Atom("C", (11.366308383, 3.598902348, 4.12967505));
Atom ATOM_94 = Atom("C", (12.62992701, 4.328548847, 4.619061934));
Atom ATOM_95 = Atom("C", (12.605874535, 4.36015586, 6.177941553));
Atom ATOM_96 = Atom("C", (13.860700933, 5.089224922, 6.688597738));
Atom ATOM_97 = Atom("C", (12.603635857, 7.276711996, 8.236717742));
Atom ATOM_98 = Atom("C", (8.825804382, 5.095580144, 0.512069019));
Atom ATOM_99 = Atom("C", (8.866863062, 5.119285382, 2.078920574));
Atom ATOM_100 = Atom("C", (10.157713895, 5.864558401, 2.504408719));
Atom ATOM_101 = Atom("C", (13.862625675, 9.460297365, 8.226886638));
Atom ATOM_102 = Atom("C", (10.079153328, 7.286988083, 0.491717855));
Atom ATOM_103 = Atom("C", (10.093933904, 7.296946562, 2.016519185));
Atom ATOM_104 = Atom("C", (11.335956797, 8.038965363, 2.541307521));
Atom ATOM_105 = Atom("C", (15.124171168, 7.275236308, 8.226886638));
Atom ATOM_106 = Atom("C", (11.3502938, 5.085308033, 0.491717855));
Atom ATOM_107 = Atom("C", (11.366308383, 5.093129147, 2.016519185));
Atom ATOM_108 = Atom("C", (12.62992701, 5.79774304, 2.541307521));
Atom ATOM_109 = Atom("C", (16.387209247, 9.461158942, 8.22642312));
Atom ATOM_110 = Atom("C", (12.605297638, 7.277671425, 0.509190934));
Atom ATOM_111 = Atom("C", (12.605874535, 7.278004497, 2.051480319));
Atom ATOM_112 = Atom("C", (13.860700933, 8.0024788, 2.568634475));
Atom ATOM_113 = Atom("C", (11.272097275, 6.507947896, 6.243574067));
Atom ATOM_114 = Atom("C", (12.563001931, 7.253251989, 6.669671561));
Atom ATOM_115 = Atom("C", (11.272097275, 8.055814158, 4.054560544));
Atom ATOM_116 = Atom("C", (12.563001931, 8.70597744, 4.615207466));
Atom ATOM_117 = Atom("C", (12.579671932, 8.71402697, 6.161747384));
Atom ATOM_118 = Atom("C", (13.84874963, 9.447480952, 6.680377654));
Atom ATOM_119 = Atom("C", (12.612588728, 5.734014676, 4.054560544));
Atom ATOM_120 = Atom("C", (13.821099028, 6.52688918, 4.615207466));
Atom ATOM_121 = Atom("C", (13.836405126, 6.537301058, 6.161747384));
Atom ATOM_122 = Atom("C", (15.106133806, 7.269627509, 6.680377654));
Atom ATOM_123 = Atom("C", (13.836405126, 7.98845161, 4.109510534));
Atom ATOM_124 = Atom("C", (15.106133806, 8.721529749, 4.627077756));
Atom ATOM_125 = Atom("C", (15.113053522, 8.725524849, 6.169877612));
Atom ATOM_126 = Atom("C", (16.381632686, 9.457939314, 6.687772832));
Atom ATOM_127 = Atom("Si", (10.714427046, 6.185976864, 4.374146063));
//}}}

/*
// - Atom drawing - {{{1
ATOM_1.draw(radius_scale = radius_scale);
ATOM_2.draw(radius_scale = radius_scale);
ATOM_3.draw(radius_scale = radius_scale);
ATOM_4.draw(radius_scale = radius_scale);
ATOM_5.draw(radius_scale = radius_scale);
ATOM_6.draw(radius_scale = radius_scale);
ATOM_7.draw(radius_scale = radius_scale);
ATOM_8.draw(radius_scale = radius_scale);
ATOM_9.draw(radius_scale = radius_scale);
ATOM_10.draw(radius_scale = radius_scale);
ATOM_11.draw(radius_scale = radius_scale);
ATOM_12.draw(radius_scale = radius_scale);
ATOM_13.draw(radius_scale = radius_scale);
ATOM_14.draw(radius_scale = radius_scale);
ATOM_15.draw(radius_scale = radius_scale);
ATOM_16.draw(radius_scale = radius_scale);
ATOM_17.draw(radius_scale = radius_scale);
ATOM_18.draw(radius_scale = radius_scale);
ATOM_19.draw(radius_scale = radius_scale);
ATOM_20.draw(radius_scale = radius_scale);
ATOM_21.draw(radius_scale = radius_scale);
ATOM_22.draw(radius_scale = radius_scale);
ATOM_23.draw(radius_scale = radius_scale);
ATOM_24.draw(radius_scale = radius_scale);
ATOM_25.draw(radius_scale = radius_scale);
ATOM_26.draw(radius_scale = radius_scale);
ATOM_27.draw(radius_scale = radius_scale);
ATOM_28.draw(radius_scale = radius_scale);
ATOM_29.draw(radius_scale = radius_scale);
ATOM_30.draw(radius_scale = radius_scale);
ATOM_31.draw(radius_scale = radius_scale);
ATOM_32.draw(radius_scale = radius_scale);
ATOM_33.draw(radius_scale = radius_scale);
ATOM_34.draw(radius_scale = radius_scale);
ATOM_35.draw(radius_scale = radius_scale);
ATOM_36.draw(radius_scale = radius_scale);
ATOM_37.draw(radius_scale = radius_scale);
ATOM_38.draw(radius_scale = radius_scale);
ATOM_39.draw(radius_scale = radius_scale);
ATOM_40.draw(radius_scale = radius_scale);
ATOM_41.draw(radius_scale = radius_scale);
ATOM_42.draw(radius_scale = radius_scale);
ATOM_43.draw(radius_scale = radius_scale);
ATOM_44.draw(radius_scale = radius_scale);
ATOM_45.draw(radius_scale = radius_scale);
ATOM_46.draw(radius_scale = radius_scale);
ATOM_47.draw(radius_scale = radius_scale);
ATOM_48.draw(radius_scale = radius_scale);
ATOM_49.draw(radius_scale = radius_scale);
ATOM_50.draw(radius_scale = radius_scale);
ATOM_51.draw(radius_scale = radius_scale);
ATOM_52.draw(radius_scale = radius_scale);
ATOM_53.draw(radius_scale = radius_scale);
ATOM_54.draw(radius_scale = radius_scale);
ATOM_55.draw(radius_scale = radius_scale);
ATOM_56.draw(radius_scale = radius_scale);
ATOM_57.draw(radius_scale = radius_scale);
ATOM_58.draw(radius_scale = radius_scale);
ATOM_59.draw(radius_scale = radius_scale);
ATOM_60.draw(radius_scale = radius_scale);
ATOM_61.draw(radius_scale = radius_scale);
ATOM_62.draw(radius_scale = radius_scale);
ATOM_63.draw(radius_scale = radius_scale);
ATOM_64.draw(radius_scale = radius_scale);
ATOM_65.draw(radius_scale = radius_scale);
ATOM_66.draw(radius_scale = radius_scale);
ATOM_67.draw(radius_scale = radius_scale);
ATOM_68.draw(radius_scale = radius_scale);
ATOM_69.draw(radius_scale = radius_scale);
ATOM_70.draw(radius_scale = radius_scale);
ATOM_71.draw(radius_scale = radius_scale);
ATOM_72.draw(radius_scale = radius_scale);
ATOM_73.draw(radius_scale = radius_scale);
ATOM_74.draw(radius_scale = radius_scale);
ATOM_75.draw(radius_scale = radius_scale);
ATOM_76.draw(radius_scale = radius_scale);
ATOM_77.draw(radius_scale = radius_scale);
ATOM_78.draw(radius_scale = radius_scale);
ATOM_79.draw(radius_scale = radius_scale);
ATOM_80.draw(radius_scale = radius_scale);
ATOM_81.draw(radius_scale = radius_scale);
ATOM_82.draw(radius_scale = radius_scale);
ATOM_83.draw(radius_scale = radius_scale);
ATOM_84.draw(radius_scale = radius_scale);
ATOM_85.draw(radius_scale = radius_scale);
ATOM_86.draw(radius_scale = radius_scale);
ATOM_87.draw(radius_scale = radius_scale);
ATOM_88.draw(radius_scale = radius_scale);
ATOM_89.draw(radius_scale = radius_scale);
ATOM_90.draw(radius_scale = radius_scale);
ATOM_91.draw(radius_scale = radius_scale);
ATOM_92.draw(radius_scale = radius_scale);
ATOM_93.draw(radius_scale = radius_scale);
ATOM_94.draw(radius_scale = radius_scale);
ATOM_95.draw(radius_scale = radius_scale);
ATOM_96.draw(radius_scale = radius_scale);
ATOM_97.draw(radius_scale = radius_scale);
ATOM_98.draw(radius_scale = radius_scale);
ATOM_99.draw(radius_scale = radius_scale);
ATOM_100.draw(radius_scale = radius_scale);
ATOM_101.draw(radius_scale = radius_scale);
ATOM_102.draw(radius_scale = radius_scale);
ATOM_103.draw(radius_scale = radius_scale);
ATOM_104.draw(radius_scale = radius_scale);
ATOM_105.draw(radius_scale = radius_scale);
ATOM_106.draw(radius_scale = radius_scale);
ATOM_107.draw(radius_scale = radius_scale);
ATOM_108.draw(radius_scale = radius_scale);
ATOM_109.draw(radius_scale = radius_scale);
ATOM_110.draw(radius_scale = radius_scale);
ATOM_111.draw(radius_scale = radius_scale);
ATOM_112.draw(radius_scale = radius_scale);
ATOM_113.draw(radius_scale = radius_scale);
ATOM_114.draw(radius_scale = radius_scale);
ATOM_115.draw(radius_scale = radius_scale);
ATOM_116.draw(radius_scale = radius_scale);
ATOM_117.draw(radius_scale = radius_scale);
ATOM_118.draw(radius_scale = radius_scale);
ATOM_119.draw(radius_scale = radius_scale);
ATOM_120.draw(radius_scale = radius_scale);
ATOM_121.draw(radius_scale = radius_scale);
ATOM_122.draw(radius_scale = radius_scale);
ATOM_123.draw(radius_scale = radius_scale);
ATOM_124.draw(radius_scale = radius_scale);
ATOM_125.draw(radius_scale = radius_scale);
ATOM_126.draw(radius_scale = radius_scale);
//- }}} -
*/

//ATOM_127.color = red; 
ATOM_127.draw(radius_scale = radius_scale);
label("$\mathsf{SiV}^-$", ATOM_127.position+(-.4,1,0), SE);

// - Bonds - {{{1
// distance: 1.54387461896
Bond(ATOM_4, ATOM_7).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.54387461913
Bond(ATOM_4, ATOM_11).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.54387461964
Bond(ATOM_6, ATOM_7).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.54387461911
Bond(ATOM_6, ATOM_13).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.54775870677
Bond(ATOM_7, ATOM_8).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.53830839362
Bond(ATOM_8, ATOM_15).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.54782298397
Bond(ATOM_8, ATOM_21).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.54782298444
Bond(ATOM_8, ATOM_35).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.54387461964
Bond(ATOM_10, ATOM_11).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.54387461834
Bond(ATOM_10, ATOM_13).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.54775870653
Bond(ATOM_11, ATOM_12).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.53830839298
Bond(ATOM_12, ATOM_15).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.54782298397
Bond(ATOM_12, ATOM_25).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.54782298447
Bond(ATOM_12, ATOM_67).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.54775870705
Bond(ATOM_13, ATOM_14).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.53830839277
Bond(ATOM_14, ATOM_15).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.54782298396
Bond(ATOM_14, ATOM_41).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.54782298449
Bond(ATOM_14, ATOM_69).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.55350754169
Bond(ATOM_15, ATOM_16).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.54298794362
Bond(ATOM_16, ATOM_29).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.54298794251
Bond(ATOM_16, ATOM_43).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.54298794188
Bond(ATOM_16, ATOM_71).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.52815756263
Bond(ATOM_18, ATOM_21).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.52815756301
Bond(ATOM_18, ATOM_25).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.54556226518
Bond(ATOM_21, ATOM_22).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.54649338353
Bond(ATOM_22, ATOM_29).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.54809849591
Bond(ATOM_23, ATOM_96).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.54796888115
Bond(ATOM_24, ATOM_31).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.54556226493
Bond(ATOM_25, ATOM_26).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.54649338331
Bond(ATOM_26, ATOM_29).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.54809849696
Bond(ATOM_27, ATOM_64).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.54796888055
Bond(ATOM_28, ATOM_31).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.55548354066
Bond(ATOM_29, ATOM_30).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.54091682483
Bond(ATOM_30, ATOM_31).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5466326022
Bond(ATOM_30, ATOM_57).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.54663260181
Bond(ATOM_30, ATOM_85).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.53884573836
Bond(ATOM_31, ATOM_32).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.55918779109
Bond(ATOM_32, ATOM_59).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.55918779123
Bond(ATOM_32, ATOM_87).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.52815756269
Bond(ATOM_34, ATOM_35).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.52815756324
Bond(ATOM_34, ATOM_41).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.54556226506
Bond(ATOM_35, ATOM_36).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.54649338397
Bond(ATOM_36, ATOM_43).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.54809849623
Bond(ATOM_39, ATOM_112).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.54796888182
Bond(ATOM_40, ATOM_47).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.54556226485
Bond(ATOM_41, ATOM_42).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.54649338371
Bond(ATOM_42, ATOM_43).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.55548354143
Bond(ATOM_43, ATOM_44).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5409168245
Bond(ATOM_44, ATOM_47).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.54663260175
Bond(ATOM_44, ATOM_57).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.54663260213
Bond(ATOM_44, ATOM_99).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.54809849599
Bond(ATOM_45, ATOM_64).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.54796888059
Bond(ATOM_46, ATOM_47).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.53884573825
Bond(ATOM_47, ATOM_48).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.55918779131
Bond(ATOM_48, ATOM_61).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.55918779119
Bond(ATOM_48, ATOM_103).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.56774845622
Bond(ATOM_49, ATOM_120).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.56756867491
Bond(ATOM_50, ATOM_57).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5466243381
Bond(ATOM_51, ATOM_122).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.52490548341
Bond(ATOM_52, ATOM_59).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.54662433815
Bond(ATOM_53, ATOM_124).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.52490548351
Bond(ATOM_54, ATOM_61).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5386637617
Bond(ATOM_55, ATOM_126).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.54228952871
Bond(ATOM_56, ATOM_63).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.55008641909
Bond(ATOM_57, ATOM_58).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.51454281223
Bond(ATOM_58, ATOM_59).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.51454281167
Bond(ATOM_58, ATOM_61).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.9771588436
Bond(ATOM_58, ATOM_127).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.53903072343
Bond(ATOM_59, ATOM_60).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.55938551591
Bond(ATOM_60, ATOM_63).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.51469357686
Bond(ATOM_60, ATOM_113).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.53903072344
Bond(ATOM_61, ATOM_62).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.55938551724
Bond(ATOM_62, ATOM_63).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.51469357635
Bond(ATOM_62, ATOM_115).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.53847350499
Bond(ATOM_63, ATOM_64).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.54113142709
Bond(ATOM_64, ATOM_117).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5281575627
Bond(ATOM_66, ATOM_67).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.52815756359
Bond(ATOM_66, ATOM_69).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.54556226538
Bond(ATOM_67, ATOM_68).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.54649338348
Bond(ATOM_68, ATOM_71).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.54556226494
Bond(ATOM_69, ATOM_70).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.54649338371
Bond(ATOM_70, ATOM_71).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.55548354103
Bond(ATOM_71, ATOM_72).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.54091682498
Bond(ATOM_72, ATOM_79).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.54663260176
Bond(ATOM_72, ATOM_85).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.54663260216
Bond(ATOM_72, ATOM_99).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.54809849583
Bond(ATOM_75, ATOM_112).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.54796888078
Bond(ATOM_76, ATOM_79).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.548098496
Bond(ATOM_77, ATOM_96).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.54796888059
Bond(ATOM_78, ATOM_79).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5388457387
Bond(ATOM_79, ATOM_80).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.55918779132
Bond(ATOM_80, ATOM_93).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.55918779071
Bond(ATOM_80, ATOM_107).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.56774845633
Bond(ATOM_81, ATOM_116).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.56756867402
Bond(ATOM_82, ATOM_85).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.54662433782
Bond(ATOM_83, ATOM_118).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.52490548351
Bond(ATOM_84, ATOM_87).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.55008641915
Bond(ATOM_85, ATOM_86).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.51454281225
Bond(ATOM_86, ATOM_87).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.51454281131
Bond(ATOM_86, ATOM_93).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.97715884407
Bond(ATOM_86, ATOM_127).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.53903072266
Bond(ATOM_87, ATOM_88).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.55938551666
Bond(ATOM_88, ATOM_95).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.51469357727
Bond(ATOM_88, ATOM_113).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.54662433813
Bond(ATOM_89, ATOM_124).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.52490548227
Bond(ATOM_90, ATOM_93).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.53866376212
Bond(ATOM_91, ATOM_126).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.542289528
Bond(ATOM_92, ATOM_95).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.53903072427
Bond(ATOM_93, ATOM_94).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.55938551723
Bond(ATOM_94, ATOM_95).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.51469357687
Bond(ATOM_94, ATOM_119).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.53847350499
Bond(ATOM_95, ATOM_96).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.54113142769
Bond(ATOM_96, ATOM_121).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.56774845599
Bond(ATOM_97, ATOM_114).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.56756867439
Bond(ATOM_98, ATOM_99).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.55008641935
Bond(ATOM_99, ATOM_100).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.51454281168
Bond(ATOM_100, ATOM_103).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.51454281146
Bond(ATOM_100, ATOM_107).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.9771588445
Bond(ATOM_100, ATOM_127).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.54662433792
Bond(ATOM_101, ATOM_118).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5249054832
Bond(ATOM_102, ATOM_103).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.53903072269
Bond(ATOM_103, ATOM_104).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.55938551638
Bond(ATOM_104, ATOM_111).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.51469357695
Bond(ATOM_104, ATOM_115).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.54662433792
Bond(ATOM_105, ATOM_122).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.52490548319
Bond(ATOM_106, ATOM_107).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.53903072429
Bond(ATOM_107, ATOM_108).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.55938551694
Bond(ATOM_108, ATOM_111).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.51469357694
Bond(ATOM_108, ATOM_119).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5386637621
Bond(ATOM_109, ATOM_126).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.54228952886
Bond(ATOM_110, ATOM_111).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5384735051
Bond(ATOM_111, ATOM_112).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.54113142772
Bond(ATOM_112, ATOM_123).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.55031354774
Bond(ATOM_113, ATOM_114).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.97722595874
Bond(ATOM_113, ATOM_127).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.54665070511
Bond(ATOM_114, ATOM_117).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.54665070466
Bond(ATOM_114, ATOM_121).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.55031354741
Bond(ATOM_115, ATOM_116).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.97722595934
Bond(ATOM_115, ATOM_127).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.54665070453
Bond(ATOM_116, ATOM_117).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5466507042
Bond(ATOM_116, ATOM_123).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.55482806259
Bond(ATOM_117, ATOM_118).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.54282054655
Bond(ATOM_118, ATOM_125).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.55031354746
Bond(ATOM_119, ATOM_120).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.97722595936
Bond(ATOM_119, ATOM_127).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.54665070452
Bond(ATOM_120, ATOM_121).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.54665070409
Bond(ATOM_120, ATOM_123).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.554828064
Bond(ATOM_121, ATOM_122).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.54282054691
Bond(ATOM_122, ATOM_125).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5548280638
Bond(ATOM_123, ATOM_124).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.54282054659
Bond(ATOM_124, ATOM_125).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.55368577994
Bond(ATOM_125, ATOM_126).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
//- }}} -

//vim-run: asy -batchView %
//vim-run: asy -f pdf %

// vim: nospell fdm=marker
