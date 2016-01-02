// parametric bed retainer and FSR mount for delta printer,
// mounts at the three corners of the frame

// set values
mount_width = 10;
retainer_height = 12;
fsr_mount_thickness = 5;
screw_width = 3;
slot_width = 6;

//measured values
// bed_radius = 120;
bed_radius = 120;
// beam_length = 270;
beam_length = 270;
beam_width = 15;
beam_height = 15;
fsr_width = 20;
// bracket_offset: using two steel rulers, measure the distance from the end
// of the beam to the point where its outside edge would meet that of its neighbor 
// bracket_offset = 48;
bracket_offset = 48;

//calculated values
frame_side = beam_length + 2*bracket_offset;
slug_offset = bed_radius*sqrt(3)/2;
slug_width = bed_radius - bed_radius*sqrt(3)/2 + mount_width;
triangle_radius = bed_radius/sqrt(3);
frame_radius = frame_side/sqrt(3);

rotate([0,0,0])
translate([-bed_radius,0,0])
union(){

// for debug, show frame (set to true to show or false to hide)
// frame is idealized, ignores end bracket truncation
show_frame = false;
if (show_frame) {
    difference() {
        translate([0,0,-beam_height])
        // a cylinder with three faces is an equilateral triangle! Who knew!
            cylinder(r = frame_radius, h = beam_height, $fn = 3);
        translate([0,0,-beam_height-1])
            cylinder(r = frame_radius-2*beam_width, h = beam_height+2, $fn = 3);
    }
}


// mount body

intersection()  {
    translate([0,0,0])
            cylinder(r = frame_side/sqrt(3), h = retainer_height+fsr_mount_thickness, $fn = 3);
    difference() {
    union() {
        // "slug"
        translate([slug_offset,-frame_side/2,0])
            cube([slug_width,frame_side,retainer_height+fsr_mount_thickness]);
        // fsr mount / bed "shelf"
        translate([2*bed_radius*sqrt(3)/2,0,0])
                cylinder(r=bed_radius,h=fsr_mount_thickness, $fn=200);
}
        // remove bed
        translate([0,0,fsr_mount_thickness])
            cylinder(r=bed_radius,h=2*(retainer_height+fsr_mount_thickness), $fn=400);
        // remove back side
        translate([bed_radius + mount_width,-bed_radius/2,-retainer_height/2])
            cube([bed_radius,bed_radius,2*(retainer_height+fsr_mount_thickness)]);
        // remove screw sliders
        // faking it on the width-wise position of the screw slots
        // this is midway between the middle of the mount body and the edge of the bed
        //xo = -(slug_offset + slug_width/2 + bed_radius)/2;
        xo = -bed_radius;
        hy = (frame_radius - bed_radius)/sqrt(3) - beam_width/2 - slot_width/2;
        for (yo = [-hy, hy])    {
            translate([-xo,yo,-1])
                rotate([0,0,90])
                    slotted_hole(r=(screw_width+1)/2, l=beam_width, h=retainer_height+fsr_mount_thickness+2);
                                }
                }
                }
        
}


module slotted_hole(r, l, h) {
    d = l/2-r;
    union(){
        for (os = [-d, d]) {
            translate([os,0,0])
                cylinder(r=r, h=h, $fn=12);
        }
        translate([-d,-r,0])
            cube([l-2*r,2*r,h]);
    }
}