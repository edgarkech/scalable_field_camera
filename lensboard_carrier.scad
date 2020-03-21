// some variables
$fn = 120; // we are using 120 fragments for cylinders and similar objects

vTolerance_length = 0.2;
vTolerance_width = 0.2;
vTolerance_height = 0.2;
vTolerance_diameter = 0.2;

vFrontPlate_length = 115;
vFrontPlate_width = 110; //vFrontPlate_length;
vFrontPlate_height = 16;
vFrontPlate_offsetX = -vFrontPlate_length/2;
vFrontPlate_offsetY = -vFrontPlate_width/2;
vFrontPlate_offsetZ = 0;

vTolerance = 0.2;
vDovetailBase = 5;

vTiltDovetail_d1 = 30-vTolerance;
vTiltDovetail_d2 = vTiltDovetail_d1+(2*vDovetailBase);
vTiltDovetail_h = vDovetailBase-vTolerance;
vTiltDovetail_offsetX = 0;
vTiltDovetail_offsetY = vFrontPlate_width/2;
vTiltDovetail_offsetZ = vFrontPlate_height/2;

vAxisHole_d = 10+vTolerance;
vAxisHole_h = vDovetailBase+vTolerance;
vAxisHole_offsetX = 0;
vAxisHole_offsetY = vFrontPlate_width/2;
vAxisHole_offsetZ = vFrontPlate_height/2;

vTiltLockBolt_d = 12;
vTiltLockBolt_h = 12;
vTiltLockBoltHole_d = 7;
vTiltLockBoltHole_h = vTiltLockBolt_h;
vTiltLockBolt_offsetX = -55;
vTiltLockBolt_offsetY = -(vFrontPlate_width+(2*vDovetailBase))/2;
vTiltLockBolt_offsetZ = vFrontPlate_height/2;


vBellowsCutoutLower_length = 105+(2*vTolerance_length);
vBellowsCutoutLower_width = vBellowsCutoutLower_length;
vBellowsCutoutLower_height = 7;
vBellowsCutoutLower_d = sqrt(2*pow(vBellowsCutoutLower_length,2));
vBellowsCutoutUpper_length = 85+(2*vTolerance_length);
vBellowsCutoutUpper_width = vBellowsCutoutUpper_length;
vBellowsCutoutUpper_d = sqrt(2*pow(vBellowsCutoutUpper_length,2));
vBellowsCutoutUpper_height = 4;
vBellowsCutoutLower_offsetX = -vBellowsCutoutLower_length/2;
vBellowsCutoutLower_offsetY = -vBellowsCutoutLower_width/2;
vBellowsCutoutLower_offsetZ = 0;
// for the upper cutout we are using a cylinder, so we have to center it
vBellowsCutoutUpper_offsetX = 0;
vBellowsCutoutUpper_offsetY = 0;
vBellowsCutoutUpper_offsetZ = vBellowsCutoutLower_height;

vLensBoardCutout_length = 100;
vLensBoardCutout_width = 97;
vLensBoardCutout_height = 2+vTolerance_height;
vLensBoardCutout_offsetX = -(vLensBoardCutout_width/2)-3;
vLensBoardCutout_offsetY = -vLensBoardCutout_width/2;
vLensBoardCutout_offsetZ = vFrontPlate_height-vLensBoardCutout_height;

vLensBoardHole_d = 85;
vLensBoardHole_h = vFrontPlate_height;
vLensBoardCircle_d = 89;
vLensBoardCircle_h = 1+vTolerance_height;
vLensBoardCircle_offsetZ = vFrontPlate_height-vLensBoardCutout_height-vLensBoardCircle_h;

vBellowsScrewHole_d = 3;
vBellowsScrewHole_h = vFrontPlate_length;
vBellowsScrewSinking_d1 = 6;
vBellowsScrewSinking_h = vBellowsScrewSinking_d1/2;
vBellowsScrewHole_offsetX = -vFrontPlate_length/2;
vBellowsScrewHole_offsetY = vBellowsCutoutUpper_length/2;
vBellowsScrewHole_offsetZ = vBellowsCutoutLower_height/2;

vClampHole_d = 2;
vClampHole_h = 8;
vClampHole_offsetX = (vFrontPlate_length/2)-3;
vClampHole_offsetY = 25;
vClampHole_offsetZ = vFrontPlate_height-vClampHole_h;



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

module hex(kw, h) {
	render() translate([0, 0, h/2]) intersection_for(a = [0, 120, 240]) {
		rotate([0, 0, a]) cube([kw, 3 * kw, h], true);
	}
}
//hex(10, 5);


