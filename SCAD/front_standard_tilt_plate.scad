// loading the base configuration
include <baseconfig.scad>;

// some modules such as hex, countersunk screws, roof, wedge are available in a module file
use <modules.scad>;

// vTiltHeight = 45; // defined in config file

vTiltPlate_l = vTiltHeight + vTiltRadius;
vTiltPlate_w = 25;
vTiltPlate_h = 5;
vTiltPlate_offsetX = 0;
vTiltPlate_offsetY = -vTiltPlate_w/2;
vTiltPlate_offsetZ = 0;

// vTiltDovetailBaseBlock_d = 50; // defined in config file
vTiltDovetailBaseBlock_l = vTiltDovetailBaseBlock_d;
vTiltDovetailBaseBlock_w = vTiltPlate_w;
vTiltDovetailBaseBlock_h = vDoveTail_h;
vTiltDovetailBaseBlock_offsetX = vTiltHeight;
vTiltDovetailBaseBlock_offsetY = 0;
vTiltDovetailBaseBlock_offsetZ = vTiltPlate_h;

// vTiltDovetailCutout_d1 = 40+vTolerance; // defined in config file
// vTiltDovetailCutout_d2 = vTiltDovetailCutout_d1-(2*vDoveTail_w); // defined in config file
vTiltDovetailCutout_h = vDoveTail_h;
vTiltDovetailCutout_offsetX = vTiltHeight;
vTiltDovetailCutout_offsetY = 0;
vTiltDovetailCutout_offsetZ = vTiltPlate_h;

vRail_l = vTiltHeight+5;
vRail_w = 8-vTolerance;
vRail_h = 5-vTolerance;
vRail_offsetX = 0;
vRail_offsetY = -vRail_w/2;
vRail_offsetZ = -vRail_h;

//vTiltAxis_d = 10-vTolerance; // defined in config file
vTiltAxis_h = vTiltDovetailBaseBlock_h;
vTiltAxis_offsetX = vTiltHeight;
vTiltAxis_offsetY = 0;
vTiltAxis_offsetZ = vTiltPlate_h;

// we are using M5 nuts to press into a hole with d=7, h=6
vNutHole_d = 7;
vNutHole_h = vTiltPlate_h+vTiltDovetailBaseBlock_h+2; 
vNutHole_offsetX = vTiltHeight;
vNutHole_offsetY = 0;
vNutHole_offsetZ = vRail_h+vTiltPlate_h-vNutHole_h;

vScrewHole_d = 5+vTolerance;
vScrewHole_h = vRail_h+vTiltPlate_h+vTiltDovetailBaseBlock_h;
vScrewHole_offsetX = vNutHole_offsetX;
vScrewHole_offsetY = vNutHole_offsetY;
vScrewHole_offsetZ = vRail_offsetZ;

vTiltSlotPlate_d = 10;
vTiltSlot_d = 5+(2*vTolerance);
vTiltSlot_h = vTiltPlate_h;
vTiltSlot_offsetX = vTiltHeight+vTiltRadius;
vTiltSlot_offsetY = 0;
vTiltSlot_offsetZ = 0;
//vTiltAngleMinus = -6; // defined in config file
//vTiltAnglePlus = 6; // defined in config file

vEdgeCut = (vTiltPlate_w-vRail_w)/2;
vEdgeCut_h = vTiltPlate_h;
vEdgeCut_offsetX = 0;
vEdgeCut_offsetY = -vTiltPlate_w/2;
vEdgeCut_offsetZ = 0;

difference(){
    union(){
        difference(){
            union(){
                // base plate
                translate([vTiltPlate_offsetX, vTiltPlate_offsetY, vTiltPlate_offsetZ])
                    cube([vTiltPlate_l, vTiltPlate_w, vTiltPlate_h]);
                             
                // rail    
                translate([vRail_offsetX, vRail_offsetY, vRail_offsetZ])
                    cube([vRail_l, vRail_w, vRail_h]);    

                // dovetail block    
                translate([vTiltDovetailBaseBlock_offsetX, vTiltDovetailBaseBlock_offsetY, vTiltDovetailBaseBlock_offsetZ])
                intersection(){
                    translate([0, 0, 0])
                    cylinder(d=vTiltDovetailBaseBlock_d, h=vTiltDovetailBaseBlock_h);
                    translate([-vTiltDovetailBaseBlock_l/2, -vTiltDovetailBaseBlock_w/2, 0])
                        cube([vTiltDovetailBaseBlock_l, vTiltDovetailBaseBlock_w, vTiltDovetailBaseBlock_h]);
                    };
                };
            // tolerance cutout
            translate([vTiltDovetailCutout_offsetX, vTiltDovetailCutout_offsetY, vTiltDovetailCutout_offsetZ])
                cylinder(d=vTiltDovetailCutout_d1, h=vTolerance);
            // dovetail cutout
            translate([vTiltDovetailCutout_offsetX, vTiltDovetailCutout_offsetY, vTiltDovetailCutout_offsetZ+vTolerance])
                cylinder(d1=vTiltDovetailCutout_d1, d2=vTiltDovetailCutout_d2, h=vTiltDovetailCutout_h);
                
            
                
            };
                
        // tilt axis bolt
        translate([vTiltAxis_offsetX, vTiltAxis_offsetY, vTiltAxis_offsetZ])
            cylinder(d=vTiltAxis_d, h=vTiltAxis_h); 
        
        // tilt slot plate
        for (a =[vTiltAngleMinus:0.5:vTiltAnglePlus]){
            rotate([0, 0, a])
                translate([vTiltSlot_offsetX, vTiltSlot_offsetY, vTiltSlot_offsetZ])
                    cylinder(d=vTiltSlotPlate_d, h=vTiltSlot_h );
        };
           
    };
    
   
    
    // screw hole
    translate([vScrewHole_offsetX, vScrewHole_offsetY, vScrewHole_offsetZ])
        cylinder(d=vScrewHole_d, h=vScrewHole_h);
    
    // screw hole
    translate([vNutHole_offsetX, vNutHole_offsetY, vNutHole_offsetZ])
        cylinder(d=vNutHole_d, h=vNutHole_h);
    
    // cutting the lower edges
    translate([vEdgeCut_offsetX, -vEdgeCut_offsetY, vEdgeCut_offsetZ])
        rotate([0, 270, 0])
            wedge(vEdgeCut_h, -vEdgeCut, -vEdgeCut);
    translate([vEdgeCut_offsetX, vEdgeCut_offsetY, vEdgeCut_offsetZ])
        rotate([0, 270, 0])
            wedge(vEdgeCut_h, vEdgeCut, -vEdgeCut);
    
    // tilt slot
        for (a =[vTiltAngleMinus:0.5:vTiltAnglePlus]){
            rotate([0, 0, a])
                translate([vTiltSlot_offsetX, vTiltSlot_offsetY, vTiltSlot_offsetZ])
                    cylinder(d=vTiltSlot_d, h=vTiltSlot_h );
        };
    
};

