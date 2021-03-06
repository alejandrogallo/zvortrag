import atoms;
unitsize(1cm);

currentprojection=perspective(
camera=(-5.21810848340874,7.45312904486999,21.0705567428606),
up=(0.00299233511687494,-0.0344196363243183,0.00713127067049946),
target=(9.13004889686709,5.14148736042921,3.89269307054404),
zoom=0.635242459631156,
angle=35.1190936195292,
viewportshift=(0.0443346299950911,0.0641124334257371),
autoadjust=false);

settings.prc       = false;
settings.render    = 10; //quality
settings.outformat = "pdf"; //output 
real bond_radius = 5;
real radius_scale = 0.5;
real max_bond_dist = 2.0;
real min_bond_dist = 0;

// - Atoms - {{{1
Atom ATOM_0 = Atom("C", (7.13420180632, 7.13420180632, 7.13420180632));
Atom ATOM_1 = Atom("C", (0.0, 0.0, 0.0));
Atom ATOM_2 = Atom("C", (0.89177522579, 0.89177522579, 0.89177522579));
Atom ATOM_3 = Atom("C", (1.78355045158, 0.0, 1.78355045158));
Atom ATOM_4 = Atom("C", (2.67532567737, 0.89177522579, 2.67532567737));
Atom ATOM_5 = Atom("C", (0.0, 1.78355045158, 1.78355045158));
Atom ATOM_6 = Atom("C", (0.89177522579, 2.67532567737, 2.67532567737));
Atom ATOM_7 = Atom("C", (1.78355045158, 1.78355045158, 3.56710090316));
Atom ATOM_8 = Atom("C", (2.67532567737, 2.67532567737, 4.45887612895));
Atom ATOM_9 = Atom("C", (1.78355045158, 1.78355045158, 0.0));
Atom ATOM_10 = Atom("C", (2.67532567737, 2.67532567737, 0.89177522579));
Atom ATOM_11 = Atom("C", (3.56710090316, 1.78355045158, 1.78355045158));
Atom ATOM_12 = Atom("C", (4.45887612895, 2.67532567737, 2.67532567737));
Atom ATOM_13 = Atom("C", (1.78355045158, 3.56710090316, 1.78355045158));
Atom ATOM_14 = Atom("C", (2.67532567737, 4.45887612895, 2.67532567737));
Atom ATOM_15 = Atom("C", (3.56710090316, 3.56710090316, 3.56710090316));
Atom ATOM_16 = Atom("C", (4.45887612895, 4.45887612895, 4.45887612895));
Atom ATOM_17 = Atom("C", (3.56710090316, 0.0, 3.56710090316));
Atom ATOM_18 = Atom("C", (4.45887612895, 0.89177522579, 4.45887612895));
Atom ATOM_19 = Atom("C", (5.35065135474, 0.0, 5.35065135474));
Atom ATOM_20 = Atom("C", (6.24242658053, 0.89177522579, 6.24242658053));
Atom ATOM_21 = Atom("C", (3.56710090316, 1.78355045158, 5.35065135474));
Atom ATOM_22 = Atom("C", (4.45887612895, 2.67532567737, 6.24242658053));
Atom ATOM_23 = Atom("C", (5.35065135474, 1.78355045158, 7.13420180632));
Atom ATOM_24 = Atom("C", (6.24242658053, 2.67532567737, 8.02597703211));
Atom ATOM_25 = Atom("C", (5.35065135474, 1.78355045158, 3.56710090316));
Atom ATOM_26 = Atom("C", (6.24242658053, 2.67532567737, 4.45887612895));
Atom ATOM_27 = Atom("C", (7.13420180632, 1.78355045158, 5.35065135474));
Atom ATOM_28 = Atom("C", (8.02597703211, 2.67532567737, 6.24242658053));
Atom ATOM_29 = Atom("C", (5.35065135474, 3.56710090316, 5.35065135474));
Atom ATOM_30 = Atom("C", (6.24242658053, 4.45887612895, 6.24242658053));
Atom ATOM_31 = Atom("C", (7.13420180632, 3.56710090316, 7.13420180632));
Atom ATOM_32 = Atom("C", (8.02597703211, 4.45887612895, 8.02597703211));
Atom ATOM_33 = Atom("C", (0.0, 3.56710090316, 3.56710090316));
Atom ATOM_34 = Atom("C", (0.89177522579, 4.45887612895, 4.45887612895));
Atom ATOM_35 = Atom("C", (1.78355045158, 3.56710090316, 5.35065135474));
Atom ATOM_36 = Atom("C", (2.67532567737, 4.45887612895, 6.24242658053));
Atom ATOM_37 = Atom("C", (0.0, 5.35065135474, 5.35065135474));
Atom ATOM_38 = Atom("C", (0.89177522579, 6.24242658053, 6.24242658053));
Atom ATOM_39 = Atom("C", (1.78355045158, 5.35065135474, 7.13420180632));
Atom ATOM_40 = Atom("C", (2.67532567737, 6.24242658053, 8.02597703211));
Atom ATOM_41 = Atom("C", (1.78355045158, 5.35065135474, 3.56710090316));
Atom ATOM_42 = Atom("C", (2.67532567737, 6.24242658053, 4.45887612895));
Atom ATOM_43 = Atom("C", (3.56710090316, 5.35065135474, 5.35065135474));
Atom ATOM_44 = Atom("C", (4.45887612895, 6.24242658053, 6.24242658053));
Atom ATOM_45 = Atom("C", (1.78355045158, 7.13420180632, 5.35065135474));
Atom ATOM_46 = Atom("C", (2.67532567737, 8.02597703211, 6.24242658053));
Atom ATOM_47 = Atom("C", (3.56710090316, 7.13420180632, 7.13420180632));
Atom ATOM_48 = Atom("C", (4.45887612895, 8.02597703211, 8.02597703211));
Atom ATOM_49 = Atom("C", (3.56710090316, 3.56710090316, 7.13420180632));
Atom ATOM_50 = Atom("C", (4.45887612895, 4.45887612895, 8.02597703211));
Atom ATOM_51 = Atom("C", (5.35065135474, 3.56710090316, 8.9177522579));
Atom ATOM_52 = Atom("C", (6.24242658053, 4.45887612895, 9.809527483690001));
Atom ATOM_53 = Atom("C", (3.56710090316, 5.35065135474, 8.9177522579));
Atom ATOM_54 = Atom("C", (4.45887612895, 6.24242658053, 9.809527483690001));
Atom ATOM_55 = Atom("C", (5.35065135474, 5.35065135474, 10.70130270948));
Atom ATOM_56 = Atom("C", (6.24242658053, 6.24242658053, 11.59307793527));
Atom ATOM_57 = Atom("C", (5.35065135474, 5.35065135474, 7.13420180632));
Atom ATOM_58 = Atom("C", (6.24242658053, 6.24242658053, 8.02597703211));
Atom ATOM_59 = Atom("C", (7.13420180632, 5.35065135474, 8.9177522579));
Atom ATOM_60 = Atom("C", (8.02597703211, 6.24242658053, 9.809527483690001));
Atom ATOM_61 = Atom("C", (5.35065135474, 7.13420180632, 8.9177522579));
Atom ATOM_62 = Atom("C", (6.24242658053, 8.02597703211, 9.809527483690001));
Atom ATOM_63 = Atom("C", (7.13420180632, 7.13420180632, 10.70130270948));
Atom ATOM_64 = Atom("C", (8.02597703211, 8.02597703211, 11.59307793527));
Atom ATOM_65 = Atom("C", (3.56710090316, 3.56710090316, 0.0));
Atom ATOM_66 = Atom("C", (4.45887612895, 4.45887612895, 0.89177522579));
Atom ATOM_67 = Atom("C", (5.35065135474, 3.56710090316, 1.78355045158));
Atom ATOM_68 = Atom("C", (6.24242658053, 4.45887612895, 2.67532567737));
Atom ATOM_69 = Atom("C", (3.56710090316, 5.35065135474, 1.78355045158));
Atom ATOM_70 = Atom("C", (4.45887612895, 6.24242658053, 2.67532567737));
Atom ATOM_71 = Atom("C", (5.35065135474, 5.35065135474, 3.56710090316));
Atom ATOM_72 = Atom("C", (6.24242658053, 6.24242658053, 4.45887612895));
Atom ATOM_73 = Atom("C", (5.35065135474, 5.35065135474, 0.0));
Atom ATOM_74 = Atom("C", (6.24242658053, 6.24242658053, 0.89177522579));
Atom ATOM_75 = Atom("C", (7.13420180632, 5.35065135474, 1.78355045158));
Atom ATOM_76 = Atom("C", (8.02597703211, 6.24242658053, 2.67532567737));
Atom ATOM_77 = Atom("C", (5.35065135474, 7.13420180632, 1.78355045158));
Atom ATOM_78 = Atom("C", (6.24242658053, 8.02597703211, 2.67532567737));
Atom ATOM_79 = Atom("C", (7.13420180632, 7.13420180632, 3.56710090316));
Atom ATOM_80 = Atom("C", (8.02597703211, 8.02597703211, 4.45887612895));
Atom ATOM_81 = Atom("C", (7.13420180632, 3.56710090316, 3.56710090316));
Atom ATOM_82 = Atom("C", (8.02597703211, 4.45887612895, 4.45887612895));
Atom ATOM_83 = Atom("C", (8.9177522579, 3.56710090316, 5.35065135474));
Atom ATOM_84 = Atom("C", (9.809527483690001, 4.45887612895, 6.24242658053));
Atom ATOM_85 = Atom("C", (7.13420180632, 5.35065135474, 5.35065135474));
Atom ATOM_86 = Atom("C", (8.02597703211, 6.24242658053, 6.24242658053));
Atom ATOM_87 = Atom("C", (8.9177522579, 5.35065135474, 7.13420180632));
Atom ATOM_88 = Atom("C", (9.809527483690001, 6.24242658053, 8.02597703211));
Atom ATOM_89 = Atom("C", (8.9177522579, 5.35065135474, 3.56710090316));
Atom ATOM_90 = Atom("C", (9.809527483690001, 6.24242658053, 4.45887612895));
Atom ATOM_91 = Atom("C", (10.70130270948, 5.35065135474, 5.35065135474));
Atom ATOM_92 = Atom("C", (11.59307793527, 6.24242658053, 6.24242658053));
Atom ATOM_93 = Atom("C", (8.9177522579, 7.13420180632, 5.35065135474));
Atom ATOM_94 = Atom("C", (9.809527483690001, 8.02597703211, 6.24242658053));
Atom ATOM_95 = Atom("C", (10.70130270948, 7.13420180632, 7.13420180632));
Atom ATOM_96 = Atom("C", (11.59307793527, 8.02597703211, 8.02597703211));
Atom ATOM_97 = Atom("C", (3.56710090316, 7.13420180632, 3.56710090316));
Atom ATOM_98 = Atom("C", (4.45887612895, 8.02597703211, 4.45887612895));
Atom ATOM_99 = Atom("C", (5.35065135474, 7.13420180632, 5.35065135474));
Atom ATOM_100 = Atom("C", (6.24242658053, 8.02597703211, 6.24242658053));
Atom ATOM_101 = Atom("C", (3.56710090316, 8.9177522579, 5.35065135474));
Atom ATOM_102 = Atom("C", (4.45887612895, 9.809527483690001, 6.24242658053));
Atom ATOM_103 = Atom("C", (5.35065135474, 8.9177522579, 7.13420180632));
Atom ATOM_104 = Atom("C", (6.24242658053, 9.809527483690001, 8.02597703211));
Atom ATOM_105 = Atom("C", (5.35065135474, 8.9177522579, 3.56710090316));
Atom ATOM_106 = Atom("C", (6.24242658053, 9.809527483690001, 4.45887612895));
Atom ATOM_107 = Atom("C", (7.13420180632, 8.9177522579, 5.35065135474));
Atom ATOM_108 = Atom("C", (8.02597703211, 9.809527483690001, 6.24242658053));
Atom ATOM_109 = Atom("C", (5.35065135474, 10.70130270948, 5.35065135474));
Atom ATOM_110 = Atom("C", (6.24242658053, 11.59307793527, 6.24242658053));
Atom ATOM_111 = Atom("C", (7.13420180632, 10.70130270948, 7.13420180632));
Atom ATOM_112 = Atom("C", (8.02597703211, 11.59307793527, 8.02597703211));
Atom ATOM_113 = Atom("C", (8.9177522579, 7.13420180632, 8.9177522579));
Atom ATOM_114 = Atom("C", (9.809527483690001, 8.02597703211, 9.809527483690001));
Atom ATOM_115 = Atom("C", (7.13420180632, 8.9177522579, 8.9177522579));
Atom ATOM_116 = Atom("C", (8.02597703211, 9.809527483690001, 9.809527483690001));
Atom ATOM_117 = Atom("C", (8.9177522579, 8.9177522579, 10.70130270948));
Atom ATOM_118 = Atom("C", (9.809527483690001, 9.809527483690001, 11.59307793527));
Atom ATOM_119 = Atom("C", (8.9177522579, 8.9177522579, 7.13420180632));
Atom ATOM_120 = Atom("C", (9.809527483690001, 9.809527483690001, 8.02597703211));
Atom ATOM_121 = Atom("C", (10.70130270948, 8.9177522579, 8.9177522579));
Atom ATOM_122 = Atom("C", (11.59307793527, 9.809527483690001, 9.809527483690001));
Atom ATOM_123 = Atom("C", (8.9177522579, 10.70130270948, 8.9177522579));
Atom ATOM_124 = Atom("C", (9.809527483690001, 11.59307793527, 9.809527483690001));
Atom ATOM_125 = Atom("C", (10.70130270948, 10.70130270948, 10.70130270948));
Atom ATOM_126 = Atom("C", (11.59307793527, 11.59307793527, 11.59307793527));
Atom ATOM_127 = Atom("Si", (7.13420180632, 7.13420180632, 7.13420180632));

