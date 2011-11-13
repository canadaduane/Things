module five_gon(p1, p2, p3, p4, p5, h=1) {
    linear_extrude(height=h,center=true) {
        polygon(
            points=[p1, p2, p3, p4, p5],
            paths=[[0,1,2,3,5]]
        );
    }
}

module rounded_elbow(angle, length, width=2, depth=10) {
	// translate([])
	adj = cos(angle/2) * length;
	opp = sin(angle/2) * length;
	bulk = (width/2)/cos(angle/2);
	extra = (width/4)/cos(angle/2);
	fudge = 0.9;

	union() {
		// Length of arm on right
		translate([adj/2,0,0])
			rotate([0,0,angle/2])
				cube([length,width,depth],center=true);
		// Length of arm on left
		translate([-adj/2,0,0])
			rotate([0,0,-angle/2])
				cube([length,width,depth],center=true);
		// Round cap on outside of connection
		translate([0,-opp/2,0])
			cylinder(r=width/2,h=depth,center=true,$fn=64);
		
		// Round cap on inside of connection
		translate([0,-opp/2+bulk,0]) {
			difference() {
				translate([0,extra/2*fudge,0])
					cube([extra,extra,depth],center=true);
				translate([0,extra,0])
					cylinder(r=width/4,h=depth*1.5,center=true,$fn=64);
			}
		}
	}
}

module belt() {
	difference() {
		translate([-7,-17,0])
			cube([14,7,10]);
		rotate([0,0,-135]) {
		}
	}
}

// belt();
difference() {
	cube([24,8,10],center=true);
	translate([0,1.2,2])
		rounded_elbow(45, 20, 2, 8);
}