difference(){

union(){
    
    intersection(){
        // base cube
        translate([vFrontPlate_offsetX, vFrontPlate_offsetY, vFrontPlate_offsetZ])
            cube([vFrontPlate_length, vFrontPlate_width, vFrontPlate_height]);
        // rounding the edges
        cylinder(d=155, h=vFrontPlate_height);
    };
    
    
    translate([vTiltDovetail_offsetX, vTiltDovetail_offsetY, vTiltDovetail_offsetZ])
    rotate([-90, 0, 0])
    intersection(){
        union(){
            cylinder(d=vTiltDovetail_d1, h= vTolerance);
            translate([0, 0, vTolerance])
                cylinder(d1=vTiltDovetail_d1, d2=vTiltDovetail_d2, h=vTiltDovetail_h);
            };
        translate([-vTiltDovetail_d2/2, -vFrontPlate_height/2, 0])
            cube([vTiltDovetail_d2, vFrontPlate_height, vTiltDovetail_h+vTolerance]);
    };
    
    rotate([0, 0, 180])
        translate([vTiltDovetail_offsetX, vTiltDovetail_offsetY, vTiltDovetail_offsetZ])
        rotate([-90, 0, 0])
        intersection(){
            union(){
                cylinder(d=vTiltDovetail_d1, h= vTolerance);
                translate([0, 0, vTolerance])
                    cylinder(d1=vTiltDovetail_d1, d2=vTiltDovetail_d2, h=vTiltDovetail_h);
                };
            translate([-vTiltDovetail_d2/2, -vFrontPlate_height/2, 0])
                cube([vTiltDovetail_d2, vFrontPlate_height, vTiltDovetail_h+vTolerance]);
        };
    
    translate([vTiltLockBolt_offsetX, vTiltLockBolt_offsetY, vTiltLockBolt_offsetZ])
        rotate([-90, 0, 0])
            cylinder(d=vTiltLockBolt_d, h=vTiltLockBolt_h);
    translate([vTiltLockBolt_offsetX, -vTiltLockBolt_offsetY, vTiltLockBolt_offsetZ])
        rotate([90, 0, 0])
            cylinder(d=vTiltLockBolt_d, h=vTiltLockBolt_h);    
    
    
    
    /*
    // base axis block
    translate([-vAxisBlock_d/2, -vAxisBlock_h/2, 0])
        cube([vAxisBlock_d, vAxisBlock_h, vAxisBlock_d]);
    
    // two aditional cylinders
    translate([-vAxisBlock_d/2, vAxisBlock_h/2, vAxisBlock_d/2])
        rotate([90, 0, 0])
            cylinder(d=vAxisBlock_d, h=vAxisBlock_h);
    translate([vAxisBlock_d/2, vAxisBlock_h/2, vAxisBlock_d/2])
        rotate([90, 0, 0])
            cylinder(d=vAxisBlock_d, h=vAxisBlock_h);
    */
};



// lower bellows cutout (cube)
translate([vBellowsCutoutLower_offsetX, vBellowsCutoutLower_offsetY, vBellowsCutoutLower_offsetZ])
    cube([vBellowsCutoutLower_length, vBellowsCutoutLower_width, vBellowsCutoutLower_height]);    

// upper bellows cutout (cylinder with only 4 fragments)
translate([vBellowsCutoutUpper_offsetX, vBellowsCutoutUpper_offsetY, vBellowsCutoutUpper_offsetZ])
    rotate([0,0,45])
        cylinder(d1=vBellowsCutoutLower_d, d2=vBellowsCutoutUpper_d, h=vBellowsCutoutUpper_height, $fn=4);

// lensboard hole
cylinder(d=vLensBoardHole_d, h=vLensBoardHole_h);

// lensboard cutout
translate([vLensBoardCutout_offsetX, vLensBoardCutout_offsetY, vLensBoardCutout_offsetZ])
    cube([vLensBoardCutout_length, vLensBoardCutout_width, vLensBoardCutout_height]);        
// lensboard circular cutout
translate([0, 0, vLensBoardCircle_offsetZ])    
    cylinder(d=vLensBoardCircle_d, h=vLensBoardCircle_h);

// vertical screwholes
translate([vBellowsScrewHole_offsetX, -vBellowsScrewHole_offsetY, vBellowsScrewHole_offsetZ])
    rotate([0, 90, 0])
        cylinder(d=vBellowsScrewHole_d, h=vBellowsScrewHole_h);
translate([vBellowsScrewHole_offsetX, vBellowsScrewHole_offsetY, vBellowsScrewHole_offsetZ])
    rotate([0, 90, 0])
        cylinder(d=vBellowsScrewHole_d, h=vBellowsScrewHole_h);

// horizontal screwholes
translate([vBellowsScrewHole_offsetY, -vBellowsScrewHole_offsetX, vBellowsScrewHole_offsetZ])
    rotate([90, 0, 0])
        cylinder(d=vBellowsScrewHole_d, h=vBellowsScrewHole_h);
translate([-vBellowsScrewHole_offsetY, -vBellowsScrewHole_offsetX, vBellowsScrewHole_offsetZ])
    rotate([90, 0, 0])
        cylinder(d=vBellowsScrewHole_d, h=vBellowsScrewHole_h);

// sinkings for the bellows screws
// vertical
translate([vBellowsScrewHole_offsetX, vBellowsScrewHole_offsetY, vBellowsScrewHole_offsetZ])
    rotate([0, 90, 0])
        cylinder(d1=vBellowsScrewSinking_d1, h=vBellowsScrewSinking_h);
translate([vBellowsScrewHole_offsetX, -vBellowsScrewHole_offsetY, vBellowsScrewHole_offsetZ])
    rotate([0, 90, 0])
        cylinder(d1=vBellowsScrewSinking_d1, h=vBellowsScrewSinking_h);
translate([-vBellowsScrewHole_offsetX, vBellowsScrewHole_offsetY, vBellowsScrewHole_offsetZ])
    rotate([0, -90, 0])
        cylinder(d1=vBellowsScrewSinking_d1, h=vBellowsScrewSinking_h);
translate([-vBellowsScrewHole_offsetX, -vBellowsScrewHole_offsetY, vBellowsScrewHole_offsetZ])
    rotate([0, -90, 0])
        cylinder(d1=vBellowsScrewSinking_d1, h=vBellowsScrewSinking_h);

// horizontal
translate([vBellowsScrewHole_offsetY, -vBellowsScrewHole_offsetX, vBellowsScrewHole_offsetZ])
    rotate([90, 0, 0])
        cylinder(d1=vBellowsScrewSinking_d1, h=vBellowsScrewSinking_h);
translate([-vBellowsScrewHole_offsetY, -vBellowsScrewHole_offsetX, vBellowsScrewHole_offsetZ])
    rotate([90, 0, 0])
        cylinder(d1=vBellowsScrewSinking_d1, h=vBellowsScrewSinking_h);
translate([vBellowsScrewHole_offsetY, vBellowsScrewHole_offsetX, vBellowsScrewHole_offsetZ])
    rotate([-90, 0, 0])
        cylinder(d1=vBellowsScrewSinking_d1, h=vBellowsScrewSinking_h);
translate([-vBellowsScrewHole_offsetY, vBellowsScrewHole_offsetX, vBellowsScrewHole_offsetZ])
    rotate([-90, 0, 0])
        cylinder(d1=vBellowsScrewSinking_d1, h=vBellowsScrewSinking_h);

// axis holes
translate([vAxisHole_offsetX, vAxisHole_offsetY, vAxisHole_offsetZ])
    rotate([-90, 0, 0])
        cylinder(d=vAxisHole_d, h=vAxisHole_h);
        
translate([vAxisHole_offsetX, -vAxisHole_offsetY, vAxisHole_offsetZ])
    rotate([90, 0, 0])
        cylinder(d=vAxisHole_d, h=vAxisHole_h);

// tilt lock bolt holes
translate([vTiltLockBolt_offsetX, vTiltLockBolt_offsetY, vTiltLockBolt_offsetZ])
        rotate([-90, 0, 0])
            cylinder(d=vTiltLockBoltHole_d, h=vTiltLockBoltHole_h);
    translate([vTiltLockBolt_offsetX, -vTiltLockBolt_offsetY, vTiltLockBolt_offsetZ])
        rotate([90, 0, 0])
            cylinder(d=vTiltLockBoltHole_d, h=vTiltLockBoltHole_h);



// holes for clamp screws
translate([-vClampHole_offsetX, -vClampHole_offsetY, vClampHole_offsetZ])
    cylinder(d=vClampHole_d, h=vClampHole_h);
translate([-vClampHole_offsetX, vClampHole_offsetY, vClampHole_offsetZ])
    cylinder(d=vClampHole_d, h=vClampHole_h);
translate([vClampHole_offsetX, -vClampHole_offsetY, vClampHole_offsetZ])
    cylinder(d=vClampHole_d, h=vClampHole_h);
translate([vClampHole_offsetX, vClampHole_offsetY, vClampHole_offsetZ])
    cylinder(d=vClampHole_d, h=vClampHole_h);

};


// cylinder(d1=105, d2=85, h=4, $fn=4);