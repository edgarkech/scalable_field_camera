// some variables
$fn = 64; // we are using 64 fragments for cylinders and similar objects

vTolerance = 0.2;


// our outer frame measurements

// bellows frame is 160x160, so we need at least 160x170 (because of the edge bolts)
vOuterFrame_length = 175; // on X-axis
vOuterFrame_width = 160; // on Y-axis
vOuterFrame_height = 60; // on Z-axis; 60 is probably the minimum
vOuterFrameStrength = 5;

// we are centering our model (kind of) for easier calculations 
vOuterFrame_offsetXneg = (vOuterFrame_length+5)/2;
vOuterFrame_offsetXpos = (vOuterFrame_length-5)/2;
vOuterFrame_offsetY = vOuterFrame_width/2;

// our edges depend on the wall strength
vEdgeBoltDiameter = 2*vOuterFrameStrength;
vEdgeBoltHole = 2+vTolerance;



// cutout on the back for the bellows frame
vBackCutout_length = 136;
vBackCutout_width = 136;
vBackCutout_height = 3;
vBackCutout_offsetX = -vBackCutout_length/2;
vBackCutout_offsetY = -vBackCutout_width/2;
vBackCutout_offsetZ = 0;

// we will use a raw cylinder with 4 fragments for the cutout, so we have to calculate the diameters
vBellowsFrameLower_length = 136;
vBellowsFrameUpper_length = 160;
vBellowsFrameCutoutLower_d = sqrt(2*pow(vBellowsFrameLower_length,2));
vBellowsFrameCutoutUpper_d = sqrt(2*pow(vBellowsFrameUpper_length,2));
vBellowsFrameCutout_h = 5;
vBellowsFrameCutout_offsetX = 0;
vBellowsFrameCutout_offsetY = 0;
vBellowsFrameCutout_offsetZ = 1;

vBellowsScrewHole_d = 3;
vBellowsScrewHole_h = vOuterFrame_width+(2*vOuterFrameStrength);
vBellowsScrewSinking_d1 = 6;
vBellowsScrewSinking_h = vBellowsScrewSinking_d1/2;
vBellowsScrewHole_offsetX = 70;
vBellowsScrewHole_offsetY = vBellowsScrewHole_h/2;
vBellowsScrewHole_offsetZ = 8;


// hinges
vHingeOuter_width = vOuterFrame_width-(4*vOuterFrameStrength)-vTolerance;
vHingeInner_width = vHingeOuter_width-(8*vOuterFrameStrength)+vTolerance;
vHingeSingle_width = (vHingeOuter_width-vHingeInner_width)/2;
vHingeBase_length = 2*vOuterFrameStrength;
vHingeBase_height = vOuterFrame_height;
vHingeHole = 5+vTolerance;
vHinge_offsetX = (vOuterFrame_length/2)-vOuterFrameStrength;
vHinge_offsetY = vHingeOuter_width/2;

vHingeWallCutout_d = vHingeBase_length;
vHingeWallCutout_h = vOuterFrameStrength;
vHingeWallCutout_offsetX = vOuterFrame_offsetXneg;
vHingeWallCutout_offsetY = vOuterFrame_offsetY;
vHingeWallCutout_offsetZ = vOuterFrame_height;

// Screwholes for the stabilizing lid
vLidHole_d = 2+vTolerance;
//vLidHole_h = 10;
vLidHole_h = vOuterFrameStrength;
vLidHoleCount_x = 3;
vLidHoleDist_x = 20;
vLidHoleCount_y = 2;
vLidHoleDist_y = 60;

vLid_length = 60;
vLid_width  = vLidHoleDist_y+30;
vLidBase_height = 3;
vLidTotal_height = 8;
vLid_offsetX = 0;
vLid_offsetY = -vLid_width/2;
vLid_offsetZ = 0;



vLidHoleRow_length = (vLidHoleCount_x-1)*vLidHoleDist_x;
vLidHoleRow_offsetX = -vOuterFrame_offsetXneg;
vLidHoleRow_offsetY = vLidHoleDist_y/2;
vLidHoleRow_offsetZ = (vOuterFrame_height-vLidHoleRow_length)/2; 


