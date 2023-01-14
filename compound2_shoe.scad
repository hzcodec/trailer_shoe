include <trailing_shoe_airplane_large.scad>
include <trailing_shoe_airplane_large_with_hole.scad>
include <trailing_shoe_airplane_with_cup.scad>
include <ruler.scad>

module rulers() {
    translate([20.0, 54, 0]) rotate([0, 90, 90]) ruler(30);
    translate([-19, 3, 0]) rotate([0, 90, 0]) ruler(50);
}

translate([-3, 0, 0]) trailing_shoe_airplane_large();
translate([-37, 55, 0]) rotate([0, 0, 180]) trailing_shoe_airplane_large_with_hole();
translate([-3, 70, 0]) trailing_shoe_airplane_large_with_cup();

// beam
beam_len = 140;
beam_y = -5;

// back
translate([-24, beam_y, -1]) cube([8, beam_len, 2]);

// front
translate([-2, beam_y, -1]) cube([3, beam_len, 2]);

//rulers();
