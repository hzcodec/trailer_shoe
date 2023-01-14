include <ruler.scad>

$fn=60;
width = 10;

//
// Used as a trailing shoe for the airplane
//

module trailing_shoe_airplane() {
    airplane_shoe();
}

module rulers() {
    translate([20.0, 54, 0]) rotate([0, 90, 90]) ruler(30);
    translate([-19, 3, 0]) rotate([0, 90, 0]) ruler(50);
}

module base() {
    base_length = 20;
    base_width = 2;
    base_thickness = 1;
    translate ([0, -4, 0]) cube([base_length, base_width, base_thickness], true);
    translate ([0, 4, 0]) cube([base_length, base_width, base_thickness], true);

    translate ([3, 0, 1]) rotate([0, 0, 90]) cube([10, 1, 1], true);
    translate ([7, 0, 1]) rotate([0, 0, 90]) cube([10, 1, 1], true);
}

module tip() {
    tip_length = 6;
    tip_width = width;
    tip_thickness = 1;
    cube([tip_length, tip_width, tip_thickness], true);
}

module pin_holder() {
    pin_length = width;
    pin_width = width;
    pin_hight = 12;

    length_of_hole = pin_hight;
    size_of_hole = 2.0;

	difference() {
        translate([0, 0, 1.5]) cube([pin_length, pin_width, pin_hight], true);
        translate([0, 0, 1.5]) cylinder(h=length_of_hole, r=size_of_hole, center=true);
    }
}

module shoe_air() {
    base();

    translate([-5, 0, 4]) pin_holder();

    color([1, 0, 0])
    translate([12.2, 0, 1.4]) rotate([0, -30, 0]) tip();
}

module beam(len) {
    length = 5;
    color([.5, .6, 1])

    // back
    translate([-7.5, -2, -0.5]) cube([length, len, 2]);

    // front
    //translate([7, -2, -1]) cube([length, len, 2]);
}


// *****************************************************
// main
// *****************************************************
number_of_items = 3;
offset = 16;

module airplane_shoe() {
    for (i = [0:number_of_items-1]) {
        translate([0, offset*i, 0]) shoe_air();
    }

    beam((number_of_items-1)*offset+4);
}

airplane_shoe();
//rulers();
