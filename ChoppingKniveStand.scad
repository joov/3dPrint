$fn=80;

wall=1.6;   // Wall thickness
length=140; // effective length
lower_width=28;  // distance between outer side of blades at blade
upper_width=25; // distance between outer side of blades at upper side of blade
height=20;  // distance from bottom to blade at end
blade_height=35;

r=pow(length,2)/8/height+height/2;

angle=2*asin(length/2/r);
echo(r);
echo(angle);

d_width=lower_width-upper_width;

rotate([90,90+angle/2,0])

difference() {

union() {
rotate_extrude(angle=angle) {
  translate([r-blade_height,0,0])
  polygon([[0,0],[0,upper_width+2*wall],[blade_height+wall,upper_width+2*wall+d_width/2],[blade_height+wall,-d_width/2]]);
};
   rotate(-90+angle/2)
    translate([-length/2-wall*sin(45),r-height+2*wall,-d_width/2])
    linear_extrude(lower_width+2*wall) {
        polygon([[0,-d_width/2],[length+wall,-d_width/2],[length-height*sin(45),height],[height*sin(45),height]]);
    
};
}

rotate_extrude(angle=angle) {
  translate([r-blade_height,0,0])
  polygon([[0,wall],[0,upper_width+wall],[blade_height,upper_width+wall+d_width/2],[blade_height,-d_width/2+wall]]);
};
}

