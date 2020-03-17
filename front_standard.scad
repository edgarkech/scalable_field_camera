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
vFrontStandartBasePlate_d1 = 110; // maybe subtract tolerance here?
vFrontStandartBasePlate_d2 = vFrontStandartBasePlate_d1-(2*vDovetail_length);
vFrontStandartBasePlate_length = 40; // we are intersecting our cylinder with a cube!
vFrontStandartBasePlate_width = vFrontStandartBasePlate_d1;
vFrontStandartBasePlate_h1 = vDovetail_height;
vFrontStandartBasePlate_h2 = vDovetail_height;
vFrontStandartBasePlate_height = vFrontStandartBasePlate_h1+vFrontStandartBasePlate_h1;
vFrontStandartBasePlate_offsetX = 0;
vFrontStandartBasePlate_offsetY = 0;
vFrontStandartBasePlate_offsetZ = 0;

vCentralScrewHole_d = 6+2*vTolerance_width;
vCentralScrewHole_h = vFrontStandartBasePlate_height;
vCentralScrewHole_offsetX = 0;
vCentralScrewHole_offsetY = 0;
vCentralScrewHole_offsetZ = 0;

vFrontStandartTiltPlate_length = 25;
vFrontStandartTiltPlate_width = 120;
vFrontStandartTiltPlate_height = 10;

vFrontStandartTiltPlate_offsetX = -vFrontStandartTiltPlate_length/2;
vFrontStandartTiltPlate_offsetY = -vFrontStandartTiltPlate_width/2;
vFrontStandartTiltPlate_offsetZ = 0;

vTiltDoveTail_d1 = vFrontStandartBasePlate_d2+(2*vTolerance_width);
vTiltDoveTail_d2 = vTiltDoveTail_d1+(2*vDovetail_length)+(2*vTolerance_width);
vTiltDovetail_h = vDovetail_height;

vUprightHolder_length = vFrontStandartTiltPlate_length;
vUprightHolder_width = 10;
vUprightHolder_height = 15;
vUprightHolderLeft_offsetX = vFrontStandartTiltPlate_offsetX;
vUprightHolderLeft_offsetY = -vFrontStandartTiltPlate_offsetY;
vUprightHolderRight_offsetX = -vFrontStandartTiltPlate_offsetX;
vUprightHolderRight_offsetY = vFrontStandartTiltPlate_offsetY;
vUprightHolder_offsetZ = vFrontStandartTiltPlate_height;

vUpright_length = vFrontStandartTiltPlate_length;
vUpright_width = 5;
vUpright_height = 140;
vUprightSlotCutout_length = 5+vTolerance_width;
vUprightSlotCutout_width = vFrontStandartTiltPlate_width+(2*vUpright_width);
vUprightSlotCutout_height = 60;
vUprightLeft_offsetX = vFrontStandartTiltPlate_offsetX;
vUprightRight_offsetX = vFrontStandartTiltPlate_offsetX;
vUprightLeft_offsetY = vFrontStandartTiltPlate_width/2;
vUprightRight_offsetY = -(vFrontStandartTiltPlate_width/2)-vUpright_width;
vUprightSlotCutout_offsetX = -vUprightSlotCutout_length/2;
vUprightSlotCutout_offsetY = -vUprightSlotCutout_width/2;
vUprightSlotCutout_offsetZ = 70;

vPullingLeverCutout_length = 5;
vPullingLeverCutout_width = 60;
vPullingLeverCutout_height = vFrontStandartBasePlate_height;
vPullingLeverCutout_offsetX = -vFrontStandartTiltPlate_offsetX-vPullingLeverCutout_length;
vPullingLeverCutout_offsetY = -vPullingLeverCutout_width/2;
vPullingLeverCutout_offsetZ = 0;




/*
vUprightScrewHole_diameter = 2;
vUprightScrewHole_height = vFrontStandartTiltPlate_width;
vUprightScrewHole_offsetX = 5;
vUprightScrewHole_offsetY = -vFrontStandartTiltPlate_offsetY;
vUprightScrewHole_offsetZ = vFrontStandartTiltPlate_height+vUprightScrewHole_diameter;
*/




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
        translate([vFrontStandartTiltPlate_offsetX, vFrontStandartTiltPlate_offsetY, vFrontStandartTiltPlate_offsetZ])
            cube([vFrontStandartTiltPlate_length, vFrontStandartTiltPlate_width, vFrontStandartTiltPlate_height]);
        // left upright holder
        translate([vUprightHolderLeft_offsetX, vUprightHolderLeft_offsetY, vUprightHolder_offsetZ])
            rotate([0, 270, 180])
                wedge(vUprightHolder_height, vUprightHolder_width, vUprightHolder_length);

        // right upright holder
        translate([vUprightHolderRight_offsetX, vUprightHolderRight_offsetY, vUprightHolder_offsetZ])
            rotate([0, 270, 0])
                wedge(vUprightHolder_height, vUprightHolder_width, vUprightHolder_length);
        // left upright 
        translate([vUprightLeft_offsetX, vUprightLeft_offsetY, 0])
            cube([vUpright_length, vUpright_width, vUpright_height]);
        
        // right upright
        translate([vUprightRight_offsetX, vUprightRight_offsetY, 0])
            cube([vUpright_length, vUpright_width, vUpright_height]);
        };
        
    // cutout for the dovetail itself
    cylinder(d1=vTiltDoveTail_d1, d2=vTiltDoveTail_d2, h=vTiltDovetail_h);
    // a little bit tolerance
    translate([0, 0, vTiltDovetail_h])
        cylinder(d=vTiltDoveTail_d2, h=vTolerance_height);

    // central screw hole
    cylinder(d=vCentralScrewHole_d, h=vFrontStandartTiltPlate_height);
    
    // cutout for upright slot
    translate([vUprightSlotCutout_offsetX, vUprightSlotCutout_offsetY, vUprightSlotCutout_offsetZ])
        cube([vUprightSlotCutout_length, vUprightSlotCutout_width, vUprightSlotCutout_height]);
       
    // cutout for pulling levers
    translate([vPullingLeverCutout_offsetX, vPullingLeverCutout_offsetY, vPullingLeverCutout_offsetZ])
        cube([vPullingLeverCutout_length, vPullingLeverCutout_width, vPullingLeverCutout_height]); 
    // rounding the cutout edges
    translate([-vFrontStandartTiltPlate_offsetX, vPullingLeverCutout_offsetY, vPullingLeverCutout_offsetZ])
        cylinder(r=vPullingLeverCutout_length, h=vPullingLeverCutout_height);   
    translate([-vFrontStandartTiltPlate_offsetX, -vPullingLeverCutout_offsetY, vPullingLeverCutout_offsetZ])
        cylinder(r=vPullingLeverCutout_length, h=vPullingLeverCutout_height); 
    
    /*
    // screw holes for the uprights
    translate([-vUprightScrewHole_offsetX, vUprightScrewHole_offsetY, vUprightScrewHole_offsetZ])
        rotate([90, 0, 0])
            cylinder(d=vUprightScrewHole_diameter, h=vUprightScrewHole_height);

    translate([vUprightScrewHole_offsetX, vUprightScrewHole_offsetY, vUprightScrewHole_offsetZ])
        rotate([90, 0, 0])
            cylinder(d=vUprightScrewHole_diameter, h=vUprightScrewHole_height);    
    */

};