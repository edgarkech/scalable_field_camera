// some variables
$fn = 60; // we are using 60 fragments for cylinders and similar objects

// some modules such as hex, countersunk screws, roof, wedge are available in a module file
use <modules.scad>;


// variables



// basic measurements, a lot of other measurements will be derived from them
vOuterFrame_l = 185;
vOuterFrame_w = 170;
vOuterFrame_h = 65;

vHingeInnerDistance = 100;
vHingeBaseWidth = 20;
vHingeHole = 5;

// we will center our model on the Y axis and on the center of the bellows frame
// thus, we will do an asymetric offset of 2.5mm on the X-axis (
vAsymOffsetX = -2.5;  

vBackPlateLength = 160;
vBackPlateStrength = 5;
vBellowsFrameStrength = 7; // in fact more, but we are only interested in a 2mm offset and 5mm pyramid
vBellowsFrameUpperLength = 160;
vBellowsFrameLowerLength = 136;

vFrameStrength = 5;
vTolerance = 0.2;

vBottomWall_l = vFrameStrength;
vBottomWall_w = vOuterFrame_w-(2*vFrameStrength);
vBottomWall_h = vOuterFrame_h-vFrameStrength;
vBottomWall_offsetX = -(vOuterFrame_l/2)+vAsymOffsetX;
vBottomWall_offsetY = -vBottomWall_w/2;
vBottomWall_offsetZ = 0;

vTopWall_l = vFrameStrength;
vTopWall_w = vOuterFrame_w-(2*vFrameStrength);
vTopWall_h = vOuterFrame_h;
vTopWall_offsetX = (vOuterFrame_l/2)+vAsymOffsetX-vFrameStrength;
vTopWall_offsetY = -vTopWall_w/2;
vTopWall_offsetZ = 0;

vSideWall_l = vOuterFrame_l-(2*vFrameStrength);
vSideWall_w = vFrameStrength;
vSideWall_h = vOuterFrame_h;
vSideWall_offsetX = -(vSideWall_l/2)+vAsymOffsetX;
vSideWallLeft_offsetY = (vOuterFrame_w/2)-vFrameStrength;
vSideWallRight_offsetY = -(vOuterFrame_w/2);
vSideWall_offsetZ = 0;

vEdgeBolt_d = 2*vFrameStrength;
vBottomEdgeBolt_h = vBottomWall_h;
vTopEdgeBolt_h = vTopWall_h;
vBottomEdgeBolt_offsetX = -(vSideWall_l/2)+vAsymOffsetX;
vTopEdgeBolt_offsetX = (vSideWall_l/2)+vAsymOffsetX;
vEdgeBolt_offsetY = vBottomWall_w/2;
vEdgeBolt_offsetZ = 0;

vEdgeBoltCone_d1 = 6;
vEdgeBoltCone_d2 = 3;
vEdgeBoltCone_h = 3;
vEdgeBoltCone_offsetZ = vOuterFrame_h;

vBackPlate_l = vSideWall_l;
vBackPlate_w = vBottomWall_w;
vBackPlate_h = vBackPlateStrength+vBellowsFrameStrength; // 11
vBackPlate_offsetX = -(vBackPlate_l/2)+vAsymOffsetX; 
vBackPlate_offsetY = -vBackPlate_w/2; 
vBackPlate_offsetZ = 0; 

vBackWindow_l = vBellowsFrameLowerLength;
vBackWindow_w = vBellowsFrameLowerLength;
vBackWindow_h = vBackPlateStrength+vBellowsFrameStrength;
vBackWindow_offsetX = -vBackWindow_l/2;
vBackWindow_offsetY = -vBackWindow_w/2;
vBackWindow_offsetZ = 0;

vBackPlateCutout_l = vBackPlateLength;
vBackPlateCutout_w = vBackPlateLength;
vBackPlateCutout_h = vBackPlateStrength;
vBackPlateCutout_offsetX = -vBackPlateCutout_l/2;
vBackPlateCutout_offsetY = -vBackPlateCutout_w/2;
vBackPlateCutout_offsetZ = 0;

vBackPlateScrewHole_d = 2.2;
vBackPlateScrewHole_h = 10;
vBackPlateLockScrewHole_offsetX = vTopEdgeBolt_offsetX;
vBackPlateLockScrewHole_offsetY = vEdgeBolt_offsetY;
vBackPlateRailScrewHole_offsetX = -(vBackPlateLength/2)-5;
vBackPlateRailScrewHole_offsetYi = 75;
vBackPlateRailScrewHole_offsetYa = 65;
vBackPlateScrewHole_offsetZ = 0;

