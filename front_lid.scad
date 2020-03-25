// some variables
$fn = 60; // we are using 60 fragments for cylinders and similar objects

// our outer frame measurements - caution overall
vFrontLidOuter_l = 185;
vFrontLidOuter_w = 170;
vFrontLidOuter_h = 10;
vFrontLid_wall = 5;
vFrontLidOuter_offsetX = -vFrontLidOuter_l/2;
vFrontLidOuter_offsetY = -vFrontLidOuter_w/2;
vFrontLidOuter_offsetZ = 0;

vFrontLidInner_l = vFrontLidOuter_l-(2*vFrontLid_wall); // on X-axis
vFrontLidInner_w = vFrontLidOuter_w-(2*vFrontLid_wall); // on Y-axis
vFrontLidInner_h = vFrontLidOuter_h-vFrontLid_wall;
vFrontLidInner_offsetX = -vFrontLidInner_l/2;
vFrontLidInner_offsetY = -vFrontLidInner_w/2;
vFrontLidInner_offsetZ = vFrontLid_wall;

// our edges depend on the wall strength
vEdgeBolt_r = vFrontLid_wall;
vEdgeBolt_h = 2*vFrontLid_wall;
vEdgeBolt_offsetX = vFrontLidInner_offsetX;
vEdgeBolt_offsetY = vFrontLidInner_offsetY;
vEdgeBolt_offsetZ = 0;

vEdgeBoltCone_d1 = 3.2;
vEdgeBoltCone_d2 = 6.2;
vEdgeBoltCone_h = 3.2;
vEdgeBoltCone_offsetZ = vEdgeBolt_h-vEdgeBoltCone_h;

//vEdgeBoltHole = 3;

// rails
vRailTolerance = 0.2;

vRailBlock_l = vFrontLidOuter_l;
vRailBlock_w = 100;
vRailBlock_h = 5;
vRailBlock_offsetX = -vRailBlock_l/2;
vRailBlock_offsetY = -vRailBlock_w/2;
vRailBlock_offsetZ = vFrontLid_wall;

// cutout via roof
vRailCutout_l = vFrontLidInner_l;
vRailCutout_w = 90 + vRailTolerance;
vRailCutout_h = vRailCutout_w/2;
vRailCutout_offsetX = vRailBlock_offsetX + 2*vFrontLid_wall;
vRailCutout_offsetY = vRailCutout_w/2;
vRailCutout_offsetZ = vFrontLid_wall;

vRailMidCutout_l = vFrontLidInner_l-10;
vRailMidCutout_w = vRailBlock_w/2;
vRailMidCutout_h = 2;
vRailMidCutout_offsetX = -(vRailMidCutout_l/2)+5;
vRailMidCutout_offsetY = -vRailMidCutout_w/2;
vRailMidCutout_offsetZ = vFrontLid_wall-vRailMidCutout_h;

// hinges
vHingeTolerance = 0.2;
vHingeTubeOuter_r = vFrontLid_wall;
vHingeTubeOuter_h = vFrontLidOuter_w;
vHingeTubeInner_d = 5+vHingeTolerance;
vHingeTube_offsetX = vFrontLidInner_offsetX;
vHingeTube_offsetY = -vFrontLidOuter_offsetY;
vHingeTube_offsetZ = vFrontLidOuter_h;

vHingeCutout_l = 2*vFrontLid_wall;
vHingeCutout_w = 20+vHingeTolerance;
vHingeCutout_h = vHingeCutout_l;
vHingeCutout_offsetX = vFrontLidOuter_offsetX;
vHingeCutout_offsetY = (vFrontLidOuter_w-vHingeCutout_w-10)/2;
vHingeCutout_offsetZ = vFrontLid_wall;



// lens indent
vLensIndent_d2 = 70;
vLensIndent_d1 = vLensIndent_d2-(2*vFrontLid_wall);
vLensIndent_h = vFrontLid_wall;
vLensIndent_offsetX = 0;
vLensIndent_offsetY = 0;
vLensIndent_offsetZ = 1;

vBackThreadBlock_d = 12;
vBackThreadBlock_l = 10;
vBackThreadBlock_w = 30;
vBackThreadBlock_h = vFrontLid_wall;
vBackThreadBlock_offsetX = vFrontLidInner_offsetX+vFrontLid_wall;
vBackThreadBlock_offsetY = -vFrontLidInner_w/2;
vBackThreadBlock_offsetZ = vFrontLid_wall;

vFocusingRodHole_d = 6.2;
vFocusingRodHole_h = vFrontLidOuter_l;
vFocusingRodHole_offsetX = vBackThreadBlock_offsetX+5;
vFocusingRodHole_offsetY = -68;
vFocusingRodHole_offsetZ = 6+vFrontLid_wall;

vFocusingKnobCutout_d = 25;
vFocusingKnobCutout_l = 15;
vFocusingKnobCutout_offsetX = -vFrontLidOuter_offsetX-vFocusingKnobCutout_l-10;
vFocusingKnobCutout_offsetY = -68;
vFocusingKnobCutout_offsetZ = vBackThreadBlock_h/2+vFrontLid_wall;

