// some variables
$fn = 120; // we are using 60 fragments for cylinders and similar objects

vTolerance_length = 1;
vTolerance_width = 0.2;
vTolerance_height = 0.2;
vTolerance_diameter = 0.2;

// we will use the same "module" size for out dovetails
vDovetail_length = 5;
vDovetail_height = 5;

// base plate
vFrontStandartBasePlate_d1 = 110-vTolerance_diameter; // maybe subtract tolerance here?
vFrontStandartBasePlate_d2 = vFrontStandartBasePlate_d1-(2*vDovetail_length)-vTolerance_diameter;
vFrontStandartBasePlate_length = 40; // we are intersecting our cylinder with a cube!
vFrontStandartBasePlate_width = vFrontStandartBasePlate_d1;
vFrontStandartBasePlate_h1 = vDovetail_height;
vFrontStandartBasePlate_h2 = vDovetail_height;
vFrontStandartBasePlate_height = vFrontStandartBasePlate_h1+vFrontStandartBasePlate_h1;
vFrontStandartBasePlate_offsetX = 0;
vFrontStandartBasePlate_offsetY = 0;
vFrontStandartBasePlate_offsetZ = 0;

vLowerDovetail_length = vFrontStandartBasePlate_length;
vLowerDovetail_outerwidth = vFrontStandartBasePlate_width-(4*vDovetail_length)+vTolerance_width;
vLowerDovetail_innerwidth = vLowerDovetail_outerwidth-(2*vDovetail_length);
vLowerDovetail_offsetX = -vLowerDovetail_outerwidth/2;
vLowerDovetail_offsetY = -vLowerDovetail_length/2;
vLowerDovetail_offsetZ = vDovetail_height;

vCentralScrewHole_d = 5+2*vTolerance_width;
vCentralScrewHole_h = vFrontStandartBasePlate_height;
vCentralScrewHole_offsetX = 0;
vCentralScrewHole_offsetY = 0;
vCentralScrewHole_offsetZ = 0;

vCentralScrewHexNut_keywidth = 8+vTolerance_width;
vCentralScrewHexNut_height = 6;
vCentralScrewHexNut_offsetX = 0;
vCentralScrewHexNut_offsetY = 0;
vCentralScrewHexNut_offsetZ = vFrontStandartBasePlate_height-vCentralScrewHexNut_height;

vLeverBoltHole_d = 8+vTolerance_diameter;
vLeverBoltHole_h = vFrontStandartBasePlate_height;
vLeverBoltHole_offsetX = -10;
vLeverBoltHole_offsetY = 25;
vLeverBoltHole_offsetZ = 4;

vLeverBoltScrewHole_d = 1.2;
vLeverBoltScrewHole_h = vFrontStandartBasePlate_height;
vLeverBoltScrewHole_offsetX = -10;
vLeverBoltScrewHole_offsetY = 25;
vLeverBoltScrewHole_offsetZ = 0;

// lever plate screw holes
vLeverPlateScrewHole_d = 1.2;
vLeverPlateScrewHole_h = vFrontStandartBasePlate_height;
vLeverPlateScrewHole_offsetX1 = -15;
vLeverPlateScrewHole_offsetX2 = 5;
vLeverPlateScrewHole_offsetY = 7.5;
vLeverPlateScrewHole_offsetZ = 0;


vLeverCutout_length = 10;
vLeverCutout_width = 80;
vLeverCutout_height = vFrontStandartBasePlate_height;
vLeverCutout_offsetX = (vFrontStandartBasePlate_length/2)-vLeverCutout_length;
vLeverCutout_offsetY = -vLeverCutout_width/2;
vLeverCutout_offsetZ = 0;

