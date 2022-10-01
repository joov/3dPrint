anzahl = 6;


difference(){
    linear_extrude(50)circle($fn=anzahl, r=sqrt(84*anzahl));
    
    for(a=[1:anzahl]) {
       rotate([0,0,360/anzahl*(a)])
       translate([2.2*anzahl,0,15])cylinder(r=5.1, h=35);
       rotate([0,0,360/anzahl*(a)])translate([sqrt(84*anzahl),0,40])       rotate([0,-90,0])cylinder(r1=6,r2=4,h=2.2);
    }
}

