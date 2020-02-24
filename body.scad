// some variables
$fn = 64; // we are using 64 fragments for cylinders and similar objects

vTolerance = 0.2;


// our outer frame measurements

// bellows frame is 160x160, so we need at least 160x170 (because of the edge bolts)
vOuterFrameLength = 170; // on X-axis
vOuterFrameWidth = 160; // on Y-axis
vOuterFrameHeight = 55; // on Z-axis
vOuterFrameStrength = 5;

// we are centering our model (kind of) for easier calculations 
vOuterFrameOffsetX = vOuterFrameLength/2;
vOuterFrameOffsetY = vOuterFrameWidth/2;

// our edges depend on the wall strength
vEdgeBoltDiameter = 2*vOuterFrameStrength;
vEdgeBoltHole = 3;



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
vBellowsScrewHole_h = vOuterFrameWidth+(2*vOuterFrameStrength);
vBellowsScrewSinking_d1 = 6;
vBellowsScrewSinking_h = vBellowsScrewSinking_d1/2;
vBellowsScrewHole_offsetX = 70;
vBellowsScrewHole_offsetY = vBellowsScrewHole_h/2;
vBellowsScrewHole_offsetZ = 8;

// the back frame will stabilize the outer frame
vBackFrameLength = 150;
vBackFrameWidth = 150;
vBackFrameOffsetX = vBackFrameLength/2;
vBackFrameOffsetY = vBackFrameWidth/2;

// we integrate an Arca Swiss compatible tripod plate
vArcaLength = 70;
vArcaWidth = 39;
vArcaCutoutDepth = 3;
vArcaHeight = 12; //overall height
vArcaBaseHeight = 1;

// rails
vRailOuterWidth = 80;
vRailInnerWidth = 60;
vRailHeight = 12;
vRailLength = vOuterFrameHeight-vRailHeight-vOuterFrameStrength;
vRailCutoutDepth = 4;
vRailCutoutOffset = 1;
vRailOffsetY = vRailOuterWidth/2;

