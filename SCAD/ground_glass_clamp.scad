// loading the base configuration
include <baseconfig.scad>;

// some modules such as hex, countersunk screws, roof, wedge are available in a module file
use <modules.scad>;


vGGClampPlate_l = 10;
vGGClampPlate_w = 40-(2*vTolerance);
vGGClampPlate_h = 3;
vGGClampPlate_offsetX = -vGGClampPlate_l/2;
vGGClampPlate_offsetY = -vGGClampPlate_w/2;
vGGClampPlate_offsetZ = 0;

vGGClampArm_l = 3;
vGGClampArm_w = 80;
vGGClampArm_h = 3;
vGGClampArm_offsetX = vGGClampPlate_l/2;
vGGClampArm_offsetY = -vGGClampArm_w/2;
vGGClampArm_offsetZ = 0;

vGGClampButton_d = vGGClampArm_h+1;
vGGClampButton_h = vGGClampArm_l;
vGGClampButton_offsetX = vGGClampPlate_l/2;
vGGClampButton_offsetY = -(vGGClampArm_w-vGGClampButton_d)/2;
vGGClampButton_offsetZ = vGGClampButton_d/2;

vScrewHole_d = 3;
vScrewHole_h = vGGClampPlate_h;
vScrewHole_offsetX = -vTolerance; 
vScrewHole_offsetY = -15;
vScrewHole_offsetZ = 0;


difference(){
    union(){
        // clamp plate
        translate([vGGClampPlate_offsetX, vGGClampPlate_offsetY, vGGClampPlate_offsetZ])
            cube([vGGClampPlate_l, vGGClampPlate_w, vGGClampPlate_h]);
        
        // clamp arms
        translate([vGGClampArm_offsetX, vGGClampArm_offsetY, vGGClampArm_offsetZ])
            cube([vGGClampArm_l, vGGClampArm_w, vGGClampArm_h]);
        
        // clamp buttons
        translate([vGGClampButton_offsetX, vGGClampButton_offsetY, vGGClampButton_offsetZ])
            rotate([0, 90, 0])
                cylinder(d=vGGClampButton_d, h=vGGClampButton_h);
        translate([vGGClampButton_offsetX, -vGGClampButton_offsetY, vGGClampButton_offsetZ])
            rotate([0, 90, 0])
                cylinder(d=vGGClampButton_d, h=vGGClampButton_h);
        };
    
    // screw holes
    translate([vScrewHole_offsetX, vScrewHole_offsetY, vScrewHole_offsetZ])
        cylinder(d=vScrewHole_d, h=vScrewHole_h );
    translate([vScrewHole_offsetX, -vScrewHole_offsetY, vScrewHole_offsetZ])
        cylinder(d=vScrewHole_d, h=vScrewHole_h );

};