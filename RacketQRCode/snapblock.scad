
module square_pyramid(base_x, base_y,height)
{
  w=base_x/2;
  h=base_y/2;
  polyhedron(points=[[-w,-h,0],[-w,h,0],[w,h,0],[w,-h,0],[0,0,height]],triangles=[[0,3,2,1], [0,1,4], [1,2,4], [2,3,4], [3,0,4]]);
}

width=8.5;
height=8.5;
depth=4.0;

cylrad = 0.6;
squish = 0.75;

module block(w=8,h=8,d=4) {
	twist=0;
	top_bottom_twist=twist;
	left_right_twist=twist;
	$fn=24;

	difference() {
		intersection() {
			//union() {
				intersection() {
					translate([0,0,0])
						square_pyramid(w,h,20);
					translate([0,0,0])
						rotate([0,0,45])
							square_pyramid(w*1.55,h*1.55,10);
				}
			//	translate([0,0,3/2])
			//		cube([w,h,3],center=true);
			//}
			translate([0,0,d/2])
				cube([w,h,d],center=true);
		}

			translate([0,0,1.3]) {
				// Bottom
			scale([1,1,squish])
				translate([0,h/2,0])
					rotate([0,90-top_bottom_twist,0])
						cylinder(r=cylrad/squish,h=w,center=true);
				// Top
			scale([1,1,squish])
				translate([0,-h/2,0])
					rotate([0,90+top_bottom_twist,0])
						cylinder(r=cylrad/squish,h=w,center=true);

				// Right
			scale([1,1,squish])
				translate([w/2,0,0])
					rotate([90-left_right_twist,0,0])
						cylinder(r=cylrad/squish,h=h,center=true);
				// Left
			scale([1,1,squish])
				translate([-w/2,0,0])
					rotate([90+left_right_twist,0,0])
						cylinder(r=cylrad/squish,h=h,center=true);
			}
		
	}
}

module block_connect(w=8,h=8,d=4) {
	block(w,h,d);
	translate([w/2,0,0])
		difference() {
			block(w,h,d);
			translate([0,0,d/2+1.3-cylrad/squish/2-0.15])
				cube([w,h,d],center=true);
		}
}

// union() {
// 	union() {
// 		for (x=[0:3])
// 			translate([width*x,0,0])
// 				block_connect(width,height);
// 	}

// 	union() {
// 		rotate([0,0,270])
// 		for (x=[0:3])
// 			translate([width*x,width*4,0])
// 				block_connect(width,height);
// 	}

// 	union() {
// 		rotate([0,0,180])
// 		for (x=[0:3])
// 			translate([width*x-width*4,width*4,0])
// 				block_connect(width,height);
// 	}

// 	union() {
// 		rotate([0,0,90])
// 		for (x=[0:3])
// 			translate([width*x-width*4,0,0])
// 				block_connect(width,height);
// 	}
// }



// length=3;
// union() {
// 	for (x=[0:(length-2)])
// 		translate([width*x,0,0])
// 			block_connect(width,height);
// 	translate([width*(length-1),0,0])
// 		block(width,height);
// }

// block(width,height);

// L-shape
// union() {
// 	for (x=[0:7])
// 		translate([width*x,0,0])
// 			block_connect(width,height);
// }

// union() {
// 	rotate([0,0,270]) {
// 		for (x=[0:7])
// 			translate([width*x,width*8,0])
// 				block_connect(width,height);
// 		translate([width*8,width*8,0])
// 			block(width,height);
// 	}
// }

module line(length=3, angle=0, end=1) {
	rotate([0,0,angle]) {
		for (x=[1:length-end]) {
			translate([width*x,0,0])
					block_connect(width,height);	
		}
		if (end == 1) {
			translate([width*length,0,0])
				block(width,height);
		}
	}
}
// Box

module box(bw=3,bh=3) {
	translate([0,0,0])
		line(bw-1,0,0);
	translate([bw*width,-width,0])
		line(bh-1,90,0);
	translate([(bw+1)*width,(bh-1)*width,0])
		line(bw-1,180,0);
	translate([width,bh*width,0])
		line(bh-1,270,0);	
}

box(19,9);

// rotate([0,0,270]) {
// 	for (x=[0:bh-2])
// 		translate([width*x,width*(bw-1),0])
// 			block_connect(width,height);
// 	translate([width*(bw-1),width*(bw-1),0])
// 		block(width,height);
// }


