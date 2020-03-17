// some variables
$fn = 60; // we are using 60 fragments for cylinders and similar objects

vTolerance_length = 1;
vTolerance_width = 0.2;
vTolerance_height = 0.2;
vTolerance_diameter = 0.2;

vBoltPlate_length = 20;
vBoltPlate_width = 50;
vBoltPlate_height = 1.5;
vBoltPlate_offsetX = -vBoltPlate_length/2;
vBoltPlate_offsetY = -vBoltPlate_width/2;
vBoltPlate_offsetZ = 0;

/*
vCentralPlate_length = 30;
vCentralPlate_width = 25;
vCentralPlate_height = vBoltPlate_height;
vCentralPlate_offsetX = -10;
vCentralPlate_offsetY = -vCentralPlate_width/2;
vCentralPlate_offsetZ = 0;
*/

vBolt_diameter = 8-vTolerance_diameter;
vBolt_height = vBoltPlate_height+5;
vBolt_offsetX = 0;
vBolt_offsetY = vBoltPlate_offsetY;
vBolt_offsetZ = 0;

vCentralBlock_length = 30;
vCentralBlock_width = 25;
vCentralBlock_height = vBoltPlate_height+4+vTolerance_height;
vCentralBlock_offsetX = -10;
vCentralBlock_offsetY = -vCentralBlock_width/2;
vCentralBlock_offsetZ = 0;

vSpringHole_d = 1.5;
vSpringHole_h = vCentralBlock_width;
vSpringHole_offsetX = 0;
vSpringHole_offsetY = vCentralBlock_width/2;
//vSpringHole_offsetZ = vCentralBlock_height-vSpringHole_d;
vSpringHole_offsetZ = 3.5;

vCentralHole_d = 12;
vCentralHole_h = vBoltPlate_height;
vCentralHole_offsetX = 10;
vCentralHole_offsetY = 0;
vCentralHole_offsetZ = 0;

vCentralScrewHexNut_keywidth = 8+vTolerance_width;
vCentralScrewHexNut_height = 6;
vCentralScrewHexNut_offsetX = 10;
vCentralScrewHexNut_offsetY = 0;
vCentralScrewHexNut_offsetZ = 0;

vLeverBoltScrewHole_d1 = 4;
vLeverBoltScrewHole_d2 = 2;
vLeverBoltScrewHole_h = vBolt_height;
vLeverBoltScrewHole_f = vLeverBoltScrewHole_d1/2;
vLeverBoltScrewHole_offsetX = 0;
vLeverBoltScrewHole_offsetY = 25;
vLeverBoltScrewHole_offsetZ = 0;

// lever plate screw holes
vLeverPlateScrewHole_d1 = 4;
vLeverPlateScrewHole_d2 = 2;
vLeverPlateScrewHole_f = vLeverPlateScrewHole_d1/2;
vLeverPlateScrewHole_h = vBolt_height;
vLeverPlateScrewHole_offsetX1 = -5;
vLeverPlateScrewHole_offsetX2 = 15;
vLeverPlateScrewHole_offsetY = 7.5;
vLeverPlateScrewHole_offsetZ = 0;


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
 
 
    





// temporary objects

module hex(kw, h) {
	render() translate([0, 0, h/2]) intersection_for(a = [0, 120, 240]) {
		rotate([0, 0, a]) cube([kw, 3 * kw, h], true);
	}
}
//hex(10, 5);

