golden = 1.61803399;
w = 180;
h = w/golden/4;
d = 8;
hook_r = 7.5;

//%cube([w, h, d], center=true);

module plate(w, h, d, end_squish=0.66) {
	difference() {
		minkowski() {
			linear_extrude(height=d-6, center=true) {
				hull() {
					translate([-w/2+end_squish*h/2,0,0])
						scale([end_squish,1,1])
							circle(h/2);
					translate([w/2-end_squish*h/2,0,0])
						scale([end_squish,1,1])
							circle(h/2);
				}
			}
			sphere(r=3,$fn=12);
		}

		translate([-w/2+end_squish*h/2,0,0])
			cylinder(r=2.5,h=d*2,center=true);

		translate([w/2-end_squish*h/2,0,0])
			cylinder(r=2.5,h=d*2,center=true);
	}
}

module hook(d, r) {
	difference() {
		union() {
			translate([0,0,0])
				cylinder(r=r,h=d,center=true);
			translate([0,0,d/2])
				cylinder(r1=r,r2=r+1,h=2,center=true);
			translate([0,0,d/2+1])
				cylinder(r1=r+1,r2=r+2,h=1,center=true);
			translate([0,0,d/2+1.5])
				cylinder(r1=r+1,r2=r+2,h=1,center=true);
			translate([0,0,d/2+2])
				cylinder(r=r+2,h=1,center=true);
		}
		translate([-r*3/2,0,-d*3/2])
			cube([r*3,r*3,d*3]);
	}
}

hook_d = hook_r/golden;

union() {
	translate([0,hook_r/2,hook_d/2+4]) {

		translate([-w/2+w/5*1,0,0])
			hook(hook_d, hook_r);

		translate([-w/2+w/5*2,0,0])
			hook(hook_d, hook_r);

		translate([-w/2+w/5*3,0,0])
			hook(hook_d, hook_r);

		translate([-w/2+w/5*4,0,0])
			hook(hook_d, hook_r);

	}

	plate(w,h,d);	
}
// hook(hook_d, hook_r);