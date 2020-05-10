// loading the base configuration
include <baseconfig.scad>;

// some modules such as hex, countersunk screws, roof, wedge are available in a module file
use <modules.scad>;

// we have some large rounded objects, so we smooth them a bit more with a higher number of fragments
$fn = 120; 

// base plate
vFrontStandartBasePlate_d1 = vSliderBase_w-vTolerance; // maybe subtract tolerance here?
vFrontStandartBasePlate_d2 = vFrontStandartBasePlate_d1-(2*vDoveTail_w);
vFrontStandartBasePlate_l = vSliderBase_l; // we are intersecting our cylinder with a cube!
vFrontStandartBasePlate_w = vFrontStandartBasePlate_d1;
vFrontStandartBasePlate_h1 = vDoveTail_h;
vFrontStandartBasePlate_h2 = vDoveTail_h;
vFrontStandartBasePlate_h = vFrontStandartBasePlate_h1+vFrontStandartBasePlate_h2;
vFrontStandartBasePlate_offsetX = 0;
vFrontStandartBasePlate_offsetY = 0;
vFrontStandartBasePlate_offsetZ = 0;

vLowerDovetail_l = vFrontStandartBasePlate_l;
vLowerDovetail_outerwidth = vFrontStandartBasePlate_w-(4*vDoveTail_w)+vTolerance;
vLowerDovetail_innerwidth = vLowerDovetail_outerwidth-(2*vDoveTail_w);
vLowerDovetail_offsetX = -vLowerDovetail_outerwidth/2;
vLowerDovetail_offsetY = -vLowerDovetail_l/2;
vLowerDovetail_offsetZ = vDoveTail_h;

vCentralScrewHole_d = 5+(2*vTolerance);
vCentralScrewHole_h = vFrontStandartBasePlate_h;
vCentralScrewHole_offsetX = 0;
vCentralScrewHole_offsetY = 0;
vCentralScrewHole_offsetZ = 0;

vCentralScrewHexNut_keywidth = 8+vTolerance;
vCentralScrewHexNut_height = 6;
vCentralScrewHexNut_offsetX = 0;
vCentralScrewHexNut_offsetY = 0;
vCentralScrewHexNut_offsetZ = vFrontStandartBasePlate_h-vCentralScrewHexNut_height;

vLeverBoltHole_d = 8+vTolerance;
vLeverBoltHole_h = vFrontStandartBasePlate_h;
vLeverBoltHole_offsetX = -(2*vDoveTail_w);
vLeverBoltHole_offsetY = (vUpperRail_w-(8*vDoveTail_w)) / 2;
vLeverBoltHole_offsetZ = vFrontStandartBasePlate_h1-1;

vLeverBoltScrewHole_d = 1.2;
vLeverBoltScrewHole_h = vFrontStandartBasePlate_h;
vLeverBoltScrewHole_offsetX = vLeverBoltHole_offsetX;
vLeverBoltScrewHole_offsetY = vLeverBoltHole_offsetY;
vLeverBoltScrewHole_offsetZ = 0;

// lever plate screw holes
vLeverPlateScrewHole_d = 1.2;
vLeverPlateScrewHole_h = vFrontStandartBasePlate_h;
vLeverPlateScrewHole_offsetX1 = -(3*vDoveTail_w);
vLeverPlateScrewHole_offsetX2 = vDoveTail_w;
vLeverPlateScrewHole_offsetY = (vLeverPlateBlock_w/2)-vDoveTail_w;
vLeverPlateScrewHole_offsetZ = 0;

vLeverCutout_l = 2*vDoveTail_w;
vLeverCutout_w = vUpperRail_w-(2*vDoveTail_w);
vLeverCutout_h = vFrontStandartBasePlate_h;
vLeverCutout_offsetX = (vFrontStandartBasePlate_l/2)-vLeverCutout_l;
vLeverCutout_offsetY = -vLeverCutout_w/2;
vLeverCutout_offsetZ = 0;

vLeverCutoutHoles_d = 2*vLeverCutout_l;
vLeverCutoutHoles_h = vLeverCutout_h;
vLeverCutoutHoles_offsetX = vLeverCutout_offsetX+(vLeverCutoutHoles_d/2);
vLeverCutoutHoles_offsetY = vLeverCutout_offsetY;
vLeverCutoutHoles_offsetZ = 0;



