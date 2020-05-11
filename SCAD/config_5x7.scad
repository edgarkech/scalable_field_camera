/*
This is the base configuration file for the 5x7" format
# we are not using the exact ANSI measures, but slightly rounded measures for slight simplification
*/

// general tolerance
vTolerance = 0.2;

// sheet film and cassette measurements (roughly based on the ANSI measurements)
vFilmSheet_l = 178;
vFilmSheet_w = 127;
vCassette_l = 214; // A min
vCassette_w = 150; // B max
vCassette_h = 14; // C max (14.3)
vLightTrap_l = 1.5; // M2
vLightTrap_w = vCassette_w;
vLightTrap_h = 1.5; // M1
vLightTrap_offsetX = 194.5; // G max
vFilmWindow_l = 171;
vFilmWindow_w = 126;
vFilmWindow_offsetX = 18;
vGroundGlass_offsetZ = 5.8;

// Graflok - although 5x7 normally doesn't have Graflok clamps, but we use this measurement on the back plate
vGraflok_h = 6; // this is not the official measurement, just measured from a camera 

// lens board measures (we are using Wista/Technika-style lensboards)
vLensboard_l = 100;
vLensboard_w = 97;
vLensboard_h = 2;
vLensboard_offsetX = -(vLensboard_l+3)/2; // caution: we have an asymetric offset!
vLensboard_offsetY = -vLensboard_w/2;
vLensboardHole_d = 85;
vLensboardLighttrap_d = 89;
vLensboardLighttrap_h = 1+vTolerance;

// bellows frame measures - the bellows frame design is derived from standardcameras.com
// back frame
vBellowsBackInner_l = 193;
vBellowsBackInner_w = vBellowsBackInner_l;
vBellowsBackOuter_l = vBellowsBackInner_l+1;
vBellowsBackOuter_w = vBellowsBackOuter_l;

vBellowsBackFrameOuter_l = 209;
vBellowsBackFrameOuter_w = vBellowsBackFrameOuter_l;
vBellowsBackFrameOuter_h = 7;
vBellowsBackFrameInner_l = 180;
vBellowsBackFrameInner_w = vBellowsBackFrameInner_l;
vBellowsBackFrameInner_h = 5;

vBellowsBackLightTrapOuter_l = vBellowsBackFrameInner_l+2*2;
vBellowsBackLightTrapOuter_w = vBellowsBackLightTrapOuter_l;
vBellowsBackLightTrap_h = 3;

vBellowsBackFrameScrewHole_d = 2;
vBellowsBackFrameScrewHole_h = 10;
vBellowsBackFrameScrewHole_offsetXY = 80;
vBellowsBackFrameScrewHole_offsetZ = vBellowsBackFrameOuter_h/2;

// front frame
vBellowsFrontInner_l = 110; 
vBellowsFrontInner_w = vBellowsFrontInner_l;
vBellowsFrontOuter_l = vBellowsFrontInner_l+1;
vBellowsFrontOuter_w = vBellowsFrontOuter_l;

vBellowsFrontFrameOuter_l = 124;
vBellowsFrontFrameOuter_w = vBellowsFrontFrameOuter_l;
vBellowsFrontFrameOuter_h = 7;
vBellowsFrontFrameInner_l = 98;
vBellowsFrontFrameInner_w = vBellowsFrontFrameInner_l;
vBellowsFrontFrameInner_h = 5;

vBellowsFrontLightTrapOuter_l = vBellowsFrontFrameInner_l+2*2;
vBellowsFrontLightTrapOuter_w = vBellowsFrontLightTrapOuter_l;
vBellowsFrontLightTrap_h = 0;

vBellowsFrontFrameScrewHole_d = 2;
vBellowsFrontFrameScrewHole_h = 10;
vBellowsFrontFrameScrewHole_offsetXY = 50;
vBellowsFrontFrameScrewHole_offsetZ = vBellowsFrontFrameOuter_h/2;

// body dimensions
vWall_strength = 5;
vBodyOuter_l = 230;
//vBodyOuter_l = 235; // make sure this is at least 4*vWall_strength larger than vBellowsBackFrameOuter_l!
vBodyOuter_w = 220; // make sure this is at least 2*vWall_strength larger than vBellowsBackFrameOuter_l!
vBodyOuter_h = 65;
vBodyEdge_r = vWall_strength;

