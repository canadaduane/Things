// cylinder 97mm long, 25.5mm radius
// cylinder 11.5mm radius

bottle_r = 21.5;
neck_r = 12;

difference() {
	linear_extrude(height=2,center=true) {
		hull() {
			circle(neck_r+3);
			translate([(neck_r*2+12)/2,0,0])
				square(12,center=true);
		}
	}
	cylinder(r=neck_r,h=3,center=true);
}
