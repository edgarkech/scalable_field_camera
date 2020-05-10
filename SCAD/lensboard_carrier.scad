// loading the base configuration
include <baseconfig.scad>;

// some modules such as hex, countersunk screws, roof, wedge are available in a module file
use <modules.scad>;


// some variables
// $fn = 120; // we are using 120 fragments for cylinders and similar objects

vFrontPlate_offsetX = -vFrontPlate_length/2;
vFrontPlate_offsetY = -vFrontPlate_width/2;
vFrontPlate_offsetZ = 0;

vTiltDovetail_offsetX = 0;
vTiltDovetail_offsetY = vFrontPlate_width/2;
vTiltDovetail_offsetZ = vFrontPlate_height/2;

vAxisHole_offsetX = 0;
vAxisHole_offsetY = vFrontPlate_width/2;
vAxisHole_offsetZ = vFrontPlate_height/2;

vTiltLockBolt_offsetX = -vFrontPlate_length/2;
vTiltLockBolt_offsetY = -(vFrontPlate_width+(2*vDoveTail_w))/2;
vTiltLockBolt_offsetZ = vFrontPlate_height/2;

vBellowsCutoutLower_length = vBellowsFrontFrameOuter_l+(2*vTolerance);
vBellowsCutoutLower_width = vBellowsCutoutLower_length;
vBellowsCutoutLower_height = vBellowsFrontFrameOuter_h;
vBellowsCutoutLower_d = sqrt(2*pow(vBellowsCutoutLower_length,2));
vBellowsCutoutUpper_length = vBellowsFrontFrameInner_l+(2*vTolerance);
vBellowsCutoutUpper_width = vBellowsCutoutUpper_length;
vBellowsCutoutUpper_d = sqrt(2*pow(vBellowsCutoutUpper_length,2));
vBellowsCutoutUpper_height = vBellowsFrontFrameInner_h;
vBellowsCutoutLower_offsetX = -vBellowsCutoutLower_length/2;
vBellowsCutoutLower_offsetY = -vBellowsCutoutLower_width/2;
vBellowsCutoutLower_offsetZ = 0;
// for the upper cutout we are using a cylinder, so we have to center it
vBellowsCutoutUpper_offsetX = 0;
vBellowsCutoutUpper_offsetY = 0;
vBellowsCutoutUpper_offsetZ = vBellowsCutoutLower_height;

vLensBoardCutout_length = vLensboard_l;
vLensBoardCutout_width = vLensboard_w;
vLensBoardCutout_height = vLensboard_h+vTolerance;
vLensBoardCutout_offsetX = -(vLensBoardCutout_width/2)-3;
vLensBoardCutout_offsetY = -vLensBoardCutout_width/2;
vLensBoardCutout_offsetZ = vFrontPlate_height-vLensBoardCutout_height;

vLensBoardHole_d = vLensboardHole_d;
vLensBoardHole_h = vFrontPlate_height;
vLensBoardCircle_d = vLensboardLighttrap_d;
vLensBoardCircle_h = vLensboardLighttrap_h;
vLensBoardCircle_offsetZ = vFrontPlate_height-vLensBoardCutout_height-vLensBoardCircle_h;

vBellowsScrewHole_d = 3;
vBellowsScrewHole_h = vFrontPlate_length;
vBellowsScrewSinking_d1 = 6;
vBellowsScrewSinking_h = vBellowsScrewSinking_d1/2;
vBellowsScrewHole_offsetX = -vFrontPlate_length/2;
vBellowsScrewHole_offsetY = vBellowsCutoutUpper_length/2;
vBellowsScrewHole_offsetZ = vBellowsCutoutLower_height/2;

vClampHole_d = 2;
vClampHole_h = 8;
vClampHole_offsetX1 = vLensBoardCutout_offsetX-5;
vClampHole_offsetX2 = vLensBoardCutout_offsetX+vLensboard_l+5;
vClampHole_offsetY = 25;
vClampHole_offsetZ = vFrontPlate_height-vClampHole_h;

vSwingScrewCutout_l = 5;
vSwingScrewCutout_w = 80;
vSwingScrewCutout_h = vFrontPlate_height;
vSwingScrewCutout_offsetX = vFrontPlate_length/2 - vSwingScrewCutout_l;
vSwingScrewCutout_offsetY = -vSwingScrewCutout_w/2;
vSwingScrewCutout_offsetZ = 0;