vLeverCutoutHoles_d = 2*vLeverCutout_length;
vLeverCutoutHoles_h = vLeverCutout_height;
vLeverCutoutHoles_offsetX = vLeverCutout_offsetX+(vLeverCutoutHoles_d/2);
vLeverCutoutHoles_offsetY = vLeverCutout_offsetY;
vLeverCutoutHoles_offsetZ = 0;


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
    difference(){
        // front standart base plate
        intersection(){
            union(){
                cylinder(d1=vFrontStandartBasePlate_d1, d2=vFrontStandartBasePlate_d2, h=vFrontStandartBasePlate_h1);
                cylinder(d=vFrontStandartBasePlate_d2, h=vFrontStandartBasePlate_height);
            };
            translate([-vFrontStandartBasePlate_length/2, -vFrontStandartBasePlate_width/2, 0])
                cube([vFrontStandartBasePlate_length, vFrontStandartBasePlate_width, vFrontStandartBasePlate_height]);    
        };    

        
        // cutout for lower dovetail
        translate([0, 0, vFrontStandartBasePlate_h1])
        union(){
            translate([-vLowerDovetail_length/2, -vLowerDovetail_outerwidth/2, 0])
                cube([vLowerDovetail_length, vLowerDovetail_outerwidth, vTolerance_height]);
            translate([-vLowerDovetail_length/2, -vLowerDovetail_innerwidth/2, vTolerance_height])
                cube([vLowerDovetail_length, vLowerDovetail_innerwidth, vDovetail_height]);
            translate([vLowerDovetail_length/2, -vLowerDovetail_outerwidth/2, vTolerance_height])
                rotate([0, 0, 90])
                    roof(2*vDovetail_length, vLowerDovetail_length, vDovetail_height);
            translate([-vLowerDovetail_length/2, vLowerDovetail_outerwidth/2, vTolerance_height])
                rotate([0, 0, 270])
                    roof(2*vDovetail_length, vLowerDovetail_length, vDovetail_height);
        };
        
        
    };
    
    };
    


    // central screw hole
    translate([vCentralScrewHole_offsetX, vCentralScrewHole_offsetY, vCentralScrewHole_offsetZ])
        cylinder(d=vCentralScrewHole_d, h=vCentralScrewHole_h);
    
    translate([vCentralScrewHexNut_offsetX, vCentralScrewHexNut_offsetY, vCentralScrewHexNut_offsetZ])
        hex(vCentralScrewHexNut_keywidth, vCentralScrewHexNut_height);
    
    // holes for lever bolts
    // outer
    translate([vLeverBoltHole_offsetX, -vLeverBoltHole_offsetY, vLeverBoltHole_offsetZ])
        cylinder(d=vLeverBoltHole_d, h=vLeverBoltHole_h);
    translate([vLeverBoltHole_offsetX, +vLeverBoltHole_offsetY, vLeverBoltHole_offsetZ])
        cylinder(d=vLeverBoltHole_d, h=vLeverBoltHole_h);
    
    // lever bolt screw holes
    translate([vLeverBoltScrewHole_offsetX, -vLeverBoltScrewHole_offsetY, vLeverBoltScrewHole_offsetZ])
        cylinder(d=vLeverBoltScrewHole_d, h=vLeverBoltScrewHole_h);
    translate([vLeverBoltScrewHole_offsetX, +vLeverBoltScrewHole_offsetY, vLeverBoltScrewHole_offsetZ])
        cylinder(d=vLeverBoltScrewHole_d, h=vLeverBoltScrewHole_h);
    
    // lever plate screw holes
    translate([vLeverPlateScrewHole_offsetX1, -vLeverPlateScrewHole_offsetY, vLeverPlateScrewHole_offsetZ])
        cylinder(d=vLeverPlateScrewHole_d, h=vLeverPlateScrewHole_h);
    translate([vLeverPlateScrewHole_offsetX1, +vLeverPlateScrewHole_offsetY, vLeverPlateScrewHole_offsetZ])
        cylinder(d=vLeverPlateScrewHole_d, h=vLeverPlateScrewHole_h);
    translate([vLeverPlateScrewHole_offsetX2, -vLeverPlateScrewHole_offsetY, vLeverPlateScrewHole_offsetZ])
        cylinder(d=vLeverPlateScrewHole_d, h=vLeverPlateScrewHole_h);
    translate([vLeverPlateScrewHole_offsetX2, +vLeverPlateScrewHole_offsetY, vLeverPlateScrewHole_offsetZ])
        cylinder(d=vLeverPlateScrewHole_d, h=vLeverPlateScrewHole_h);
    
     
    // cutout for locking levers
    translate([vLeverCutout_offsetX, vLeverCutout_offsetY, vLeverCutout_offsetZ])
        cube([vLeverCutout_length, vLeverCutout_width, vLeverCutout_height]);
    translate([vLeverCutoutHoles_offsetX, vLeverCutoutHoles_offsetY, vLeverCutoutHoles_offsetZ])    
        cylinder(d=vLeverCutoutHoles_d, h=vLeverCutoutHoles_d );
    translate([vLeverCutoutHoles_offsetX, -vLeverCutoutHoles_offsetY, vLeverCutoutHoles_offsetZ])    
        cylinder(d=vLeverCutoutHoles_d, h=vLeverCutoutHoles_d );
    
};