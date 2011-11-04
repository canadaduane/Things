
//******************* OTHER FILES NEEDED ************************************** 


//*****************************************************************************
//******************* VARIABLES TO ADJUST *************************************

bottomBlockHeight = 2;
baseToBelt = 5;
width = 10;
centreGap = 5;
beltWidth = 6.6;
cableTieWidth = 3;
cableTieRecess = 1;
beltPathRadius = 2;
outsideWidth = 2;
beltRecessHeight = 2;

//*****************************************************************************
//******************* OTHER VARIABLES *****************************************

//$fn = 36;
$fa=3;
$fs=.3;

//*****************************************************************************
//******************* VIEW ****************************************************

beltTightener();

//doublebeltTightener();

//*****************************************************************************
//******************* MODULES *************************************************

module beltTightener(){
length = beltPathRadius * 4 + centreGap;
width = outsideWidth * 2 + beltWidth;
blockHeight = baseToBelt + beltRecessHeight - beltPathRadius;
	union(){
		difference(){
			cube([length,width,blockHeight]);
				translate([beltPathRadius * 2,-1,bottomBlockHeight])
					cube([length - beltPathRadius * 4,width + 2,baseToBelt + beltRecessHeight]);
				translate([-1,outsideWidth,baseToBelt - beltPathRadius])
					cube([length + 2,beltWidth,beltRecessHeight + 1]);
				translate([length / 2 - cableTieWidth / 2, -1, -1])
					cube([cableTieWidth,cableTieRecess + 1,bottomBlockHeight + 2]);
				translate([length / 2 - cableTieWidth / 2, width - cableTieRecess, -1])
					cube([cableTieWidth,cableTieRecess + 1,bottomBlockHeight + 2]);
		}
		translate([beltPathRadius, width, baseToBelt - beltPathRadius]) rotate([90, 0, 0]) cylinder(r = beltPathRadius, h = width);
		translate([length - beltPathRadius, width, baseToBelt - beltPathRadius]) rotate([90, 0, 0]) cylinder(r = beltPathRadius, h = width);
		translate([beltPathRadius, width, baseToBelt + beltRecessHeight - beltPathRadius]) rotate([90, 0, 0]) cylinder(r = beltPathRadius, h = outsideWidth);
		translate([beltPathRadius, outsideWidth, baseToBelt + beltRecessHeight - beltPathRadius]) rotate([90, 0, 0]) cylinder(r = beltPathRadius, h = outsideWidth);
		translate([length - beltPathRadius, width, baseToBelt + beltRecessHeight - beltPathRadius]) rotate([90, 0, 0]) cylinder(r = beltPathRadius, h = outsideWidth);
		translate([length - beltPathRadius, outsideWidth, baseToBelt + beltRecessHeight - beltPathRadius]) rotate([90, 0, 0]) cylinder(r = beltPathRadius, h = outsideWidth);

	}
}


module doublebeltTightener(){
	union(){
		beltTightener();
		translate([beltPathRadius * 2 + centreGap, 0, 0]) beltTightener();
	}
}


//********************** END MODULES ******************************************