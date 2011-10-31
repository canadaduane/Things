// sphere(r=3,$fn=6);

// difference() {
// 	sphere(r=4,$fn=8);
// 	sphere(r=3.6,$fn=8);
// }

// module triangle_pyramid(radius)
// {
//   o=radius/2;		//equivalent to radius*sin(30)
//   a=radius*sqrt(3)/2;	//equivalent to radius*cos(30)
//   polyhedron(points=[[-a,-o,-o],[a,-o,-o],[0,radius,-o],[0,0,radius]],triangles=[[0,1,2],[1,2,3],[0,1,3],[0,2,3]]);
// }

module square_pyramid(base_x, base_y,height)
{
  w=base_x/2;
  h=base_y/2;
  polyhedron(points=[[-w,-h,0],[-w,h,0],[w,h,0],[w,-h,0],[0,0,height]],triangles=[[0,3,2,1], [0,1,4], [1,2,4], [2,3,4], [3,0,4]]);
}

module double_pyramid(len=10) {
	square_pyramid(len,len,len/2);
	rotate([180,0,0])
		square_pyramid(len,len,len/2);
}


difference() {
	double_pyramid(15);	
	double_pyramid(14.6);
}
