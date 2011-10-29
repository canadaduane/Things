// use <MCAD/regular_shapes.scad>

module lineup(num, xspace, yspace, zspace) {
  for (i = [0 : num-1])
    translate([ xspace*i, yspace*i, zspace*i ]) child(0);
}

module rounded(radius)
{
	difference()
	{
		cube([radius*2,radius*2,500], center=true);
		translate([radius,radius,0])
			cylinder(r=radius,h=501,center=true, $fn=25);
	}
}

module pole_shape(height)
{
	cylinder(r=7.5,h=height,center=true);
}

module pole(height)
{
	translate([0,0,height/2])
	difference() {
		union() {
			pole_shape(height);
			translate([0,0,height/2])
				sphere(r=7.5,center=true);
		}
		translate([0,0,-height/2])
			cube([30,2,12],center=true);
	}
}

module toy1_shape()
{
	cylinder(r=24.5,h=15,center=true);
}

module toy2_shape()
{
	cube([33,49,15],center=true);
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

module toy5_shape()
{
	cylinder(r=27,h=15,$fn=5,center=true);
}

module hole()
{
	cylinder(r=8.5,h=20,center=true);
}

module toy1_with_hole()
{
	difference()
	{
		toy1_shape();
		hole();
	}	
}

module toy2_with_hole()
{
	difference()
	{
		toy2_shape();
		hole();
	}	
}

module toy3_with_hole()
{
	difference()
	{
		toy3_shape();
		hole();
	}
}

module toy4_with_hole()
{
	difference()
	{
		toy4_shape();
		hole();
	}
}

module toy5_with_hole()
{
	difference()
	{
		toy5_shape();
		hole();
	}
}

module toy1()
{
	toy1_with_hole();
}

module toy2()
{
	rotate([0,0,45])
	difference()
	{
		rotate([0,0,45])
			toy2_with_hole();
		
		translate([00, -35, 0])
			rotate([0,0,45])
				translate([8,0,0])
					rounded(4);

		rotate([0,0,90])
			translate([0, -35, 0])
				rotate([0,0,45])
					translate([0,8,0])
						rounded(4);
		
		rotate([0,0,180])
			translate([0, -35, 0])
				rotate([0,0,45])
					translate([8,0,0])
						rounded(4);

		rotate([0,0,270])
			translate([0, -35, 0])
				rotate([0,0,45])
					translate([0,8,0])
						rounded(4);
	}
}

module toy3()
{
	difference()
	{
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

module toy4()
{
	rotate([0,0,45])
	difference()
	{
		rotate([0,0,45])
			toy4_with_hole();
		
		translate([0, -35, 0])
			rotate([0,0,45])
				rounded(4);

		rotate([0,0,90])
			translate([0, -35, 0])
				rotate([0,0,45])
					rounded(4);
		
		rotate([0,0,180])
			translate([0, -35, 0])
				rotate([0,0,45])
					rounded(4);

		rotate([0,0,270])
			translate([0, -35, 0])
				rotate([0,0,45])
					rounded(4);
	}
}

module toy5()
{
	difference() {
		rotate([0,0,18])
			toy5_with_hole();

		translate([0, 28, 0])
			rotate([0,0,225])
				rounded(4);
		
		rotate([0,0,72.5])
			translate([0, 28, 0])
				rotate([0,0,225])
					rounded(4);

		rotate([0,0,144])
			translate([0, 28, 0])
				rotate([0,0,225])
					rounded(4);

		rotate([0,0,216])
			translate([0, 28, 0])
				rotate([0,0,225])
					rounded(4);

		rotate([0,0,288])
			translate([0, 28, 0])
				rotate([0,0,225])
					rounded(4);
	}
}

module base_solid()
{
	difference()
	{
		// Big base board
		cube([330,55,17],center=true);
		
		// Hollow out the holes for the poles
		translate([0,0,5]) {
			translate([-140,0,0])			
				cylinder(r=7.5,h=20,center=true);
			translate([-70,0,0])			
				cylinder(r=7.5,h=20,center=true);
			translate([0,8,0])			
				cylinder(r=7.5,h=20,center=true);
			translate([70,0,0])			
				cylinder(r=7.5,h=20,center=true);
			translate([140,0,0])			
				cylinder(r=7.5,h=20,center=true);
		}

		// Round the 4 corners
		translate([-166,-28,0])
			rotate([0,0,0])
				rounded(5);
		translate([-166,28,0])
			rotate([0,0,270])
				rounded(5);
		translate([166,28,0])
			rotate([0,0,180])
				rounded(5);
		translate([166,-28,0])
			rotate([0,0,90])
				rounded(5);
	}
}

module base_half(top)
{
	extended = 50;
	translate([0,0,top*(8.5)+sign(top)*(extended/2)])
		cube([340,65,17+extended],center=true);
}

module joint(x,y,z,x2,y2,z2,top,mirr)
{
	l = 500;
	union()
	{
		difference()
		{
			// Chop the base in to two
			intersection()
			{
				child(0);
				translate([x-(mirr*l/2),y,z])
					cube([l,l,l],center=true);
			}

			intersection()
			{	
				child(0);
				translate([x+(mirr*x2),y+y2,z+z2])
					child(1);
				translate([x,y,z-(top*l/2)])
					cube([l,l,l],center=true);
			}
		}
		intersection()
		{	
			child(0);
			translate([x-(mirr*x2),y-y2,z-z2])
				child(1);
			translate([x,y,z+(top*l/2)])
				cube([l,l,l],center=true);
		}
	}
}

module joint_volume()
{
	difference()
	{
		rotate([0,0,45])
			cube([28,28,100],center=true);
		rotate([0,0,0])
			translate([0,-20,0])
				rotate([0,0,45])
					rounded(5);
		rotate([0,0,90])
			translate([0,-20,0])
				rotate([0,0,45])
					rounded(5);
		rotate([0,0,180])
			translate([0,-20,0])
				rotate([0,0,45])
					rounded(5);
		rotate([0,0,270])
			translate([0,-20,0])
				rotate([0,0,45])
					rounded(5);
	}
}

module base()
{
	chop_inner = 35;
	chop_outer = 105;

	// Left-end
	joint(-chop_outer,0,0, -5,0,0, 1,1)
	{
		base_solid();
		joint_volume();
	}

	// Left-middle
	translate([0,0,-40])
	union()
	{
		intersection()
		{
			joint(-chop_inner,0,0, -5,0,0, 1,1)
			{
				base_solid();
				joint_volume();
			}
			translate([250-70,0,0])
				cube([500,500,500],center=true);
		}

		difference()
		{
			joint(-chop_outer,0,0, -5,0,0, -1,-1)
			{
				base_solid();
				joint_volume();
			}
			translate([250-70,0,0])
				cube([500,500,500],center=true);
		}		
	}

	// // Middle (joints on both left and right-hand sides, bottom extending out)
	translate([0,0,-80])
	union()
	{
		difference()
		{
			joint(chop_inner,0,0, -5,0,0, -1,1)
			{
				base_solid();
				joint_volume();
			}
			translate([-250,0,0])
				cube([500,500,500],center=true);
		}

		translate([0.0001,0,0]) // Make sure this is a 2-manifold object for STL export
		{
			difference()
			{
				joint(-chop_inner,0,0, -5,0,0, -1,-1)
				{
					base_solid();
					joint_volume();
				}
				translate([250,0,0])
					cube([500,500,500],center=true);
			}
		}
	}

	// // Right-middle
	translate([0,0,-40])
	union()
	{
		intersection()
		{
			joint(chop_inner,0,0, -5,0,0, 1,-1)
			{
				base_solid();
				joint_volume();
			}
			translate([-250+70,0,0])
				cube([500,500,500],center=true);
		}

		difference()
		{
			joint(chop_outer,0,0, -5,0,0, -1,1)
			{
				base_solid();
				joint_volume();
			}
			translate([-250+70,0,0])
				cube([500,500,500],center=true);
		}		
	}

	// // Right-end
	joint(chop_outer,0,0, -5,0,0, 1,-1)
	{
		base_solid();
		joint_volume();
	}
}

// base();

translate([-140,0,0])
{
	translate([0,0,20])
		pole(107-15*4);
	
	translate([0,0,160-15*4])
		toy1();
}

translate([-70,0,0])
{
	translate([0,0,20])
		pole(107-15*3);
	
	translate([0, 0, 160-15*3])
		lineup(2, 0, 0, 20)
			toy2();
}

translate([0,0,0])
{
	translate([0,8,20])
		pole(107-15*2);

	translate([0, 0, 160-15*2])
		// lineup(3, 0, 0, 20)
			toy3();
}

translate([70,0,0]) {
	translate([0,0,20])
		pole(107-15*1);

	translate([0, 0, 160-15*1])
		lineup(4, 0, 0, 20)
			toy4();
}

translate([140,0,0])
{
	translate([0,0,20])
		pole(107-15*0);

	translate([0, 0, 160-15*0])
		lineup(5, 0, 0, 20)
			toy5();
}


