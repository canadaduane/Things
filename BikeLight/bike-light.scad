use <battery-pack.scad>

battery_pack([ 10.5,44.5 ], 4);

translate([27.5,0,5]){
	rotate([0,90,0]) {
		difference() {
			cylinder(r=23/2,h=10,center=true);
			cylinder(r=21/2,h=10,center=true);
		}
	}
}

			// cylinder(r=23/2,h=10,center=true);
			// cylinder(r=21/2,h=10,center=true);