difference(){
union(){
    difference(){
        // front standart base plate
        intersection(){
            union(){
                cylinder(d1=vFrontStandartBasePlate_d1, d2=vFrontStandartBasePlate_d2, h=vFrontStandartBasePlate_h1);
                cylinder(d=vFrontStandartBasePlate_d2, h=vFrontStandartBasePlate_h);
            };
            translate([-vFrontStandartBasePlate_l/2, -vFrontStandartBasePlate_w/2, 0])
                cube([vFrontStandartBasePlate_l, vFrontStandartBasePlate_w, vFrontStandartBasePlate_h]);    
        };    

        
        // cutout for lower dovetail
        translate([0, 0, vFrontStandartBasePlate_h1])
        /*
        union(){
            translate([-vLowerDovetail_l/2, -vLowerDovetail_outerwidth/2, 0])
                cube([vLowerDovetail_l, vLowerDovetail_outerwidth, vTolerance]);
            translate([-vLowerDovetail_l/2, -vLowerDovetail_innerwidth/2, vTolerance])
                cube([vLowerDovetail_l, vLowerDovetail_innerwidth, vDoveTail_h]);
            translate([vLowerDovetail_l/2, -vLowerDovetail_outerwidth/2, vTolerance])
                rotate([0, 0, 90])
                    roof(2*vDoveTail_w, vLowerDovetail_l, vDoveTail_h);
            translate([-vLowerDovetail_l/2, vLowerDovetail_outerwidth/2, vTolerance])
                rotate([0, 0, 270])
                    roof(2*vDoveTail_w, vLowerDovetail_l, vDoveTail_h);
        };
        */
        union(){
            translate([-vLowerDovetail_l/2, -vLowerDovetail_outerwidth/2, 0])
                cube([vLowerDovetail_l, vLowerDovetail_outerwidth, vTolerance]);
            translate([-vLowerDovetail_l/2, -vLowerDovetail_outerwidth/2, vTolerance])
                roof(vLowerDovetail_l, vLowerDovetail_outerwidth, vLowerDovetail_outerwidth/2);
            
            }
        
        
        
    };
    
    };
    


    // central screw hole
    translate([vCentralScrewHole_offsetX, vCentralScrewHole_offsetY, vCentralScrewHole_offsetZ])
        cylinder(d=vCentralScrewHole_d, h=vCentralScrewHole_h);
    
    translate([vCentralScrewHexNut_offsetX, vCentralScrewHexNut_offsetY, vCentralScrewHexNut_offsetZ])
        hex(vCentralScrewHexNut_keywidth, vCentralScrewHexNut_height);
    
    // holes for lever bolts
    // outer
    translate([vLeverBoltHole_offsetX, -vLeverBoltHole_offsetY, vLeverBoltHole_offsetZ])
        cylinder(d=vLeverBoltHole_d, h=vLeverBoltHole_h);
    translate([vLeverBoltHole_offsetX, +vLeverBoltHole_offsetY, vLeverBoltHole_offsetZ])
        cylinder(d=vLeverBoltHole_d, h=vLeverBoltHole_h);
    
    // lever bolt screw holes
    translate([vLeverBoltScrewHole_offsetX, -vLeverBoltScrewHole_offsetY, vLeverBoltScrewHole_offsetZ])
        cylinder(d=vLeverBoltScrewHole_d, h=vLeverBoltScrewHole_h);
    translate([vLeverBoltScrewHole_offsetX, +vLeverBoltScrewHole_offsetY, vLeverBoltScrewHole_offsetZ])
        cylinder(d=vLeverBoltScrewHole_d, h=vLeverBoltScrewHole_h);
    
    // lever plate screw holes
    translate([vLeverPlateScrewHole_offsetX1, -vLeverPlateScrewHole_offsetY, vLeverPlateScrewHole_offsetZ])
        cylinder(d=vLeverPlateScrewHole_d, h=vLeverPlateScrewHole_h);
    translate([vLeverPlateScrewHole_offsetX1, +vLeverPlateScrewHole_offsetY, vLeverPlateScrewHole_offsetZ])
        cylinder(d=vLeverPlateScrewHole_d, h=vLeverPlateScrewHole_h);
    translate([vLeverPlateScrewHole_offsetX2, -vLeverPlateScrewHole_offsetY, vLeverPlateScrewHole_offsetZ])
        cylinder(d=vLeverPlateScrewHole_d, h=vLeverPlateScrewHole_h);
    translate([vLeverPlateScrewHole_offsetX2, +vLeverPlateScrewHole_offsetY, vLeverPlateScrewHole_offsetZ])
        cylinder(d=vLeverPlateScrewHole_d, h=vLeverPlateScrewHole_h);
    
     
    // cutout for locking levers
    translate([vLeverCutout_offsetX, vLeverCutout_offsetY, vLeverCutout_offsetZ])
        cube([vLeverCutout_l, vLeverCutout_w, vLeverCutout_h]);
    translate([vLeverCutoutHoles_offsetX, vLeverCutoutHoles_offsetY, vLeverCutoutHoles_offsetZ])    
        cylinder(d=vLeverCutoutHoles_d, h=vLeverCutoutHoles_d );
    translate([vLeverCutoutHoles_offsetX, -vLeverCutoutHoles_offsetY, vLeverCutoutHoles_offsetZ])    
        cylinder(d=vLeverCutoutHoles_d, h=vLeverCutoutHoles_d );
    
};