$fn=60;
tow_car_width = 8;

//
// Used as a trailing shoe for the towing car
//

module trailing_shoe_tow_car() {
    tow_car_shoe();
}

module tow_car_base() {
    base_length = 15;
    base_width = tow_car_width;
    base_thickness = 2;
    cube([base_length, base_width, base_thickness], true);
}

module tow_car_tip() {
    tip_length = 9;
    tip_width = tow_car_width;
    tip_thickness = 2;
    cube([tip_length, tip_width, tip_thickness], true);
}

module tow_car_pin_base() {
    pin_length = 6;
    pin_width = 4;
    pin_hight = 3;
    translate([0, 0, -2]) cube([pin_length, pin_width, pin_hight], true);
}

module tow_car_pin_holder() {
    pin_length = 6;
    pin_width = tow_car_width;
    pin_hight = 19;

    length_of_hole = pin_hight;

    // 4 mm hole
    size_of_hole = 2.0;  // radius 2 mm

	difference() {
        translate([0, 0, 1.5]) cube([pin_length, pin_width, pin_hight], true);
        translate([0, 0, 1.5]) cylinder(h=length_of_hole, r=size_of_hole, center=true);
    }
}

module shoe() {
    tow_car_base();

    // translate([0, 0, 4]) pin_base1();
    translate([0, 0, 8]) tow_car_pin_holder();

    color([1, 0, 0])
    translate([10.8, 0, 2.1]) rotate([0, -30, 0]) tow_car_tip();
}

module tow_car_beam(len) {
    length = 2;
    color([.5, .6, 1])

    // back
    translate([-7.5, -2, -1]) cube([length, len, 2]);

    // front
    translate([4, -2, -1]) cube([length, len, 2]);
}


// *****************************************************
// main
// *****************************************************
module tow_car_shoe() {
    number_of_items = 4;
    offset = 16;
    
    for (i = [0:number_of_items-1]) {
        translate([0, offset*i, 0]) shoe();
    }
    
    //tow_car_beam((number_of_items-1)*offset+4);
}

//tow_car_shoe();

