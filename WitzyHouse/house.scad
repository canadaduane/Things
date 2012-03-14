
house_width=150;
house_height=150;
house_depth=150;
roof=sqrt(house_width*house_width+house_height*house_height);
wall_thickness=2.5;
extra=15;

difference() {
    cube([house_width,house_height,house_depth],center=true);
    translate([0,wall_thickness,wall_thickness])
        cube([house_width-wall_thickness*2,house_height,house_depth],center=true);
}

// cube([10,10,10],center=true);

translate([0,house_height/2,0]) {
    translate([-house_width/4,house_height/4,0])
        rotate([0,0,45])
            translate([-extra/2,0,0])
                cube([roof/2+wall_thickness+extra,wall_thickness,house_depth],center=true);
    translate([house_width/4,house_height/4,0])
        rotate([0,0,-45])
            translate([extra/2,0,0])
                cube([roof/2+wall_thickness+extra,wall_thickness,house_depth],center=true);

    translate([0,0,-house_depth/2+wall_thickness/2])
        difference() {
            rotate([0,0,45])
                cube([roof/2,roof/2,wall_thickness],center=true);
            translate([0,-roof/2+roof/4,0])
                cube([roof,roof/2,wall_thickness*2],center=true);
        }
}

//cylinder (h=20,r=10);
// difference() {
//     cube([40,40,40]);
//     cube([37.5,37.5,37.5]);
// }

// translate([0,0,40])
//     cube([40,40,2.5]);
// translate([11,-17,0]){
//     rotate([0,0,45]) {
//         difference() {
//             cube([40,40,40]);
//             translate([2.5,2.5,0]) {
//                 cube([37.5,35,37.5]);
//             }
//         }
//         // translate([15,-20,0])
//         //     %cube([20,20,40]);
//     }
// }