difference(){

union(){
    
    intersection(){
        // base cube
        translate([vFrontPlate_offsetX, vFrontPlate_offsetY, vFrontPlate_offsetZ])
            cube([vFrontPlate_length, vFrontPlate_width, vFrontPlate_height]);
        // rounding the edges
        cylinder(d=vEdgeCutCylinder, h=vFrontPlate_height);
    };
    
    
    translate([vTiltDovetail_offsetX, vTiltDovetail_offsetY, vTiltDovetail_offsetZ])
    rotate([-90, 0, 0])
    intersection(){
        union(){
            cylinder(d=vTiltDovetail_d1, h= vTolerance);
            translate([0, 0, vTolerance])
                cylinder(d1=vTiltDovetail_d1, d2=vTiltDovetail_d2, h=vTiltDovetail_h);
            };
        translate([-vTiltDovetail_d2/2, -vFrontPlate_height/2, 0])
            cube([vTiltDovetail_d2, vFrontPlate_height, vTiltDovetail_h+vTolerance]);
    };
    
    rotate([0, 0, 180])
        translate([vTiltDovetail_offsetX, vTiltDovetail_offsetY, vTiltDovetail_offsetZ])
        rotate([-90, 0, 0])
        intersection(){
            union(){
                cylinder(d=vTiltDovetail_d1, h= vTolerance);
                translate([0, 0, vTolerance])
                    cylinder(d1=vTiltDovetail_d1, d2=vTiltDovetail_d2, h=vTiltDovetail_h);
                };
            translate([-vTiltDovetail_d2/2, -vFrontPlate_height/2, 0])
                cube([vTiltDovetail_d2, vFrontPlate_height, vTiltDovetail_h+vTolerance]);
        };
    
    translate([vTiltLockBolt_offsetX, vTiltLockBolt_offsetY, vTiltLockBolt_offsetZ])
        rotate([-90, 0, 0])
            cylinder(d=vTiltLockBolt_d, h=vTiltLockBolt_h);
    translate([vTiltLockBolt_offsetX, -vTiltLockBolt_offsetY, vTiltLockBolt_offsetZ])
        rotate([90, 0, 0])
            cylinder(d=vTiltLockBolt_d, h=vTiltLockBolt_h);    
    
};



// lower bellows cutout (cube)
translate([vBellowsCutoutLower_offsetX, vBellowsCutoutLower_offsetY, vBellowsCutoutLower_offsetZ])
    cube([vBellowsCutoutLower_length, vBellowsCutoutLower_width, vBellowsCutoutLower_height]);    

// upper bellows cutout (cylinder with only 4 fragments)
translate([vBellowsCutoutUpper_offsetX, vBellowsCutoutUpper_offsetY, vBellowsCutoutUpper_offsetZ])
    rotate([0,0,45])
        cylinder(d1=vBellowsCutoutLower_d, d2=vBellowsCutoutUpper_d, h=vBellowsCutoutUpper_height, $fn=4);

// lensboard hole
cylinder(d=vLensBoardHole_d, h=vLensBoardHole_h);

// lensboard cutout
translate([vLensBoardCutout_offsetX, vLensBoardCutout_offsetY, vLensBoardCutout_offsetZ])
    cube([vLensBoardCutout_length, vLensBoardCutout_width, vLensBoardCutout_height]);        
// lensboard circular cutout
translate([0, 0, vLensBoardCircle_offsetZ])    
    cylinder(d=vLensBoardCircle_d, h=vLensBoardCircle_h);

// vertical screwholes
translate([vBellowsScrewHole_offsetX, -vBellowsScrewHole_offsetY, vBellowsScrewHole_offsetZ])
    rotate([0, 90, 0])
        cylinder(d=vBellowsScrewHole_d, h=vBellowsScrewHole_h);
translate([vBellowsScrewHole_offsetX, vBellowsScrewHole_offsetY, vBellowsScrewHole_offsetZ])
    rotate([0, 90, 0])
        cylinder(d=vBellowsScrewHole_d, h=vBellowsScrewHole_h);

// horizontal screwholes
translate([vBellowsScrewHole_offsetY, -vBellowsScrewHole_offsetX, vBellowsScrewHole_offsetZ])
    rotate([90, 0, 0])
        cylinder(d=vBellowsScrewHole_d, h=vBellowsScrewHole_h);
translate([-vBellowsScrewHole_offsetY, -vBellowsScrewHole_offsetX, vBellowsScrewHole_offsetZ])
    rotate([90, 0, 0])
        cylinder(d=vBellowsScrewHole_d, h=vBellowsScrewHole_h);

// sinkings for the bellows screws
// vertical
translate([vBellowsScrewHole_offsetX, vBellowsScrewHole_offsetY, vBellowsScrewHole_offsetZ])
    rotate([0, 90, 0])
        cylinder(d1=vBellowsScrewSinking_d1, h=vBellowsScrewSinking_h);
translate([vBellowsScrewHole_offsetX, -vBellowsScrewHole_offsetY, vBellowsScrewHole_offsetZ])
    rotate([0, 90, 0])
        cylinder(d1=vBellowsScrewSinking_d1, h=vBellowsScrewSinking_h);
translate([-vBellowsScrewHole_offsetX, vBellowsScrewHole_offsetY, vBellowsScrewHole_offsetZ])
    rotate([0, -90, 0])
        cylinder(d1=vBellowsScrewSinking_d1, h=vBellowsScrewSinking_h);
translate([-vBellowsScrewHole_offsetX, -vBellowsScrewHole_offsetY, vBellowsScrewHole_offsetZ])
    rotate([0, -90, 0])
        cylinder(d1=vBellowsScrewSinking_d1, h=vBellowsScrewSinking_h);

// horizontal
translate([vBellowsScrewHole_offsetY, -vBellowsScrewHole_offsetX, vBellowsScrewHole_offsetZ])
    rotate([90, 0, 0])
        cylinder(d1=vBellowsScrewSinking_d1, h=vBellowsScrewSinking_h);
translate([-vBellowsScrewHole_offsetY, -vBellowsScrewHole_offsetX, vBellowsScrewHole_offsetZ])
    rotate([90, 0, 0])
        cylinder(d1=vBellowsScrewSinking_d1, h=vBellowsScrewSinking_h);
translate([vBellowsScrewHole_offsetY, vBellowsScrewHole_offsetX, vBellowsScrewHole_offsetZ])
    rotate([-90, 0, 0])
        cylinder(d1=vBellowsScrewSinking_d1, h=vBellowsScrewSinking_h);
translate([-vBellowsScrewHole_offsetY, vBellowsScrewHole_offsetX, vBellowsScrewHole_offsetZ])
    rotate([-90, 0, 0])
        cylinder(d1=vBellowsScrewSinking_d1, h=vBellowsScrewSinking_h);

// axis holes
translate([vAxisHole_offsetX, vAxisHole_offsetY, vAxisHole_offsetZ])
    rotate([-90, 0, 0])
        cylinder(d=vAxisHole_d, h=vAxisHole_h);
        
translate([vAxisHole_offsetX, -vAxisHole_offsetY, vAxisHole_offsetZ])
    rotate([90, 0, 0])
        cylinder(d=vAxisHole_d, h=vAxisHole_h);

// tilt lock bolt holes
translate([vTiltLockBolt_offsetX, vTiltLockBolt_offsetY, vTiltLockBolt_offsetZ])
        rotate([-90, 0, 0])
            cylinder(d=vTiltLockBoltHole_d, h=vTiltLockBoltHole_h);
    translate([vTiltLockBolt_offsetX, -vTiltLockBolt_offsetY, vTiltLockBolt_offsetZ])
        rotate([90, 0, 0])
            cylinder(d=vTiltLockBoltHole_d, h=vTiltLockBoltHole_h);



// holes for clamp screws
translate([vClampHole_offsetX2, -vClampHole_offsetY, vClampHole_offsetZ])
    cylinder(d=vClampHole_d, h=vClampHole_h);
translate([vClampHole_offsetX2, vClampHole_offsetY, vClampHole_offsetZ])
    cylinder(d=vClampHole_d, h=vClampHole_h);
translate([vClampHole_offsetX1, -vClampHole_offsetY, vClampHole_offsetZ])
    cylinder(d=vClampHole_d, h=vClampHole_h);
translate([vClampHole_offsetX1, vClampHole_offsetY, vClampHole_offsetZ])
    cylinder(d=vClampHole_d, h=vClampHole_h);

// cutout for swing screw
translate([vSwingScrewCutout_offsetX, vSwingScrewCutout_offsetY, vSwingScrewCutout_offsetZ])
    cube([vSwingScrewCutout_l, vSwingScrewCutout_w, vSwingScrewCutout_h]);

};


// cylinder(d1=105, d2=85, h=4, $fn=4);