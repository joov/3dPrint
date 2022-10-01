$fn=80;

rotate_extrude(angle=360,convexity=10) {
rotate([0,0,90])
difference() {
polygon(points=[[0,0],[0,40],[102.6,63],[102.6,0]])    ;
translate([1,0])
polygon(points=[[0,0],[0,39],[102.6,62],[102.6,0]])    ;
}

}