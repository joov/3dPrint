include <LampshadeCommon.scad>



union() {

    translate([0,0,foot_height])
    difference() {
    rotate_extrude(angle = 360, convexity = 10) 
        difference() {
            half_ellipse(height=big_ellipse_height, width=overall_width);
            half_ellipse(height=big_ellipse_height-wall_thickness, width=overall_width-wall_thickness);
        };
        
    }

    foots(thickness=wall_thickness/2, height=foot_height, width=foot_width, radius=overall_width/2, angle=foot_angle);
}
