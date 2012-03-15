use <ToyShapes.scad>

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


