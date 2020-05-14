// some variables
$fn = 60; // we are using 60 fragments for cylinders and similar objects

// some modules such as hex, countersunk screws, roof, wedge are available in a module file
use <modules.scad>;


// variables

vTolerance = 0.2;


vLockingLeverRadius_r = 5;


vLockingLeverRadius_offsetX = vLockingLeverRadius_r;
vLockingLeverRadius_offsetY = vLockingLeverRadius_r;
vLockingLeverRadius_offsetZ = 0;

vLockingLever_l = vLockingLeverRadius_r+12;
vLockingLever_w = 2*vLockingLeverRadius_r;
vLockingLever_h = 4;
vLockingLever_offsetX = vLockingLeverRadius_r;
vLockingLever_offsetY = 0;
vLockingLever_offsetZ = 0;

vLockingLeverExtension_l = 12;
vLockingLeverExtension_w = 8;
vLockingLeverExtension_h = vLockingLever_h;
vLockingLeverExtension_offsetX = 2*vLockingLeverRadius_r;
vLockingLeverExtension_offsetY = vLockingLeverRadius_r;
vLockingLeverExtension_offsetZ = 0;


vLockingLeverRampCutoff_l = -vLockingLeverExtension_w/2;
vLockingLeverRampCutoff_w = vLockingLeverExtension_l;
vLockingLeverRampCutoff_h = 1;
vLockingLeverRampCutoff_offsetX = vLockingLeverExtension_offsetX;
vLockingLeverRampCutoff_offsetY = vLockingLeverRadius_r+vLockingLeverExtension_w;
vLockingLeverRampCutoff_offsetZ = 0;

vScrewHole_d = 3+vTolerance;
vScrewHole_h = vLockingLever_h;

difference(){
union(){
    translate([vLockingLeverRadius_offsetX, vLockingLeverRadius_offsetY, vLockingLeverRadius_offsetZ])
        cylinder(r=vLockingLeverRadius_r, h=vLockingLever_h);
    translate([vLockingLever_offsetX, vLockingLever_offsetY, vLockingLever_offsetZ])
        cube([vLockingLever_l, vLockingLever_w, vLockingLever_h]);
    translate([vLockingLeverExtension_offsetX, vLockingLeverExtension_offsetY, vLockingLeverExtension_offsetZ])
        cube([vLockingLeverExtension_l, vLockingLeverExtension_w, vLockingLeverExtension_h]);
    };    
translate([vLockingLeverRadius_offsetX, vLockingLeverRadius_offsetY, vLockingLeverRadius_offsetZ])
        cylinder(d=vScrewHole_d, h=vScrewHole_h);
    translate([vLockingLeverRampCutoff_offsetX, vLockingLeverRampCutoff_offsetY, vLockingLeverRampCutoff_offsetZ])
        wedge(vLockingLeverRampCutoff_w, vLockingLeverRampCutoff_l, vLockingLeverRampCutoff_h);
};