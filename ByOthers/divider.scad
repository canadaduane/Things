// 230x310
// 115 x 103
drawer_divider(width=115, depth=103, height=60, internal_wall=3, external_wall=1.5, floor_thickness=1.125, floor=1);

module drawer_divider(width=76, depth=76, height=25, external_wall=1, internal_wall=2, x_compartments=2, y_compartments=2, floor_thickness=1, floor=0) {
	difference() {
		cube([width,depth,height]);
		translate([external_wall,external_wall,-1])
			cube([width-external_wall*2,depth-external_wall*2,height+2]);
	}
	for (x_comp=[1:x_compartments-1])
		translate([x_comp/x_compartments*(width-external_wall*2)-internal_wall/2+external_wall,0,0])
			cube([internal_wall,depth,height]);
	for (y_comp=[1:y_compartments-1])
		translate([0,y_comp/y_compartments*(depth-external_wall*2)-internal_wall/2+external_wall,0])
			cube([width,internal_wall,height]);
	if (floor==1)
		cube([width,depth,floor_thickness]);
}