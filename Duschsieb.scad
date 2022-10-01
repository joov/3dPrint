r=64/2;
h=4;
wall_w=0.8;
num_spokes=12;
$fn=60;

r_eff=r-wall_w/2;

union() {
    circ(r_eff, wall_w);
    circ(r_eff/2, wall_w);

    for(i=[0:360/num_spokes:360]) {
      rotate([0,0,i])
        translate([0,r_eff/2,0])
            cube([wall_w, r_eff/2, h],center=false);
    }

    for(i=[0:360/num_spokes*2:360]) {
      rotate([0,0,i])
            cube([wall_w, r_eff/2, h],center=false);
    }
    
    for(i=[0:360/num_spokes*2:360]) {
      rotate([0,0,i])
        translate([0,r_eff,0])cylinder(h=h,r=wall_w/2);
    }

}

module circ(r, w) {
    linear_extrude(h)difference(){
        circle(r);
        circle(r-wall_w);
        
    }
}
