// loading the base configuration
include <baseconfig.scad>;

// some modules such as hex, countersunk screws, roof, wedge are available in a module file
use <modules.scad>;
    
// some measures in here are hard wired based on the experience with the first prototype. Normally there is no need to change them (except a measure is hinted with "adapt")


vRailTolerance = vTolerance;
    
vLowerRail_l = vBodyOuter_l-15; // we need 5mm space to move backwards for the lid lock
vLowerRailOuter_w = vLowerRail_w-vRailTolerance;
vLowerRailInner_w = vLowerRail_w-(2*vDoveTail_w)-vRailTolerance;
vLowerRail_h = vDoveTail_h;
vLowerRail_offsetX = 0;
vLowerRail_offsetY = -vLowerRailOuter_w/2;
vLowerRail_offsetZ = 0;

vUpperRail_l = vLowerRail_l-5;
vUpperRailOuter_w = vLowerRailOuter_w;
vUpperRail_h = vLowerRail_h;
vUpperRail_offsetX = 0;
vUpperRail_offsetY = -(vUpperRailOuter_w/2);
vUpperRail_offsetZ = 0;

vMidSection_h = 7; // 7 should fit for 4x5 and 5x7

vUpperBlock_l = vUpperRail_l;
vUpperBlock_w = vLowerRailInner_w;
vUpperBlock_h = vUpperRail_h + vMidSection_h;
vUpperBlock_offsetX = 0;
vUpperBlock_offsetY = -vUpperBlock_w/2;
vUpperBlock_offsetZ = vLowerRail_h;

vMidCutout_l = vUpperRail_l-30;
vMidCutout_w = vLowerRailOuter_w-30;
vMidCutout_h = vLowerRail_h+vUpperBlock_h;
vMidCutout_offsetX = 15;
vMidCutout_offsetY = -vMidCutout_w/2;
vMidCutout_offsetZ = 0;

vUpperCutout_l = vUpperRail_l-5;
vUpperCutout_w = vUpperRailOuter_w-(4*vDoveTail_w)+vRailTolerance;
vUpperCutout_h = vMidSection_h+1;
vUpperCutout_offsetX = 0;
vUpperCutout_offsetY = -vUpperCutout_w/2;
vUpperCutout_offsetZ = vMidCutout_h-vUpperCutout_h;

vFrontCutout_l = vUpperRail_l;
vFrontCutout_w = vUpperCutout_w-10;
vFrontCutout_h = vUpperCutout_h;
vFrontCutout_offsetX = 0;
vFrontCutout_offsetY = -vFrontCutout_w/2;
vFrontCutout_offsetZ = vUpperCutout_offsetZ;

vLensCutout_d = vUpperCutout_w; 
vLensCutout_h = vLowerRail_h+vUpperBlock_h;
vLensCutout_offsetX = (vLowerRail_l/2)-10; 
vLensCutout_offsetY = 0;
vLensCutout_offsetZ = 0;

// cutout for stop indents
vStopIndent_w = vUpperCutout_w + (2*vStopIndent_l);
vStopIndentCount = floor(vUpperRail_l/vStopIndentDistance);
vStopIndent_offsetY = -vStopIndent_w/2;
vStopIndent_offsetZ = vLowerRail_h+vMidSection_h+vUpperRail_h-vStopIndent_h;

vFocusingLever_w = (vBodyOuter_w/2)-10;
vFocusingLever_l = vFocusingLever_w;
vFocusingLever_h = vMidSection_h-1;
vFocusingLever_offsetX = 16; // manually set, probably no need to change things here
vFocusingLever_offsetY = 0;
vFocusingLever_offsetZ = vLowerRail_h + vFocusingLever_h + 0.5;

vFocusingThreadBlock_l = 12; // as long as we keep T5 or T6 rods, there's no need to change things here
vFocusingThreadBlock_w = 20-vTolerance;
vFocusingThreadBlock_h = 12;
vFocusingThreadBlock_offsetX = vFocusingLever_offsetX;
vFocusingThreadBlock_offsetY = -vFocusingLever_w;
vFocusingThreadBlock_offsetZ = 0;

vFocusingThreadHole_d = 10+vTolerance; // T6 = 10, T5 = 8
vFocusingThreadHole_h = vFocusingLever_l;
vFocusingThreadHole_offsetX = vFocusingLever_offsetX;
vFocusingThreadHole_offsetY = -vFocusingLever_w+7; // don't change this, unless you also check the corresponding value for front lid and focusing block
vFocusingThreadHole_offsetZ = 6;


vLidLock_d1 = vLidLockBase_d-vTolerance;
vLidLock_d2 = vLidLockBase_d-1; // we make cones, so it is easier to lock
vLidLock_h = 4;
vLidLock_offsetX = vUpperRail_l; // we need a locking lenght of about 4mm
vLidLock_offsetY = -vLidLockHole_distance/2; // double check if this fits to the upper rail width!
vLidLock_offsetZ = 5+vLidLockBase_d;

vEdgeCutoff = 3;
vEdgeCutoff_h = vLowerRail_h+vMidSection_h+vUpperRail_h;


