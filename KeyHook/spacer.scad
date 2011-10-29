
difference() {
	union() {
		translate([0,0,4])
			cylinder(r=3.5,h=1,center=true);
		cylinder(r=2.0,h=8,center=true);
	}
	cylinder(r=1.2,h=10,center=true,$fn=7);
}
