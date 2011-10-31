// cylinder 97mm long, 25.5mm radius
// cylinder 11.5mm radius

use <body_loop.scad>

module groove(w=2.5,d=12) {
	difference() {
		cube([w*3,w*3,d],center=true);
		translate([-26,0.8,0])
			rotate([90,0,0])
				scale([1,2,1])
					body_loop();
	}
}
// len=170;
module longpiece(len=10, w=2.5, d=12) {
	cube([w,len,d],center=true);

	translate([-(w*3)/2,(len-w*3)/2,0])
		groove(w);
	
	translate([-(w*3)/2,(len-w)/2-80,0])
		groove(w);
}


module hanger(hang_w=15, hang_len=30, w=2.5, d=12) {
	linear_extrude(height=d,center=true) {
		translate([0,-hang_len/2])
			square([hang_w,w],center=true);

		translate([hang_w/2,-hang_len/2+5]) {
			square([w,10],center=true);
			translate([0,5])
				scale([0.5,1])
					circle(w,$fn=16);
			translate([0,-5])
				circle(w/2,$fn=12);
		}

		translate([-hang_w/2-0.2,-hang_len/2])
			circle(w/2,$fn=12);

		translate([-hang_w/2+5,-0.5,0])
			rotate([0,0,-20])
				square([w,hang_len],center=true);
	}
}

longpiece(140);
translate([1,-83,0])
	hanger(22);