vFocusingBlockScrew_d = 3;
vFocusingBlockScrew_h = 10;
vFocusingBlockScrew1_offsetX = vFocusingKnobCutout_offsetX-5;
vFocusingBlockScrew1_offsetY = vFocusingKnobCutout_offsetY+8;

vFocusingBlockScrew2_offsetX = vFocusingKnobCutout_offsetX-5;
vFocusingBlockScrew2_offsetY = vFocusingKnobCutout_offsetY-8;

vFocusingBlockScrew3_offsetX = vFocusingKnobCutout_offsetX+vFocusingKnobCutout_l+5;
vFocusingBlockScrew3_offsetY = vFocusingKnobCutout_offsetY+8;

vFocusingBlockScrew4_offsetX = vFocusingKnobCutout_offsetX+vFocusingKnobCutout_l+5;
vFocusingBlockScrew4_offsetY = vFocusingKnobCutout_offsetY-8;

vFocusingBlockScrew_offsetZ = 0;

vFocusingBlockCutout_l = vFrontLid_wall;
vFocusingBlockCutout_w = 25;
vFocusingBlockCutout_h = vFrontLid_wall;
vFocusingBlockCutout_offsetX = -vFrontLidInner_offsetX;
vFocusingBlockCutout_offsetY = vFrontLidInner_offsetY+vFrontLid_wall;
vFocusingBlockCutout_offsetZ = vFrontLid_wall;

// Screwholes for the stabilizing lid
vLidHole_d = 2;
vLidHole_h = vFrontLid_wall;
vLidHoleCount_x = 5;
vLidHoleDist_x = 35;
vLidHoleCount_y = 2;
vLidHoleDist_y = 60;

vLidHoleRow_length = (vLidHoleCount_x-1)*vLidHoleDist_x;
vLidHoleRow_offsetX = -vLidHoleRow_length/2;
vLidHoleRow_offsetY = vLidHoleDist_y/2;
vLidHoleRow_offsetZ = 0.5; // because of problems with adhesion for the first layer, we place our little screw holes a little bit higher and do the rest with post processing (hot needle)



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














