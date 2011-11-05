//cylinder (h=20,r=10);
difference() {
  cube([40,40,40]);
  cube([37.5,37.5,37.5]);
}
translate([11,-17,0]){
  rotate([0,0,45]) {
	difference() {
    	cube([40,40,40]);
	translate([2.5,2.5,0]) {
		cube([37.5,35,37.5]);}

	}
  }
}
