// some variables
$fn = 60; // we are using 64 fragments for cylinders and similar objects

// our outer frame measurements
vOuterFrameLength = 170; // on X-axis
vOuterFrameWidth = 160; // on Y-axis
vOuterFrameHeight = 10; // on Z-axis
vOuterFrameStrength = 5;

// we are centering our model (kind of) for easier calculations 
vOuterFrameOffsetX = vOuterFrameLength/2;
vOuterFrameOffsetY = vOuterFrameWidth/2;

// our edges depend on the wall strength
vEdgeBoltDiameter = 2*vOuterFrameStrength;
vEdgeBoltHole = 3;

/*
// the back frame will stabilize the outer frame
vBackFrameLength = 140;
vBackFrameWidth = 140;
vBackFrameOffsetX = vBackFrameLength/2;
vBackFrameOffsetY = vBackFrameWidth/2;
*/

/*
// we integrate an Arca Swiss compatible tripod plate
vArcaLength = 70;
vArcaWidth = 39;
vArcaCutoutDepth = 3;
vArcaHeight = 12; //overall height
vArcaBaseHeight = 1;
*/

/* linear guide version
// rails
vRailOuterWidth = 80;
vRailInnerWidth = 60;
vRailHeight = 12;
vRailLength = vOuterFrameHeight-vRailHeight-vOuterFrameStrength;
vRailCutoutDepth = 4;
vRailCutoutOffset = 1;
vRailOffsetY = vRailOuterWidth/2;

// linear guides
vSlideBlockInnerDistance = 60;
vSlideBlockLength = 30;
vSlideBlockWidth = 20;
*/

// dovetail guides
vDovetailGuideLength = vOuterFrameLength+vOuterFrameStrength;
vDovetailGuideOffsetX= (vOuterFrameLength/2)+vOuterFrameStrength;
vDovetailGuideOuterWidth = 100;
vDovetailGuideOuterOffsetY = vDovetailGuideOuterWidth/2;
vDovetailGuideInnerWidth = 80;
vDovetailGuideInnerOffsetY = vDovetailGuideInnerWidth/2;
vDovetailHeight = 10;
vDovetailHeightTolerance = 0.2;
vDovetailGuideSingleWidth = (vDovetailGuideOuterWidth-vDovetailGuideInnerWidth)/2;
vDovetailCutout = 5;
vDovetailCutoutLength = vOuterFrameLength;
vDovetailSliderInnerWidth = 50;
vDovetailSliderSingleWidth = ((vDovetailGuideInnerWidth-vDovetailSliderInnerWidth)/2)+vDovetailCutout;
vDovetailSliderOffsetY = (vDovetailGuideInnerWidth/2)+vDovetailCutout;

// thread blocks
vThreadBlockWidth = 20;
vThreadBlockFrontLength = 10;
vThreadBlockBackLength = 20;
vThreadBlockMidLength = 10;
vFocusWheelGapLength = 15;
vFocusWheelGapWidth = 25;
vThreadIndentLength = vOuterFrameLength-vThreadBlockFrontLength-vFocusWheelGapLength-vThreadBlockMidLength-vThreadBlockBackLength;
vThreadIndentWidth = 20;
vThreadIndentOffsetX = vOuterFrameOffsetX-vThreadBlockFrontLength-vFocusWheelGapLength-vThreadBlockMidLength;
vThreadBlockHeight = 2*vOuterFrameStrength;
vThreadHoleDiameter = 6;
vThreadHoleLength = vOuterFrameLength;


// hinges
vHingeOuterWidth = vOuterFrameWidth-(4*vOuterFrameStrength);
vHingeInnerWidth = vHingeOuterWidth-(8*vOuterFrameStrength);
vHingeSingleWidth = (vHingeOuterWidth-vHingeInnerWidth)/2;
vHingeBaseLength = 2*vOuterFrameStrength;
vHingeBaseHeight = vOuterFrameHeight;
vHingeHole = 4;
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
    };

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
   };    
//wedge(20, 30, 40);

module tube(d1, d2, h) {
    difference() {
        cylinder(d=d1, h=h);
        cylinder(d=d2, h=h);
        }
    };




    
