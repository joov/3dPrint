diam = 32;
diam2 = 34;
height=22;
rect_width=13;
rect_depth=5;

$fn=40;

max_diam = max(diam, diam2);

difference() {
    linear_extrude(height,scale=[0.6,1]) square([1.75*max_diam,2.7*max_diam],center=true);


    offs=diam*0.75;
    translate([0,offs,height/2])cylinder(r=diam/2,h=height+0.1,center=true); 
 
   translate([0,-diam/2+offs,height/2])cube([rect_width,rect_depth,height+0.1],center=true);

    offs2 = -diam2*0.75;

    translate([0,offs2,height/2])cylinder(r=diam/2,h=height+0.1,center=true); 
 
   translate([0,+diam2/2+offs2,height/2])cube([rect_width,rect_depth,height+0.1],center=true);

}

 