// we will use a raw cylinder with 4 fragments for the cutout, so we have to calculate the diameters
vBellowsFrameCutoutLower_d = sqrt(2*pow(vBellowsFrameLowerLength,2));
vBellowsFrameCutoutUpper_d = sqrt(2*pow(vBellowsFrameUpperLength,2));
vBellowsFrameCutout_h = vBellowsFrameStrength-2;
vBellowsFrameCutout_offsetX = 0;
vBellowsFrameCutout_offsetY = 0;
vBellowsFrameCutout_offsetZ = vBackPlateStrength+2;

vBellowsScrew_d = 3+vTolerance;
vBellowsScrew_h = vFrameStrength;
vBellowsScrew_offsetX = 70;
vBellowsScrew_offsetY = -(vOuterFrame_w/2);
vBellowsScrew_offsetZ = vBellowsFrameCutout_offsetZ+vBellowsFrameStrength;

// hinges

vHingeOuter_d = 2*vFrameStrength;
vHingeOuter_h = vHingeBaseWidth-vTolerance;
vHingeInner_d = vHingeHole+vTolerance;
vHingeInner_h = vHingeOuter_h;
vHinge_offsetX = vSideWall_offsetX;
vHinge_offsetY = (vHingeInnerDistance+vTolerance)/2;
vHinge_offsetZ = vSideWall_h;

vHingeColumn_l = vHingeOuter_d;
vHingeColumn_w = vHingeOuter_h;
vHingeColumn_h = vBottomWall_h+(vHingeOuter_d/2);
vHingeColumn_offsetX = vBottomWall_offsetX;
vHingeColumnLeft_offsetY = (vHingeInnerDistance+vTolerance)/2;
vHingeColumnRight_offsetY = -((vHingeInnerDistance-vTolerance)/2)-vHingeBaseWidth;
vHingeColumn_offsetZ = 0;

vHingeWallCutout_d = 2*vFrameStrength;
vHingeWallCutout_h = vFrameStrength;
vHingeWallCutout_offsetX = vHinge_offsetX;
vHingeWallCutout_offsetY = vSideWallLeft_offsetY;
vHingeWallCutout_offsetZ = vSideWall_h;

vStabilizerBlock_l = vBottomWall_h;
vStabilizerBlock_w = 100;
vStabilizerBlock_h = 12;
vStabilizerBlock_offsetX = vBottomWall_offsetX;
vStabilizerBlock_offsetY = -vStabilizerBlock_w/2;
vStabilizerBlock_offsetZ = 0;

vDovetailTolerance = 0.2;

vDovetail_l = vBottomWall_h;
vDovetailOuter_w = 50+vDovetailTolerance;
vDovetailInner_w = 40+vDovetailTolerance;
vDovetail_offsetX = vStabilizerBlock_offsetX-7-vDovetailTolerance;
vDovetail_offsetY = -vDovetailOuter_w/2;
vDovetail_offsetZ = 0;

vDovetailToleranceCutout_l = vDovetailTolerance;
vDovetailToleranceCutout_w = vDovetailOuter_w;
vDovetailToleranceCutout_h = vBottomWall_h;
vDovetailToleranceCutout_offsetX = vDovetail_offsetX;
vDovetailToleranceCutout_offsetY = vDovetail_offsetY;
vDovetailToleranceCutout_offsetZ = vDovetail_offsetZ;

vLockingHole_d = 7;
vLockingHole_h = 8;
vLockingHole_offsetX = vDovetail_offsetX;
vLockingHole_offsetY = 0;
vLockingHole_offsetZ = 10;

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
        translate([vDovetailToleranceCutout_offsetX, vDovetailToleranceCutout_offsetY, vDovetailToleranceCutout_offsetZ])
            cube([vDovetailToleranceCutout_l, vDovetailToleranceCutout_w, vDovetailToleranceCutout_h]); 
        // dovetail
        translate([vDovetail_offsetX, vDovetail_offsetY, vDovetail_offsetZ])
            rotate([0, 270, 0])
                roof(vDovetail_l, vDovetailOuter_w, vDovetailOuter_w/2);
                    
    // stabilizer locking hole
    translate([vLockingHole_offsetX, vLockingHole_offsetY, vLockingHole_offsetZ])
        rotate([0, 90, 0])
            cylinder(d=vLockingHole_d, h=vLockingHole_h);
    
    };
        
        