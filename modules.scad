
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
module tube(d1, d2, h) {
    difference() {
        cylinder(d=d1, h=h);
        cylinder(d=d2, h=h);
        };
    };

module countersunk_screw(vScrew_d, vScrew_l){
    union(){
    cylinder(d=vScrew_d, h= vScrew_l);
    cylinder(d1=vScrew_d*2, h=vScrew_d);
    };
};



