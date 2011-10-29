// 31mm top
//  * 10mm - 4mm (hole) - 3mm - 4mm (hole) - 10mm
// 60mm bottom (edge side)
// 19mm bottom to top

module tetragon(p1, p2, p3, p4, h=1) {
    linear_extrude(height=h,center=true) {
        polygon(
            points=[p1, p2, p3, p4],
            paths=[[0,1,2,3]]
        );
    }
}

//%cube([10,10,2],center=true);
difference() {
	// Same shape as the blade:
	union() {
		tetragon([-31/2,0],[31/2,0],[60/2,19],[-60/2,19], 3);
		// Blade connection piece
		translate([0,-5,0])
			tetragon([-31/2,0],[31/2,0],[38.5/2,10],[-38.5/2,10], 3);
		// Handle
		difference() {
			translate([0,-35,0]) {
				difference() {
					// Rounded handle
					minkowski() {
						cube([29,60,0.5],center=true);
						sphere(r=2,$fn=12);
					}
					// Carve top
					translate([0,0,4])
						rotate([-0.9,0,0])
							cube([35,64,4],center=true);
					// Carve oval left
					translate([28,13.5,-2.5])
						scale([0.5,1,1])
							linear_extrude(height=10)
								circle(r=30,$fn=64);
					// Carve oval right
					translate([-28,13.5,-2.5])
						scale([0.5,1,1])
							linear_extrude(height=10)
								circle(r=30,$fn=64);
				}
			}
			translate([0,-25,-5-1.5])
				cube([100,100,10],center=true);
		}
	}


	translate([0,0,3.3]) {
		// Make the blade angle downward toward the surface
		rotate([-8,0,0]) {
			cube([60,60,4],center=true);
			// Also cut the blade holder in half
			translate([0,-14.5+30+19/2,0])
				cube([60,30,10],center=true);
			
			// Right-hand hole
			translate([3.5,2,0]) {
				cylinder(r=1.85,h=15,center=true, $fn=16);
				// With space for a nut on the back
				translate([0,0,-4.5])
					rotate([0,0,30])
						cylinder(r=3.5,h=3,center=true, $fn=6);
			}

			// Left-hand hole
			translate([-3.5,2,0]) {
				cylinder(r=1.85,h=15,center=true, $fn=16);
				// With space for a nut on the back
				translate([0,0,-4.5])
					rotate([0,0,30])
						cylinder(r=3.5,h=3,center=true, $fn=6);
			}
		}
	}
}