// - Atoms - 1}}}


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

// - Atoms drawing - 1}}}
*/

ATOM_127.draw(radius_scale = radius_scale);
//ATOM_127.color=red;
label("$\mathsf{SiV}^-$", ATOM_127.position+(0.2,1,0), SE);

// - Bonds - {{{1
// distance: 1.5446
Bond(ATOM_1, ATOM_2).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_2, ATOM_3).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_2, ATOM_5).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_2, ATOM_9).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_3, ATOM_4).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_4, ATOM_7).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_4, ATOM_11).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_4, ATOM_17).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_5, ATOM_6).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_6, ATOM_7).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_6, ATOM_13).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_6, ATOM_33).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_7, ATOM_8).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_8, ATOM_15).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_8, ATOM_21).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_8, ATOM_35).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_9, ATOM_10).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_10, ATOM_11).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_10, ATOM_13).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_10, ATOM_65).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_11, ATOM_12).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_12, ATOM_15).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_12, ATOM_25).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_12, ATOM_67).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_13, ATOM_14).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_14, ATOM_15).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_14, ATOM_41).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_14, ATOM_69).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_15, ATOM_16).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_16, ATOM_29).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_16, ATOM_43).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_16, ATOM_71).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_17, ATOM_18).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_18, ATOM_19).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_18, ATOM_21).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_18, ATOM_25).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_19, ATOM_20).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_20, ATOM_23).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_20, ATOM_27).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_21, ATOM_22).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_22, ATOM_23).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_22, ATOM_29).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_22, ATOM_49).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_23, ATOM_24).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_24, ATOM_31).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_24, ATOM_51).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_25, ATOM_26).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_26, ATOM_27).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_26, ATOM_29).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_26, ATOM_81).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_27, ATOM_28).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_28, ATOM_31).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_28, ATOM_83).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_29, ATOM_30).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_30, ATOM_31).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_30, ATOM_57).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_30, ATOM_85).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_31, ATOM_32).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_32, ATOM_59).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_32, ATOM_87).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_33, ATOM_34).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_34, ATOM_35).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_34, ATOM_37).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_34, ATOM_41).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_35, ATOM_36).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_36, ATOM_39).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_36, ATOM_43).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_36, ATOM_49).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_37, ATOM_38).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_38, ATOM_39).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_38, ATOM_45).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_39, ATOM_40).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_40, ATOM_47).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_40, ATOM_53).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_41, ATOM_42).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_42, ATOM_43).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_42, ATOM_45).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_42, ATOM_97).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_43, ATOM_44).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_44, ATOM_47).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_44, ATOM_57).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_44, ATOM_99).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_45, ATOM_46).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_46, ATOM_47).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_46, ATOM_101).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_47, ATOM_48).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_48, ATOM_61).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_48, ATOM_103).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_49, ATOM_50).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_50, ATOM_51).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_50, ATOM_53).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_50, ATOM_57).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_51, ATOM_52).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_52, ATOM_55).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_52, ATOM_59).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_53, ATOM_54).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_54, ATOM_55).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_54, ATOM_61).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_55, ATOM_56).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_56, ATOM_63).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_57, ATOM_58).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_58, ATOM_59).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_58, ATOM_61).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_58, ATOM_127).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_59, ATOM_60).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_60, ATOM_63).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_60, ATOM_113).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_61, ATOM_62).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_62, ATOM_63).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_62, ATOM_115).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_63, ATOM_64).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_64, ATOM_117).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_65, ATOM_66).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_66, ATOM_67).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_66, ATOM_69).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_66, ATOM_73).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_67, ATOM_68).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_68, ATOM_71).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_68, ATOM_75).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_68, ATOM_81).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_69, ATOM_70).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_70, ATOM_71).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_70, ATOM_77).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_70, ATOM_97).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_71, ATOM_72).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_72, ATOM_79).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_72, ATOM_85).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_72, ATOM_99).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_73, ATOM_74).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_74, ATOM_75).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_74, ATOM_77).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_75, ATOM_76).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_76, ATOM_79).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_76, ATOM_89).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_77, ATOM_78).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_78, ATOM_79).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_78, ATOM_105).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_79, ATOM_80).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_80, ATOM_93).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_80, ATOM_107).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_81, ATOM_82).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_82, ATOM_83).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_82, ATOM_85).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_82, ATOM_89).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_83, ATOM_84).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_84, ATOM_87).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_84, ATOM_91).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_85, ATOM_86).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_86, ATOM_87).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_86, ATOM_93).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_86, ATOM_127).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_87, ATOM_88).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_88, ATOM_95).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_88, ATOM_113).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_89, ATOM_90).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_90, ATOM_91).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_90, ATOM_93).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_91, ATOM_92).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_92, ATOM_95).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_93, ATOM_94).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_94, ATOM_95).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_94, ATOM_119).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_95, ATOM_96).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_96, ATOM_121).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_97, ATOM_98).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_98, ATOM_99).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_98, ATOM_101).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_98, ATOM_105).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_99, ATOM_100).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_100, ATOM_103).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_100, ATOM_107).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_100, ATOM_127).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_101, ATOM_102).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_102, ATOM_103).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_102, ATOM_109).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_103, ATOM_104).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_104, ATOM_111).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_104, ATOM_115).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_105, ATOM_106).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_106, ATOM_107).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_106, ATOM_109).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_107, ATOM_108).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_108, ATOM_111).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_108, ATOM_119).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_109, ATOM_110).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_110, ATOM_111).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_111, ATOM_112).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_112, ATOM_123).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_113, ATOM_114).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_114, ATOM_117).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_114, ATOM_121).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_115, ATOM_116).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_116, ATOM_117).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_116, ATOM_123).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_117, ATOM_118).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_118, ATOM_125).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_119, ATOM_120).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_120, ATOM_121).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_120, ATOM_123).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_121, ATOM_122).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_122, ATOM_125).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_123, ATOM_124).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_124, ATOM_125).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);
// distance: 1.5446
Bond(ATOM_125, ATOM_126).draw(max_dist=max_bond_dist, min_dist=min_bond_dist,radius=bond_radius);

// - Bonds - 1}}}

//vim-run: asy -batchView %
//vim-run: asy -f pdf %

// vim: nospell fdm=marker
