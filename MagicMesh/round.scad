wire_diameter = 0.644;
pixel=1.0;
$fn=24;

difference() {
	cube([pixel*2,pixel*2,pixel],center=true);
	cylinder(r=wire_diameter/2,h=pixel,center=true);
}

rotate([0,0,45])
	cylinder(r=wire_diameter/2,h=10,center=true);