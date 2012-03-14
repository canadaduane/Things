
var implicit_template = 
	"import Graphics.Implicit\n\n" +
	"out = union [\n{{lines}}]\n\n" +
	"writeSTL (-100,-100,-100) (100,100,100) 1 \"{{filename}}\" out\n";

var lines = [
    "cube 40",
    "translate (20,20,20) (sphere 15)"
];

function op(name, lines, indent) {
	
}