// Leg endings for the Eyler-Werve couch

$fn=64;
difference() {
	difference() {
		cylinder(r1=20,r2=23,h=15,center=true);
		translate([0,0,-2.5])
			cylinder(r1=12,r2=10,h=10,center=true);
	}
	difference() {
		cube([100,100,100],center=true);
		translate([0,0,-50])
			cylinder(r1=50,r2=1,h=100);
	}
}