// cylinder 97mm long, 25.5mm radius
// cylinder 11.5mm radius

bottle_r = 21.5;
neck_r = 11.5;

// cylinder(r=bottle_r,h=97,center=true);
// translate([0,0,(97+10)/2])
// 	cylinder(r=neck_r,h=10,center=true);

cube([10,20,2],center=true);
translate([0,0,bottle_r+2])
	rotate([90,0,0])
		difference() {
			cylinder(r=bottle_r+2,h=2,center=true);
			cylinder(r=bottle_r,h=3,center=true);
		}