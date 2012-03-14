module clip(length, faces) {
    difference() {
        union() {
            cube([length,20,5],center=true);
            translate([-length/2,0,0])
                cylinder(r=10,h=5,center=true,$fn=faces);
            translate([length/2,0,0])
                cylinder(r=10,h=5,center=true,$fn=faces);
        }
        translate([-length/2,0,0])
            cylinder(r=4.5,h=7,center=true,$fn=faces);
        translate([length/2,0,0])
            cylinder(r=4.5,h=7,center=true,$fn=faces);
        
        translate([-length/2,5,0]) {
            linear_extrude(height=9,center=true) {
                polygon(
                    points=[[-4.5,-5],[4.5,-5],[2.9,5],[-2.9,5]],
                    paths=[[0,1,2,3]]
                );
            }
        }

        translate([length/2,5,0]) {
            linear_extrude(height=9,center=true) {
                polygon(
                    points=[[-4.5,-5],[4.5,-5],[3.1,5],[-3.1,5]],
                    paths=[[0,1,2,3]]
                );
            }
        }

        linear_extrude(height=9,center=true) {
            polygon(
                points=[[-length/2+10,-7],[length/2-10,-7],[length/2-9,7],[-length/2+9,7]],
                paths=[[0,1,2,3]]
            );
        }
    }
        
}