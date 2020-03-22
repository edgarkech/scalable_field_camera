// some variables
$fn = 60; // we are using 60 fragments for cylinders and similar objects

// some modules such as hex, countersunk screws, roof, wedge are available in a module file
use <modules.scad>;


// variables

vClampBase_l = 15;
vClampBase_w = 70;
vClampBase_h = 3;
vClampBase_offsetX = 0;
vClampBase_offsetY = -vClampBase_w/2;
vClampBase_offsetZ = 0;

vClampCutout_l = 5;
vClampCutout_w = 30;
vClampCutout_h = vClampBase_h;
vClampCutout_offsetX = 10;
vClampCutout_offsetY = -vClampCutout_w/2;
vClampCutout_offsetZ = 0;

vScrewHole_d = 3;
vScrewHole_h = vClampBase_h;
vScrewHole_offsetX = 5;
vScrewHole_offsetY = 25;
vScrewHole_offsetZ = 0;

vEdgeCut = 5;
vEdgeCut_h = vClampBase_h;
vEdgeCut_offsetX1 = 0;
vEdgeCut_offsetX2 = vClampBase_l;
vEdgeCut_offsetY1 = vClampBase_w/2;
vEdgeCut_offsetY2 = vClampCutout_w/2;
vEdgeCut_offsetZ = 0;



difference(){
    // base plate
    translate([vClampBase_offsetX, vClampBase_offsetY, vClampBase_offsetZ])
        cube([vClampBase_l, vClampBase_w, vClampBase_h]);
    
    // cutout
    translate([vClampCutout_offsetX, vClampCutout_offsetY, vClampCutout_offsetZ])
        cube([vClampCutout_l, vClampCutout_w, vClampCutout_h]);
    
    // screw holes
    translate([vScrewHole_offsetX, vScrewHole_offsetY, vScrewHole_offsetZ])
        cylinder(d=vScrewHole_d, h=vScrewHole_h);
    translate([vScrewHole_offsetX, -vScrewHole_offsetY, vScrewHole_offsetZ])
        cylinder(d=vScrewHole_d, h=vScrewHole_h);
    
    // edge cut
    translate([vEdgeCut_offsetX1, vEdgeCut_offsetY1, vEdgeCut_offsetZ])
        rotate([0, 270, 0])
            wedge(vEdgeCut_h, -vEdgeCut, -vEdgeCut);
    
    translate([vEdgeCut_offsetX1, -vEdgeCut_offsetY1, vEdgeCut_offsetZ])
        rotate([0, 270, 0])
            wedge(vEdgeCut_h, vEdgeCut, -vEdgeCut);
    
    translate([vEdgeCut_offsetX2, vEdgeCut_offsetY1, vEdgeCut_offsetZ])
        rotate([0, 270, 0])
            wedge(vEdgeCut_h, -vEdgeCut, vEdgeCut);
    
    translate([vEdgeCut_offsetX2, -vEdgeCut_offsetY1, vEdgeCut_offsetZ])
        rotate([0, 270, 0])
            wedge(vEdgeCut_h, vEdgeCut, vEdgeCut);
            
    translate([vEdgeCut_offsetX2, -vEdgeCut_offsetY2, vEdgeCut_offsetZ])
        rotate([0, 270, 0])
            wedge(vEdgeCut_h, -vEdgeCut, vEdgeCut);
    
    translate([vEdgeCut_offsetX2, vEdgeCut_offsetY2, vEdgeCut_offsetZ])
        rotate([0, 270, 0])
            wedge(vEdgeCut_h, vEdgeCut, vEdgeCut);        
    
}
