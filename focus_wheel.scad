
$fn=60;

vFocusWheel_d = 20;
vFocusWheel_h = 14.8;
vThread_d = 5;
vThread_h = vFocusWheel_h;

vThreadNut_d = 7;
vThreadNut_h = 6;
vThreadNut_offsetZ = 2;

vStopNut_d = 10.2;
vStopNut_h = 6;
vStopNut_offsetZ = vThreadNut_offsetZ+vThreadNut_h;

vEdgecut = 1;


vLowerSegment_d1 = vFocusWheel_d - 2*vEdgecut;
vLowerSegment_d2 = vFocusWheel_d;
vLowerSegment_h = vEdgecut;
vLowerSegment_offsetZ = 0;

vMidSegment_d = vFocusWheel_d;
vMidSegment_h = vFocusWheel_h - 2*vEdgecut;
vMidSegment_offsetZ = vLowerSegment_h;

vUpperSegment_d1 = vFocusWheel_d;
vUpperSegment_d2 = vFocusWheel_d - 2*vEdgecut;
vUpperSegment_h = vEdgecut;
vUpperSegment_offsetZ = vLowerSegment_h+vMidSegment_h;

vLockingScrewHole_d = 3;
vLockingScrewHole_h = vFocusWheel_d/2;
vLockingScrewHole_offsetZ = vThreadNut_offsetZ+vThreadNut_h+vStopNut_h/2;

vCutout_l = vFocusWheel_h;
vCutout_w = 4;
vCutout_h = 2;
vCutout_offsetX = vFocusWheel_d/2;
vCutout_offsetY = -vCutout_w/2;
vCutout_offsetZ = 0;


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
    



difference(){
    union(){
        cylinder(d1=vLowerSegment_d1, d2=vLowerSegment_d2, h=vLowerSegment_h);

        translate([0, 0, vMidSegment_offsetZ])
        cylinder(d=vMidSegment_d, h=vMidSegment_h);   
           
        translate([0, 0, vUpperSegment_offsetZ])   
        cylinder(d1=vUpperSegment_d1, d2=vUpperSegment_d2, h=vUpperSegment_h); 
    };    
    
    // thread hole
    cylinder(d=vThread_d, h=vThread_h);
    
    // thread nut hole
    translate([0, 0, vThreadNut_offsetZ])
        cylinder(d=vThreadNut_d, h=vThreadNut_h);
    
    // stop nut hole
    translate([0, 0, vStopNut_offsetZ])
        cylinder(d=vStopNut_d, h=vStopNut_h+3);
    
    // locking screw hole
    translate([0, 0, vLockingScrewHole_offsetZ])
        rotate([0,90, 0])
            cylinder(d=vLockingScrewHole_d, h=vLockingScrewHole_h);
    
    
    for (i=[0:5]){
    rotate([0, 0, i*30])    
        union(){
        translate([vCutout_offsetX, vCutout_offsetY, vCutout_offsetZ])
            rotate([0, 270, 0])
                roof(vCutout_l, vCutout_w, vCutout_h);

        translate([-vCutout_offsetX, vCutout_offsetY, vCutout_offsetZ])
            rotate([0, 270, 0])
                roof(vCutout_l, vCutout_w, -vCutout_h);
        };
    };
    

};
