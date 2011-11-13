// 55 x 12.5

height = 10;
flange = 0.5;
flange_height=3;

hole_w = 52.5; // 55
hole_h = 11.25; //12.5

conn_h = 5;

difference() {
	
	union() {
		cube([hole_w,hole_h,height],center=true);
		translate([0,0,-height/2+7])
			minkowski() {
				cube([hole_w+0.5,hole_h+0.5,0.5],center=true);
				sphere(r=0.75,$fn=8);
			}

		translate([0,0,height/2]) {
			translate([0,0,conn_h/2])
				cube([hole_h,hole_h,conn_h],center=true);
		}

		translate([0,0,-height/2+flange_height/2]) {
			union() {
				translate([-hole_w/2+1.25-flange,0,0])
					multmatrix([ [1, 0, -0.2, 0], 
								 [0, 1, 0, 0],
								 [0, 0, 1, 0],
								 [0, 0, 0, 1] ])
						cube([2,hole_h,flange_height],center=true);
				translate([+hole_w/2-1.25+flange,0,0])
					multmatrix([ [1, 0, 0.2, 0], 
								 [0, 1, 0, 0],
								 [0, 0, 1, 0],
								 [0, 0, 0, 1] ])
						cube([2,hole_h,flange_height],center=true);
				translate([0,+hole_h/2-1.25+flange,0])
					multmatrix([ [1, 0, 0, 0], 
								 [0, 1, 0.2, 0],
								 [0, 0, 1, 0],
								 [0, 0, 0, 1] ])
						cube([hole_w,2,flange_height],center=true);
				translate([0,-hole_h/2+1.25-flange,0])
					multmatrix([ [1, 0, 0, 0], 
								 [0, 1, -0.2, 0],
								 [0, 0, 1, 0],
								 [0, 0, 0, 1] ])
						cube([hole_w,2,flange_height],center=true);
			}
		}
	}
	translate([0,0,height/2]) {
		translate([0,-2,0])
			cube([hole_h-4,hole_h-4,5],center=true);
	}
}

