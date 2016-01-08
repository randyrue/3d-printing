include <MCAD/roundedcube.scad>;
rotate([-90,0,0])
difference() {
    cube([120,100,49],center=true);
    translate([0,-5,0])
        roundedcube([114,100,43],true,3);
    translate([0,-40,0])
        cube([114,37,60],center=true);
    translate([0,-40,-10])
        cube([114,40,60],center=true);
    translate([35,48,0])
        cube([13,10,27],center=true);
    translate([-25,48,0])
        cube([28,10,20],center=true);
    for (x=[-20,20]) {
        translate([-25-x,48,0])
            rotate([90,0,0])
                cylinder(r=2,h=10, center=true);
    }
    for (z=[13,-13]) {
        for (x=[60,-60]) {
            translate([x,-42,z])
                rotate([0,90,0])
                    cylinder(r=2,h=10, center=true);
        }
    }
    translate([60,0,0])
        roundedcube([10,4,12],true,3);
}

