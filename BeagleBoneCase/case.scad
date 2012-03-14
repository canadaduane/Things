wall_thickness=5.0;
base_thickness=2.0;
bb_depth=20;
bb_width=55.5;
bb_height=88.5;
bb_curve_corner=10;

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
	BeagleBox();

	translate([0,0,-bb_depth/2+9]) {
		// -- Bottom End --

		// Power connector
		translate([18,-bb_height/2,-0.5])
			cube([10,10,10],center=true);
		// Ethernet port
		translate([-2.75,-bb_height/2,1.5])
			cube([16.5,10,14],center=true);

		// Mini USB (Underneath)
		// translate([-23,-bb_height/2-5,-16])
		translate([-23,-bb_height/2,-9+0.334])
			cube([10,12,base_thickness-0.3333]);

		// -- Top End --

		// SD Card slot
		translate([-6,bb_height/2,-5.5])
			cube([12,10,2], center=true);
		// USB port
		translate([10.5,bb_height/2,1.5])
			cube([15,10,8],center=true);
	}
}