difference(){
union(){
    // lower rail
    difference(){
        translate([vLowerRail_offsetX, vLowerRail_offsetY, vLowerRail_offsetZ])
            roof(vLowerRail_l, vLowerRailOuter_w, vLowerRailOuter_w/2);
        translate([vLowerRail_offsetX, vLowerRail_offsetY, vLowerRail_h])
            cube([vLowerRail_l, vLowerRailOuter_w, vLowerRailOuter_w/2]);    
    };

    // upper block
    translate([vUpperBlock_offsetX, vUpperBlock_offsetY, vUpperBlock_offsetZ])
            cube([vUpperBlock_l, vUpperBlock_w, vUpperBlock_h]);    
    
    // focusing lever
    translate([vFocusingLever_offsetX, vFocusingLever_offsetY, vFocusingLever_offsetZ])
        rotate([0, 90, 0])
            wedge(vFocusingLever_h, -vFocusingLever_w, vFocusingLever_l);
    
    
    // focusing lever thread block
    translate([vFocusingThreadBlock_offsetX, vFocusingThreadBlock_offsetY, vFocusingThreadBlock_offsetZ])
                cube([vFocusingThreadBlock_l, vFocusingThreadBlock_w, vFocusingThreadBlock_h]);
        
    // lid lock bolts
    translate([vLidLock_offsetX, vLidLock_offsetY, vLidLock_offsetZ])
        rotate([0, 90, 0])
            cylinder(d1=vLidLock_d1, d2=vLidLock_d2, h=vLidLock_h);
    translate([vLidLock_offsetX, -vLidLock_offsetY, vLidLock_offsetZ])
        rotate([0, 90, 0])
            cylinder(d1=vLidLock_d1, d2=vLidLock_d2, h=vLidLock_h);
    
    // lower rail
    translate([0,0,vLowerRail_h+vUpperBlock_h])
        mirror([0,0,1]){
            difference(){
                translate([vUpperRail_offsetX, vUpperRail_offsetY, vUpperRail_offsetZ])
                    roof(vUpperRail_l, vUpperRailOuter_w, vUpperRailOuter_w/2);
                translate([vUpperRail_offsetX, vUpperRail_offsetY, vUpperRail_h])
                    cube([vUpperRail_l, vUpperRailOuter_w, vUpperRailOuter_w/2]);    
            };
        };

    };
    
    // mid cutout
    translate([vMidCutout_offsetX, vMidCutout_offsetY, vMidCutout_offsetZ])
        cube([vMidCutout_l, vMidCutout_w, vMidCutout_h]); 
 
    // upper cutout
    translate([vUpperCutout_offsetX, vUpperCutout_offsetY, vUpperCutout_offsetZ])
        cube([vUpperCutout_l, vUpperCutout_w, vUpperCutout_h]);
   
    // front cutout
    translate([vFrontCutout_offsetX, vFrontCutout_offsetY, vFrontCutout_offsetZ])
        cube([vFrontCutout_l, vFrontCutout_w, vFrontCutout_h]);
    
    for (i = [0:5]){ 
    // lens cutout
    translate([vLensCutout_offsetX+(i*2), vLensCutout_offsetY, vLensCutout_offsetZ])
        cylinder(d=vLensCutout_d, h=vLensCutout_h);
    };
    
    // stop indents
    for (i=[0:vStopIndentCount]){
    translate([i*vStopIndentDistance+vStopIndent_offsetX, vStopIndent_offsetY, vStopIndent_offsetZ])
        cube([vStopIndent_l, vStopIndent_w, vStopIndent_h]);        
    };

    // focusing thread hole
    translate([vFocusingThreadHole_offsetX, vFocusingThreadHole_offsetY, vFocusingThreadHole_offsetZ])
        rotate([0, 90, 0])
            cylinder(d=vFocusingThreadHole_d, h=vFocusingThreadHole_h);
    
    // edge cutoff
    // back left
    translate([0, -vLowerRail_offsetY, 0])
        rotate([0, -90, 0])
            wedge(vEdgeCutoff_h, -vEdgeCutoff, -vEdgeCutoff);
    // lower front left
    translate([vLowerRail_l, -vLowerRail_offsetY, 0])
        rotate([0, -90, 0])
            wedge(vEdgeCutoff_h, -vEdgeCutoff, vEdgeCutoff);
    // upper front left
    translate([vUpperRail_l, -vLowerRail_offsetY, vLowerRail_h])
        rotate([0, -90, 0])
            wedge(vEdgeCutoff_h, -vEdgeCutoff, vEdgeCutoff);
    // back right
    translate([0, vLowerRail_offsetY, 0])
        rotate([0, -90, 0])
            wedge(vEdgeCutoff_h, vEdgeCutoff, -vEdgeCutoff);
    // lower front right
    translate([vLowerRail_l, vLowerRail_offsetY, 0])
        rotate([0, -90, 0])
            wedge(vEdgeCutoff_h, vEdgeCutoff, vEdgeCutoff);
    // upper front right
    translate([vUpperRail_l, vLowerRail_offsetY, vLowerRail_h])
        rotate([0, -90, 0])
            wedge(vEdgeCutoff_h, vEdgeCutoff, vEdgeCutoff);
    
};