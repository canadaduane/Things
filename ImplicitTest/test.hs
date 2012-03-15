import Graphics.Implicit

out = union [
    cube 40,
    translate (20,20,20) (sphere 15) ]

main = writeSTL (-50,-50,-50) (50,50,50) 1 "test.stl" out 
