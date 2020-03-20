// in mm
outer_radius=190;

// in mm
inner_radius=10;

// arc steps
steps=20;

// in mm (thickness of mat
mat_thickness=1.75;

wall_height=7.5;

//Diameter of the Incircle of the Hexagons
cell_size=7;


strainer("yes");


module strainer(is_rect) {
    


    // in mm
    width=(is_rect=="yes") ? outer_radius : 2*outer_raduis;
   
    
   difference() {
        union() {
            //base grid
            honeycomb(outer_radius, width, mat_thickness, cell_size, mat_thickness);
            
            cube(size=[mat_thickness, outer_radius,wall_height ],center=false);

            cube(size=[outer_radius, mat_thickness, wall_height ],center=false);

            arcs(inner_radius, outer_radius);  
        };

    linear_extrude(height=wall_height+0.1, center=false)
        union() {
            polygon(points=arc_points(0,inner_radius, steps));
            polygon(points=arc_points(outer_radius, 2*outer_radius, steps));
        };    
    };
}

function arc_points(ir, or, steps) = [
        [ir,0],[or,0],
        // first expression generating the points in the positive Y quadrant
        for (a = [0 : steps]) [ or*cos(a*90/steps), or * sin(a * 90 / steps)  ],
        [0,or],[0,ir],
        // second expression generating the points in the negative Y quadrant
        for (a = [0 : steps]) [ ir*sin(a*90/steps), ir * cos(a * 90 / steps)  ],
    ];

module arcs(inner_radius, outer_radius) {
    
    outer_points = arc_points(inner_radius, outer_radius, steps);
    inner_points = arc_points(inner_radius+mat_thickness, outer_radius-mat_thickness, steps);
    

    linear_extrude(height=wall_height, center=false)
        difference() {
            polygon(points=outer_points);
            polygon(points=inner_points);
        };
    

}




module honeycomb (length, width, height, cell_size, mat_thickness, center) {
    
   no_of_rows = floor(1.75 * length / (cell_size + mat_thickness)) ;
    
    rd=cell_size/2; //hole radius
    s=mat_thickness; //space between holes
    
    $fn=6;
    ht=mat_thickness+.2;
    sx=(2*rd)+s;
    sy=sx*cos(30);

    // Source: https://www.thingiverse.com/thing:3948996
    difference() {
        cube(size=[length, width, height], center=false);
      
    for(y=[0:no_of_rows-1]){
        translate([0,y*2*sy,0])
        for(x=[0:no_of_rows-1]){ 
            translate([sx*x,0,0]) cylinder(r=rd,h=mat_thickness+.1, center=false);
            translate([(sx*x)+(sx/2),sy,0]) cylinder(r=rd,h=mat_thickness+.1, center=false);
        }
    }
}

}