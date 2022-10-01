include <LampshadeCommon.scad>



union() {


    //stabilizing ring
    translate([0,0,foot_height])
       linear_extrude(height=wall_thickness)difference() {
        circle(r=overall_width/2);
        circle(r=overall_width/2-wall_thickness/2);
    }
    
     mat = [[1,0,-cos(twist_lower_angle)*overall_width/small_ellipse_height,0],
        [0,1,sin(twist_lower_angle)*overall_width/small_ellipse_height,0],
        [0,0,1]];
 
    difference() {
    union() {
        translate([0,0,foot_height+wall_thickness])
    for(a=[0:delta_angle:360])
         rotate([0,0,a])
            multmatrix(m=mat)
                linear_extrude(height=small_ellipse_height/2, twist=twist_lower_angle) 
            translate([overall_width/2-wall_thickness/4,0,0])
                square([wall_thickness/2,rod_width],center=true);


        
    }
    
    color([1,0,0])translate([0,0,small_ellipse_height/2+foot_height])cylinder(h=rod_width/2, r2=rod_width/2,r1=0);

    
}


    foots(thickness=wall_thickness/2, height=foot_height, width=foot_width, radius=overall_width/2, angle=foot_angle);
}