difference(){
    union(){
        difference(){
            union(){
                // base plate in x direction
                translate([vFrontLidOuter_offsetX, vFrontLidInner_offsetY, vFrontLidOuter_offsetZ])
                    cube([vFrontLidOuter_l, vFrontLidInner_w, vFrontLidOuter_h]);
                // base plate in y direction
                translate([vFrontLidInner_offsetX, vFrontLidOuter_offsetY, vFrontLidOuter_offsetZ])
                    cube([vFrontLidInner_l, vFrontLidOuter_w, vFrontLidOuter_h]);
            };

            // cutout (we get a little bit asymmetric here, because we want to have a double strength wall below our hinges)
            translate([vFrontLidInner_offsetX+vFrontLid_wall, vFrontLidInner_offsetY, vFrontLidInner_offsetZ])
                cube([vFrontLidInner_l-vFrontLid_wall, vFrontLidInner_w, vFrontLidInner_h]);
        };


        // edge bolts
        translate([vEdgeBolt_offsetX, vEdgeBolt_offsetY, vEdgeBolt_offsetZ])
            cylinder(r=vEdgeBolt_r, h=vEdgeBolt_h);

        translate([vEdgeBolt_offsetX, -vEdgeBolt_offsetY, vEdgeBolt_offsetZ])
            cylinder(r=vEdgeBolt_r, h=vEdgeBolt_h);

        translate([-vEdgeBolt_offsetX, vEdgeBolt_offsetY, vEdgeBolt_offsetZ])
            cylinder(r=vEdgeBolt_r, h=vEdgeBolt_h);

        translate([-vEdgeBolt_offsetX, -vEdgeBolt_offsetY, vEdgeBolt_offsetZ])
            cylinder(r=vEdgeBolt_r, h=vEdgeBolt_h);

        // rail block
        translate([vRailBlock_offsetX, vRailBlock_offsetY, vRailBlock_offsetZ])
            cube([vRailBlock_l, vRailBlock_w, vRailBlock_h]);

        // hinge tube
        translate([vHingeTube_offsetX, vHingeTube_offsetY, vHingeTube_offsetZ])
            rotate([90, 0, 0])
                cylinder(r=vHingeTubeOuter_r, h=vHingeTubeOuter_h);
                
        // back thread block
        translate([vBackThreadBlock_offsetX, vBackThreadBlock_offsetY, vBackThreadBlock_offsetZ])
            cube([vBackThreadBlock_l, vBackThreadBlock_w, vBackThreadBlock_h]);
        
        translate([vBackThreadBlock_offsetX, vFocusingRodHole_offsetY, vFocusingRodHole_offsetZ])
            rotate([0, 90, 0])
                cylinder(d=vBackThreadBlock_d, h=vBackThreadBlock_l);    
       
        
    };
    
    // rail cutout
    translate([vRailCutout_offsetX, -vRailCutout_offsetY, vRailCutout_offsetZ])
        cube([vRailCutout_l, vRailCutout_w, vRailTolerance]);
    
    translate([vRailCutout_offsetX, -vRailCutout_offsetY, vRailCutout_offsetZ+vRailTolerance])
        roof(vRailCutout_l, vRailCutout_w, vRailCutout_h);
    
    translate([vRailMidCutout_offsetX, vRailMidCutout_offsetY, vRailMidCutout_offsetZ])
        cube([vRailMidCutout_l, vRailMidCutout_w, vRailMidCutout_h]);
     
    // hinge hole
    translate([vHingeTube_offsetX, vHingeTube_offsetY, vHingeTube_offsetZ])
        rotate([90, 0, 0])
            cylinder(d=vHingeTubeInner_d, h=vHingeTubeOuter_h);
    
    // hinge cutouts
    translate([vHingeCutout_offsetX, vHingeCutout_offsetY-vHingeCutout_w, vHingeCutout_offsetZ])
        cube([vHingeCutout_l, vHingeCutout_w, vHingeCutout_h]);
    translate([vHingeCutout_offsetX, -vHingeCutout_offsetY, vHingeCutout_offsetZ])
        cube([vHingeCutout_l, vHingeCutout_w, vHingeCutout_h]);

    // focusing rod hole
    translate([vFocusingRodHole_offsetX, vFocusingRodHole_offsetY, vFocusingRodHole_offsetZ])
        rotate([0, 90, 0])
            cylinder(d=vFocusingRodHole_d, h=vFocusingRodHole_h);
    
    // focusing knob cutout
    translate([vFocusingKnobCutout_offsetX, vFocusingKnobCutout_offsetY, vFocusingKnobCutout_offsetZ])
        rotate([0, 90, 0])
            cylinder(d=vFocusingKnobCutout_d, h=vFocusingKnobCutout_l);
            
    // cutout in front wall for focusing block
    translate([vFocusingBlockCutout_offsetX, vFocusingBlockCutout_offsetY, vFocusingBlockCutout_offsetZ])
        cube([vFocusingBlockCutout_l, vFocusingBlockCutout_w, vFocusingBlockCutout_h]);
    
    // screw holes for front focusing block
    /*
    translate([vFocusingBlockScrew1_offsetX, vFocusingBlockScrew1_offsetY, vFocusingBlockScrew_offsetZ])
        countersunk_screw(vFocusingBlockScrew_d, vFocusingBlockScrew_h);
    */
    
    translate([vFocusingBlockScrew2_offsetX, vFocusingBlockScrew2_offsetY, vFocusingBlockScrew_offsetZ])
        countersunk_screw(vFocusingBlockScrew_d, vFocusingBlockScrew_h);
    
    translate([vFocusingBlockScrew3_offsetX, vFocusingBlockScrew3_offsetY, vFocusingBlockScrew_offsetZ])
        countersunk_screw(vFocusingBlockScrew_d, vFocusingBlockScrew_h);
    
    /*
    translate([vFocusingBlockScrew4_offsetX, vFocusingBlockScrew4_offsetY, vFocusingBlockScrew_offsetZ])
        countersunk_screw(vFocusingBlockScrew_d, vFocusingBlockScrew_h);
    */
    
    // lens indent
    translate([vLensIndent_offsetX, vLensIndent_offsetY, vLensIndent_offsetZ])
        cylinder(d1=vLensIndent_d1, d2=vLensIndent_d2, h=vLensIndent_h);
    
    // Holes for screwing the stabilizer lid   
    translate([vLidHoleRow_offsetX, vLidHoleRow_offsetY, vLidHoleRow_offsetZ])
    for (i = [0:vLidHoleCount_x-1]){ 
        translate([i*vLidHoleDist_x, 0, 0])
        cylinder(d=vLidHole_d, h=vLidHole_h);
    };
    
    translate([vLidHoleRow_offsetX, -vLidHoleRow_offsetY, vLidHoleRow_offsetZ])
    for (i = [0:vLidHoleCount_x-1]){ 
        translate([i*vLidHoleDist_x, 0, 0])
        cylinder(d=vLidHole_d, h=vLidHole_h);
    };
    
    // cones for edge bolts from body
    translate([-vEdgeBolt_offsetX, vEdgeBolt_offsetY, vEdgeBoltCone_offsetZ])
        cylinder(d1=vEdgeBoltCone_d1, d2=vEdgeBoltCone_d2, h=vEdgeBoltCone_h);
    translate([-vEdgeBolt_offsetX, -vEdgeBolt_offsetY, vEdgeBoltCone_offsetZ])
        cylinder(d1=vEdgeBoltCone_d1, d2=vEdgeBoltCone_d2, h=vEdgeBoltCone_h);
    
};


