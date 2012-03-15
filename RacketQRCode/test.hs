import Graphics.Implicit

rect w h d = extrude d (polygon [(-w/2,h/2), (w/2,h/2), (w/2,-h/2), (-w/2,-h/2)])

out =
	union [
		rect 10 20 40,
		translate (20,20,20) (sphere 15)
	]

main = writeSTL (-50,-50,-50) (50,50,50) 1 "test.stl" out
