//slotted_hole module for sloppy screw holes, etc

slotted_hole(r=4,l=20,h=15);


module slotted_hole(r, l, h) {
    d = l/2-r;
    union(){
        for (offset = [-d, d]) {
            translate([offset,0,0])
                cylinder(r=r, h=h, $fn=12);
        }
        translate([-d,-r,0])
            cube([l-2*r,2*r,h]);
    }
}