inner_length = 10.8;
inner_width=7.6;
wall=1.9;
height=9.4;
upper_length=7.2;
upper_height=2.9;
upper_width=2.7;

union() {
linear_extrude(height) {
difference() {
square([inner_length+2*wall, inner_width+2*wall],true);
square([inner_length, inner_width],true);
translate([-wall/2,0,0])square([wall,inner_width+2*wall],false);
}
}
translate([-upper_length/2, inner_width/2, height])cube([upper_length,wall,upper_height],false);
translate([-upper_length/2, inner_width/2, height+upper_width])cube([upper_length,upper_width,wall],false);
}