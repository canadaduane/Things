// cylinder 97mm long, 25.5mm radius
// cylinder 11.5mm radius

module body_loop(bottle_r = 21.5, thickness=2) {
	union() {
		difference() {
			linear_extrude(height=2,center=true) {
				hull() {
					circle(bottle_r+3,$fn=64);
					translate([(bottle_r*2)/2,0,0])
						square(12,center=true);
				}
			}
			cylinder(r=bottle_r,h=3,center=true,$fn=64);
		}
		translate([bottle_r+6-thickness/2,0,2])
			cube([thickness,12,2.1],center=true);
	}
}

body_loop(21.5,1.75);