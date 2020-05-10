// loading the base configuration
include <baseconfig.scad>;

// some modules such as hex, countersunk screws, roof, wedge are available in a module file
use <modules.scad>;



vCassetteLighttrapBorder = 1.5;

vBackPlate_l = vBackPlateLength-(2*vTolerance);
vBackPlate_w = vBackPlate_l;
vBackPlate_h = vBackPlateStrength+1; // we add 1mm and make indents for our locks
vBackPlate_offsetX = -vBackPlate_l/2;
vBackPlate_offsetY = -vBackPlate_w/2;
vBackPlate_offsetZ = 0;

vEdgeCut = 2;
vEdgeCut_h = vBackPlate_h;
vEdgeCut_offsetX = -vBackPlate_l/2;
vEdgeCut_offsetY = -vBackPlate_w/2;
vEdgeCut_offsetZ = 0;

vLightTrapOuter_l = vBellowsBackFrameInner_l+1;
vLightTrapOuter_w = vLightTrapOuter_l;
vLightTrapInner_l = vLightTrapOuter_l-5;
vLightTrapInner_w = vLightTrapInner_l;
vLightTrap_h = 1.5;
vLightTrapOuter_offsetX = -vLightTrapOuter_l/2;
vLightTrapOuter_offsetY = -vLightTrapOuter_w/2;
vLightTrapInner_offsetX = -vLightTrapInner_l/2;
vLightTrapInner_offsetY = -vLightTrapInner_w/2;
vLightTrap_offsetZ = 0;

vWindowCutout_l = vFilmWindow_l;
vWindowCutout_w = vFilmWindow_w;
vWindowCutout_h = vBackPlate_h;
vWindowCutout_offsetX = -vWindowCutout_l/2;
vWindowCutout_offsetY = -vWindowCutout_w/2;
vWindowCutout_offsetZ = 0;

vCassetteBaseBlock_l = vBackPlate_l;
vCassetteBaseBlock_w = vCassette_w + (2*vWall_strength);
vCassetteBaseBlock_h = vGraflok_h; // we make this Graflok height, to make the addition of Graflok clamps a little bit easier
vCassetteBaseBlock_offsetX = -vCassetteBaseBlock_l/2;
vCassetteBaseBlock_offsetY = -vCassetteBaseBlock_w/2;
vCassetteBaseBlock_offsetZ = vBackPlate_h;

vCassetteGuideBaseCylinder_d = 24; // should be at least 2x vCassetteBaseBlock_h
vCassetteGuideBaseCylinder_h = vCassetteBaseBlock_w;
vCassetteGuideBaseCylinder_offsetX1 = -(vCassetteBaseBlock_l-vCassetteGuideBaseCylinder_d+5)/2;
vCassetteGuideBaseCylinder_offsetX2 = (vCassetteBaseBlock_l-vCassetteGuideBaseCylinder_d)/2;
vCassetteGuideBaseCylinder_offsetY = -vCassetteGuideBaseCylinder_h/2;
vCassetteGuideBaseCylinder_offsetZ = vBackPlate_h+vCassetteBaseBlock_h;

vCassetteGuideBackCutout_l = vCassetteGuideBaseCylinder_d;
vCassetteGuideBackCutout_w = vCassette_w-(2*vWall_strength);
vCassetteGuideBackCutout_h = vCassetteGuideBaseCylinder_d/2;
vCassetteGuideBackCutout_offsetX = -(vCassetteBaseBlock_l+vCassetteGuideBaseCylinder_d)/2;
vCassetteGuideBackCutout_offsetY = -vCassetteGuideBackCutout_w/2;
vCassetteGuideBackCutout_offsetZ = vBackPlate_h+vCassetteBaseBlock_h;

