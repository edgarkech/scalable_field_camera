// some variables
$fn = 60; // we are using 60 fragments for cylinders and similar objects

// our outer frame measurements - caution overall
vFrontLidOuter_l = 185;
vFrontLidOuter_w = 170;
vFrontLidOuter_h = 10;
vFrontLid_wall = 5;
vFrontLidOuter_offsetX = -vFrontLidOuter_l/2;
vFrontLidOuter_offsetY = -vFrontLidOuter_w/2;
vFrontLidOuter_offsetZ = 0;

vFrontLidInner_l = vFrontLidOuter_l-(2*vFrontLid_wall); // on X-axis
vFrontLidInner_w = vFrontLidOuter_w-(2*vFrontLid_wall); // on Y-axis
vFrontLidInner_h = vFrontLidOuter_h-vFrontLid_wall;
vFrontLidInner_offsetX = -vFrontLidInner_l/2;
vFrontLidInner_offsetY = -vFrontLidInner_w/2;
vFrontLidInner_offsetZ = vFrontLid_wall;

// our edges depend on the wall strength
vEdgeBolt_r = vFrontLid_wall;
vEdgeBolt_h = 2*vFrontLid_wall;
vEdgeBolt_offsetX = vFrontLidInner_offsetX;
vEdgeBolt_offsetY = vFrontLidInner_offsetY;
vEdgeBolt_offsetZ = 0;

vEdgeBoltCone_d1 = 3.2;
vEdgeBoltCone_d2 = 6.2;
vEdgeBoltCone_h = 3.2;
vEdgeBoltCone_offsetZ = vEdgeBolt_h-vEdgeBoltCone_h;

//vEdgeBoltHole = 3;

// rails
vRailTolerance = 0.2;

vRailBlock_l = vFrontLidOuter_l;
vRailBlock_w = 100;
vRailBlock_h = 5;
vRailBlock_offsetX = -vRailBlock_l/2;
vRailBlock_offsetY = -vRailBlock_w/2;
vRailBlock_offsetZ = vFrontLid_wall;

// cutout via roof
vRailCutout_l = vFrontLidInner_l;
vRailCutout_w = 90 + vRailTolerance;
vRailCutout_h = vRailCutout_w/2;
vRailCutout_offsetX = vRailBlock_offsetX + 2*vFrontLid_wall;
vRailCutout_offsetY = vRailCutout_w/2;
vRailCutout_offsetZ = vFrontLid_wall;

vRailMidCutout_l = vFrontLidInner_l-10;
vRailMidCutout_w = vRailBlock_w/2;
vRailMidCutout_h = 2;
vRailMidCutout_offsetX = -(vRailMidCutout_l/2)+5;
vRailMidCutout_offsetY = -vRailMidCutout_w/2;
vRailMidCutout_offsetZ = vFrontLid_wall-vRailMidCutout_h;

// hinges
vHingeTolerance = 0.2;
vHingeTubeOuter_r = vFrontLid_wall;
vHingeTubeOuter_h = vFrontLidOuter_w;
vHingeTubeInner_d = 5+vHingeTolerance;
vHingeTube_offsetX = vFrontLidInner_offsetX;
vHingeTube_offsetY = -vFrontLidOuter_offsetY;
vHingeTube_offsetZ = vFrontLidOuter_h;

vHingeCutout_l = 2*vFrontLid_wall;
vHingeCutout_w = 20+vHingeTolerance;
vHingeCutout_h = vHingeCutout_l;
vHingeCutout_offsetX = vFrontLidOuter_offsetX;
vHingeCutout_offsetY = (vFrontLidOuter_w-vHingeCutout_w-10)/2;
vHingeCutout_offsetZ = vFrontLid_wall;



// lens indent
vLensIndent_d2 = 70;
vLensIndent_d1 = vLensIndent_d2-(2*vFrontLid_wall);
vLensIndent_h = vFrontLid_wall;
vLensIndent_offsetX = 5;
vLensIndent_offsetY = 0;
vLensIndent_offsetZ = 1;

vBackThreadBlock_l = 10;
vBackThreadBlock_w = 24;
vBackThreadBlock_h = 12;
vBackThreadBlock_offsetX = vFrontLidInner_offsetX+vFrontLid_wall;
vBackThreadBlock_offsetY = -75;
vBackThreadBlock_offsetZ = vFrontLid_wall;

vFocusingRodHole_d = 6.2;
vFocusingRodHole_h = vFrontLidOuter_l;
vFocusingRodHole_offsetX = vBackThreadBlock_offsetX+5;
vFocusingRodHole_offsetY = -63;
vFocusingRodHole_offsetZ = vBackThreadBlock_h/2+vFrontLid_wall;

vFocusingKnobCutout_d = 25;
vFocusingKnobCutout_l = 25;
vFocusingKnobCutout_offsetX = -vFrontLidOuter_offsetX-vFocusingKnobCutout_l-15;
vFocusingKnobCutout_offsetY = -63;
vFocusingKnobCutout_offsetZ = vBackThreadBlock_h/2+vFrontLid_wall;

vFocusingBlockScrew_d = 3;
vFocusingBlockScrew_h = 10;
vFocusingBlockScrew1_offsetX = vFocusingKnobCutout_offsetX-5;
vFocusingBlockScrew1_offsetY = vFocusingKnobCutout_offsetY+8;

vFocusingBlockScrew2_offsetX = vFocusingKnobCutout_offsetX-5;
vFocusingBlockScrew2_offsetY = vFocusingKnobCutout_offsetY-8;

vFocusingBlockScrew3_offsetX = vFocusingKnobCutout_offsetX+vFocusingKnobCutout_l+5;
vFocusingBlockScrew3_offsetY = vFocusingKnobCutout_offsetY+8;

vFocusingBlockScrew4_offsetX = vFocusingKnobCutout_offsetX+vFocusingKnobCutout_l+5;
vFocusingBlockScrew4_offsetY = vFocusingKnobCutout_offsetY-8;

vFocusingBlockScrew_offsetZ = 0;

vFocusingBlockCutout_l = vFrontLid_wall;
vFocusingBlockCutout_w = 25;
vFocusingBlockCutout_h = vFrontLid_wall;
vFocusingBlockCutout_offsetX = -vFrontLidInner_offsetX;
vFocusingBlockCutout_offsetY = vFrontLidInner_offsetY+vFrontLid_wall;
vFocusingBlockCutout_offsetZ = vFrontLid_wall;

// Screwholes for the stabilizing lid
vLidHole_d = 2;
vLidHole_h = vFrontLid_wall;
vLidHoleCount_x = 5;
vLidHoleDist_x = 35;
vLidHoleCount_y = 2;
vLidHoleDist_y = 60;

vLidHoleRow_length = (vLidHoleCount_x-1)*vLidHoleDist_x;
vLidHoleRow_offsetX = -vLidHoleRow_length/2;
vLidHoleRow_offsetY = vLidHoleDist_y/2;
vLidHoleRow_offsetZ = 0.5; // because of problems with adhesion for the first layer, we place our little screw holes a little bit higher and do the rest with post processing (hot needle)

