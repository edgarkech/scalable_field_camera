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

vTotalPlate_length = 140;
vTotalPlate_height = 12;

vDovetail_length = vTotalPlate_length;
vDovetailOuter_width = 50;
vDovetailInner_width = 40;
vDovetail_height = (vDovetailOuter_width-vDovetailInner_width)/2;
vDovetail_offsetX = 0;
vDovetail_offsetY = -vDovetailOuter_width/2;
vDovetail_offsetZ = 0;

vDovetailEdgeCutoff = 3;

vArca_length = 120;
vArca_width = 39;
vArca_height = 7;
vArcaBase_cutout = 3;
vArcaBase_height = 1;
vArca_offsetX = 0;
vArca_offsetY = -vArca_width/2;
vArca_offsetZ = vDovetail_height+vArca_height;

vArcaEdgeCutoff = 3;


vLockingCylinder_d1 = 20;
vLockingCylinder_d2 = 10;
vLockingCylinder_h = 8;
vLockingCylinder_offsetX = vTotalPlate_length-10;
vLockingCylinder_offsetY = 0;
vLockingCylinder_offsetZ = 0;

// we are using a M5x6x7 thread nut!
vLockingThreadHole_d = 7;
vLockingThreadHole_h = 6;
vLockingThreadHole_offsetX = vLockingCylinder_offsetX;
vLockingThreadHole_offsetY = vLockingCylinder_offsetY;
vLockingThreadHole_offsetZ = vLockingCylinder_offsetZ;

vLockingHole_d = 5.2;
vLockingHole_h = vTotalPlate_height;
vLockingHole_offsetX = vLockingCylinder_offsetX;
vLockingHole_offsetY = vLockingCylinder_offsetY;
vLockingHole_offsetZ = vLockingCylinder_offsetZ;


difference(){
    union(){
        // Dovetail plate
        translate([vDovetail_offsetX, vDovetail_offsetY, vDovetail_offsetZ])
            difference(){
                intersection(){
                    roof(vDovetail_length, vDovetailOuter_width, vDovetailOuter_width/2);
                    cube([vDovetail_length, vDovetailOuter_width, vDovetail_height]);
                };
                // cut off dovetail edges
                translate([0, 0, 0])
                    wedge(vDovetailEdgeCutoff, vDovetailEdgeCutoff, vDovetail_height);
                translate([vDovetail_length, 0, 0])
                    wedge(-vDovetailEdgeCutoff, vDovetailEdgeCutoff, vDovetail_height);
                translate([0, vDovetailOuter_width, 0])
                    wedge(vDovetailEdgeCutoff, -vDovetailEdgeCutoff, vDovetail_height);
                translate([vDovetail_length, vDovetailOuter_width, 0])
                    wedge(-vDovetailEdgeCutoff, -vDovetailEdgeCutoff, vDovetail_height);
                
            };
        
        // Arca plate    
        translate([vArca_offsetX, vArca_offsetY, vArca_offsetZ])
            mirror([0,0,1])
                difference(){
                    union(){
                        cube([vArca_length, vArca_width, vArcaBase_height ]);
                        translate([0, 0, vArcaBase_height])
                            roof(vArca_length, vArca_width, vArca_width/2);
                        translate([0,0,vArcaBase_height+vArcaBase_cutout])
                            cube([vArca_length, vArca_width, vArca_width]);
                    };
                    translate([0,0,vArca_height])
                        cube([vArca_length, vArca_width, vArca_width]);
                    
                    // cut off edges
                    translate([0, 0, 0])
                        wedge(vArcaEdgeCutoff, vArcaEdgeCutoff, vArca_height);
                    translate([vArca_length, 0, 0])
                        wedge(-vArcaEdgeCutoff, vArcaEdgeCutoff, vArca_height);
                    translate([0, vArca_width, 0])
                        wedge(vArcaEdgeCutoff, -vArcaEdgeCutoff, vArca_height);
                    translate([vArca_length, vArca_width, 0])
                        wedge(-vArcaEdgeCutoff, -vArcaEdgeCutoff, vArca_height);
                    
                };
        
        // Cylinder for locking mechanism
        translate([vLockingCylinder_offsetX, vLockingCylinder_offsetY, vLockingCylinder_offsetZ])
            cylinder(d1=vLockingCylinder_d1, d2=vLockingCylinder_d2, h=vLockingCylinder_h);
                
    };
    // Hole for thread nut
        translate([vLockingThreadHole_offsetX, vLockingThreadHole_offsetY, vLockingThreadHole_offsetZ])
            cylinder(d=vLockingThreadHole_d, h=vLockingThreadHole_h);
    
    // ScrewHole
        translate([vLockingHole_offsetX, vLockingHole_offsetY, vLockingHole_offsetZ])
            cylinder(d=vLockingHole_d, h=vLockingHole_h);
    
};