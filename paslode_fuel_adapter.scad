//rotate([180,0,0])
union() {
    difference() {
        translate([0,0,0])
            cylinder(r=17.5, h=56,$fn=100,center=true);
        translate([0,0,1])
            cylinder(r=16.5, h=56,$fn=100,center=true);
    }
    translate([0,0,-29.5])
        cylinder(r1=16,r2=17.5,h=3,$fn=100,center=true);
    translate([0,0,-72])
        cylinder(r=16,h=83,$fn=100,center=true);
}