module roof(l, w, h){
    polyhedron(
        points=[
            [0,0,0],
            [l,0,0],
            [l,w,0],
            [0,w,0],
            [l/2,0,h],
            [l/2,w,h]
            ],
        faces=[
            [0,1,2,3],
            [0,4,1],
            [1,4,5,2],
            [2,5,3],
            [3,5,4,0]
            ]
            );
    }

//roof(20, 10, 15);

module wedge(l, w, h) {
    polyhedron(
            points=[
                [0,0,0],
                [l,0,0],
                [0,w,0],
                [0,0,h],
                [l,0,h],
                [0,w,h]
            ],
            faces=[
                [0,1,2],
                [0,3,4,1],
                [1,4,5,2],
                [2,5,3,0],
                [3,5,4]
            ]
    );
   }    
//wedge(20, 30, 40);

module tube(d1, d2, h) {
    difference() {
        cylinder(d=d1, h=h);
        cylinder(d=d2, h=h);
        }
    }

















difference(){
    union(){
        // we want to have rounded edges
        
        // edge bolt1
        translate([-vOuterFrame_offsetXneg, -vOuterFrame_offsetY, 0])
        cylinder(d=vEdgeBoltDiameter, h=vOuterFrame_height-vOuterFrameStrength);
        
        // edge bolt2
        translate([-vOuterFrame_offsetXneg, vOuterFrame_offsetY, 0])
        cylinder(d=vEdgeBoltDiameter, h=vOuterFrame_height-vOuterFrameStrength);
                    
        // edge bolt3
        translate([vOuterFrame_offsetXpos, -vOuterFrame_offsetY, 0])
        cylinder(d=vEdgeBoltDiameter, h=vOuterFrame_height);
        
        // edge bolt4
        translate([vOuterFrame_offsetXpos, vOuterFrame_offsetY, 0])
        cylinder(d=vEdgeBoltDiameter, h=vOuterFrame_height);
        
        // bottom wall -x _offset
        translate([-vOuterFrame_offsetXneg-vOuterFrameStrength, -vOuterFrame_offsetY, 0])
        cube([vOuterFrameStrength, vOuterFrame_width, vOuterFrame_height-vOuterFrameStrength]);
        
        // top wall +x _offset
        translate([vOuterFrame_offsetXpos, -vOuterFrame_offsetY, 0])
        cube([vOuterFrameStrength, vOuterFrame_width, vOuterFrame_height]);
        
        // left wall -y _offset
        translate([-vOuterFrame_offsetXneg, -vOuterFrame_offsetY-vOuterFrameStrength, 0])
        cube([vOuterFrame_length, vOuterFrameStrength, vOuterFrame_height]);
        
        // right wall +y _offset
        translate([-vOuterFrame_offsetXneg, vOuterFrame_offsetY, 0])
        cube([vOuterFrame_length, vOuterFrameStrength, vOuterFrame_height]);

        // back
        translate([-vOuterFrame_offsetXneg, -vOuterFrame_offsetY, 0])
            cube([vOuterFrame_length, vOuterFrame_width, vBellowsFrameCutout_h+vBellowsFrameCutout_offsetZ]);
            
        
                
        // hinges for the front lid
        translate([-vOuterFrame_offsetXneg-vOuterFrameStrength, -vHinge_offsetY, 0 ])
        difference(){
            union(){
                cube([vHingeBase_length, vHingeOuter_width, vHingeBase_height]);
                translate([vHingeBase_length/2, 0, vHingeBase_height])
                rotate([0, 90, -270])
                cylinder(d=vHingeBase_length, h=vHingeOuter_width);
            };
            // subtracting the hole
            translate([vHingeBase_length/2, 0, vHingeBase_height])
            rotate([0, 90, -270])
            cylinder(d=vHingeHole, h=vHingeOuter_width);
            
            // subtracting the inner block
            translate([0, vHingeSingle_width, 0])
            cube([vHingeBase_length, vHingeInner_width, vHingeBase_height+vOuterFrameStrength]);
            

        };
        
               
        
    };
    
    
    
    // cutout for bellows frame
    // upper bellows cutout (cylinder with only 4 fragments)
    translate([vBellowsFrameCutout_offsetX, vBellowsFrameCutout_offsetY, vBellowsFrameCutout_offsetZ])
        rotate([0,0,45])
            cylinder(d1=vBellowsFrameCutoutLower_d, d2=vBellowsFrameCutoutUpper_d, h=vBellowsFrameCutout_h, $fn=4);
    
    translate([vBackCutout_offsetX, vBackCutout_offsetY, vBackCutout_offsetZ])
            cube([vBackCutout_length, vBackCutout_width, vBackCutout_height]);
    
    
    // screw holes for bellows frame
    // horizontal screwholes
    translate([vBellowsScrewHole_offsetX, -vBellowsScrewHole_offsetY, vBellowsScrewHole_offsetZ])
        rotate([-90, 0, 0])
            cylinder(d=vBellowsScrewHole_d, h=vBellowsScrewHole_h);
    translate([-vBellowsScrewHole_offsetX, -vBellowsScrewHole_offsetY, vBellowsScrewHole_offsetZ])
        rotate([-90, 0, 0])
            cylinder(d=vBellowsScrewHole_d, h=vBellowsScrewHole_h);
    
    // sinkings for the bellows screw holes        
    // horizontal
    translate([vBellowsScrewHole_offsetX, -vBellowsScrewHole_offsetY, vBellowsScrewHole_offsetZ])
        rotate([-90, 0, 0])
            cylinder(d1=vBellowsScrewSinking_d1, h=vBellowsScrewSinking_h);
    translate([-vBellowsScrewHole_offsetX, -vBellowsScrewHole_offsetY, vBellowsScrewHole_offsetZ])
        rotate([-90, 0, 0])
            cylinder(d1=vBellowsScrewSinking_d1, h=vBellowsScrewSinking_h);
    translate([vBellowsScrewHole_offsetX, vBellowsScrewHole_offsetY, vBellowsScrewHole_offsetZ])
        rotate([90, 0, 0])
            cylinder(d1=vBellowsScrewSinking_d1, h=vBellowsScrewSinking_h);
    translate([-vBellowsScrewHole_offsetX, vBellowsScrewHole_offsetY, vBellowsScrewHole_offsetZ])
        rotate([90, 0, 0])
            cylinder(d1=vBellowsScrewSinking_d1, h=vBellowsScrewSinking_h);        
    
    // cutout for the hinges
    translate([-vHingeWallCutout_offsetX, vHingeWallCutout_offsetY, vHingeWallCutout_offsetZ])
        rotate([-90, 0, 0])
            cylinder(d=vHingeWallCutout_d, h=vHingeWallCutout_h);
    translate([-vHingeWallCutout_offsetX, -vHingeWallCutout_offsetY, vHingeWallCutout_offsetZ])
        rotate([90, 0, 0])
            cylinder(d=vHingeWallCutout_d, h=vHingeWallCutout_h);
    
    // we have to drill holes into our edge bolts
    
    // edge hole1
    translate([-vOuterFrame_offsetXneg, -vOuterFrame_offsetY, 0])
    cylinder(d=vEdgeBoltHole, h=vOuterFrame_height);
    
    // edge hole2
    translate([-vOuterFrame_offsetXneg, vOuterFrame_offsetY, 0])
    cylinder(d=vEdgeBoltHole, h=vOuterFrame_height);
            
    // edge hole3
    translate([vOuterFrame_offsetXpos, -vOuterFrame_offsetY, 0])
    cylinder(d=vEdgeBoltHole, h=vOuterFrame_height);
    
    // edge hole4
    translate([vOuterFrame_offsetXpos, vOuterFrame_offsetY, 0])
    cylinder(d=vEdgeBoltHole, h=vOuterFrame_height);
    
    
    // Holes for screwing the stabilizer lid
    
    translate([vLidHoleRow_offsetX, vLidHoleRow_offsetY, vLidHoleRow_offsetZ])
        rotate([0,-90, 0])
            for (i = [0:vLidHoleCount_x-1]){ 
                translate([i*vLidHoleDist_x, 0, 0])
                    cylinder(d=vLidHole_d, h=vLidHole_h);
            };
    
    translate([vLidHoleRow_offsetX, -vLidHoleRow_offsetY, vLidHoleRow_offsetZ])
        rotate([0,-90, 0])
            for (i = [0:vLidHoleCount_x-1]){ 
                translate([i*vLidHoleDist_x, 0, 0])
                    cylinder(d=vLidHole_d, h=vLidHole_h);
            };
    

    
    
    
};

