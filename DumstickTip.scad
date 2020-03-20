overall_height=12.5;
overall_width=9;

hole_width=5.7;
hole_height=5.7;
num_slices=40;


big_ellipse_height=0.8*2*overall_height;
small_ellipse_height=0.2*2*overall_height;

// this is the height difference that the hole in the bottom removes from the overall height
diff =  small_ellipse_height/2*(1.0-sqrt(1-pow(hole_width/overall_width,2)));

// the real hole height has to be increased by diff
real_hole_height=hole_height+diff;

big_ellipse_scale=big_ellipse_height/overall_width;
small_ellipse_scale=small_ellipse_height/overall_width;

$fn=num_slices;

// scale so that diff is added to overall_height
scale([1,1,(overall_height+diff)/overall_height])
translate([0,0,-diff])
rotate_extrude(angle = 360, convexity = 10) {
//rotate([0,0,90])
difference() {
translate([0,small_ellipse_height/2])
   union() {
     difference() {
            scale([overall_width,big_ellipse_height])
                circle(d=1);
            translate([-overall_width/2,-big_ellipse_height])
            square([overall_width,big_ellipse_height]);
       };
    scale([overall_width,small_ellipse_height])circle(d=1);
    };
    translate([-hole_width/2,0])square([hole_width,real_hole_height]);
    translate([-overall_width,0]) 
    square([overall_width,overall_height]);
}
}