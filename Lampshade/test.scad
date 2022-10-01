 $fn=100;
 
 mat = [[1,0,0,0],
        [0,1,100/150,0],
        [0,0,1]];
 
for(a=[0:6:360])
     rotate([0,0,a])
        multmatrix(m=mat)
            linear_extrude(height=150, twist=90) 
        translate([100,0,0])
            square([2,11],center=true);

translate([0,0,150])cylinder(h=5,r1=5.6,r2=0);

