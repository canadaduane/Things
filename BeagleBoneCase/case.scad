wall_thickness=6.5;
base_thickness=2.0;
bb_depth=20;
bb_width=55.5;
bb_height=88.5;
bb_curve_corner=10;

peg_pow_front=16.0;
peg_pow_side=3.0;

peg_sd_front=6.5;
peg_sd_side=6.5;

peg_outer_radius=2.8;
peg_inner_radius=2.0;

module RoundedBB(extra_width,extra_height,depth,curve=bb_curve_corner) {
	minkowski() {
		cube([bb_width-curve+extra_width,bb_height-curve+extra_height,depth],center=true);
		cylinder(r=curve/2, height=depth, $fn=32);
	}
}

module BeagleBox(curve=bb_curve_corner) {
	difference() {
		RoundedBB(wall_thickness, wall_thickness, bb_depth, curve);
		translate([0,0,base_thickness])
			RoundedBB(0, 0, bb_depth, curve-2);
	}	
}

difference() {
	union() {
		difference() {
			BeagleBox();

			translate([0,0,-bb_depth/2+9]) {
				// -- Bottom End --

				// Power connector
				translate([18,-bb_height/2,2.5])
					cube([10,10,12],center=true);
				// Ethernet port
				translate([-2,-bb_height/2,3.5])
					cube([16.5,10,14],center=true);

				// Mini USB (Underneath)
				// translate([-23,-bb_height/2-5,-16])     // protruding
				// translate([-23,-bb_height/2,-9+0.334])  // thin layer underneath
				//	cube([10,12,base_thickness-0.3333]);
				translate([-22,-bb_height/2,-12])
					cube([10,10,10]);

				// -- Top End --

				// SD Card slot
				translate([-6.5,bb_height/2,-5.5])
					cube([12,10,2], center=true);
				// USB port
				translate([10.5,bb_height/2,1.5])
					cube([15,10,8],center=true);
			}
		}

		// Pegs
		translate([0,0,-bb_depth/2+9]) {
			// Pegs on "power" end
			translate([-bb_width/2+peg_pow_side,-bb_height/2+peg_pow_front,-6])
				cylinder(r=peg_outer_radius,h=2,$fn=32,center=true);
			translate([bb_width/2-peg_pow_side,-bb_height/2+peg_pow_front,-6])
				cylinder(r=peg_outer_radius,h=2,$fn=32,center=true);

			// Pegs on "sd card" end
			translate([-bb_width/2+peg_sd_side,bb_height/2-peg_sd_front,-6])
				cylinder(r=peg_outer_radius,h=2,$fn=32,center=true);
			translate([bb_width/2-peg_sd_side,bb_height/2-peg_sd_front,-6])
				cylinder(r=peg_outer_radius,h=2,$fn=32,center=true);
		}
	}

	// Drill holes through pegs and floor
	translate([0,0,-bb_depth/2+9]) {
		// Pegs on "power" end
		translate([-bb_width/2+peg_pow_side,-bb_height/2+peg_pow_front,-5])
			cylinder(r=peg_inner_radius,h=10,$fn=32,center=true);
		translate([bb_width/2-peg_pow_side,-bb_height/2+peg_pow_front,-5])
			cylinder(r=peg_inner_radius,h=10,$fn=32,center=true);

		// Pegs on "sd card" end
		translate([-bb_width/2+peg_sd_side,bb_height/2-peg_sd_front,-5])
			cylinder(r=peg_inner_radius,h=10,$fn=32,center=true);
		translate([bb_width/2-peg_sd_side,bb_height/2-peg_sd_front,-5])
			cylinder(r=peg_inner_radius,h=10,$fn=32,center=true);
	}
}