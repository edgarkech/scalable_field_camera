// some variables
$fn = 60; // we are using 60 fragments for cylinders and similar objects

// some modules such as hex, countersunk screws, roof, wedge are available in a module file
use <modules.scad>;


// variables

// this are raw measurements - we will derive the final measurements for our model from them

vTolerance = 0.2;
vGG_thickness = 2;
vGG_plane_offset = 5;
vFilmWindow_length = 121;
vFilmWindow_width = 101;
vCassetteLowerBorder = 16; // Distance from lower border to window frame
vHolder_height = 2;



vGGFrame_l = 165 ;
vGGFrame_w = 120.5;
vGGFrame_h = 12;
vGGFrame_offsetX = -vFilmWindow_length/2-vCassetteLowerBorder;
vGGFrame_offsetY = -vGGFrame_w/2;
vGGFrame_offsetZ = 0;

vGGHolder_d = vGGFrame_h+vHolder_height;
vGGHolder_h = vGGFrame_w;
vGGHolder_offsetX = 0;
vGGHolder_offsetY = -vGGHolder_h/2;
vGGHolder_offsetZ = vGGHolder_d/2;

vGGHolderHole_d = 2;
vGGHolderHole_h = vGGHolder_h;
vGGHolderHole_offsetX = 0;
vGGHolderHole_offsetY = -vGGHolder_h/2;
vGGHolderHole_offsetZ = vGGFrame_h-(vGGHolderHole_d/2);

vWindowCutout_l = vFilmWindow_length;
vWindowCutout_w = vFilmWindow_width;
vWindowCutout_h = vGG_plane_offset;
vWindowCutout_offsetX = -vWindowCutout_l/2;
vWindowCutout_offsetY = -vWindowCutout_w/2;
vWindowCutout_offsetZ = 0;

vGGFrameCutout_l = 127.5;
vGGFrameCutout_w = 102.5;
vGGFrameCutout_h = vGGFrame_h;
vGGFrameCutout_offsetX = -vGGFrameCutout_l/2;
vGGFrameCutout_offsetY = -vGGFrameCutout_w/2;
vGGFrameCutout_offsetZ = vGG_plane_offset;

vGGBed_d = 6;
vGGBed_h = vWindowCutout_h;
vGGBed_offsetX = -vFilmWindow_length/3/2;
vGGBed_offsetY = -vWindowCutout_w/2;
vGGBed_offsetZ = 0;

vGGClampCutout_l = 10;
vGGClampCutout_w = 40;
vGGClampCutout_h = vGGFrame_h-vWindowCutout_h+vGG_thickness;
vGGClampCutout_offsetX1 = -(vGGFrameCutout_l/2) - vGGClampCutout_l;
vGGClampCutout_offsetX2 = (vGGFrameCutout_l/2);
vGGClampCutout_offsetY = -(vGGClampCutout_w/2);
vGGClampCutout_offsetZ = vGG_plane_offset+vGG_thickness;

vGGClampHole_d = 2.5;
vGGClampHole_h = vGGFrame_h;
vGGClampHole_offsetX1 = -(vGGFrameCutout_l/2) - (vGGClampCutout_l/2);
vGGClampHole_offsetX2 = (vGGFrameCutout_l/2) + (vGGClampCutout_l/2);
vGGClampHole_offsetY = -15;
vGGClampHole_offsetZ = 2;


vFrontCutout_l = 2/3*vGGFrame_h;
vFrontCutout_w = 50;
vFrontCutout_h = vGGFrame_h;
vFrontCutout_offsetX = vGGFrame_offsetX + vGGFrame_l-vFrontCutout_l;
vFrontCutout_offsetY = -vFrontCutout_w/2;
vFrontCutout_offsetZ = 0;

vLowerFrontRamp_l = 2/3*vGGFrame_h;
vLowerFrontRamp_w = vGGFrame_w;
vLowerFrontRamp_h = vLowerFrontRamp_l;
vLowerFrontRamp_offsetX = vGGFrame_offsetX + vGGFrame_l;
vLowerFrontRamp_offsetY = -vLowerFrontRamp_w/2;
vLowerFrontRamp_offsetZ = 0;

vEdgeCut = 2;
vEdgeCut_h = vGGFrame_h;
vEdgeCut_offsetX1 = vGGFrame_offsetX;
vEdgeCut_offsetX2 = vGGFrame_offsetX + vGGFrame_l;
vEdgeCut_offsetY = -vGGFrame_w/2;
vEdgeCut_offsetY2 = -vFrontCutout_w/2;
vEdgeCut_offsetZ = 0;