// we will center our model on the Y axis and on the center of the bellows frame
// at least for the 4x5 version, we have to do an asymetric offset of 2.5mm on the X-axis 
vAsymOffsetX = 0;
//vAsymOffsetX = -2.5;  

// back plate
vBackPlateLength = 210; // we will probably use about the same size as the bellows back frame
vBackPlateStrength = vWall_strength;

// hinges for front lid
vHingeInnerDistance = 120;
vHingeBaseWidth = 30;
vHingeHole = 5;

// lid lock measures
vLidLockBase_d = 8;
vLidLockHole_distance = 100;

// rail dimensions
vLowerRail_w = 120;
vUpperRail_w = vLowerRail_w;

// cutout for stop indents
vStopIndent_l = 4;
vStopIndent_h = 5;
vStopIndentDistance = 30; // shorter than 25 is not necessary
vStopIndent_offsetX = 35; // don't go shorter than 20 if you intend to use a 90mm lens!

// for all dovetails we use a base width of 5mm and a base height of 5mm
// we are applying tolerances to the inner AND outer part of a dovetail, in width and height
vDoveTail_w = 5;
vDoveTail_h = 5;
vDoveTail_tolerance = 0.2;

// front standard carrier / slider
// width is depending on vUpperRail_w
vSliderBase_w = vUpperRail_w + (4*vDoveTail_w);
vSliderBase_l = 40; // make sure to have enough space in the body.


// lever plate 
vLeverPlateBase_w = vUpperRail_w - (8*vDoveTail_w);
vLeverPlateBlock_w = 50;
vLeverPlateBlock_l = vSliderBase_l-(2*vDoveTail_w);

vFrontStandard_h = 160;
vFrontStandardSlot_h = vFrontStandard_h - 30;


// lensboard carrier
vFrontPlate_length = vSliderBase_w; // vSliderBase_w is a bit too tight for 4x5", so there wie will add 5mm, for 5x7 vSliderBase_w is OK to get a squared lensboard carrier
vFrontPlate_width = vSliderBase_w; //vFrontPlate_length;
vFrontPlate_height = 16;
vEdgeCutCylinder = floor(sqrt(2*pow(vFrontPlate_width,2)))-12;

vTiltDovetailBase_d1 = 30;
vTiltDovetailBase_d2 = vTiltDovetailBase_d1+(2*vDoveTail_w);
vTiltDovetailBaseBlock_d = vTiltDovetailBase_d1+(4*vDoveTail_w);

vTiltDovetail_d1 = vTiltDovetailBase_d1-vTolerance;
vTiltDovetail_d2 = vTiltDovetailBase_d2-vTolerance;
vTiltDovetail_h = vDoveTail_w-vTolerance;

vTiltDovetailCutout_d1 = vTiltDovetailBase_d2+vTolerance;
vTiltDovetailCutout_d2 = vTiltDovetailBase_d1+vTolerance;

vAxisHole_d = 10+vTolerance;
vAxisHole_h = vDoveTail_w+vTolerance;

vTiltLockBolt_d = 12;
vTiltLockBolt_h = 18;
vTiltLockBoltHole_d = 7;
vTiltLockBoltHole_h = vTiltLockBolt_h;

vTiltHeight = 50;
vTiltRadius = vFrontPlate_length/2;
vTiltAngleMinus = -7;
vTiltAnglePlus = 7;
vTiltAxis_d = 10-vTolerance;

// focusing rod
vFocusingRod_d = 6;
vFocusingKnob_d = 25;
vFocusingKnob_h = 20;

// stabilizer measures (just the outer measures of our stabilizer block, not the tripod slider)
vStabilizerBase_l = vBodyOuter_l;
vStabilizerBase_w = 100;  
vStabilizerBase_h = 2;
vStabilizerTotal_h = 7;
vStabilizerDovetailBase_w = 50;

// screw holes for the stabilizer
vLidHoleCount_x = 6;
vLidHoleDist_x = 35;
vLidHoleCount_y = 2;
vLidHoleDist_y = 60;

// screw diameters, length is individually set
vScrew1Hole_d = 3;
vScrew1ThreadHole_d = 2.2;
vScrew2Hole_d = 2;
vScrew2ThreadHole_d = 1.4;


 