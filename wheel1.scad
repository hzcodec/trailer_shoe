include <ruler.scad>

$fa = 1;
$fs = 0.4;
$fn=60;

module rulers() {
    translate([20.0, 0, 3]) rotate([0, 90, 90]) ruler(30);
    //translate([-19, 3, 0]) rotate([0, 90, 0]) ruler(50);
}

module donut() {
    wheel_radius = 4;
    tyre_diameter = 2;
    
    rotate_extrude(angle=360) {
        translate([wheel_radius - tyre_diameter/2, 0])
            circle(d=tyre_diameter);
    }
}

module spoke() {
    cylinder(h=1, d=4, center=true);
}

module wheel() {
    donut();
    spoke();
}

//rulers();
