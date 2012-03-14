function round(num, dec) {
	var result = Math.round( Math.round( num * Math.pow( 10, dec + 1 ) ) / Math.pow( 10, 1 ) ) / Math.pow(10,dec);
	return result;
}

if (process.argv.length < 3) {
	console.log("USAGE: node genscad.js [text]");
} else {
	var text = process.argv[2];

	var qrcode = require('./qrcode').qrcode;

	var bw = 10, bh = 10, bd = 1.5;
	var spacer = 0.4;

	var code = qrcode(text);

	console.log(
		'module pixel(width=' + round(bw,4) +', height=' + round(bh,4) + ', depth=' + round(bd,4) + ') {\n' +
		'  cube([width+' + round(spacer/3,4) + ', height+' + round(spacer/3,4) + ', depth]);\n' +
		'}\n'
	);

	// Borders
		// Top
	console.log(
		'translate([0,0,0])' +
		' cube([' + round((code.width+2) * (bw+spacer),4) + ', ' + round(bh+spacer,4) + ', ' + bd + ']);');
		// Bottom
	console.log(
		'translate([0,' + round(-(code.width+1) * (bh+spacer),4) + ',0])' +
		' cube([' + round((code.width+2) * (bw+spacer), 4) + ', ' + round(bh+spacer,4) + ', ' + bd + ']);');
		// Left
	console.log(
		'translate([0,' + round(-(code.width) * (bh+spacer), 4) + ',0])' +
		' cube([' + round(bw+spacer, 4) + ', ' + round((code.width) * (bh+spacer), 4) + ', ' + bd + ']);');
		// Right
	console.log(
		'translate([' + round((code.width+1) * (bw+spacer), 4) + ',' + round(-(code.width) * (bh+spacer), 4) + ',0])' +
		' cube([' + round(bw+spacer, 4) + ', ' + round((code.width) * (bh+spacer), 4) + ', ' + bd + ']);');

	// Spacers Grid
	for (var x = 0; x < code.width; x++) {
		console.log(
			'translate([' + round((x+1) * (bw+spacer), 4) + ', ' + round(-code.width * (bh+spacer), 4) + ', 0])' +
			' cube([' + round(spacer, 4) + ', ' + round((code.width) * (bh+spacer), 4) + ', ' + bd + ']);');
	}
	for (var y = 0; y < code.width; y++) {
		console.log(
			'translate([0, ' + round(-(y+1) * (bh+spacer), 4) + ', 0])' +
			' cube([' + round((code.width+1) * (bw+spacer), 4) + ', ' + round(spacer, 4) + ', ' + bd + ']);');
	}


	// Actual QR Code
	for (var i = 0; i < code.width; i++) {
		for (var j = 0; j < code.width; j++) {
			var pixel = code.frame[i*code.width+j];
			if (pixel) {
				// Do nothing for black
			} else {
				// White pixel
				console.log('translate([' + round((j+1) * (bw+spacer) + spacer*2/3, 4) + ', ' + round(-(i+1) * (bh+spacer) + spacer*2/3, 4) + ', 0]) pixel();');
			}
		}
	}
}
