union() {
    translate([-(11/2)+1.4,0,0.7])cube(size=[2.8,2.8,1.4],center=true);
    translate([0,0,1.4])
    linear_extrude(5.6)scale([11,4.8])circle(0.5,$fn=40);

    translate([-(11/2),1,5.6+1.4])
    rotate([90,0,0])linear_extrude(2)polygon([[0,0],[0,3],[3,0]]);
    
    translate([2.9,0,2])linear_extrude(4)rotate([0,0,-90])polygon([[-3,0],[-1.5,3],[1.5,3],[3,0]]);
    
    translate([-7.4,(2.1)/2,1.4]) {
    
        translate([-2.4-1.6,-2.1-2,0])cube([3.2+2.4,4+2.1,5.6]);
        cube([1.6,2,18]);
        
        translate([0,-4.1,0])cube([1.6,2,18]);
        translate([-4,0,0])cube([1.6,2,18]);
        translate([-4,-4.1,0])cube([1.6,2,18]);
        
        
    }
    translate([-7.4+1.5,-(4+2.1)/2,1.4])cube([2.1,4+2.1,5.6+3]);
}

//color([1,0,0]) translate([-2.7,-2.4,1.4])cube([5.6,4.8,5.5]);

//color([1,0,0]) translate([-2.7-3.1,-2.4,1.4])cube([8.7,4.8,5.5]);