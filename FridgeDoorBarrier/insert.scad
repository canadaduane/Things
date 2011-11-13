// 5 mm round bar

w=50;
h=11.25-4;
d=4.4;
tip=6;
rad=7;

difference() {
	union() {
		translate([-w/4,0,0])
			cube([w/2,h,d],center=true);
		linear_extrude(height=d,center=true) {
			hull() {
				translate([w/2-tip,0,0])
					circle(r=rad);
				translate([-w/2+rad/2+h,0,0])
					circle(r=rad);
			}
		}
			// minkowski() {
			// 	cube([w-6.5,h+4,d-6.5/2],center=true);
			// 	cylinder(r=1,h=d-6.5/2,center=true,$fn=16);
			// }
		// }
	}
	translate([w/2-tip,0,0])
		cylinder(r=2.5,h=12,center=true,$fn=32);
}