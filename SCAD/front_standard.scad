// loading the base configuration
include <baseconfig.scad>;

// some modules such as hex, countersunk screws, roof, wedge are available in a module file
use <modules.scad>;


// base plate
vFrontStandartBasePlate_d1 = vSliderBase_w; // maybe add tolerance here?
vFrontStandartBasePlate_d2 = vFrontStandartBasePlate_d1-(2*vDoveTail_w);
vFrontStandartBasePlate_length = vSliderBase_l; // we are intersecting our cylinder with a cube!
vFrontStandartBasePlate_width = vFrontStandartBasePlate_d1;
vFrontStandartBasePlate_h1 = vDoveTail_h;
vFrontStandartBasePlate_h2 = vDoveTail_h;
vFrontStandartBasePlate_height = vFrontStandartBasePlate_h1+vFrontStandartBasePlate_h1;
vFrontStandartBasePlate_offsetX = 0;
vFrontStandartBasePlate_offsetY = 0;
vFrontStandartBasePlate_offsetZ = 0;

vCentralScrewHole_d = 5+2*vTolerance;
vCentralScrewHole_h = vFrontStandartBasePlate_height;
vCentralScrewHole_offsetX = 0;
vCentralScrewHole_offsetY = 0;
vCentralScrewHole_offsetZ = 0;

vFrontStandartTiltPlate_length = vSliderBase_l-(3*vDoveTail_w);
vFrontStandartTiltPlate_width = vSliderBase_w+(4*vDoveTail_w);
vFrontStandartTiltPlate_height = 2*vDoveTail_h;

vFrontStandartTiltPlate_offsetX = -vFrontStandartTiltPlate_length/2;
vFrontStandartTiltPlate_offsetY = -vFrontStandartTiltPlate_width/2;
vFrontStandartTiltPlate_offsetZ = 0;

vTiltDoveTail_d1 = vFrontStandartBasePlate_d2+(2*vTolerance);
vTiltDoveTail_d2 = vTiltDoveTail_d1+(2*vDoveTail_w)+(2*vTolerance);
vTiltDovetail_h = vDoveTail_h;

vUprightHolder_length = vFrontStandartTiltPlate_length;
vUprightHolder_width = 15;
vUprightHolder_height = 10;
vUprightHolderLeft_offsetX = vFrontStandartTiltPlate_offsetX;
vUprightHolderLeft_offsetY = -vFrontStandartTiltPlate_offsetY;
vUprightHolderRight_offsetX = -vFrontStandartTiltPlate_offsetX;
vUprightHolderRight_offsetY = vFrontStandartTiltPlate_offsetY;
vUprightHolder_offsetZ = vFrontStandartTiltPlate_height;

vUpright_length = vFrontStandartTiltPlate_length;
vUpright_width = 5;
vUpright_height = vFrontStandard_h;
vUprightSlotCutout_length = 8+vTolerance;
vUprightSlotCutout_width = vFrontStandartTiltPlate_width+(2*vUpright_width);
vUprightSlotCutout_height = vFrontStandardSlot_h;
vUprightLeft_offsetX = vFrontStandartTiltPlate_offsetX;
vUprightRight_offsetX = vFrontStandartTiltPlate_offsetX;
vUprightLeft_offsetY = vFrontStandartTiltPlate_width/2;
vUprightRight_offsetY = -(vFrontStandartTiltPlate_width/2)-vUpright_width;
vUprightSlotCutout_offsetX = -vUprightSlotCutout_length/2;
vUprightSlotCutout_offsetY = -vUprightSlotCutout_width/2;
vUprightSlotCutout_offsetZ = 25;

vPullingLeverCutout_length = vDoveTail_w;
vPullingLeverCutout_width = vUpperRail_w;
vPullingLeverCutout_height = vFrontStandartBasePlate_height;
vPullingLeverCutout_offsetX = -vFrontStandartTiltPlate_offsetX-vPullingLeverCutout_length;
vPullingLeverCutout_offsetY = -vPullingLeverCutout_width/2;
vPullingLeverCutout_offsetZ = 0;

