
difference() {
	cylinder(r1=20,r2=23,h=15,center=true);
	translate([0,0,-2.5])
		cylinder(r=14,h=10,center=true);
}

translate([0,0,18]) {
	scale([4,4,4]) {
			translate([0,0,-1.5])
			scale([1.0,1.0,0.4])
			sphere(r=2,$fn=30);

			translate([0,0,-2.8])
			cylinder(r1=2,r2=1,h=2,$fn=30,center=true);
	}
}