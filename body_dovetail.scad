// Screwholes for the stabilizing lid

$fn=60;


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







module countersunk_screw(vScrew_d, vScrew_l){
    union(){
    cylinder(d=vScrew_d, h= vScrew_l);
    cylinder(d1=vScrew_d*2, h=vScrew_d);
    };
}











vDovetailTolerance_width = 0.2;
vDovetailTolerance_height = 0.2;

// Screwholes for the stabilizing lid
vLidHole_d = 3;
vLidHole_h = 8;
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
vLidHoleRow_offsetX = (vLid_length-vLidHoleRow_length)/2;
vLidHoleRow_offsetY = vLidHoleDist_y/2;
vLidHoleRow_offsetZ = vLidTotal_height; 

vDovetail_length = vLid_length;
vDovetailOuter_width = 50+vDovetailTolerance_width;
vDovetailInner_width = 40+vDovetailTolerance_width;
vDovetail_offsetX = 0;
vDovetail_offsetY = -vDovetailOuter_width/2;
vDovetail_offsetZ = vLidBase_height;

vLockingHole_d = 5;
vLockingHole_h = vLidTotal_height;
vLockingHole_offsetX = 10;
vLockingHole_offsetY = 0;
vLockingHole_offsetZ = 0;


difference(){
    intersection(){
        translate([vLid_offsetX, vLid_offsetY, vLid_offsetZ])
            cube([vLid_length, vLid_width, vLidTotal_height]);
        translate([vLid_offsetX, vLid_offsetY, vLid_offsetZ])
            roof(vLid_length, vLid_width, vLid_width/2 );
    };
    
    // a little bit of height tolerance fro the dove tail
    translate([vDovetail_offsetX, vDovetail_offsetY, vDovetail_offsetZ])
        cube([vDovetail_length, vDovetailOuter_width, vDovetailTolerance_height]);
    
    // the dovetail itself
    translate([vDovetail_offsetX, vDovetail_offsetY, vDovetail_offsetZ+vDovetailTolerance_height])
        roof(vDovetail_length, vDovetailOuter_width, vDovetailOuter_width/2);
    
    // Holes for screwing the stabilizer lid
    translate([vLidHoleRow_offsetX, vLidHoleRow_offsetY, vLidHoleRow_offsetZ])
        mirror([0,0,1])
        for (i = [0:vLidHoleCount_x-1]){ 
            translate([i*vLidHoleDist_x, 0, 0])
            countersunk_screw(vLidHole_d, vLidHole_h);
        };
    translate([vLidHoleRow_offsetX, -vLidHoleRow_offsetY, vLidHoleRow_offsetZ])
        mirror([0,0,1])
        for (i = [0:vLidHoleCount_x-1]){ 
            translate([i*vLidHoleDist_x, 0, 0])
            countersunk_screw(vLidHole_d, vLidHole_h);
        };
    
    // Hole for Locking Screw
    translate([vLockingHole_offsetX, vLockingHole_offsetY, vLockingHole_offsetZ])
        cylinder(d=vLockingHole_d, h=vLockingHole_h);
    




};



/*
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
    
*/