// loading the base configuration
include <baseconfig.scad>;

// some modules such as hex, countersunk screws, roof, wedge are available in a module file
use <modules.scad>;




vBoltPlate_length = 20-(2*vTolerance);
vBoltPlate_width = vLeverPlateBase_w; // caution: this is just the width without the radius!
vBoltPlate_height = 1.5;
vBoltPlate_offsetX = -vBoltPlate_length/2;
vBoltPlate_offsetY = -vBoltPlate_width/2;
vBoltPlate_offsetZ = 0;

vBolt_diameter = 8-vTolerance;
vBolt_height = vBoltPlate_height+5;
vBolt_offsetX = 0;
vBolt_offsetY = vBoltPlate_offsetY;
vBolt_offsetZ = 0;

vCentralBlock_length = vLeverPlateBlock_l;
vCentralBlock_width = vLeverPlateBlock_w;
vCentralBlock_height = vBoltPlate_height+4+vTolerance;
vCentralBlock_offsetX = vLeverPlateBlock_l-vSliderBase_l; // this should result in a negative offset
vCentralBlock_offsetY = -vCentralBlock_width/2;
vCentralBlock_offsetZ = 0;

vSpringHole_d = 1.5;
vSpringHole_h = vCentralBlock_width;
vSpringHole_offsetX = vCentralBlock_offsetX+2.5;
vSpringHole_offsetY = vCentralBlock_width/2;
//vSpringHole_offsetZ = vCentralBlock_height-vSpringHole_d;
vSpringHole_offsetZ = 3.5;

vCentralHole_d = 12;
vCentralHole_h = vBoltPlate_height;
vCentralHole_offsetX = 10;
vCentralHole_offsetY = 0;
vCentralHole_offsetZ = 0;

vCentralScrewHexNut_keywidth = 8+vTolerance;
vCentralScrewHexNut_height = 6;
vCentralScrewHexNut_offsetX = 10;
vCentralScrewHexNut_offsetY = 0;
vCentralScrewHexNut_offsetZ = 0;

vLeverBoltScrewHole_d1 = 4;
vLeverBoltScrewHole_d2 = 2;
vLeverBoltScrewHole_h = vBolt_height;
vLeverBoltScrewHole_f = vLeverBoltScrewHole_d1/2;
vLeverBoltScrewHole_offsetX = 0;
vLeverBoltScrewHole_offsetY = vBolt_offsetY;
vLeverBoltScrewHole_offsetZ = 0;

// lever plate screw holes
vLeverPlateScrewHole_d1 = 4;
vLeverPlateScrewHole_d2 = 2;
vLeverPlateScrewHole_f = vLeverPlateScrewHole_d1/2;
vLeverPlateScrewHole_h = vBolt_height;
vLeverPlateScrewHole_offsetX1 = -vDoveTail_w;
vLeverPlateScrewHole_offsetX2 = 3*vDoveTail_w;
vLeverPlateScrewHole_offsetY = (vLeverPlateBlock_w/2)-vDoveTail_w;
vLeverPlateScrewHole_offsetZ = 0;