vCassetteCutout_l = vCassette_l;
vCassetteCutout_w = vCassette_w+(2*vTolerance); // measure your own cassettes! official maximum width is 121, but some of my older cassettes are 121.5!
vCassetteCutout_h = vCassetteGuideBaseCylinder_d; // normally we would take only the cassette height, but we need a bit more height to cut out our guides from the base cylinders
vCassetteCutout_offsetX = -((vWindowCutout_l/2)+vFilmWindow_offsetX);
vCassetteCutout_offsetY = -vCassetteCutout_w/2;
vCassetteCutout_offsetZ = vBackPlate_h;

vCassetteLighttrap_l = vLightTrap_l+1; // we take the official measure from our include and add 1mm tolerance
vCassetteLighttrap_w = vCassette_w+(2*vTolerance);
vCassetteLighttrap_h = vLightTrap_h+0.5; // we take the official measure from our include and add 0.5mm tolerance
vCassetteLighttrap_offsetX = vCassetteCutout_offsetX+vLightTrap_offsetX-vCassetteLighttrap_l;
vCassetteLighttrap_offsetY = -vCassetteLighttrap_w/2;
vCassetteLighttrap_offsetZ = vBackPlate_h-vCassetteLighttrap_h;

vSpringHole_d = 2; // we use 1.2mm spring wire, so a printed hole with 2mm should be OK
vSpringHole_h = vCassetteBaseBlock_l+vCassetteGuideBaseCylinder_d;
vSpringHole_offsetX = -vSpringHole_h/2;
vSpringHole_offsetY = ((vCassetteBaseBlock_w-vCassetteCutout_w)/4)+(vCassetteCutout_w/2);
vSpringHole_offsetZ = vBackPlate_h+vCassetteBaseBlock_h+(vSpringHole_d/2);

vSpringHolder_l = 3;
vSpringHolder_w = 10;
vSpringHolder_h = 4;
vSpringHolder_offsetX = vCassetteBaseBlock_offsetX-2.5;
vSpringHolder_offsetY = -vSpringHolder_w/2;
vSpringHolder_offsetZ = vBackPlate_h+vCassetteBaseBlock_h;

vFrontRamp_l = 10;
vFrontRamp_w = vCassetteCutout_w;
vFrontRamp_h = -(vBackPlate_h-5);
vFrontRamp_offsetX = vBackPlate_l/2;
vFrontRamp_offsetY = -vFrontRamp_w/2;
vFrontRamp_offsetZ = vBackPlate_h;

vLockPatch_l = (vBackPlate_w-vCassetteBaseBlock_w)/2-vTolerance;
vLockPatch_w = vLockPatch_l;
vLockPatch_h = vBackPlate_h-5;
vLockPatch_offsetX = -vBackPlate_l/2;
vLockPatch_offsetY = -vBackPlate_w/2;
vLockPatch_offsetZ = 5;