union(){
    difference(){
        
        union(){
            translate([vGGFrame_offsetX, vGGFrame_offsetY, vGGFrame_offsetZ])
                cube([vGGFrame_l, vGGFrame_w, vGGFrame_h]);
            
            translate([vGGHolder_offsetX, vGGHolder_offsetY, vGGHolder_offsetZ])
                rotate([-90, 0, 0])
                cylinder(d=vGGHolder_d, h=vGGHolder_h);
            
            
            };
        // window cutout
        translate([vWindowCutout_offsetX, vWindowCutout_offsetY, vWindowCutout_offsetZ])
            cube([vWindowCutout_l, vWindowCutout_w, vWindowCutout_h]);
        
        // GG frame cutout
        translate([vGGFrameCutout_offsetX, vGGFrameCutout_offsetY, vGGFrameCutout_offsetZ])
            cube([vGGFrameCutout_l, vGGFrameCutout_w, vGGFrameCutout_h]);
        
        // GG clamp cutout
        translate([vGGClampCutout_offsetX1, vGGClampCutout_offsetY, vGGClampCutout_offsetZ])
            cube([vGGClampCutout_l, vGGClampCutout_w, vGGClampCutout_h]);
        translate([vGGClampCutout_offsetX2, vGGClampCutout_offsetY, vGGClampCutout_offsetZ])
            cube([vGGClampCutout_l, vGGClampCutout_w, vGGClampCutout_h]);
        
        // GG clamp holes
        translate([vGGClampHole_offsetX1, vGGClampHole_offsetY, vGGClampHole_offsetZ])
            cylinder(d=vGGClampHole_d, h=vGGClampHole_h);
        translate([vGGClampHole_offsetX1, -vGGClampHole_offsetY, vGGClampHole_offsetZ])
            cylinder(d=vGGClampHole_d, h=vGGClampHole_h);
        translate([vGGClampHole_offsetX2, vGGClampHole_offsetY, vGGClampHole_offsetZ])
            cylinder(d=vGGClampHole_d, h=vGGClampHole_h);
        translate([vGGClampHole_offsetX2, -vGGClampHole_offsetY, vGGClampHole_offsetZ])
            cylinder(d=vGGClampHole_d, h=vGGClampHole_h);
        
        // GG holder hole
        translate([vGGHolderHole_offsetX, vGGHolderHole_offsetY, vGGHolderHole_offsetZ])
            rotate([-90, 0, 0])
                cylinder(d=vGGHolderHole_d, h=vGGHolderHole_h);
        
        //front cutout
        translate([vFrontCutout_offsetX, vFrontCutout_offsetY, vFrontCutout_offsetZ])
            cube([vFrontCutout_l, vFrontCutout_w, vFrontCutout_h]);
        
        // edge cut
        translate([vEdgeCut_offsetX1, -vEdgeCut_offsetY, vEdgeCut_offsetZ])
            rotate([0, 270, 0])
                wedge(vEdgeCut_h, -vEdgeCut, -vEdgeCut);
        translate([vEdgeCut_offsetX1, vEdgeCut_offsetY, vEdgeCut_offsetZ])
            rotate([0, 270, 0])
                wedge(vEdgeCut_h, vEdgeCut, -vEdgeCut);
        translate([vEdgeCut_offsetX2, -vEdgeCut_offsetY, vEdgeCut_offsetZ])
            rotate([0, 270, 0])
                wedge(vEdgeCut_h, -vEdgeCut, vEdgeCut);
        translate([vEdgeCut_offsetX2, vEdgeCut_offsetY, vEdgeCut_offsetZ])
            rotate([0, 270, 0])
                wedge(vEdgeCut_h, vEdgeCut, vEdgeCut);
        translate([vEdgeCut_offsetX2, -vEdgeCut_offsetY2, vEdgeCut_offsetZ])
            rotate([0, 270, 0])
                wedge(vEdgeCut_h, vEdgeCut, vEdgeCut);
        translate([vEdgeCut_offsetX2, vEdgeCut_offsetY2, vEdgeCut_offsetZ])
            rotate([0, 270, 0])
                wedge(vEdgeCut_h, -vEdgeCut, vEdgeCut);
         
        // lower front cut
        translate([vLowerFrontRamp_offsetX, vLowerFrontRamp_offsetY, vLowerFrontRamp_offsetZ])
            rotate([0, 0, 90])
                wedge(vLowerFrontRamp_w, vLowerFrontRamp_l, vLowerFrontRamp_h);
    };
    // GG bed
    translate([vGGBed_offsetX, vGGBed_offsetY, vGGBed_offsetZ])
        cylinder(d=vGGBed_d , h=vGGBed_h);
    translate([vGGBed_offsetX, -vGGBed_offsetY, vGGBed_offsetZ])
        cylinder(d=vGGBed_d , h=vGGBed_h);
    translate([-vGGBed_offsetX, vGGBed_offsetY, vGGBed_offsetZ])
        cylinder(d=vGGBed_d , h=vGGBed_h);
    translate([-vGGBed_offsetX, -vGGBed_offsetY, vGGBed_offsetZ])
        cylinder(d=vGGBed_d , h=vGGBed_h);
    
    
};    
     
