// some variables
$fn = 120; // we are using 60 fragments for cylinders and similar objects

vTolerance_length = 1;
vTolerance_width = 0.2;
vTolerance_height = 0.2;
vTolerance_diameter = 0.2;

vLeverBasePlate_length = 20;
vLeverBasePlate_width = 15;
vLeverBasePlate_height = 3;
vLeverBasePlate_offsetX = 0;
vLeverBasePlate_offsetY = -10;
vLeverBasePlate_offsetZ = 0;

vLockingBolt_length = 4;
vLockingBolt_width = 2;
vLockingBolt_radius = vLockingBolt_width;
vLockingBolt_height = vLeverBasePlate_height;
vLockingBolt_offsetX = vLeverBasePlate_length-vLockingBolt_length;
vLockingBolt_offsetY = vLeverBasePlate_offsetY-vLockingBolt_width;
vLockingBolt_offsetZ = 0;

vPullingLever_length = 30;
vPullingLever_width = 7;
vPullingLever_height = vLeverBasePlate_height;
vPullingLever_offsetX = 0;
vPullingLever_offsetY = -2;
vPullingLever_offsetZ = 0;

vPullingGrip_length = 5;
vPullingGrip_width = vPullingLever_width;
vPullingGrip_height = vLeverBasePlate_height+15;
vPullingGrip_offsetX = vPullingLever_length-vPullingGrip_length;
vPullingGrip_offsetY = vPullingLever_offsetY;
vPullingGrip_offsetZ = 0;
vPullingGripWedge_length = vPullingGrip_length;
vPullingGripWedge_width = -2;
vPullingGripWedge_height = vPullingGrip_height;
vPullingGripWedge_offsetX = vPullingLever_length;
vPullingGripWedge_offsetY = vPullingLever_offsetY;
vPullingGripWedge_offsetZ = 0;

vSpringLever_d1 = 6;
vSpringLever_d2 = 2;
vSpringLever_h = vLeverBasePlate_height;
vSpringLever_offsetX = vLeverBasePlate_length-(vSpringLever_d1/2);
vSpringLever_offsetY = 5;
vSpringLever_offsetZ = 0;


vBoltHole_d = 8+vTolerance_diameter;
vBoltHole_h = vLeverBasePlate_height;
vBoltHole_offsetX = 0;
vBoltHole_offsetY = 0;
vBoltHole_offsetZ = 0;


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

translate([vSpringLever_offsetX, vSpringLever_offsetY, vSpringLever_offsetZ])
    cylinder(d1=vSpringLever_d1, d2=vSpringLever_d2, h=vSpringLever_h);
translate([vSpringLever_offsetX, vSpringLever_offsetY, vSpringLever_offsetZ])
    cylinder(d1=vSpringLever_d2, d2=vSpringLever_d1, h=vSpringLever_h);

difference(){
    union(){
            translate([vLeverBasePlate_offsetX, vLeverBasePlate_offsetY, vLeverBasePlate_offsetZ])
                cube([vLeverBasePlate_length, vLeverBasePlate_width, vLeverBasePlate_height]);
            
            // rounded back
            translate([vLeverBasePlate_offsetX, 0, vLeverBasePlate_offsetZ])
                cylinder(h=vLeverBasePlate_height, d=vLeverBasePlate_length);    
            
            // locking bolt
            translate([vLockingBolt_offsetX, vLockingBolt_offsetY, vLockingBolt_offsetZ])
                cube([vLockingBolt_length, vLockingBolt_width, vLockingBolt_height]);
            translate([vLockingBolt_offsetX+vLockingBolt_radius, vLockingBolt_offsetY, vLockingBolt_offsetZ])
                cylinder(h=vLockingBolt_height, r=vLockingBolt_width);
            
            // pulling lever
            translate([vPullingLever_offsetX, vPullingLever_offsetY, vPullingLever_offsetZ])
                cube([vPullingLever_length, vPullingLever_width, vPullingLever_height]);
        
            translate([vPullingGripWedge_offsetX, vPullingGripWedge_offsetY, vPullingGripWedge_offsetZ])
                rotate([0, 0, 90])
                    wedge(vPullingGripWedge_width, vPullingGripWedge_length, vPullingGripWedge_height);

            translate([vPullingGrip_offsetX, vPullingGrip_offsetY, vPullingGrip_offsetZ])
                cube([vPullingGrip_length, vPullingGrip_width, vPullingGrip_height]);
                
            
            
        };
    translate([vBoltHole_offsetX, vBoltHole_offsetY, vBoltHole_offsetZ])
                cylinder(h=vBoltHole_h, d=vBoltHole_d); 

};