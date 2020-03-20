include <LampshadeCommon.scad>



difference() {
    union(){

        //Plate
        difference() {
            union() {
                translate([-wall_plate_width/2, overall_width/2+wall_distance, 0])cube([wall_plate_width, wall_plate_thickness, wall_plate_height]);
                
                color([0,1,0])translate([-overall_width/2-wall_distance,overall_width/2+wall_distance,0])rotate([0,0,-45])color([1,0,0])
                ring(r=overall_width/2, height=ring_height, rim=ring_height, angle=45);
                
                color([0,1,0])scale([-1,1,1])translate([-overall_width/2-wall_distance,overall_width/2+wall_distance,0])rotate([0,0,-45])color([1,0,0])ring(r=overall_width/2, height=ring_height, rim=ring_height, angle=45);

    color([0,1,0])translate([-1.5*wall_distance,overall_width/2,0])cube(size=[3*wall_distance,wall_distance,ring_height]);


            }
            
            // Drill holes
            translate([wall_plate_width/2*0.8,overall_width/2+wall_distance+wall_plate_thickness,wall_plate_height*2/3])color([1,0,0])rotate([90,0,0])linear_extrude(height=wall_plate_thickness, scale=1.5)circle(r=drill_hole_width/2);

             scale([-1,1,1])translate([wall_plate_width/2*0.8,overall_width/2+wall_distance+wall_plate_thickness,wall_plate_height*2/3])color([1,0,0])rotate([90,0,0])linear_extrude(height=wall_plate_thickness, scale=1.5)circle(r=drill_hole_width/2);
            
        // Rounded corners    
        translate([wall_plate_width/2-drill_hole_width, overall_width/2+wall_distance+wall_plate_thickness, wall_plate_height-drill_hole_width])rotate([90,0,0])color([1,0,0])ring(r=2*drill_hole_width, rim=drill_hole_width, height=wall_plate_thickness, angle=90);

        scale([-1,1,1])translate([wall_plate_width/2-drill_hole_width, overall_width/2+wall_distance+wall_plate_thickness, wall_plate_height-drill_hole_width])rotate([90,0,0])color([1,0,0])ring(r=2*drill_hole_width, rim=drill_hole_width, height=wall_plate_thickness, angle=90);
        
        translate([0,0,wall_plate_height])scale([1,1,-1])translate([wall_plate_width/2-drill_hole_width, overall_width/2+wall_distance+wall_plate_thickness, wall_plate_height-drill_hole_width])rotate([90,0,0])color([1,0,0])ring(r=2*drill_hole_width, rim=drill_hole_width, height=wall_plate_thickness, angle=90);

        translate([0,0,wall_plate_height])scale([-1,1,-1])translate([wall_plate_width/2-drill_hole_width, overall_width/2+wall_distance+wall_plate_thickness, wall_plate_height-drill_hole_width])rotate([90,0,0])color([1,0,0])ring(r=2*drill_hole_width, rim=drill_hole_width, height=wall_plate_thickness, angle=90);
            
    // Cavity for cables etc.
            translate([0,overall_width/2+wall_distance+wall_plate_thickness,wall_plate_height/2])color([1,0,0])rotate([90,0,0])linear_extrude(height=wall_plate_thickness-wall_thickness, 0)scale([0.9*wall_plate_width/wall_plate_height,1])circle(r=(wall_plate_height-wall_thickness)/2);


        }


        // Disk
        difference(){
           cylinder(r=overall_width/2+wall_thickness, h=ring_height);
            
        // Foot holes
            for (a=[0:120:240])rotate([0,0,a])foot_hole(r=overall_width/2, height=ring_height, small_width=wall_thickness/1.2, big_width=foot_width+wall_thickness+0.2, angle=foot_angle+5, flat_depth=foot_height-wall_thickness/2+0.5);

        
        // Lamp mount        
            cylinder(r=lamp_mount_inner_width/2, h=ring_height);
        
    // make lamp mount thinner
    translate([0,0,ring_height/2])cylinder(r=lamp_mount_outer_width/2, h=ring_height/2);
                

        }

    }

        // Holes to illuminate lower part of lamp
            color([1,0,0])for (a=[0:360/num_ring_holes:360])rotate([0,0,a])translate([lamp_mount_inner_width/2+(overall_width-lamp_mount_inner_width)/4,0,0])cylinder(r=ring_height/2, h=ring_height);
              
    // Wells to fit upper/lower lampshade into  
    ring(r=overall_width/2+0.4, height=wall_thickness/2, rim=wall_thickness/2+0.8);
            translate([0,0,ring_height-wall_thickness/2])
                ring(r=overall_width/2+0.4, height=wall_thickness/2, rim=wall_thickness/2+0.8);
            



    // Make rods to wall mount hollow
                translate([-overall_width/2-wall_distance-wall_thickness/2,overall_width/2+wall_distance,wall_thickness/2])rotate([0,0,-40])ring(r=overall_width/2, height=ring_height-wall_thickness, rim=ring_height-wall_thickness, angle=45);

                scale([-1,1,1])translate([-overall_width/2-wall_distance-wall_thickness/2,overall_width/2+wall_distance,wall_thickness/2])rotate([0,0,-40])ring(r=overall_width/2, height=ring_height-wall_thickness, rim=ring_height-wall_thickness, angle=45);

    color([1,0,1])translate([-2*wall_distance, lamp_mount_inner_width/2+(overall_width-lamp_mount_inner_width)/4,wall_thickness/2])cube(size=[4*wall_distance,(overall_width-lamp_mount_inner_width)/2,ring_height-wall_thickness]);
            
            
    rotate([0,0,90-360/num_ring_holes*1.5])ring(r=lamp_mount_inner_width/2+(overall_width-lamp_mount_inner_width)/4+drill_hole_width, height=ring_height/2, rim=2*drill_hole_width, angle=360/num_ring_holes*3);

}