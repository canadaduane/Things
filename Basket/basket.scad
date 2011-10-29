//=======================================================================================  
module torus(outerRadius, innerRadius)
  {
  r=(outerRadius-innerRadius)/2;
  rotate_extrude($fn=256) translate([innerRadius+r,0,0]) circle(r,$fn=36);	
  }
//=======================================================================================  
module isosceles_triangle(base,length,height)
  {
  rotate(90,[1,0,0]) linear_extrude(height=length) polygon(points=[[-base/2,0],[+base/2,0],[0,height]],paths=[[0,1,2]]);
  }
//=======================================================================================  

rods=16;


//build platform for debug  
%color([0.5,0.5,0.5,0.1]) translate([-50,-50,-1.01]) cube([100,100,1]);
   
  
//=======================================================================================  
difference()
  {
  union()
    {
    cylinder(r=74/2,h=4,$fn=360);
    torus(74/2+4,74/2-4);
    translate([0,0,66]) torus(71.93/2+2,71.93/2-2);
    for(i=[1:rods])
      {
      rotate((i)*(360/rods),[0,0,1])
        {
        translate([0,-(74/2)+0.2,-2.5]) rotate(34,[0,0,1]) rotate(30,[0,1,0])cylinder(r=2,h=79,$fn=36);
        translate([0,-(74/2)+0.2,-2.5]) rotate(-34,[0,0,1]) rotate(-30,[0,1,0])cylinder(r=2,h=79,$fn=36);
        }
      rotate((i+0.5)*(360/rods),[0,0,1])
        translate([0,-(74/2)+3.05,66]) rotate(12,[1,0,0]) isosceles_triangle(base=13.3,length=3.3,height=-12.2);
      }
    }
    translate([-50,-50,-10]) cube([100,100,10]);
  }
//=======================================================================================  
