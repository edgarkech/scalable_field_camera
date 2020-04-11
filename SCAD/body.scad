// loading the base configuration
include <baseconfig.scad>;

// some modules such as hex, countersunk screws, roof, wedge are available in a module file
use <modules.scad>;


vBellowsFrameUpperLength = vBellowsBackFrameOuter_l+1;
vBellowsFrameLowerLength = vBellowsBackFrameInner_l+1;

vBottomWall_l = vWall_strength;
vBottomWall_w = vBodyOuter_w-(2*vWall_strength);
vBottomWall_h = vBodyOuter_h-vWall_strength;
vBottomWall_offsetX = -(vBodyOuter_l/2)+vAsymOffsetX;
vBottomWall_offsetY = -vBottomWall_w/2;
vBottomWall_offsetZ = 0;

vTopWall_l = vWall_strength;
vTopWall_w = vBodyOuter_w-(2*vWall_strength);
vTopWall_h = vBodyOuter_h;
vTopWall_offsetX = (vBodyOuter_l/2)+vAsymOffsetX-vWall_strength;
vTopWall_offsetY = -vTopWall_w/2;
vTopWall_offsetZ = 0;

vSideWall_l = vBodyOuter_l-(2*vWall_strength);
vSideWall_w = vWall_strength;
vSideWall_h = vBodyOuter_h;
vSideWall_offsetX = -(vSideWall_l/2)+vAsymOffsetX;
vSideWallLeft_offsetY = (vBodyOuter_w/2)-vWall_strength;
vSideWallRight_offsetY = -(vBodyOuter_w/2);
vSideWall_offsetZ = 0;

vEdgeBolt_d = 2*vWall_strength;
vBottomEdgeBolt_h = vBottomWall_h;
vTopEdgeBolt_h = vTopWall_h;
vBottomEdgeBolt_offsetX = -(vSideWall_l/2)+vAsymOffsetX;
vTopEdgeBolt_offsetX = (vSideWall_l/2)+vAsymOffsetX;
vEdgeBolt_offsetY = vBottomWall_w/2;
vEdgeBolt_offsetZ = 0;

vEdgeBoltCone_d1 = vEdgeBolt_d-4;
vEdgeBoltCone_d2 = vEdgeBoltCone_d1/2;
vEdgeBoltCone_h = vEdgeBoltCone_d1/2;
vEdgeBoltCone_offsetZ = vBodyOuter_h;

vBackPlate_l = vSideWall_l;
vBackPlate_w = vBottomWall_w;
vBackPlate_h = vBackPlateStrength+vBellowsBackFrameOuter_h; // 11
vBackPlate_offsetX = -(vBackPlate_l/2)+vAsymOffsetX; 
vBackPlate_offsetY = -vBackPlate_w/2; 
vBackPlate_offsetZ = 0; 

vBackWindow_l = vBellowsFrameLowerLength;
vBackWindow_w = vBellowsFrameLowerLength;
vBackWindow_h = vBackPlateStrength+vBellowsBackFrameOuter_h;
vBackWindow_offsetX = -vBackWindow_l/2;
vBackWindow_offsetY = -vBackWindow_w/2;
vBackWindow_offsetZ = 0;

vBackPlateCutout_l = vBackPlateLength;
vBackPlateCutout_w = vBackPlateLength;
vBackPlateCutout_h = vBackPlateStrength;
vBackPlateCutout_offsetX = -vBackPlateCutout_l/2;
vBackPlateCutout_offsetY = -vBackPlateCutout_w/2;
vBackPlateCutout_offsetZ = 0;

vBackPlateScrewHole_d = vScrew1ThreadHole_d;
vBackPlateScrewHole_h = 10;
vBackPlateLockScrewHole_offsetX = vTopEdgeBolt_offsetX;
vBackPlateLockScrewHole_offsetY = vEdgeBolt_offsetY;
vBackPlateRailScrewHole_offsetX = -(vBackPlateLength/2)-5;
vBackPlateRailScrewHole_offsetYi = (vBackPlateLength/2)-5;
vBackPlateRailScrewHole_offsetYa = vBackPlateRailScrewHole_offsetYi-10;
vBackPlateScrewHole_offsetZ = 0;

// we will use a raw cylinder with 4 fragments for the cutout, so we have to calculate the diameters
vBellowsFrameCutoutLower_d = sqrt(2*pow(vBellowsFrameLowerLength,2));
vBellowsFrameCutoutUpper_d = sqrt(2*pow(vBellowsFrameUpperLength,2));
vBellowsFrameCutout_h = vBellowsBackFrameOuter_h-2;
vBellowsFrameCutout_offsetX = 0;
vBellowsFrameCutout_offsetY = 0;
vBellowsFrameCutout_offsetZ = vBackPlateStrength+2;

