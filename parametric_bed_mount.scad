// set values
mount_width = 10;
retainer_height = 10;
fsr_mount_height = 5;

//measured values
bed_radius = 120;
beam_length = 270;
beam_width = 15;
beam_height = 15;
fsr_width = 20;
// bracket_offset: using two steel rulers, measure the distance from the end
// of the beam to the point where its outside edge would meet that of its neighbor 
bracket_offset = 45;

//calculated values
frame_geometry_side_length = beam_length + 2*bracket_offset;
slug_offset = bed_radius*sqrt(3)/2;
cylinder_radius = bed_radius/sqrt(3);

// for debug, show frame (set to true to show or false to hide)
// frame is idealized, ignores end bracket truncation
show_frame = true;
if (show_frame) {
    difference() {
        translate([0,0,-beam_height])
            cylinder(r = frame_geometry_side_length/sqrt(3), h = beam_height, $fn = 3);
        translate([0,0,-beam_height-1])
            cylinder(r = frame_geometry_side_length/sqrt(3)-2*beam_width, h = beam_height+2, $fn = 3);
    }
}


// mount body
difference() {
	translate([cylinder_radius/2+slug_offset,0,0])
        // a cylinder with three faces is an equilateral triangle!
		cylinder(r=cylinder_radius,h=retainer_height,$fn=3);
	translate([0,0,-retainer_height/2])
		cylinder(r=bed_radius,h=2*retainer_height, $fn=400);
	translate([bed_radius + mount_width,-bed_radius/2,-retainer_height/2])
		cube([bed_radius,bed_radius,2*retainer_height]);
}