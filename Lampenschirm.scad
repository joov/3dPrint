edges = 8;
radius = 10;
wall_thickness = 1;
height = 150;

linear_extrude(height=height/2, twist= 90, scale=3)
difference() {
    star(radius,edges);
    star(radius-wall_thickness, edges);
}


module star(radius, edges) {

    union(){
        circle(radius,$fn=edges/2);
        rotate([0,0,360/edges]) circle(radius,$fn=edges/2);
    }
}    
    