vBellowsScrew_d = vScrew1Hole_d+vTolerance;
vBellowsScrew_h = vWall_strength;
vBellowsScrew_offsetX = vBellowsFrameScrewHole_offsetXY;
vBellowsScrew_offsetY = -(vBodyOuter_w/2);
vBellowsScrew_offsetZ = vBellowsFrameCutout_offsetZ+vBellowsBackFrameOuter_h;

// hinges
vHingeOuter_d = 2*vWall_strength;
vHingeOuter_h = vHingeBaseWidth-vTolerance;
vHingeInner_d = vHingeHole+vTolerance;
vHingeInner_h = vHingeOuter_h;
vHinge_offsetX = vSideWall_offsetX;
vHinge_offsetY = (vHingeInnerDistance+vTolerance)/2;
vHinge_offsetZ = vSideWall_h+vTolerance; // we need 0.2 tolerance here, otherwise the lid won't close without force

vHingeColumn_l = vHingeOuter_d;
vHingeColumn_w = vHingeOuter_h;
vHingeColumn_h = vBottomWall_h+(vHingeOuter_d/2);
vHingeColumn_offsetX = vBottomWall_offsetX;
vHingeColumnLeft_offsetY = (vHingeInnerDistance+vTolerance)/2;
vHingeColumnRight_offsetY = -((vHingeInnerDistance-vTolerance)/2)-vHingeBaseWidth;
vHingeColumn_offsetZ = 0;

vHingeWallCutout_d = 2*vWall_strength+vTolerance; // we need 0.2 tolerance here, otherwise the 
vHingeWallCutout_h = vWall_strength;
vHingeWallCutout_offsetX = vHinge_offsetX;
vHingeWallCutout_offsetY = vSideWallLeft_offsetY;
vHingeWallCutout_offsetZ = vSideWall_h;

vStabilizerBlock_l = vBottomWall_h;
vStabilizerBlock_w = vStabilizerBase_w;
vStabilizerBlock_h = vStabilizerBase_h+vWall_strength;
vStabilizerBlock_offsetX = vBottomWall_offsetX;
vStabilizerBlock_offsetY = -vStabilizerBlock_w/2;
vStabilizerBlock_offsetZ = 0;

vStabilizerDovetail_l = vBottomWall_h;
vStabilizerDovetail_w = vStabilizerDovetailBase_w+vDoveTail_tolerance;
vStabilizerDovetail_offsetX = vStabilizerBlock_offsetX-vStabilizerBase_h-vDoveTail_tolerance;
vStabilizerDovetail_offsetY = -vStabilizerDovetail_w/2;
vStabilizerDovetail_offsetZ = 0;

vStabilizerDovetailToleranceCutout_l = vDoveTail_tolerance;
vStabilizerDovetailToleranceCutout_w = vStabilizerDovetail_w;
vStabilizerDovetailToleranceCutout_h = vBottomWall_h;
vStabilizerDovetailToleranceCutout_offsetX = vStabilizerDovetail_offsetX;
vStabilizerDovetailToleranceCutout_offsetY = vStabilizerDovetail_offsetY;
vStabilizerDovetailToleranceCutout_offsetZ = vStabilizerDovetail_offsetZ;

vLockingHole_d = 5+vTolerance;
vLockingHole_h = 8;
vLockingHole_offsetX = vStabilizerDovetail_offsetX;
vLockingHole_offsetY = 0;
vLockingHole_offsetZ = 10;

vLidLockHole_d = vLidLockBase_d+vTolerance;
vLidLockHole_h = vWall_strength;
vLidLockHole_offsetX = vTopWall_offsetX;
vLidLockHole_offsetY = -vLidLockHole_distance/2;
vLidLockHole_offsetZ = vTopWall_h-vLidLockBase_d;

// only as helper
//cylinder(d=160, h=20);

