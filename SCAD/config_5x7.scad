/*
This is the base configuration file for the 4x5" format
# we are not using the exact ANSI measures, but slightly rounded measures for slight simplification
*/

// general tolerance
vTolerance = 0.2;

// sheet film and cassette measurements
vFilmSheet_l = 127;
vFilmSheet_w = 178;
vCassette_l = 214; // A min
vCassette_w = 150; // B max
vCassette_h = 14.3; // C max
vLightTrap_l = 1.5; // M2
vLightTrap_w = vCassette_w;
vLightTrap_h = 1.5; // M1
vLightTrap_offsetX = 194.5; // G max
vFilmWindow_l = 171;
vFilmWindow_w = 126;
vFilmWindow_offsetX = 18;
vGroundGlass_offsetZ = 5.8;

// Graflok?

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
vBellowsBackInner_l = 194;
vBellowsBackInner_w = vBellowsBackInner_l;
vBellowsBackOuter_l = vBellowsBackInner_l+0.8;
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

vBellowsFrameScrewHole_d = 2;
vBellowsFrameScrewHole_h = 10;
vBellowsFrameScrewHole_offsetXY = 80;
vBellowsFrameScrewHole_offsetZ = vBellowsBackFrameOuter_h/2;

// body dimensions
vWall_strength = 5;
vBodyOuter_l = 185;
vBodyOuter_w = 170;
vBodyOuter_h = 65;
vBodyEdge_r = vWall_strength;

// rail dimensions
vLowerRail_w = 90;
vUpperRail_w = vLowerRail_w;

// for all dovetails we use a base width of 5mm and a base height of 5mm
// we are applying tolerances to the inner AND outer part of a dovetail, in width and height
vDoveTail_w = 5;
vDoveTail_h = 5;
vDoveTail_tolerance = 0.2;

// focusing rod
vFocusingRod_d = 6;
vFocusingKnob_d = 25;
vFocusingKnob_h = 20;

// stabilizer measures (just the outer measures of our stabilizer block, not the tripod slider)
vStabilizerBase_l = 140;
vStabilizerBase_w = 100;  
vStabilizerBase_h = 8;


 