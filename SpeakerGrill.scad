// in mm
wall_diameter=97;


brim_width=15;
brim_height=17;


// in mm (thickness of mat
mat_thickness=0.96;

//Diameter of the Incircle of the Hexagons
cell_size=3.84;

$fn=40;

grill();


module grill() {
    
 difference() {
   union() {
     // in mm
     width=wall_diameter;
       
        translate([wall_diameter/2,wall_diameter/2])rotate_extrude()translate([wall_diameter/2,0])difference() {
            square([brim_width+mat_thickness,brim_height+mat_thickness]);
            translate([mat_thickness,mat_thickness])square([brim_width,brim_height]);
        }
        
        //base grid
        honeycomb(width, mat_thickness, cell_size, mat_thickness);
    }
       color([1,0,0])translate([wall_diameter/2,wall_diameter/2])rotate_extrude()
            translate([wall_diameter/2+brim_width,0])square([wall_diameter/2-brim_width,mat_thickness]);
  }
}


module honeycomb (width, height, cell_size, mat_thickness) {
    
   no_of_rows = floor(1.75 * width / (cell_size + mat_thickness)) ;
    
    rd=cell_size/2; //hole radius
    s=mat_thickness; //space between holes
    
    $fn=6;
    sx=(2*rd)+s/2;
    sy=sx*cos(30);

    // Source: https://www.thingiverse.com/thing:3948996
    difference() {
        cube(size=[width, width, height], center=false);
      
    for(y=[0:no_of_rows-1]){
        translate([0,y*2*sy,0])
        for(x=[0:no_of_rows-1]){ 
           translate([sx*x,0,0])       rotate([0,0,30])cylinder(r=rd,h=mat_thickness+.1, center=false);
           translate([(sx*x)+(sx/2),sy,0]) 
           rotate([0,0,30])cylinder(r=rd,h=mat_thickness+.1, center=false);
        }
    }
}

}