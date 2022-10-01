$fn=60;
inner_d1=118; // diameter of lower fitting
inner_d2=125; // diameter of adapter piece


wall_thickness=1.6;
overall_height=40;
adapter_height=25; // Height of adapter piece

hole_distance=105; // assuming holes are in square position
hole_diag_distance=sqrt(2.0)*hole_distance;
hole_width=4.7;  // Diameter of screw hole
hole_bevel=6;    // Diameter of bevel for srew hole

assert(hole_diag_distance+2*hole_bevel > inner_d2+2*wall_thickness, "Hole spacing too small!");

difference() {
    union() {
        cylinder(h=overall_height,d=inner_d2+2*wall_thickness);
        for (i = [inner_d2/2,-inner_d2/2]){
          translate([i,0,0])resize([6*hole_bevel,3*hole_bevel])cylinder(h=3,d=40);
        translate([0,i,0])resize([3*hole_bevel,6*hole_bevel])cylinder(h=3,d=40);
        }
        
    }
    cylinder(h=overall_height-adapter_height,d1=inner_d1,d2=inner_d2);
    translate([0,0,overall_height-adapter_height])cylinder(h=adapter_height,d=inner_d2);
    for (i = [hole_diag_distance/2,-hole_diag_distance/2]){
      translate([i,0,0]) {
        cylinder(h=4,d=hole_width);
        translate([0,0,2]) cylinder(h=1.01,d1=hole_width,d2=hole_bevel);
      }
      translate([0,i,0]) {
        cylinder(h=4,d=hole_width);
        translate([0,0,2]) cylinder(h=1.01,d1=hole_width,d2=hole_bevel);
      }
    }
}