difference(){

    // box
    union(){
        // back plate
        translate([vBackPlate_offsetX, vBackPlate_offsetY, vBackPlate_offsetZ])
            cube([vBackPlate_l, vBackPlate_w, vBackPlate_h]);

        // bottom wall
        translate([vBottomWall_offsetX, vBottomWall_offsetY, vBottomWall_offsetZ])
            cube([vBottomWall_l, vBottomWall_w, vBottomWall_h]);
            
        // top wall
        translate([vTopWall_offsetX, vTopWall_offsetY, vTopWall_offsetZ])
            cube([vTopWall_l, vTopWall_w, vTopWall_h]); 
         
        // left side wall
        translate([vSideWall_offsetX, vSideWallLeft_offsetY, vSideWall_offsetZ])
            cube([vSideWall_l, vSideWall_w, vSideWall_h]); 
            
        // right side wall
        translate([vSideWall_offsetX, vSideWallRight_offsetY, vSideWall_offsetZ])
            cube([vSideWall_l, vSideWall_w, vSideWall_h]); 
            
        // edge bolts
            // bottom left
            translate([vBottomEdgeBolt_offsetX, vEdgeBolt_offsetY, vEdgeBolt_offsetZ])
                cylinder(d=vEdgeBolt_d, h=vBottomEdgeBolt_h);
            // bottom right
            translate([vBottomEdgeBolt_offsetX, -vEdgeBolt_offsetY, vEdgeBolt_offsetZ])
                cylinder(d=vEdgeBolt_d, h=vBottomEdgeBolt_h);
            // top left
            translate([vTopEdgeBolt_offsetX, vEdgeBolt_offsetY, vEdgeBolt_offsetZ])
                cylinder(d=vEdgeBolt_d, h=vTopEdgeBolt_h);
            translate([vTopEdgeBolt_offsetX, vEdgeBolt_offsetY, vEdgeBoltCone_offsetZ])
                cylinder(d1=vEdgeBoltCone_d1, d2=vEdgeBoltCone_d2, h=vEdgeBoltCone_h);    
            // top right
            translate([vTopEdgeBolt_offsetX, -vEdgeBolt_offsetY, vEdgeBolt_offsetZ])
                cylinder(d=vEdgeBolt_d, h=vTopEdgeBolt_h);
            translate([vTopEdgeBolt_offsetX, -vEdgeBolt_offsetY, vEdgeBoltCone_offsetZ])
                cylinder(d1=vEdgeBoltCone_d1, d2=vEdgeBoltCone_d2, h=vEdgeBoltCone_h);
            
        // hinge columns
            //left column
            translate([vHingeColumn_offsetX, vHingeColumnLeft_offsetY, vHingeColumn_offsetZ])
                cube([vHingeColumn_l, vHingeColumn_w, vHingeColumn_h]);
            //right column
            translate([vHingeColumn_offsetX, vHingeColumnRight_offsetY, vHingeColumn_offsetZ])
                cube([vHingeColumn_l, vHingeColumn_w, vHingeColumn_h]);
              
        // hinge tube
            // left
            translate([vHinge_offsetX, vHinge_offsetY, vHinge_offsetZ])
                rotate([-90, 0, 0])
                    cylinder(d=vHingeOuter_d, h=vHingeOuter_h);
            // right
            translate([vHinge_offsetX, -vHinge_offsetY, vHinge_offsetZ])
                rotate([90, 0, 0])
                    cylinder(d=vHingeOuter_d, h=vHingeOuter_h);
        
        // stabilizer / dove tail plate
        translate([vStabilizerBlock_offsetX, vStabilizerBlock_offsetY, vStabilizerBlock_offsetZ])
            rotate([0, 270, 0])
                intersection(){
                    roof(vStabilizerBlock_l, vStabilizerBlock_w, vStabilizerBlock_w/4);
                    cube([vStabilizerBlock_l, vStabilizerBlock_w, vStabilizerBlock_h]);
                };
        
            };
    
    // back plate cutout
    translate([vBackPlateCutout_offsetX, vBackPlateCutout_offsetY, vBackPlateCutout_offsetZ])
        cube([vBackPlateCutout_l, vBackPlateCutout_w, vBackPlateCutout_h]);
    
    // back window
    translate([vBackWindow_offsetX, vBackWindow_offsetY, vBackWindow_offsetZ])
        cube([vBackWindow_l, vBackWindow_w, vBackWindow_h]); 
     
    // cutout for bellows frame (pyramid)
    translate([vBellowsFrameCutout_offsetX, vBellowsFrameCutout_offsetY, vBellowsFrameCutout_offsetZ])
        rotate([0,0,45])
            cylinder(d1=vBellowsFrameCutoutLower_d, d2=vBellowsFrameCutoutUpper_d, h=vBellowsFrameCutout_h, $fn=4);
    
    // side wall cutouts for hinges
    // cutout for the hinges
    translate([vHingeWallCutout_offsetX, vHingeWallCutout_offsetY, vHingeWallCutout_offsetZ])
        rotate([-90, 0, 0])
            cylinder(d=vHingeWallCutout_d, h=vHingeWallCutout_h);
    translate([vHingeWallCutout_offsetX, -vHingeWallCutout_offsetY, vHingeWallCutout_offsetZ])
        rotate([90, 0, 0])
            cylinder(d=vHingeWallCutout_d, h=vHingeWallCutout_h);        
    
    // hinge holes
        // left
        translate([vHinge_offsetX, vHinge_offsetY, vHinge_offsetZ])
            rotate([-90, 0, 0])
                cylinder(d=vHingeInner_d, h=vHingeInner_h);
        // right
        translate([vHinge_offsetX, -vHinge_offsetY, vHinge_offsetZ])
            rotate([90, 0, 0])
                cylinder(d=vHingeInner_d, h=vHingeInner_h);
    
    // screw holes for the bellows screws
        // left
        translate([vBellowsScrew_offsetX, vBellowsScrew_offsetY, vBellowsScrew_offsetZ])
            rotate([-90, 0, 0])
                countersunk_screw(vBellowsScrew_d, vBellowsScrew_h);
        translate([-vBellowsScrew_offsetX, vBellowsScrew_offsetY, vBellowsScrew_offsetZ])
            rotate([-90, 0, 0])
                countersunk_screw(vBellowsScrew_d, vBellowsScrew_h);
        // right
        translate([vBellowsScrew_offsetX, -vBellowsScrew_offsetY, vBellowsScrew_offsetZ])
            rotate([90, 0, 0])
                countersunk_screw(vBellowsScrew_d, vBellowsScrew_h);
        translate([-vBellowsScrew_offsetX, -vBellowsScrew_offsetY, vBellowsScrew_offsetZ])
            rotate([90, 0, 0])
                countersunk_screw(vBellowsScrew_d, vBellowsScrew_h);
                
    // screw holes for back plate
        // top/lock
        translate([vBackPlateLockScrewHole_offsetX, vBackPlateLockScrewHole_offsetY, vBackPlateScrewHole_offsetZ])
            cylinder(d=vBackPlateScrewHole_d, h=vBackPlateScrewHole_h);
        translate([vBackPlateLockScrewHole_offsetX, -vBackPlateLockScrewHole_offsetY, vBackPlateScrewHole_offsetZ])
            cylinder(d=vBackPlateScrewHole_d, h=vBackPlateScrewHole_h);
            
        // bottom rail
        translate([vBackPlateRailScrewHole_offsetX, vBackPlateRailScrewHole_offsetYa, vBackPlateScrewHole_offsetZ])
            cylinder(d=vBackPlateScrewHole_d, h=vBackPlateScrewHole_h);
        translate([vBackPlateRailScrewHole_offsetX, vBackPlateRailScrewHole_offsetYi, vBackPlateScrewHole_offsetZ])
            cylinder(d=vBackPlateScrewHole_d, h=vBackPlateScrewHole_h);    
        translate([vBackPlateRailScrewHole_offsetX, -vBackPlateRailScrewHole_offsetYa, vBackPlateScrewHole_offsetZ])
            cylinder(d=vBackPlateScrewHole_d, h=vBackPlateScrewHole_h);
        translate([vBackPlateRailScrewHole_offsetX, -vBackPlateRailScrewHole_offsetYi, vBackPlateScrewHole_offsetZ])
            cylinder(d=vBackPlateScrewHole_d, h=vBackPlateScrewHole_h);
            
    // stabilizer / dove tail
        // tolerance cutout
        translate([vStabilizerDovetailToleranceCutout_offsetX, vStabilizerDovetailToleranceCutout_offsetY, vStabilizerDovetailToleranceCutout_offsetZ])
            cube([vStabilizerDovetailToleranceCutout_l, vStabilizerDovetailToleranceCutout_w, vStabilizerDovetailToleranceCutout_h]); 
        // dovetail
        translate([vStabilizerDovetail_offsetX, vStabilizerDovetail_offsetY, vStabilizerDovetail_offsetZ])
            rotate([0, 270, 0])
                roof(vStabilizerDovetail_l, vStabilizerDovetail_w, vStabilizerDovetail_w/2);
                    
    // stabilizer locking hole
    translate([vLockingHole_offsetX, vLockingHole_offsetY, vLockingHole_offsetZ])
        rotate([0, 90, 0])
            cylinder(d=vLockingHole_d, h=vLockingHole_h);
    
    // lid lock holes
    translate([vLidLockHole_offsetX, vLidLockHole_offsetY, vLidLockHole_offsetZ])
        rotate([0, 90, 0])
            cylinder(d=vLidLockHole_d, h=vLidLockHole_h);
    translate([vLidLockHole_offsetX, -vLidLockHole_offsetY, vLidLockHole_offsetZ])
        rotate([0, 90, 0])
            cylinder(d=vLidLockHole_d, h=vLidLockHole_h);
    
    };
        
        