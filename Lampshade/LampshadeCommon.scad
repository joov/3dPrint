overall_width=120;

num_slices=80;

wall_thickness = 4; // double wall thickness

big_ellipse_height=220;
small_ellipse_height=100;

ring_height=10;
num_ring_holes=20;
foot_width=6;
foot_angle=15;

num_rods=40;
gap_rods=0; //mm

delta_angle=360/num_rods;

offset_top=0.1;

twist_lower_angle = 90*(1+small_ellipse_height/big_ellipse_height)/2;
echo(twist_lower_angle);
//twist_lower_angle=90;
rod_width = overall_width*3.141/num_rods-gap_rods;

foot_height=ring_height-wall_thickness+0.2;

wall_plate_width=80;
wall_plate_height=25;
wall_plate_thickness=8;

drill_hole_width=4;

lamp_mount_inner_width=41;
lamp_mount_outer_width=63;

wall_distance=7;

$fn=num_slices;



// Hollow half ellipse
module half_ellipse(height, width) {
    difference() {
       union() {
         difference() {
                scale([width,height])
                    circle(d=1);
                translate([-width/2,-height])
                square([width,height]);
                translate([-width,0]) 
                square([width,height]);
           };
    }
   }
}


// Foot
module foot(thickness, height, width, radius, angle) {
    rotate_extrude(angle=angle, convexity=10)
    
    translate([radius, 0]) rotate([0,0,180]) polygon([[0,0],[0,-height], [thickness, -height], [thickness, -thickness], [width, -thickness], [width, 0]]);
}

module foots(thickness, height, width, radius, angle) {

    foot(thickness, height, width, radius, angle);

    rotate([0,0,120])foot(thickness, height, width, radius, angle);

    rotate([0,0,240])foot(thickness, height, width, radius, angle);

}

module ring(r, height, rim, angle=360) {

    rotate_extrude(angle=angle, convexity=10)
        translate([r-rim,0,0])
        polygon([[0,0],[0,height], [rim, height], [rim,0]]);
}

module foot_hole(r, height, angle, small_width, big_width, flat_depth) {
    ring(r=r, height=height, rim=small_width, angle=3*angle);
    rotate([0,0,angle-1])ring(r=r, height=height, rim=big_width, angle=angle+2);
    translate([0,0,height-flat_depth])ring(r=r, height=flat_depth+0.1, rim=big_width, angle=angle);
    rotate([0,0,2*angle])ring(r=r, height=flat_depth, rim=big_width, angle=angle);
}