difference(){
    union(){
        // front slider base
        translate([vBoltPlate_offsetX, vBoltPlate_offsetY, vBoltPlate_offsetZ])
            cube([vBoltPlate_length, vBoltPlate_width, vBoltPlate_height]);
        
        // rounded sides
        translate([vBolt_offsetX, vBolt_offsetY, vBolt_offsetZ])
            cylinder(h=vBoltPlate_height, d=vBoltPlate_length);
        
        translate([vBolt_offsetX, -vBolt_offsetY, vBolt_offsetZ])
            cylinder(h=vBoltPlate_height, d=vBoltPlate_length);
         
        // bolts
        translate([vBolt_offsetX, vBolt_offsetY, vBolt_offsetZ])
            cylinder(h=vBolt_height, d=vBolt_diameter);
        
        translate([vBolt_offsetX, -vBolt_offsetY, vBolt_offsetZ])
            cylinder(h=vBolt_height, d=vBolt_diameter);
        
        // central plate
        translate([vCentralBlock_offsetX, vCentralBlock_offsetY, vCentralBlock_offsetZ])
            cube([vCentralBlock_length, vCentralBlock_width, vCentralBlock_height]);
        

    };
    translate([vCentralScrewHexNut_offsetX, vCentralScrewHexNut_offsetY, vCentralScrewHexNut_offsetZ])
        hex(vCentralScrewHexNut_keywidth, vCentralScrewHexNut_height);
    
    // spring hole in central block
    translate([vSpringHole_offsetX, vSpringHole_offsetY, vSpringHole_offsetZ])
        rotate([90, 0, 0])
            cylinder(d=vSpringHole_d, h=vSpringHole_h );
    
    // lever plate screw holes
    translate([vLeverPlateScrewHole_offsetX1, -vLeverPlateScrewHole_offsetY, vLeverPlateScrewHole_offsetZ])
        cylinder(d=vLeverPlateScrewHole_d2, h=vLeverPlateScrewHole_h);
    translate([vLeverPlateScrewHole_offsetX1, +vLeverPlateScrewHole_offsetY, vLeverPlateScrewHole_offsetZ])
        cylinder(d=vLeverPlateScrewHole_d2, h=vLeverPlateScrewHole_h);
    translate([vLeverPlateScrewHole_offsetX2, -vLeverPlateScrewHole_offsetY, vLeverPlateScrewHole_offsetZ])
        cylinder(d=vLeverPlateScrewHole_d2, h=vLeverPlateScrewHole_h);
    translate([vLeverPlateScrewHole_offsetX2, +vLeverPlateScrewHole_offsetY, vLeverPlateScrewHole_offsetZ])
        cylinder(d=vLeverPlateScrewHole_d2, h=vLeverPlateScrewHole_h);
    
    // lever bolt screw holes
    translate([vLeverBoltScrewHole_offsetX, -vLeverBoltScrewHole_offsetY, vLeverBoltScrewHole_offsetZ])
        cylinder(d=vLeverBoltScrewHole_d2, h=vLeverBoltScrewHole_h);
    translate([vLeverBoltScrewHole_offsetX, +vLeverBoltScrewHole_offsetY, vLeverBoltScrewHole_offsetZ])
        cylinder(d=vLeverBoltScrewHole_d2, h=vLeverBoltScrewHole_h);
        
        
        
    // bevels for all screw holes
    // lever plate screw holes
    translate([vLeverPlateScrewHole_offsetX1, -vLeverPlateScrewHole_offsetY, vLeverPlateScrewHole_offsetZ])
        cylinder(d1=vLeverPlateScrewHole_d1, d2=vLeverPlateScrewHole_d2, h=vLeverPlateScrewHole_f);
    translate([vLeverPlateScrewHole_offsetX1, +vLeverPlateScrewHole_offsetY, vLeverPlateScrewHole_offsetZ])
        cylinder(d1=vLeverPlateScrewHole_d1, d2=vLeverPlateScrewHole_d2, h=vLeverPlateScrewHole_f);
    translate([vLeverPlateScrewHole_offsetX2, -vLeverPlateScrewHole_offsetY, vLeverPlateScrewHole_offsetZ])
        cylinder(d1=vLeverPlateScrewHole_d1, d2=vLeverPlateScrewHole_d2, h=vLeverPlateScrewHole_f);
    translate([vLeverPlateScrewHole_offsetX2, +vLeverPlateScrewHole_offsetY, vLeverPlateScrewHole_offsetZ])
        cylinder(d1=vLeverPlateScrewHole_d1, d2=vLeverPlateScrewHole_d2, h=vLeverPlateScrewHole_f);
    
    // lever bolt screw holes
    translate([vLeverBoltScrewHole_offsetX, -vLeverBoltScrewHole_offsetY, vLeverBoltScrewHole_offsetZ])
        cylinder(d1=vLeverBoltScrewHole_d1, d2=vLeverBoltScrewHole_d2, h=vLeverBoltScrewHole_f);
    translate([vLeverBoltScrewHole_offsetX, +vLeverBoltScrewHole_offsetY, vLeverBoltScrewHole_offsetZ])
        cylinder(d1=vLeverBoltScrewHole_d1, d2=vLeverBoltScrewHole_d2, h=vLeverBoltScrewHole_f);

    
};