union(){
difference(){
    union(){
    // base plate
    translate([vBackPlate_offsetX, vBackPlate_offsetY, vBackPlate_offsetZ])
        cube([vBackPlate_l, vBackPlate_w, vBackPlate_h]);
    // cassette base block
    translate([vCassetteBaseBlock_offsetX, vCassetteBaseBlock_offsetY, vCassetteBaseBlock_offsetZ])
        cube([vCassetteBaseBlock_l, vCassetteBaseBlock_w, vCassetteBaseBlock_h]);    
    // cassette guide base cylinders
    translate([vCassetteGuideBaseCylinder_offsetX1, vCassetteGuideBaseCylinder_offsetY, vCassetteGuideBaseCylinder_offsetZ])
        rotate([270,0,0])
            cylinder(d=vCassetteGuideBaseCylinder_d, h=vCassetteGuideBaseCylinder_h);
    translate([vCassetteGuideBaseCylinder_offsetX2, vCassetteGuideBaseCylinder_offsetY, vCassetteGuideBaseCylinder_offsetZ])
        rotate([270,0,0])
            cylinder(d=vCassetteGuideBaseCylinder_d, h=vCassetteGuideBaseCylinder_h);    
        
        };
    
    // light trap
    difference(){
        translate([vLightTrapOuter_offsetX, vLightTrapOuter_offsetY, vLightTrap_offsetZ])
            cube([vLightTrapOuter_l, vLightTrapOuter_w, vLightTrap_h]);
        translate([vLightTrapInner_offsetX, vLightTrapInner_offsetY, vLightTrap_offsetZ])
            cube([vLightTrapInner_l, vLightTrapInner_w, vLightTrap_h]);
            };
    
    // front ramp
    translate([vFrontRamp_offsetX, vFrontRamp_offsetY, vFrontRamp_offsetZ])
        rotate([0, 0, 90])
            wedge(vFrontRamp_w, vFrontRamp_l, vFrontRamp_h);        
            
    // window
    translate([vWindowCutout_offsetX, vWindowCutout_offsetY, vWindowCutout_offsetZ])
        cube([vWindowCutout_l, vWindowCutout_w, vWindowCutout_h]);        
    
    // cassette cutout
    translate([vCassetteCutout_offsetX, vCassetteCutout_offsetY, vCassetteCutout_offsetZ])
        cube([vCassetteCutout_l, vCassetteCutout_w, vCassetteCutout_h]);        
            
    // cassette light trap
    translate([vCassetteLighttrap_offsetX, vCassetteLighttrap_offsetY, vCassetteLighttrap_offsetZ])
        cube([vCassetteLighttrap_l, vCassetteLighttrap_w, vCassetteLighttrap_h]);        
            
    // cassette guide back cutout
    translate([vCassetteGuideBackCutout_offsetX, vCassetteGuideBackCutout_offsetY, vCassetteGuideBackCutout_offsetZ])
        cube([vCassetteGuideBackCutout_l, vCassetteGuideBackCutout_w, vCassetteGuideBackCutout_h]);
   
    // spring holes
    // +y
    translate([vSpringHole_offsetX, vSpringHole_offsetY, vSpringHole_offsetZ])
    rotate([0, 90, 0])
    cylinder(d=vSpringHole_d, h=vSpringHole_h);
        // -y
    translate([vSpringHole_offsetX, -vSpringHole_offsetY, vSpringHole_offsetZ])
    rotate([0, 90, 0])
    cylinder(d=vSpringHole_d, h=vSpringHole_h);         
    
    // cutting the edges of the base plate
    translate([vEdgeCut_offsetX, -vEdgeCut_offsetY, vEdgeCut_offsetZ])
        rotate([0, 270, 0])
            wedge(vEdgeCut_h, -vEdgeCut, -vEdgeCut);
    translate([vEdgeCut_offsetX, vEdgeCut_offsetY, vEdgeCut_offsetZ])
        rotate([0, 270, 0])
            wedge(vEdgeCut_h, vEdgeCut, -vEdgeCut);
    translate([-vEdgeCut_offsetX, -vEdgeCut_offsetY, vEdgeCut_offsetZ])
        rotate([0, 270, 0])
            wedge(vEdgeCut_h, -vEdgeCut, vEdgeCut);
    translate([-vEdgeCut_offsetX, vEdgeCut_offsetY, vEdgeCut_offsetZ])
        rotate([0, 270, 0])
            wedge(vEdgeCut_h, vEdgeCut, vEdgeCut);
    
    // lock patches
    
    for (a =[0, 90, 180, 270]){ 
        rotate([0,0,a])
            translate([vLockPatch_offsetX, vLockPatch_offsetY, vLockPatch_offsetZ])
            cube([vLockPatch_l, vLockPatch_w, vLockPatch_h]); 
        };
    
    };
    
    // spring holder
    translate([vSpringHolder_offsetX, vSpringHolder_offsetY, vSpringHolder_offsetZ])
        cube([vSpringHolder_l, vSpringHolder_w, vSpringHolder_h]);
    
    
    
    
    
};    
 
