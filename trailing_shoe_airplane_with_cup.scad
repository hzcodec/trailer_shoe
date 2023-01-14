include <ruler.scad>
include <wheel1.scad>

$fn=60;
width = 12;

//
// Used as a trailing shoe for the airplane
//

module trailing_shoe_airplane_large_with_cup() {
    shoe_with_cup();
}


module rulers() {
    translate([11.0, 55, 0]) rotate([90, 0, 0]) ruler(30);
    translate([-19, 6, 0]) rotate([0, 90, 0]) ruler(50);
}

module base3_with_cup() {
    base_length = 26;
    base_width = width;
    base_thickness = 2;
    
    cube([base_length, base_width, base_thickness], true);

	difference() {
        translate([5, 0, 3]) cylinder(h=5, r=5.5, center=true);
        translate([5, 0, 3]) cylinder(h=5, r=4.5, center=true);
    }
}

module tip3_with_cup() {
    tip_length = 6;
    tip_width = width;
    tip_thickness = 2;
    cube([tip_length, tip_width, tip_thickness], true);
}

module pin_holder3_with_cup() {
    pin_length = width;
    pin_width = width;
    pin_hight = 12;

    length_of_hole = pin_hight;
    size_of_hole = 2.0;

	difference() {
        translate([1, 0, 1.5]) cube([pin_length, pin_width, pin_hight], true);
        translate([1, 0, 1.5]) cylinder(h=length_of_hole, r=size_of_hole, center=true);
    }
}

module shoe3_with_cup() {
    base3_with_cup();

    translate([-8, 0, 4]) pin_holder3_with_cup();

    color([1, 0, 0])
    translate([15.1, 0, 1.4]) rotate([0, -30, 0]) tip3_with_cup();

    //translate([10.0, 0, 2]) cube([4, 10, 5], true);

    wheel_pos = 6.5;
    rotate([90, 0, 0]) translate([-8, 3, -wheel_pos]) wheel();
    rotate([90, 0, 0]) translate([-8, 3, wheel_pos]) wheel();
}

module beam3(len) {
    length = 2;
    color([.5, .6, 1])

    // back
    translate([-14.5, -2, -1]) cube([length, len, 2]);

    // front
    translate([4, -2, -1]) cube([length, len, 2]);
}


// *****************************************************
// main
// *****************************************************
number_of_items = 4;
dist_between_objects = 18;

module shoe_with_cup() { 
    for (i = [0:number_of_items-1]) {
        translate([0, dist_between_objects*i, 0]) shoe3_with_cup();
    }

    //beam3((number_of_items-1)*dist_between_objects+4);
}


//shoe_with_cup();

//rulers();
