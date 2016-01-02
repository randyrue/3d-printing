difference() {
    cube([30,75,5], center=true);
    cylinder(r=6.25, h=7, center=true);
    for (i = [[10,30,-3.5],[-10,30,-3.5],[10,-30,-3.5],[-10,-30,-3.5]]) {
        translate(i)
            cylinder(r=2,h=7,$fn=10);
    }
}