// Parametric Herringbone Gear
// (C) 2011 Duane Johnson
// Released under the MIT License

// See http://en.wikipedia.org/wiki/Gear
module tooth_outline(dedendum, addendum, circular_thickness, topland_thickness)
{
	d2 = dedendum/2;
	a2 = addendum/2;
	ct = circular_thickness/2;
	tt = topland_thickness/2;

	polygon(points=[
		[-ct,d2], [-ct,-d2], [ct,-d2], [ct, d2],
		[ct-(ct-tt)*1/11, d2+a2/3*1], [ct-(ct-tt)*5/11, d2+a2/3*2], [tt, d2+a2/3*3],
		[-tt, d2+a2/3*3], [-ct+(ct-tt)*5/11, d2+a2/3*2], [-ct+(ct-tt)*1/11, d2+a2/3*1]
	]);
}

module tooth(base, height)
{
	// Center the tooth at the middle of the base
	translate([0,5,-height/2])
	linear_extrude(height=height)
		tooth_outline(10, 10, base, base/4);
}

module helical_gear(teeth, height, twist, segments)
{
	PI = 3.14159;
	Teeth = teeth;
	ToothBase = 10;
	GearHeight = height + 5;
	GearRadius = (Teeth*ToothBase)/(PI); // c = 2*pi*r, or r=c/(2*pi)

	TotalTwist = twist;
	Segments = segments;
	StepTwist = TotalTwist/Segments;
	SegmentDistZ = GearHeight/Segments;
	SegmentDistX = GearRadius*(StepTwist/180*PI);
	SegmentDistHyp = sqrt(SegmentDistX*SegmentDistX + SegmentDistZ*SegmentDistZ);
	SegmentHeight = SegmentDistZ; // Wrong
	SegmentAngle = -1 * sign(twist) * (90 - asin(SegmentDistZ/SegmentDistHyp));

	union()
	{
		// difference()
		// {
		// 	cylinder(r=GearRadius+1, h=height, center=true);
		// 	cylinder(r=GearRadius-5, h=height, center=true);
		// }

		intersection()
		{
			cylinder(r=GearRadius*2, h=height, center=true);
			translate([0, 0, -GearHeight/2])
			{
				for ( l = [ 0 : Segments ] )
				{
					translate([0, 0, SegmentDistZ*l])
					{
						for ( i = [ 0 : Teeth ] )
						{
							rotate([0, 0, (i / Teeth * 360) + (StepTwist * l)])
								translate([GearRadius, 0, 0])
									rotate([0, SegmentAngle, 270])
									// rotate([5, -20, 285])
										tooth(ToothBase, SegmentDistHyp);
						}
					}
				}
			}
		}
	}
}

union()
{
	// cylinder(r=180/3.14159, h=4, center=true);

	// translate([0,0,15])
		// helical_gear(18, 30, 15, 10);

	translate([0,0,-15])
		rotate([0,0,15])
			helical_gear(18, 30, -15, 10);
}
