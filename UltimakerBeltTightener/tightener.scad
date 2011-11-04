
difference() {
	cube([4,11,1]);
	translate([0,2,0.5])
		cube([1,7,0.5]);
	translate([2,2,0.5])
		cube([1,7,0.5]);
}
translate([0,11-2,1])
	cube([4,2,1]);
translate([0,0,1])
	cube([4,2,1]);