vEdgeCutoff_l = vFrontStandartTiltPlate_length;
vEdgeCutoff_w = 10;
vEdgeCutoff_h = 10; 
vEdgeCutoff_offsetX = vEdgeCutoff_l/2;
vEdgeCutoff_offsetY = -(vFrontStandartTiltPlate_width+10)/2;
vEdgeCutoff_offsetZ = 0;

difference(){
    union(){
        translate([vFrontStandartTiltPlate_offsetX, vFrontStandartTiltPlate_offsetY, vFrontStandartTiltPlate_offsetZ])
            cube([vFrontStandartTiltPlate_length, vFrontStandartTiltPlate_width, vFrontStandartTiltPlate_height]);
        // left upright holder
        translate([-vUprightHolderLeft_offsetX, vUprightHolderLeft_offsetY, vUprightHolder_offsetZ])
            rotate([0, 0, 180])
                wedge(vUprightHolder_length, vUprightHolder_width, vUprightHolder_height);

        // right upright holder
        translate([-vUprightHolderRight_offsetX, vUprightHolderRight_offsetY, vUprightHolder_offsetZ])
            rotate([0, 0, 0])
                wedge(vUprightHolder_length, vUprightHolder_width, vUprightHolder_height);
        // left upright 
        translate([vUprightLeft_offsetX, vUprightLeft_offsetY, 0])
            cube([vUpright_length, vUpright_width, vUpright_height]);
        
        // right upright
        translate([vUprightRight_offsetX, vUprightRight_offsetY, 0])
            cube([vUpright_length, vUpright_width, vUpright_height]);
        };
        
    // cutout for the dovetail itself
    cylinder(d1=vTiltDoveTail_d1, d2=vTiltDoveTail_d2, h=vTiltDovetail_h);
    // a little bit tolerance
    translate([0, 0, vTiltDovetail_h])
        cylinder(d=vTiltDoveTail_d2, h=vTolerance);

    // central screw hole
    cylinder(d=vCentralScrewHole_d, h=vFrontStandartTiltPlate_height);
    
    // cutout for upright slot
    translate([vUprightSlotCutout_offsetX, vUprightSlotCutout_offsetY, vUprightSlotCutout_offsetZ])
        cube([vUprightSlotCutout_length, vUprightSlotCutout_width, vUprightSlotCutout_height]);
       
    // cutout for pulling levers
    translate([vPullingLeverCutout_offsetX, vPullingLeverCutout_offsetY, vPullingLeverCutout_offsetZ])
        cube([vPullingLeverCutout_length, vPullingLeverCutout_width, vPullingLeverCutout_height]); 
    // rounding the cutout edges
    translate([-vFrontStandartTiltPlate_offsetX, vPullingLeverCutout_offsetY, vPullingLeverCutout_offsetZ])
        cylinder(r=vPullingLeverCutout_length, h=vPullingLeverCutout_height);   
    translate([-vFrontStandartTiltPlate_offsetX, -vPullingLeverCutout_offsetY, vPullingLeverCutout_offsetZ])
        cylinder(r=vPullingLeverCutout_length, h=vPullingLeverCutout_height); 
    
    // cut the lower edges
    translate([-vEdgeCutoff_offsetX, vEdgeCutoff_offsetY, vEdgeCutoff_offsetZ])
        rotate([0, 0, 0])
            wedge(vEdgeCutoff_l, vEdgeCutoff_h, vEdgeCutoff_w);
    translate([-vEdgeCutoff_offsetX, -vEdgeCutoff_offsetY, vEdgeCutoff_offsetZ])
        rotate([0, 0, 0])
            wedge(vEdgeCutoff_l, -vEdgeCutoff_h, vEdgeCutoff_w);


};