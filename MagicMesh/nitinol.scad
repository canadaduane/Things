wire_diameter = 0.644;
wire_sheath = 1.0-wire_diameter-0.25;
sheath = wire_diameter+wire_sheath;
sheath_length = 4.0;
pixel = 1.0;

module sheath() {
	// rotate([0,0,45]) {
	cube([sheath_length,sheath,sheath],center=true);
	rotate([0,90,0])
		cylinder(r=wire_diameter/2,h=10,$fn=24);
	// }
}

module part() {
	rotate([0,45,0]) {
		intersection() {
			rotate([0,0,45])
				sheath();
			rotate([0,45,0])
				cube([pixel,pixel,pixel],center=true);
		}

		rotate([0,0,45])
			translate([2,0,0])
				sheath();

		translate([0,pixel/2,0]) {
			rotate([0,45,0]) {
				difference() {
					cube([pixel,pixel*2,pixel],center=true);
					cube([
						pixel-0.44,
						pixel*2,
						pixel-0.44],center=true);
				}
			}
		}
	}
}

for(y=[0:2]) {
	for(x=[0:2]) {
		translate([x*2,0,y])
			part();
		translate([x*2+1,0,y])
			rotate([0,180,0])
				part();
	}
}