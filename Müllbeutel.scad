$fn=20;
difference(){
union(){
    cube([55,55,159]);
    translate([0,55,0])cube([65,65,124]);
    translate([0,120,0])cube([80,77,99]);

    translate([55,44,90])rotate([0,90,0])linear_extrude(.5)text("50 l - Gelbe Tonne", size=7);


    translate([65,107,90])rotate([0,90,0])linear_extrude(.5)text("20 l - Bio-/Restmüll", size=7);
    
    translate([80,185,90])rotate([0,90,0])linear_extrude(.5)text("5 l - Kosmetikeimer", size=7);
}
translate([27,27,2]){cylinder(d=50,h=160);
translate([5,58,2])cylinder(d=60,h=125);
translate([13,130,2])cylinder(d=75,h=100);

 translate([2,-25,2])cube([30,35,160]);   
 translate([5,-27+55,2])cube([34,45,160]);   
 translate([8+5,-27+120,2])cube([40,55,160]);   
    
    }
}