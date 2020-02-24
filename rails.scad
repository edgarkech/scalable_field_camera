// some variables
$fn = 60; // we are using 60 fragments for cylinders and similar objects

// our outer frame measurements
vOuterFrame_length = 170; // on X-axis
vOuterFrame_width = 160; // on Y-axis
vOuterFrame_height = 10; // on Z-axis
vOuterFrame_strength = 5;

// we are centering our model on the Y axis for easier calculations 
vOuterFrame_offsetX = 0;
vOuterFrame_offsetY = vOuterFrame_width/2;

vTolerance_length = 1;
vTolerance_width = 0.2;
vTolerance_height = 0.2;



// slider
vSliderTotal_height = 15;

vSliderColumn_length = vOuterFrame_length-vOuterFrame_strength-vTolerance_length;
vSliderColumnOuter_width = 80;
vSliderColumnInner_width = 50+vTolerance_width; // including tolerance!
vSliderColumn_width = (vSliderColumnOuter_width-vSliderColumnInner_width)/2;
vSliderColumn_height = 10; 
vSliderColumn_offsetX = vOuterFrame_offsetX;
vSliderColumnLeft_offsetY = (vSliderColumnOuter_width/2)-vSliderColumn_width;
vSliderColumnRight_offsetY = -vSliderColumnOuter_width/2;
vSliderColumn_offsetZ = 0;

vSliderStabilizer_length = 8;
vSliderStabilizerBack_length = 25;
vSliderStabilizer_width = vSliderColumnOuter_width;
vSliderStabilizer_height = 5-vTolerance_height;
vSliderStabilizerBack_offsetX = 0;
vSliderStabilizerFront_offsetX = vSliderColumn_length-vSliderStabilizer_length;
vSliderStabilizer_offsetY = -vSliderStabilizer_width/2;
vSliderStabilizer_offsetZ = vSliderColumn_height-vSliderStabilizer_height;

//vSlider
vSliderUpperCutout_length = vSliderColumn_length;
vSliderUpperCutout_width = vSliderColumnOuter_width-10+vTolerance_width;
vSliderUpperCutout_height = vSliderTotal_height-vSliderColumn_height;
vSliderUpperCutout_offsetX = vSliderColumn_offsetX;
vSliderUpperCutout_offsetY = -vSliderUpperCutout_width/2;
vSliderUpperCutout_offsetZ = vSliderColumn_height;

vLowerDovetail_length = vOuterFrame_length;
vLowerDovetail_width = 10; // we are using the roof module, so we don't have to rotate
vLowerDovetail_height = 5;
vLowerDovetail_offsetX = vSliderColumn_offsetX;
vLowerDovetailLeft_offsetY = vSliderColumnLeft_offsetY+vSliderColumn_width+(vLowerDovetail_width/2);
vLowerDovetailRight_offsetY = vSliderColumnRight_offsetY+(vLowerDovetail_width/2);
vLowerDovetail_offsetZ = 0;


vUpperDovetail_length = vSliderColumn_length;
vUpperDovetail_width = vLowerDovetail_width; 
vUpperDovetail_height = vLowerDovetail_height;
// caution: because we have to rotate the upper dovetails, their offsets will be different from the lower dovetail offsets
vUpperDovetail_offsetX = vSliderColumn_length; 
vUpperDovetailLeft_offsetY = vSliderColumnLeft_offsetY+vSliderColumn_width+(vUpperDovetail_width/2);
vUpperDovetailRight_offsetY = vSliderColumnRight_offsetY+(vUpperDovetail_width/2);
vUpperDovetail_offsetZ = vSliderTotal_height;

vSliderColumnExt_length = vOuterFrame_strength+vTolerance_length;
vSliderColumnExt_width = vSliderColumn_width;
vSliderColumnExt_height = vLowerDovetail_height;
vSliderColumnExt_offsetX = vSliderColumn_length;
vSliderColumnExtLeft_offsetY = vSliderColumnLeft_offsetY;
vSliderColumnExtRight_offsetY = vSliderColumnRight_offsetY;
vSliderColumnExt_offsetZ = 0;

// lens hole
vLensHole_diameter = 60;
vLensHole_height = vSliderTotal_height;
vLensHole_offsetX = (vOuterFrame_length/2);
vLensHole_offsetY = 0; // we should be centered
vLensHole_offsetZ = vLowerDovetail_height;

// thread block holes
vThreadBlockHole_diameter = 3;
vThreadBlockHole_height = vSliderTotal_height;
vThreadBlockHole_offsetX = vSliderStabilizerBack_length-5;
vThreadBlockHole_offsetY = 15;
vThreadBlockHole_offsetZ = 0;
vThreadBlockBevel_d1 = vThreadBlockHole_diameter;
vThreadBlockBevel_d2 = vThreadBlockHole_diameter*2;
vThreadBlockBevel_height = (vThreadBlockBevel_d2-vThreadBlockBevel_d1)/2;
vThreadBlockBevel_offsetX = vThreadBlockHole_offsetX;
vThreadBlockBevel_offsetY = vThreadBlockHole_offsetY;
vThreadBlockBevel_offsetZ = vSliderColumn_height-vThreadBlockBevel_height;

