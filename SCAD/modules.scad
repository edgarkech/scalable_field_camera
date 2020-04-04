/*
This is a collection of the modules which are used heavily within the whole project.
Almost all parts rely on the modules to remain "as is", especially regarding their current orientation.
So please act very carefully here, otherwise you may screw up the complete design!

*/

// roof module - this is heavily used for dovetail cutouts
// please keep as is
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

// a wedge module - this is heavily used for cutting edges
// please keep as is    
module wedge(l, w, h) {
    polyhedron(
            points=[
                [0,0,0],
                [l,0,0],
                [l,w,0],
                [0,w,0],
                [0,0,h],
                [l,0,h]
            ],
            faces=[
                [0,3,2,1],
                [0,1,5,4],
                [1,2,5],
                [2,3,4,5],
                [3,0,4]
            ]
    );
   };

// simple tube module.   
module tube(d1, d2, h) {
    difference() {
        cylinder(d=d1, h=h);
        cylinder(d=d2, h=h);
        };
    };

// mainly used for making holes for countersunk screws
// please keep as is    
module countersunk_screw(vScrew_d, vScrew_l){
    union(){
    cylinder(d=vScrew_d, h= vScrew_l);
    cylinder(d1=vScrew_d*2, h=vScrew_d);
    };
};

// module for making hexagons, e.g. hex nuts. kw is the key width
// please keep as is
module hex(kw, h) {
	render()
        translate([0, 0, h/2])
            intersection_for(a = [0, 120, 240]) {
                rotate([0, 0, a])
                    cube([kw, 3 * kw, h], true);
                }
}

