module trim()
{
	translate([-5,0,0])
	difference()
	{
		cube([10,100,3],center=true);

		translate([5-6,0,0+2])
			rotate([90,0,0])
				cylinder(r=6,h=110,center=true,$fn=30);
	}
}

module face(w,h,d)
{
	smudge=0.0001;

	difference()
	{
		cube([w,h,d],center=true);
		translate([w/2,0,0])
			trim();
		translate([-(w/2+smudge),0,0])
			rotate([0,0,180])
				trim();
		translate([0,(h/2+smudge),0])
			rotate([0,0,90])
				trim();
		translate([0,-(h/2+smudge),0])
			rotate([0,0,270])
				trim();
	}
}

face(60,20,3);