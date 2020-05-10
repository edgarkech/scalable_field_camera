// loading the base configuration
include <baseconfig.scad>;

// some modules such as hex, countersunk screws, roof, wedge are available in a module file
use <modules.scad>;


vLeverBasePlate_length = 20;
vLeverBasePlate_width = 15;
vLeverBasePlate_height = 4;
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
vPullingGripWedge_width = -3;
vPullingGripWedge_height = vPullingGrip_height;
vPullingGripWedge_offsetX = vPullingLever_length;
vPullingGripWedge_offsetY = vPullingLever_offsetY;
vPullingGripWedge_offsetZ = vPullingGrip_height;

vSpringLever_d1 = 6;
vSpringLever_d2 = 2;
vSpringLever_h = vLeverBasePlate_height;
vSpringLever_offsetX = vLeverBasePlate_length-(vSpringLever_d1/2);
vSpringLever_offsetY = 5;
vSpringLever_offsetZ = 0;


vBoltHole_d = 8+vTolerance;
vBoltHole_h = vLeverBasePlate_height;
vBoltHole_offsetX = 0;
vBoltHole_offsetY = 0;
vBoltHole_offsetZ = 0;




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
                rotate([0, 90, 90])
                    wedge(vPullingGripWedge_height, vPullingGripWedge_length, vPullingGripWedge_width);

            translate([vPullingGrip_offsetX, vPullingGrip_offsetY, vPullingGrip_offsetZ])
                cube([vPullingGrip_length, vPullingGrip_width, vPullingGrip_height]);
                
            
            
        };
    translate([vBoltHole_offsetX, vBoltHole_offsetY, vBoltHole_offsetZ])
                cylinder(h=vBoltHole_h, d=vBoltHole_d); 

};