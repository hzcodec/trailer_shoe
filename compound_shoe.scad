include <trailing_shoe_tow_car.scad>
// include <trailing_shoe_airplane.scad>
// include <trailing_shoe_airplane2.scad>
include <trailing_shoe_airplane_with_cup.scad>
include <ruler.scad>

module ruler1() {
    translate([20.0, 54, 0]) rotate([0, 90, 90]) ruler(30);
    translate([-19, 3, 0]) rotate([0, 90, 0]) ruler(50);
}

module ruler2() {
    translate([-3, 36, 10]) rotate([0, 90, 0]) ruler(50);
}

// trailing show for car
translate([-6, 70, 0])  trailing_shoe_tow_car();
rotate([0, 0, 180]) 
translate([25, -118, 0])  trailing_shoe_tow_car();

//translate([-3, 0, 0]) trailing_shoe_airplane();
//translate([-32, 48, 0]) rotate([0, 0, 180]) trailing_shoe_airplane2();

// translate([-32, 48, 0]) rotate([0, 0, 180]) trailing_shoe_airplane2();
translate([0, 0, 0]) rotate([0, 0, 0]) trailing_shoe_airplane_large_with_cup();
translate([-30, 54, 0]) rotate([0, 0, 180]) trailing_shoe_airplane_large_with_cup();

// beam
beam_len = 127;
beam_y = -5;
translate([-19, beam_y, -1]) cube([6, beam_len, 2]);
translate([-2, beam_y, -1]) cube([3, beam_len, 2]);

// ruler1();
// ruler2();
