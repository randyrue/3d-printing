// FSR mount and bed retainer for hybrid delta printer
// using Johann's aluminum brackets and 270mm 15x15 openbeam
// extrusions.

// currently fixed size and approximated, plan is to make it
// parametric based on plate diameter, beam size, bracket offset

rotate([0,-90,0])
difference(){
	union(){
		difference() {
			translate([-35,0,2])
				cube([200,130,10],center=true);
			cylinder(r=130,h=15,$fn=400,center=true);
		}
			translate([-130,0,-9])
				cylinder(r=25,h=7,$fn=100);
	}
	translate([-205,-75,-10])
		cube([70,150,20]);
	translate([-145,51,-10])
		rotate([0,0,22])
			cube([50,20,20]);
	translate([-145,-72,-10])
		rotate([0,0,-22])
			cube([50,20,20]);
	translate([-129,-45,-5])
		cylinder(r=2,h=20,$fn=50);
	translate([-129,45,-5])
		cylinder(r=2,h=20,$fn=50);
	translate([-129,-45,5])
		cylinder(r=4,h=20,$fn=50);
	translate([-129,45,5])
		cylinder(r=4,h=20,$fn=50);
}