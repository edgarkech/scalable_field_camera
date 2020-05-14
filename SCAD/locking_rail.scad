// some variables
$fn = 60; // we are using 60 fragments for cylinders and similar objects

// some modules such as hex, countersunk screws, roof, wedge are available in a module file
use <modules.scad>;


// variables

vTolerance = 0.2;


vLockingRailBaseRadius_r = 5;
vLockingRailBaseRadius_offsetX1 = vLockingRailBaseRadius_r;
vLockingRailBaseRadius_offsetX2 = vLockingRailBaseRadius_r+10;
vLockingRailBaseRadius_offsetY= vLockingRailBaseRadius_r;
vLockingRailBaseRadius_offsetZ = 0;

vLockingRailBaseBlock_l = 2*vLockingRailBaseRadius_r;
vLockingRailBaseBlock_w = 2*vLockingRailBaseRadius_r;
vLockingRailBaseBlock_h = 4;
vLockingRailBaseBlock_offsetX = vLockingRailBaseRadius_r;
vLockingRailBaseBlock_offsetY = 0;
vLockingRailBaseBlock_offsetZ = 0;

vLockingRailExtension_l = 12;
vLockingRailExtension_w = vLockingRailBaseRadius_r+8;
vLockingRailExtension_h = vLockingRailBaseBlock_h;
vLockingRailExtension_offsetX = 0;
vLockingRailExtension_offsetY = vLockingRailBaseRadius_r;
vLockingRailExtension_offsetZ = 0;

vLockingRailRampCutoff_l = 5;
vLockingRailRampCutoff_w = vLockingRailExtension_l;
vLockingRailRampCutoff_h = 2;
vLockingRailRampCutoff_offsetX = 0;
vLockingRailRampCutoff_offsetY = vLockingRailExtension_w+vLockingRailExtension_offsetY;
vLockingRailRampCutoff_offsetZ = 0;

vScrewHole_d = 3+vTolerance;
vScrewHole_h = vLockingRailBaseBlock_h;

/*
translate([vLockingRailRampCutoff_offsetX, vLockingRailRampCutoff_offsetY, vLockingRailRampCutoff_offsetZ])
wedge(vLockingRailRampCutoff_w, -vLockingRailRampCutoff_l, vLockingRailRampCutoff_h);
*/



difference(){
    union(){
    translate([vLockingRailBaseRadius_offsetX1, vLockingRailBaseRadius_offsetY, vLockingRailBaseRadius_offsetZ])
        cylinder(r = vLockingRailBaseRadius_r, h= vLockingRailBaseBlock_h);
    translate([vLockingRailBaseRadius_offsetX2, vLockingRailBaseRadius_offsetY, vLockingRailBaseRadius_offsetZ])
        cylinder(r = vLockingRailBaseRadius_r, h= vLockingRailBaseBlock_h);
    // base block
    translate([vLockingRailBaseBlock_offsetX, vLockingRailBaseBlock_offsetY, vLockingRailBaseBlock_offsetZ])
        cube([vLockingRailBaseBlock_l, vLockingRailBaseBlock_w, vLockingRailBaseBlock_h]);
    // extension block
    translate([vLockingRailExtension_offsetX, vLockingRailExtension_offsetY, vLockingRailExtension_offsetZ])
        cube([vLockingRailExtension_l, vLockingRailExtension_w, vLockingRailExtension_h]);
    };
    
    // cut off ramp
    translate([vLockingRailRampCutoff_offsetX, vLockingRailRampCutoff_offsetY, vLockingRailRampCutoff_offsetZ])
        wedge(vLockingRailRampCutoff_w, -vLockingRailRampCutoff_l, vLockingRailRampCutoff_h);
    
    // screw holes
    translate([vLockingRailBaseRadius_offsetX1, vLockingRailBaseRadius_offsetY, vLockingRailBaseRadius_offsetZ])
        cylinder(d=vScrewHole_d, h=vScrewHole_h);
    translate([vLockingRailBaseRadius_offsetX2, vLockingRailBaseRadius_offsetY, vLockingRailBaseRadius_offsetZ])
        cylinder(d=vScrewHole_d, h=vScrewHole_h);

};
