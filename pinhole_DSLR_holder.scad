// mounting insert for laser-drilled pinhole disk,
// mounts to body cap for Canon DSLR

cap_ID = 48;
pinhole_disk_diam = 19;
pinhole_disk_th = 0.6;

mount_th = 3*pinhole_disk_th;
disk_inset = pinhole_disk_th+0.4;

difference() {
    cylinder(r=cap_ID/2, h=mount_th, $fn=200, center=true);
    translate([0,0,mount_th-disk_inset])
        cylinder(r=(pinhole_disk_diam+1)/2, h=2, $fn=200, center=true);
    cylinder(r=pinhole_disk_diam/4, h=20*pinhole_disk_th, $fn=200, center=true);
}