// hinges
vHingeOuterWidth = vOuterFrameWidth-(4*vOuterFrameStrength)-vTolerance;
vHingeInnerWidth = vHingeOuterWidth-(8*vOuterFrameStrength)+vTolerance;
vHingeSingleWidth = (vHingeOuterWidth-vHingeInnerWidth)/2;
vHingeBaseLength = 2*vOuterFrameStrength;
vHingeBaseHeight = vOuterFrameHeight+vOuterFrameStrength;
vHingeHole = 4+vTolerance;
vHingeOffsetX = (vOuterFrameLength/2)-vOuterFrameStrength;
vHingeOffsetY = vHingeOuterWidth/2;




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
        translate([-vOuterFrameOffsetX, -vOuterFrameOffsetY, 0])
        cylinder(d=vEdgeBoltDiameter, h=vOuterFrameHeight);
        
        // edge bolt2
        translate([-vOuterFrameOffsetX, vOuterFrameOffsetY, 0])
        cylinder(d=vEdgeBoltDiameter, h=vOuterFrameHeight);
                    
        // edge bolt3
        translate([vOuterFrameOffsetX, -vOuterFrameOffsetY, 0])
        cylinder(d=vEdgeBoltDiameter, h=vOuterFrameHeight);
        
        // edge bolt4
        translate([vOuterFrameOffsetX, vOuterFrameOffsetY, 0])
        cylinder(d=vEdgeBoltDiameter, h=vOuterFrameHeight);
        
        // bottom wall -x offset
        translate([-vOuterFrameOffsetX-vOuterFrameStrength, -vOuterFrameOffsetY, 0])
        cube([vOuterFrameStrength, vOuterFrameWidth, vOuterFrameHeight]);
        
        // top wall +x offset
        translate([vOuterFrameOffsetX, -vOuterFrameOffsetY, 0])
        cube([vOuterFrameStrength, vOuterFrameWidth, vOuterFrameHeight]);
        
        // left wall -y offset
        translate([-vOuterFrameOffsetX, -vOuterFrameOffsetY-vOuterFrameStrength, 0])
        cube([vOuterFrameLength, vOuterFrameStrength, vOuterFrameHeight]);
        
        // right wall +y offset
        translate([-vOuterFrameOffsetX, vOuterFrameOffsetY, 0])
        cube([vOuterFrameLength, vOuterFrameStrength, vOuterFrameHeight]);

        // back
        translate([-vOuterFrameOffsetX, -vOuterFrameOffsetY, 0])
            cube([vOuterFrameLength, vOuterFrameWidth, vBellowsFrameCutout_h+vBellowsFrameCutout_offsetZ]);
            
        
        /*
        // arca plate
        translate([-vOuterFrameOffsetX-vOuterFrameStrength-vArcaHeight, -vArcaWidth/2, 0])
        difference(){
            cube([vArcaHeight, vArcaWidth, vArcaLength]);
            translate([4, 0, 0])
            wedge(-vArcaCutoutDepth, vArcaCutoutDepth, vArcaLength);
            translate([4, vArcaWidth, 0])
            wedge(-vArcaCutoutDepth, -vArcaCutoutDepth, vArcaLength);
        };
        */
        
        /*
        // rails for parking/holding the front standard in the box
        translate([-vOuterFrameOffsetX, -vRailOffsetY, vOuterFrameStrength])
        difference(){
            cube([vRailHeight, vRailOuterWidth, vRailLength]);
            translate([0, (vRailOuterWidth-vRailInnerWidth)/2, 0])    
            cube([vRailHeight, vRailInnerWidth, vRailLength]) ;   
            translate([vRailHeight-vRailCutoutDepth-vRailCutoutOffset, 0, 0])
            wedge(vRailCutoutDepth, vRailCutoutDepth, vRailLength);
            translate([vRailHeight-vRailCutoutDepth-vRailCutoutOffset, vRailOuterWidth, 0])
            wedge(vRailCutoutDepth, -vRailCutoutDepth, vRailLength);
        };
        */
        
        // hinges for the front lid
        translate([-vOuterFrameOffsetX-vOuterFrameStrength, -vHingeOffsetY, 0 ])
        difference(){
            union(){
                cube([vHingeBaseLength, vHingeOuterWidth, vHingeBaseHeight]);
                translate([vHingeBaseLength/2, 0, vHingeBaseHeight])
                rotate([0, 90, -270])
                cylinder(d=vHingeBaseLength, h=vHingeOuterWidth);
            };
            // subtracting the hole
            translate([vHingeBaseLength/2, 0, vHingeBaseHeight])
            rotate([0, 90, -270])
            cylinder(d=vHingeHole, h=vHingeOuterWidth);
            
            // subtracting the inner block
            translate([0, vHingeSingleWidth, 0])
            cube([vHingeBaseLength, vHingeInnerWidth, vHingeBaseHeight+vOuterFrameStrength]);
            

        };
        
        // reinforcements for the lid struts
        
        
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
    
    
    // we have to drill holes into our edge bolts
    
    // edge hole1
    translate([-vOuterFrameOffsetX, -vOuterFrameOffsetY, 0])
    cylinder(d=vEdgeBoltHole, h=vOuterFrameHeight);
    
    // edge hole2
    translate([-vOuterFrameOffsetX, vOuterFrameOffsetY, 0])
    cylinder(d=vEdgeBoltHole, h=vOuterFrameHeight);
            
    // edge hole3
    translate([vOuterFrameOffsetX, -vOuterFrameOffsetY, 0])
    cylinder(d=vEdgeBoltHole, h=vOuterFrameHeight);
    
    // edge hole4
    translate([vOuterFrameOffsetX, vOuterFrameOffsetY, 0])
    cylinder(d=vEdgeBoltHole, h=vOuterFrameHeight);
};

