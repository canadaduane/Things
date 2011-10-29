//use <MCAD/regular_shapes.scad>

module rounded(radius) {
	difference() {
		cube([radius*2,radius*2,20], center=true);
		translate([radius,radius,0])
			cylinder(r=radius,h=21,center=true, $fn=25);
	}
}

module toy3_shape()
{
	linear_extrude(height=15,center=true,convexity=0,twist=0) {
		circle(r=34, $fn=3);
	}
}

module toy4_shape()
{
	cube([49,49,15],center=true);	
}

module hole()
{
	cylinder(r=8.5,h=20,center=true);
}

module toy3_with_hole() {
	difference() {
		toy3_shape();
		hole();
	}
}

module toy4_with_hole() {
	difference() {
		toy4_shape();
		hole();
	}
}

module toy3() {
	difference() {
		rotate([0,0,30])
		toy3_with_hole();

		translate([0, -33.3, 0])
		rotate([0,0,45])
		rounded(2);

		rotate([0,0,120])
		translate([0, -33.3, 0])
		rotate([0,0,45])
		rounded(2);

		rotate([0,0,240])
		translate([0, -33.3, 0])
		rotate([0,0,45])
		rounded(2);
	}
}

module toy4() {
	toy4_with_hole();
}

toy4();