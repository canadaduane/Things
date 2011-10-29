
// import("Pliers_Left.STL");

// translate([0,0,-30])
// import("Pliers_Right.STL");

difference()
{
	union()
	{
		translate([0,0,0])
			cylinder(r=20,h=2);
		difference()
		{
			union()
			{
				translate([0,0,2])
					cylinder(r1=10,r2=8,h=2);
				translate([0,0,4])
					cylinder(r1=8,r2=10,h=2);
			}
			translate([0,0,2+5])
			{
				cube([50,2,10],center=true);
				rotate([0,0,90])
					cube([50,2,10],center=true);
			}
		}
	}
	translate([0,0,0])
		cylinder(r1=8,r2=4,h=4);
	translate([0,0,4])
		cylinder(r1=4,r2=6,h=2);
}
