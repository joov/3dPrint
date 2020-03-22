include <LampshadeCommon.scad>



union() {


    //stabilizing ring
    translate([0,0,foot_height])
       linear_extrude(height=wall_thickness)difference() {
        circle(r=overall_width/2);
        circle(r=overall_width/2-wall_thickness/2);
    }
    
     mat = [[1,0,0,0],
        [0,1,overall_width/big_ellipse_height,0],
        [0,0,1]];
 
    difference() {
    union() {
        translate([0,0,foot_height+wall_thickness])
    for(a=[0:360/num_rods:360])
         rotate([0,0,a])
            multmatrix(m=mat)
                linear_extrude(height=big_ellipse_height/2, twist=90) 
            translate([overall_width/2-wall_thickness/4,0,0])
                square([wall_thickness/2,rod_width],center=true);

        translate([0,0,big_ellipse_height/2+foot_height+wall_thickness])cylinder(h=rod_width/2,r1=rod_width/2+gap_rods/2+0.2,r2=0);

    translate([0,0,big_ellipse_height/2+foot_height+wall_thickness])
    linear_extrude(height=rod_width/2, scale=0, twist=-30)
        for(a=[0:360/num_rods:360])
           rotate([0,0,a])
            translate([-wall_thickness/2,rod_width/2-wall_thickness/2,0])square([wall_thickness/2,wall_thickness/2]);


    a=1;
    mat2 = [[1,0,0,0],
        [0,1,0,0],
        [0,0,1]];

                color([1,0,0])
        multmatrix(m=mat2)
        linear_extrude(height=big_ellipse_height/2, twist=90, scale=0) 
            translate([overall_width/2-wall_thickness/4,0,0])
                square([wall_thickness/2,rod_width],center=true);

        
    }
    
    
       color([1,0,0])translate([0,0,big_ellipse_height/2+foot_height+wall_thickness-rod_width+0.1])cylinder(h=rod_width/2,r=rod_width+gap_rods/2-wall_thickness/2);
       
        translate([0,0,big_ellipse_height/2+foot_height+wall_thickness])cylinder(h=rod_width/2-wall_thickness/2,r1=rod_width/2+gap_rods/2-wall_thickness/2,r2=0);


    
}


    
//    difference() {
//    rotate_extrude(angle = 360, convexity = 10) 
//        difference() {
//            half_ellipse(height=big_ellipse_height, width=overall_width);
//            half_ellipse(height=big_ellipse_height-wall_thickness, width=overall_width-wall_thickness);
  //      };
        
    //}
    
    

    foots(thickness=wall_thickness/2, height=foot_height, width=foot_width, radius=overall_width/2, angle=foot_angle);
}
