// loading the base configuration
include <baseconfig.scad>;

// some modules such as hex, countersunk screws, roof, wedge are available in a module file
use <modules.scad>;


vStabilizer_offsetX = -vStabilizerBase_l/2;
vStabilizer_offsetY = -vStabilizerBase_w/2;
vStabilizer_offsetZ = 0;

// Screwholes for the stabilizing lid
vLidHole_d = vScrew1Hole_d;
vLidHole_h = vStabilizerTotal_h+1;

vLidHoleRow_length = (vLidHoleCount_x-1)*vLidHoleDist_x;
vLidHoleRow_offsetX = -vLidHoleRow_length/2;
vLidHoleRow_offsetY = vLidHoleDist_y/2;
vLidHoleRow_offsetZ = vStabilizerTotal_h; 

vDovetail_length = vStabilizerBase_l;
vDovetailOuter_width = vStabilizerDovetailBase_w+vDoveTail_tolerance;
vDovetailInner_width = vDovetailOuter_width-(2*vDoveTail_w);
vDovetail_offsetX = vStabilizer_offsetX;
vDovetail_offsetY = -vDovetailOuter_width/2;
vDovetail_offsetZ = vStabilizerBase_h;

vLockingHole_d = 5;
vLockingHole_h = vStabilizerTotal_h;
vLockingHole_offsetX = vStabilizer_offsetX+10;
vLockingHole_offsetY = 0;
vLockingHole_offsetZ = 0;


difference(){
    intersection(){
        translate([vStabilizer_offsetX, vStabilizer_offsetY, vStabilizer_offsetZ])
            cube([vStabilizerBase_l, vStabilizerBase_w, vStabilizerTotal_h]);
        translate([vStabilizer_offsetX, vStabilizer_offsetY, vStabilizer_offsetZ])
            roof(vStabilizerBase_l, vStabilizerBase_w, vStabilizerBase_w/2 );
    };
    
    // a little bit of height tolerance for the dove tail
    translate([vDovetail_offsetX, vDovetail_offsetY, vDovetail_offsetZ])
        cube([vDovetail_length, vDovetailOuter_width, vDoveTail_tolerance]);
    
    // the dovetail itself
    translate([vDovetail_offsetX, vDovetail_offsetY, vDovetail_offsetZ+vDoveTail_tolerance])
        roof(vDovetail_length, vDovetailOuter_width, vDovetailOuter_width/2);
    
    // Holes for screwing the stabilizer lid
    translate([vLidHoleRow_offsetX, vLidHoleRow_offsetY, vLidHoleRow_offsetZ])
        mirror([0,0,1])
        for (i = [0:vLidHoleCount_x-1]){ 
            translate([i*vLidHoleDist_x, 0, 0])
            countersunk_screw(vLidHole_d, vLidHole_h);
        };
    
    translate([vLidHoleRow_offsetX, -vLidHoleRow_offsetY, vLidHoleRow_offsetZ])
        mirror([0,0,1])
        for (i = [0:vLidHoleCount_x-1]){ 
            translate([i*vLidHoleDist_x, 0, 0])
            countersunk_screw(vLidHole_d, vLidHole_h);
        };
    
    // Hole for Locking Screw
    translate([vLockingHole_offsetX, vLockingHole_offsetY, vLockingHole_offsetZ])
        cylinder(d=vLockingHole_d, h=vLockingHole_h);

};



/*
    // Holes for screwing the stabilizer lid
    
    translate([vLidHoleRow_offsetX, vLidHoleRow_offsetY, vLidHoleRow_offsetZ])
    for (i = [0:vLidHoleCount_x-1]){ 
        translate([i*vLidHoleDist_x, 0, 0])
        cylinder(d=vLidHole_d, h=vLidHole_h);
    };
    
    translate([vLidHoleRow_offsetX, -vLidHoleRow_offsetY, vLidHoleRow_offsetZ])
    for (i = [0:vLidHoleCount_x-1]){ 
        translate([i*vLidHoleDist_x, 0, 0])
        cylinder(d=vLidHole_d, h=vLidHole_h);
    };
    
*/