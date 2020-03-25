// some variables
$fn = 60; // we are using 60 fragments for cylinders and similar objects

module roof(l, w, h){
    polyhedron(
        points=[
            [0,0,0],
            [l,0,0],
            [l,w,0],
            [0,w,0],
            [0,w/2,h],
            [l,w/2,h]
            ],
        faces=[
            [0,1,2,3],
            [0,4,1],
            [1,4,5,2],
            [2,5,3],
            [3,5,4,0]
            ]
            );
    };

module wedge(l, w, h) {
    polyhedron(
            points=[
                [0,0,0],
                [l,0,0],
                [l,w,0],
                [0,w,0],
                [0,0,h],
                [l,0,h]
            ],
            faces=[
                [0,3,2,1],
                [0,1,5,4],
                [1,2,5],
                [2,3,4,5],
                [3,0,4]
            ]
    );
   };    

module tube(d1, d2, h) {
    difference() {
        cylinder(d=d1, h=h);
        cylinder(d=d2, h=h);
        };
    };

module countersunk_screw(vScrew_d, vScrew_l){
    union(){
    cylinder(d=vScrew_d, h= vScrew_l);
    cylinder(d1=vScrew_d*2, h=vScrew_d);
    };
};
    
    


vTolerance = 0.2;    
vRailTolerance = 0.2;
    
vLowerRail_l = 172;
vLowerRailOuter_w = 90-vRailTolerance;
vLowerRailInner_w = 80-vRailTolerance;
vLowerRail_h = 5;
vLowerRail_offsetX = 0;
vLowerRail_offsetY = -vLowerRailOuter_w/2;
vLowerRail_offsetZ = 0;

vUpperRail_l = 167;
vUpperRailOuter_w = vLowerRailOuter_w;
vUpperRail_h = vLowerRail_h;
vUpperRail_offsetX = 0;
vUpperRail_offsetY = -(vUpperRailOuter_w/2);
vUpperRail_offsetZ = 0;

vMidSection_h = 7;

vUpperBlock_l = vUpperRail_l;
vUpperBlock_w = vLowerRailInner_w;
vUpperBlock_h = vUpperRail_h + vMidSection_h;
vUpperBlock_offsetX = 0;
vUpperBlock_offsetY = -vUpperBlock_w/2;
vUpperBlock_offsetZ = vLowerRail_h;

vMidCutout_l = vUpperRail_l-30;
vMidCutout_w = 60;
vMidCutout_h = vLowerRail_h+vUpperBlock_h;
vMidCutout_offsetX = 15;
vMidCutout_offsetY = -vMidCutout_w/2;
vMidCutout_offsetZ = 0;

vUpperCutout_l = vUpperRail_l;
vUpperCutout_w = 70+vRailTolerance;
vUpperCutout_h = vMidSection_h+1;
vUpperCutout_offsetX = 0;
vUpperCutout_offsetY = -vUpperCutout_w/2;
vUpperCutout_offsetZ = vMidCutout_h-vUpperCutout_h;

vLensCutout_d = 70;
vLensCutout_h = vLowerRail_h+vUpperBlock_h;
vLensCutout_offsetX = 80;
vLensCutout_offsetY = 0;
vLensCutout_offsetZ = 0;

// cutout for stop indents
vStopIndent_l = 4;
vStopIndent_w = vUpperCutout_w + (2*vStopIndent_l);
vStopIndent_h = 5;
vStopIndentDistance = 20;
vStopIndentCount = floor(vUpperRail_l/vStopIndentDistance);
vStopIndent_offsetX = 15;
vStopIndent_offsetY = -vStopIndent_w/2;
vStopIndent_offsetZ = vLowerRail_h+vMidSection_h+vUpperRail_h-vStopIndent_h;

vFocusingLever_l = 70;
vFocusingLever_w = 75-vTolerance;
vFocusingLever_h = vMidSection_h-1;
vFocusingLever_offsetX = 16;
vFocusingLever_offsetY = 0;
vFocusingLever_offsetZ = vLowerRail_h + vFocusingLever_h + 0.5;

vFocusingThreadBlock_l = 12;
vFocusingThreadBlock_w = 20-vTolerance;
vFocusingThreadBlock_h = 12;
vFocusingThreadBlock_offsetX = vFocusingLever_offsetX;
vFocusingThreadBlock_offsetY = -vFocusingLever_w;
vFocusingThreadBlock_offsetZ = 0;

vFocusingThreadHole_d = 10.2;
vFocusingThreadHole_h = vFocusingLever_l;
vFocusingThreadHole_offsetX = vFocusingLever_offsetX;
vFocusingThreadHole_offsetY = -68;
//vFocusingThreadHole_offsetZ = vFocusingThreadBlock_h/2;
vFocusingThreadHole_offsetZ = 6;


