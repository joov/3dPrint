r=60;
h_hold=40;
h=5;
r_hold=5;
w=1.6;
num_comb=18;
h_comb=10;
w_comb=3;

union(){
    cylinder(r=r_hold/2,h=h_hold,$fn=20);
//    cube([r,w,h]);
    rotate([90,0,90])linear_extrude(r,scale=0.6)
        square([w,h],false);
    
    for(i=[0:r/(num_comb):r]) 
        translate([i,0,0])
            linear_extrude(w)polygon([[0,0],[w_comb,-h_comb],[w_comb,0]]);
        
}