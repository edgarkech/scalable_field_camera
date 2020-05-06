// loading the base configuration
include <baseconfig.scad>;

// some modules such as hex, countersunk screws, roof, wedge are available in a module file
use <modules.scad>;


vTotalPlate_length = vStabilizerBase_l;
vTotalPlate_height = 12;

vDovetail_length = vTotalPlate_length;
vDovetailOuter_width = vStabilizerDovetailBase_w-vDoveTail_tolerance;
vDovetailInner_width = vDovetailOuter_width-(2*vDoveTail_w);
vDovetail_height = vDoveTail_h;
vDovetail_offsetX = 0;
vDovetail_offsetY = -vDovetailOuter_width/2;
vDovetail_offsetZ = 0;

vDovetailEdgeCutoff = 3;

vArca_length = vTotalPlate_length-20;
vArca_width = 38;
vArca_height = 7;
vArcaBase_cutout = 4;
vArcaBase_height = 1.5;
vArca_offsetX = 0;
vArca_offsetY = -vArca_width/2;
vArca_offsetZ = vDovetail_height+vArca_height;

vArcaEdgeCutoff = 3;


vLockingCylinder_d1 = 20;
vLockingCylinder_d2 = 10;
vLockingCylinder_h = 7;
vLockingCylinder_offsetX = vTotalPlate_length-10;
vLockingCylinder_offsetY = 0;
vLockingCylinder_offsetZ = 0;

// we are using a M5x6x7 thread nut!
vLockingThreadHole_d = 7;
vLockingThreadHole_h = 6;
vLockingThreadHole_offsetX = vLockingCylinder_offsetX;
vLockingThreadHole_offsetY = vLockingCylinder_offsetY;
vLockingThreadHole_offsetZ = vLockingCylinder_offsetZ;

vLockingHole_d = 5.2;
vLockingHole_h = vTotalPlate_height;
vLockingHole_offsetX = vLockingCylinder_offsetX;
vLockingHole_offsetY = vLockingCylinder_offsetY;
vLockingHole_offsetZ = vLockingCylinder_offsetZ;


difference(){
    union(){
        // Dovetail plate
        translate([vDovetail_offsetX, vDovetail_offsetY, vDovetail_offsetZ])
            difference(){
                intersection(){
                    roof(vDovetail_length, vDovetailOuter_width, vDovetailOuter_width/2);
                    cube([vDovetail_length, vDovetailOuter_width, vDovetail_height]);
                };
                // cut off dovetail edges
                translate([0, 0, 0])
                    rotate([0, 270, 0])
                        wedge(vDovetail_height, vDovetailEdgeCutoff, -vDovetailEdgeCutoff);
                translate([vDovetail_length, 0, 0])
                    rotate([0, 270, 0])
                        wedge(vDovetail_height, vDovetailEdgeCutoff, vDovetailEdgeCutoff);
                translate([0, vDovetailOuter_width, 0])
                    rotate([0, 270, 0])
                        wedge(vDovetail_height, -vDovetailEdgeCutoff, -vDovetailEdgeCutoff);
                translate([vDovetail_length, vDovetailOuter_width, 0])
                    rotate([0, 270, 0])
                        wedge(vDovetail_height, -vDovetailEdgeCutoff, vDovetailEdgeCutoff);
                
            };
        
        // Arca plate    
        translate([vArca_offsetX, vArca_offsetY, vArca_offsetZ])
            mirror([0,0,1])
                difference(){
                    union(){
                        cube([vArca_length, vArca_width, vArcaBase_height ]);
                        translate([0, 0, vArcaBase_height])
                            roof(vArca_length, vArca_width, vArca_width/2);
                        translate([0,0,vArcaBase_height+vArcaBase_cutout])
                            cube([vArca_length, vArca_width, vArca_width]);
                    };
                    translate([0,0,vArca_height])
                        cube([vArca_length, vArca_width, vArca_width]);
                    
                    // cut off edges
                    translate([0, 0, 0])
                        rotate([0, 270, 0])
                            wedge( vArca_height, vArcaEdgeCutoff, -vArcaEdgeCutoff);
                    
                    translate([vArca_length, 0, 0])
                        rotate([0, 270, 0])
                         wedge(vArca_height, vArcaEdgeCutoff, vArcaEdgeCutoff);
                    
                    translate([0, vArca_width, 0])
                        rotate([0, 270, 0])
                            wedge(vArca_height, -vArcaEdgeCutoff, -vArcaEdgeCutoff);
                    
                    translate([vArca_length, vArca_width, 0])
                        rotate([0, 270, 0])
                            wedge(vArca_height, -vArcaEdgeCutoff, vArcaEdgeCutoff);
                    
                };
        
        // Cylinder for locking mechanism
        translate([vLockingCylinder_offsetX, vLockingCylinder_offsetY, vLockingCylinder_offsetZ])
            cylinder(d1=vLockingCylinder_d1, d2=vLockingCylinder_d2, h=vLockingCylinder_h);
                
    };
    // Hole for thread nut
        translate([vLockingThreadHole_offsetX, vLockingThreadHole_offsetY, vLockingThreadHole_offsetZ])
            cylinder(d=vLockingThreadHole_d, h=vLockingThreadHole_h);
    
    // ScrewHole
        translate([vLockingHole_offsetX, vLockingHole_offsetY, vLockingHole_offsetZ])
            cylinder(d=vLockingHole_d, h=vLockingHole_h);
    
};