// cutout for stop indents
vStopIndentCutout_length = 4;
vStopIndentCutout_width = vSliderUpperCutout_width + (2*vStopIndentCutout_length);
vStopIndentCutout_height = 5;
vStopIndentCutout1_offsetX = 25-(vStopIndentCutout_length/2);
vStopIndentCutout2_offsetX = 55-(vStopIndentCutout_length/2);
vStopIndentCutout3_offsetX = 85-(vStopIndentCutout_length/2);
vStopIndentCutout4_offsetX = 115-(vStopIndentCutout_length/2);
vStopIndentCutout5_offsetX = 145-(vStopIndentCutout_length/2);
vStopIndentCutout_offsetY = -vStopIndentCutout_width/2;
vStopIndentCutout_offsetZ = vSliderColumn_height;


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
        // left column
        translate([vSliderColumn_offsetX, vSliderColumnLeft_offsetY, vSliderColumn_offsetZ])
            cube([vSliderColumn_length, vSliderColumn_width, vSliderTotal_height]);
            
        // left column extension 
        translate([vSliderColumnExt_offsetX, vSliderColumnExtLeft_offsetY, vSliderColumnExt_offsetZ])
            cube([vSliderColumnExt_length, vSliderColumnExt_width, vSliderColumnExt_height]);
            
        // lower left dovetail 
        translate([vLowerDovetail_offsetX, vLowerDovetailLeft_offsetY, vLowerDovetail_offsetZ])
            rotate([0,0,-90])
            roof(vLowerDovetail_width, vLowerDovetail_length, vLowerDovetail_height);

        // upper left dovetail
        translate([vUpperDovetail_offsetX, vUpperDovetailLeft_offsetY, vUpperDovetail_offsetZ])
            rotate([180,0,-90])
            roof(vUpperDovetail_width, vUpperDovetail_length, vUpperDovetail_height);

        // right column
        translate([vSliderColumn_offsetX, vSliderColumnRight_offsetY, vSliderColumn_offsetZ])
            cube([vSliderColumn_length, vSliderColumn_width, vSliderTotal_height]);
            
        // right column extension    
        translate([vSliderColumnExt_offsetX, vSliderColumnExtRight_offsetY, vSliderColumnExt_offsetZ])
            cube([vSliderColumnExt_length, vSliderColumnExt_width, vSliderColumnExt_height]);
            
        // lower right dovetail 
        translate([vLowerDovetail_offsetX, vLowerDovetailRight_offsetY, vLowerDovetail_offsetZ])
            rotate([0,0,-90])
            roof(vLowerDovetail_width, vLowerDovetail_length, vLowerDovetail_height);
         
         // upper right dovetail
         translate([vUpperDovetail_offsetX, vUpperDovetailRight_offsetY, vUpperDovetail_offsetZ])
            rotate([180,0,-90])
            roof(vUpperDovetail_width, vUpperDovetail_length, vUpperDovetail_height);
         
        // back stabilizer
        translate([vSliderStabilizerBack_offsetX, vSliderStabilizer_offsetY, vSliderStabilizer_offsetZ])
            cube([vSliderStabilizerBack_length, vSliderStabilizer_width, vSliderStabilizer_height]);
            
        // front stabilizer    
        translate([vSliderStabilizerFront_offsetX, vSliderStabilizer_offsetY, vSliderStabilizer_offsetZ])
            cube([vSliderStabilizer_length, vSliderStabilizer_width, vSliderStabilizer_height]);
        };
    
    // slider upper cutout
    translate([vSliderUpperCutout_offsetX, vSliderUpperCutout_offsetY, vSliderUpperCutout_offsetZ])
        cube([vSliderUpperCutout_length, vSliderUpperCutout_width, vSliderUpperCutout_height]);
        
    // lens hole
    translate([vLensHole_offsetX, vLensHole_offsetY, vLensHole_offsetZ])
        cylinder(d=vLensHole_diameter, h=vLensHole_height);
   
    // threadblock holes
    // left    
    translate([vThreadBlockHole_offsetX, vThreadBlockHole_offsetY, vThreadBlockHole_offsetZ])
        cylinder(d=vThreadBlockHole_diameter, h=vThreadBlockHole_height);
    
    // left bevel    
    translate([vThreadBlockBevel_offsetX, vThreadBlockBevel_offsetY, vThreadBlockBevel_offsetZ])
        cylinder(h=vThreadBlockBevel_height, d1=vThreadBlockBevel_d1, d2=vThreadBlockBevel_d2);
    
    // right
    translate([vThreadBlockHole_offsetX, -vThreadBlockHole_offsetY, vThreadBlockHole_offsetZ])
        cylinder(d=vThreadBlockHole_diameter, h=vThreadBlockHole_height);
    
    // right bevel
    translate([vThreadBlockBevel_offsetX, -vThreadBlockBevel_offsetY, vThreadBlockBevel_offsetZ])
        cylinder(h=vThreadBlockBevel_height, d1=vThreadBlockBevel_d1, d2=vThreadBlockBevel_d2);
        
        
        
    // stop indents
    translate([vStopIndentCutout1_offsetX, vStopIndentCutout_offsetY, vStopIndentCutout_offsetZ])
        cube([vStopIndentCutout_length, vStopIndentCutout_width, vStopIndentCutout_height]);
        
    // stop indents
    translate([vStopIndentCutout2_offsetX, vStopIndentCutout_offsetY, vStopIndentCutout_offsetZ])
        cube([vStopIndentCutout_length, vStopIndentCutout_width, vStopIndentCutout_height]);
    
    // stop indents
    translate([vStopIndentCutout3_offsetX, vStopIndentCutout_offsetY, vStopIndentCutout_offsetZ])
        cube([vStopIndentCutout_length, vStopIndentCutout_width, vStopIndentCutout_height]);
        
    // stop indents
    translate([vStopIndentCutout4_offsetX, vStopIndentCutout_offsetY, vStopIndentCutout_offsetZ])
        cube([vStopIndentCutout_length, vStopIndentCutout_width, vStopIndentCutout_height]);
    
    // stop indents
    translate([vStopIndentCutout5_offsetX, vStopIndentCutout_offsetY, vStopIndentCutout_offsetZ])
        cube([vStopIndentCutout_length, vStopIndentCutout_width, vStopIndentCutout_height]);

};