difference(){
    union(){
        // we want to have rounded edges
        
        // edge bolt1 (front left)
        translate([-vOuterFrameOffsetX, -vOuterFrameOffsetY, 0])
        cylinder(d=vEdgeBoltDiameter, h=vOuterFrameHeight);
        
        // edge bolt2 (front right)
        translate([-vOuterFrameOffsetX, vOuterFrameOffsetY, 0])
        cylinder(d=vEdgeBoltDiameter, h=vOuterFrameHeight);
        
     
        // bottom wall -x offset
        translate([-vOuterFrameOffsetX-vOuterFrameStrength, -vOuterFrameOffsetY, 0])
        cube([vOuterFrameStrength, vOuterFrameWidth, vOuterFrameHeight]);
        
 
        // hinge tube (has to be rounded)    
        translate([vOuterFrameOffsetX, -vOuterFrameOffsetY-vOuterFrameStrength, vOuterFrameStrength])
        rotate([0, 90, 90])
        cylinder(d=vOuterFrameHeight, h=vOuterFrameWidth+(2*vOuterFrameStrength));
   
        
        // left wall -y offset
        translate([-vOuterFrameOffsetX, -vOuterFrameOffsetY-vOuterFrameStrength, 0])
        cube([vOuterFrameLength, vOuterFrameStrength, vOuterFrameHeight]);
        
        // right wall +y offset
        translate([-vOuterFrameOffsetX, vOuterFrameOffsetY, 0])
        cube([vOuterFrameLength, vOuterFrameStrength, vOuterFrameHeight]);

        // bottom
        translate([-vOuterFrameOffsetX, -vOuterFrameOffsetY, 0])
        cube([vOuterFrameLength, vOuterFrameWidth, vOuterFrameStrength]);
        
        // dovetail guides (raw blocks only, cutouts are made later)
        // left
        translate([-vDovetailGuideOffsetX, -vDovetailGuideOuterOffsetY, 0 ])
        cube([vDovetailGuideLength, vDovetailGuideSingleWidth, vDovetailHeight]);
        
        // right
        translate([-vDovetailGuideOffsetX, vDovetailGuideInnerOffsetY, 0 ])
        cube([vDovetailGuideLength, vDovetailGuideSingleWidth, vDovetailHeight]);
               
        // thread blocks
        
        // front block
        translate([-vOuterFrameOffsetX, -vThreadBlockWidth/2, 0])
        cube([vThreadBlockFrontLength, vThreadBlockWidth, vThreadBlockHeight]);
        
        // mid block
        translate([-vOuterFrameOffsetX+vThreadBlockFrontLength+vFocusWheelGapLength, -vThreadBlockWidth/2, 0])
        cube([vThreadBlockMidLength, vThreadBlockWidth, vThreadBlockHeight]);
        
        // back block
        translate([vOuterFrameOffsetX-vThreadBlockBackLength, -vThreadBlockWidth/2, 0])
        cube([vThreadBlockBackLength, vThreadBlockWidth, vThreadBlockHeight]);
        
    };
    
    // cutouts for hinges
    // left
    translate([vHingeOffsetX, -vHingeOffsetY,0])
    cube([vHingeBaseLength, vHingeSingleWidth, vHingeBaseHeight]);
    
    // right
    translate([vHingeOffsetX, vHingeOffsetY-vHingeSingleWidth,0])
    cube([vHingeBaseLength, vHingeSingleWidth, vHingeBaseHeight]);    
    

    /*
    // indents for linear guides
    translate([-vOuterFrameOffsetX, -(vSlideBlockInnerDistance/2)-vSlideBlockWidth, 3])
    cube([vSlideBlockLength, vSlideBlockWidth, 10]);
    
    translate([-vOuterFrameOffsetX, vSlideBlockInnerDistance/2, 3])
    cube([vSlideBlockLength, vSlideBlockWidth, 10]);
    */
    
    // indent for the focusing rod
    translate([-vThreadIndentOffsetX, -vThreadIndentWidth/2, 0])
    cube([vThreadIndentLength, vThreadIndentWidth, 10]);
    
    // indent for the focusing wheel
    translate([-vOuterFrameOffsetX+vThreadBlockFrontLength, -vFocusWheelGapWidth/2, 0])
    cube([vFocusWheelGapLength, vFocusWheelGapWidth, 10]);
    
    // hole for focusing rod
    translate([-vOuterFrameOffsetX-10, 0, vOuterFrameStrength])
    rotate([0, 90, 0])
    cylinder(d=vThreadHoleDiameter, h=vThreadHoleLength);
    
    
    // hole for the hinges
    translate([vOuterFrameOffsetX, -vOuterFrameOffsetY-vOuterFrameStrength, vOuterFrameStrength])
    rotate([0, 90, 90])
    cylinder(d=vHingeHole, h=vOuterFrameLength+(2*vOuterFrameStrength));
    
    
    // dovetail cutouts left side
    translate([-vDovetailGuideOffsetX, -vDovetailSliderOffsetY, vOuterFrameStrength])
    union(){
        cube([vDovetailCutoutLength, vDovetailSliderSingleWidth, vDovetailHeightTolerance]);

        translate([0, vDovetailCutout, vDovetailHeightTolerance])
        cube([vDovetailCutoutLength, (vDovetailGuideInnerWidth-vDovetailSliderInnerWidth)/2, vDovetailCutout]);

        translate([vDovetailCutoutLength, vDovetailCutout, vDovetailHeightTolerance])
        rotate([0, 270, 0])
        wedge(vDovetailCutout, -vDovetailCutout, vDovetailCutoutLength);
    };
    
    // dovetail cutouts right side
    translate([-vDovetailGuideOffsetX, (vDovetailSliderInnerWidth/2), vOuterFrameStrength])
    union(){
        cube([vDovetailCutoutLength, vDovetailSliderSingleWidth, vDovetailHeightTolerance]);

        translate([0, 0, vDovetailHeightTolerance])
        cube([vDovetailCutoutLength, (vDovetailGuideInnerWidth-vDovetailSliderInnerWidth)/2, vDovetailCutout]);

        translate([vDovetailCutoutLength, vDovetailSliderSingleWidth-vDovetailCutout, vDovetailHeightTolerance])
        rotate([0, 270, 0])
        wedge(vDovetailCutout, vDovetailCutout, vDovetailCutoutLength);
    };
    
    
    
    // cut the edges
    translate([vOuterFrameOffsetX, vOuterFrameOffsetY, 0])
    difference(){
    cube([vEdgeBoltDiameter, vEdgeBoltDiameter, vEdgeBoltDiameter]);
    cylinder(d=vEdgeBoltDiameter, h=vEdgeBoltDiameter);    
    };
    
    translate([vOuterFrameOffsetX, -vOuterFrameOffsetY, 0])
    difference(){
    translate([0, -vEdgeBoltDiameter, 0])
    cube([vEdgeBoltDiameter, vEdgeBoltDiameter, vEdgeBoltDiameter]);
    cylinder(d=vEdgeBoltDiameter, h=vEdgeBoltDiameter);    
    };
    
};

