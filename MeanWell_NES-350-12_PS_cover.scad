include <MCAD/roundedcube.scad>;
// rotate for best printing
rotate([-90,0,0])
difference() {
    // outside box
    cube([122,100,49],center=true);
    // inside rounded edge hollow
    translate([0,-5,0])
        roundedcube([116,100,43],true,3);
    // subtract top edge with longer inset
    translate([0,-40,0])
        cube([116,47,60],center=true);
    
    // subtract lower edge
    translate([0,-40,-10])
        cube([116,50,60],center=true);
    // subtract hole for switch
    translate([35,48,0])
        cube([13,10,27],center=true);
    // subtract hole for power outlet
    translate([-25,48,0])
        cube([28,10,20],center=true);
    // subtract screw holes for power outlet
    for (x=[-20,20]) {
        translate([-25-x,48,0])
            rotate([90,0,0])
                cylinder(r=2,h=10, center=true);
    }
    // subtract mounting screw holes
    for (z=[13,-13]) {
        for (x=[60,-60]) {
            translate([x,-42,z])
                rotate([0,90,0])
                    cylinder(r=2,h=10, center=true);
        }
    }
    // subtract passthrough hole for wiring
    translate([60,0,0])
        roundedcube([10,12,4],true,3);


// notch the top edge to accommodate the case
    for (x=[56.5,-56.5]) {
        translate([x,-15,25])
            cube([3,4,10],center=true);
    }
}