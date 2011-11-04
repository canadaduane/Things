module belt() {
	difference() {
		translate([-7,-17,0])
			cube([14,7,10]);
		rotate([0,0,-135]) {
			difference() {
				cube([15,15,7]);
				minkowski() {
					cube([11,11,7]);
					cylinder(r=1,$fn=16);
				}
			}
		}
	}
}

belt();