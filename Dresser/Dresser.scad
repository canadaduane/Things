
module drawer()
{
	union()
	{
		import("FaceBoard.stl",convexity=2);

		translate([0,0,-1.5])
		scale([1.0,1.0,0.4])
		sphere(r=2,$fn=30);

		translate([0,0,-2.8])
		cylinder(r1=2,r2=1,h=2,$fn=30,center=true);

		translate([0,0,-4])
		scale([1.0,1.0,0.2])
		sphere(r=3,$fn=30);

		difference()
		{
			translate([0,0,28])
				cube([56,16,56],center=true);
			
			translate([0,-1,27])
				cube([52,14,54],center=true);
		}
	}
}


// translate([0,-21,0])
// 	drawer();

translate([0,0,0])
	drawer();

// translate([0,21,0])
// 	drawer();

