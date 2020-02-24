// some variables
$fn = 120; // we are using 120 fragments for cylinders and similar objects

vTolerance_length = 0.2;
vTolerance_width = 0.2;
vTolerance_height = 0.2;
vTolerance_diameter = 0.2;

vFrontPlate_length = 113;
vFrontPlate_width = vFrontPlate_length;
vFrontPlate_height = 16;
vFrontPlate_offsetX = -vFrontPlate_length/2;
vFrontPlate_offsetY = -vFrontPlate_width/2;
vFrontPlate_offsetZ = 0;

vAxisBlock_d = vFrontPlate_height;
vAxisBlock_h = 120-vTolerance_width;
vAxisBlock_offsetX = vAxisBlock_d/2;
vAxisBlock_offsetY = vAxisBlock_h/2;
vAxisBlock_offsetZ = vAxisBlock_d/2;

vAxisHole_d = 5+vTolerance_diameter;
vAxisHole_h = 120;
vAxisHole_offsetX = 0;
vAxisHole_offsetY = vAxisHole_h/2;
vAxisHole_offsetZ = vAxisBlock_offsetZ;

vAxisNutHole_d = 7;
vAxisNutHole_h = 118;
vAxisNutHole_offsetX = 0;
vAxisNutHole_offsetY = vAxisNutHole_h/2;
vAxisNutHole_offsetZ = vAxisBlock_offsetZ;

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

vLensBoardCutout_length = 99.6;
vLensBoardCutout_width = 96.6;
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

// axis hole
translate([vAxisHole_offsetX, vAxisHole_offsetY, vAxisHole_offsetZ])
    rotate([90, 0, 0])
        cylinder(d=vAxisHole_d, h=vAxisHole_h);
translate([vAxisNutHole_offsetX, vAxisNutHole_offsetY, vAxisNutHole_offsetZ])
    rotate([90, 0, 0])
        cylinder(d=vAxisNutHole_d, h=vAxisNutHole_h);

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