vEdgeCutoff = 5;
vEdgeCutoff_h = vLowerRail_h+vMidSection_h+vUpperRail_h;


difference(){
union(){
    // lower rail
    difference(){
        translate([vLowerRail_offsetX, vLowerRail_offsetY, vLowerRail_offsetZ])
            roof(vLowerRail_l, vLowerRailOuter_w, vLowerRailOuter_w/2);
        translate([vLowerRail_offsetX, vLowerRail_offsetY, vLowerRail_h])
            cube([vLowerRail_l, vLowerRailOuter_w, vLowerRailOuter_w/2]);    
    };

    // upper block
    translate([vUpperBlock_offsetX, vUpperBlock_offsetY, vUpperBlock_offsetZ])
            cube([vUpperBlock_l, vUpperBlock_w, vUpperBlock_h]);    
    
    // focusing lever
    translate([vFocusingLever_offsetX, vFocusingLever_offsetY, vFocusingLever_offsetZ])
        rotate([0, 90, 0])
            wedge(vFocusingLever_h, -vFocusingLever_w+2, vFocusingLever_l);
    
    
    // focusing lever thread block
    translate([vFocusingThreadBlock_offsetX, vFocusingThreadBlock_offsetY, vFocusingThreadBlock_offsetZ])
                cube([vFocusingThreadBlock_l, vFocusingThreadBlock_w, vFocusingThreadBlock_h]);
        
        
    // lower rail
    translate([0,0,vLowerRail_h+vUpperBlock_h])
        mirror([0,0,1]){
            difference(){
                translate([vUpperRail_offsetX, vUpperRail_offsetY, vUpperRail_offsetZ])
                    roof(vUpperRail_l, vUpperRailOuter_w, vUpperRailOuter_w/2);
                translate([vUpperRail_offsetX, vUpperRail_offsetY, vUpperRail_h])
                    cube([vUpperRail_l, vUpperRailOuter_w, vUpperRailOuter_w/2]);    
            };
        };

    };
    
    // mid cutout
    translate([vMidCutout_offsetX, vMidCutout_offsetY, vMidCutout_offsetZ])
        cube([vMidCutout_l, vMidCutout_w, vMidCutout_h]); 
 
    // upper cutout
    translate([vUpperCutout_offsetX, vUpperCutout_offsetY, vUpperCutout_offsetZ])
        cube([vUpperCutout_l, vUpperCutout_w, vUpperCutout_h]); 
    for (i = [0:5]){ 
    // lens cutout
    translate([vLensCutout_offsetX+(i*2), vLensCutout_offsetY, vLensCutout_offsetZ])
        cylinder(d=vLensCutout_d, h=vLensCutout_h);
    };
    
    // stop indents
    for (i=[0:vStopIndentCount]){
    translate([i*vStopIndentDistance+vStopIndent_offsetX, vStopIndent_offsetY, vStopIndent_offsetZ])
        cube([vStopIndent_l, vStopIndent_w, vStopIndent_h]);        
    };

    // focusing thread hole
    translate([vFocusingThreadHole_offsetX, vFocusingThreadHole_offsetY, vFocusingThreadHole_offsetZ])
        rotate([0, 90, 0])
            cylinder(d=vFocusingThreadHole_d, h=vFocusingThreadHole_h);
    
    // edge cutoff
    // back left
    translate([0, -vLowerRail_offsetY, 0])
        rotate([0, -90, 0])
            wedge(vEdgeCutoff_h, -vEdgeCutoff, -vEdgeCutoff);
    // lower front left
    translate([vLowerRail_l, -vLowerRail_offsetY, 0])
        rotate([0, -90, 0])
            wedge(vEdgeCutoff_h, -vEdgeCutoff, vEdgeCutoff);
    // upper front left
    translate([vUpperRail_l, -vLowerRail_offsetY, vLowerRail_h])
        rotate([0, -90, 0])
            wedge(vEdgeCutoff_h, -vEdgeCutoff, vEdgeCutoff);
    // back right
    translate([0, vLowerRail_offsetY, 0])
        rotate([0, -90, 0])
            wedge(vEdgeCutoff_h, vEdgeCutoff, -vEdgeCutoff);
    // lower front right
    translate([vLowerRail_l, vLowerRail_offsetY, 0])
        rotate([0, -90, 0])
            wedge(vEdgeCutoff_h, vEdgeCutoff, vEdgeCutoff);
    // upper front right
    translate([vUpperRail_l, vLowerRail_offsetY, vLowerRail_h])
        rotate([0, -90, 0])
            wedge(vEdgeCutoff_h, vEdgeCutoff, vEdgeCutoff);
    
};