difference(){
    union(){
        // front slider base
        translate([vBoltPlate_offsetX, vBoltPlate_offsetY, vBoltPlate_offsetZ])
            cube([vBoltPlate_length, vBoltPlate_width, vBoltPlate_height]);
        
        // rounded sides
        translate([vBolt_offsetX, vBolt_offsetY, vBolt_offsetZ])
            cylinder(h=vBoltPlate_height, d=vBoltPlate_length);
        
        translate([vBolt_offsetX, -vBolt_offsetY, vBolt_offsetZ])
            cylinder(h=vBoltPlate_height, d=vBoltPlate_length);
         
        // bolts
        translate([vBolt_offsetX, vBolt_offsetY, vBolt_offsetZ])
            cylinder(h=vBolt_height, d=vBolt_diameter);
        
        translate([vBolt_offsetX, -vBolt_offsetY, vBolt_offsetZ])
            cylinder(h=vBolt_height, d=vBolt_diameter);
        
        // central plate
        translate([vCentralBlock_offsetX, vCentralBlock_offsetY, vCentralBlock_offsetZ])
            cube([vCentralBlock_length, vCentralBlock_width, vCentralBlock_height]);
        

    };
    translate([vCentralScrewHexNut_offsetX, vCentralScrewHexNut_offsetY, vCentralScrewHexNut_offsetZ])
        hex(vCentralScrewHexNut_keywidth, vCentralScrewHexNut_height);
    
    // spring hole in central block
    translate([vSpringHole_offsetX, vSpringHole_offsetY, vSpringHole_offsetZ])
        rotate([90, 0, 0])
            cylinder(d=vSpringHole_d, h=vSpringHole_h );
    
    // lever plate screw holes
    translate([vLeverPlateScrewHole_offsetX1, -vLeverPlateScrewHole_offsetY, vLeverPlateScrewHole_offsetZ])
        cylinder(d=vLeverPlateScrewHole_d2, h=vLeverPlateScrewHole_h);
    translate([vLeverPlateScrewHole_offsetX1, +vLeverPlateScrewHole_offsetY, vLeverPlateScrewHole_offsetZ])
        cylinder(d=vLeverPlateScrewHole_d2, h=vLeverPlateScrewHole_h);
    translate([vLeverPlateScrewHole_offsetX2, -vLeverPlateScrewHole_offsetY, vLeverPlateScrewHole_offsetZ])
        cylinder(d=vLeverPlateScrewHole_d2, h=vLeverPlateScrewHole_h);
    translate([vLeverPlateScrewHole_offsetX2, +vLeverPlateScrewHole_offsetY, vLeverPlateScrewHole_offsetZ])
        cylinder(d=vLeverPlateScrewHole_d2, h=vLeverPlateScrewHole_h);
    
    // lever bolt screw holes
    translate([vLeverBoltScrewHole_offsetX, -vLeverBoltScrewHole_offsetY, vLeverBoltScrewHole_offsetZ])
        cylinder(d=vLeverBoltScrewHole_d2, h=vLeverBoltScrewHole_h);
    translate([vLeverBoltScrewHole_offsetX, +vLeverBoltScrewHole_offsetY, vLeverBoltScrewHole_offsetZ])
        cylinder(d=vLeverBoltScrewHole_d2, h=vLeverBoltScrewHole_h);
        
        
        
    // bevels for all screw holes
    // lever plate screw holes
    translate([vLeverPlateScrewHole_offsetX1, -vLeverPlateScrewHole_offsetY, vLeverPlateScrewHole_offsetZ])
        cylinder(d1=vLeverPlateScrewHole_d1, d2=vLeverPlateScrewHole_d2, h=vLeverPlateScrewHole_f);
    translate([vLeverPlateScrewHole_offsetX1, +vLeverPlateScrewHole_offsetY, vLeverPlateScrewHole_offsetZ])
        cylinder(d1=vLeverPlateScrewHole_d1, d2=vLeverPlateScrewHole_d2, h=vLeverPlateScrewHole_f);
    translate([vLeverPlateScrewHole_offsetX2, -vLeverPlateScrewHole_offsetY, vLeverPlateScrewHole_offsetZ])
        cylinder(d1=vLeverPlateScrewHole_d1, d2=vLeverPlateScrewHole_d2, h=vLeverPlateScrewHole_f);
    translate([vLeverPlateScrewHole_offsetX2, +vLeverPlateScrewHole_offsetY, vLeverPlateScrewHole_offsetZ])
        cylinder(d1=vLeverPlateScrewHole_d1, d2=vLeverPlateScrewHole_d2, h=vLeverPlateScrewHole_f);
    
    // lever bolt screw holes
    translate([vLeverBoltScrewHole_offsetX, -vLeverBoltScrewHole_offsetY, vLeverBoltScrewHole_offsetZ])
        cylinder(d1=vLeverBoltScrewHole_d1, d2=vLeverBoltScrewHole_d2, h=vLeverBoltScrewHole_f);
    translate([vLeverBoltScrewHole_offsetX, +vLeverBoltScrewHole_offsetY, vLeverBoltScrewHole_offsetZ])
        cylinder(d1=vLeverBoltScrewHole_d1, d2=vLeverBoltScrewHole_d2, h=vLeverBoltScrewHole_f);

    
};