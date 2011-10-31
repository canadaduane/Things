// cylinder 97mm long, 25.5mm radius
// cylinder 11.5mm radius

module neck_loop(neck_r=12,thickness=1.75) {
	union() {
		difference() {
			linear_extrude(height=thickness,center=true) {
				hull() {
					circle(neck_r+3);
					translate([(neck_r*2+21)/2,0,0])
						square(12,center=true);
				}
			}
			cylinder(r=neck_r,h=3,center=true);
		}
		translate([neck_r+11.5+6-thickness-0.14,0,2])
			cube([thickness,12,2],center=true);
	}
}

neck_loop(12, 1.6);