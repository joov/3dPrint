// size in mm
size=3;

linear_extrude(height = size, center = false, convexity = 0, twist = 100, slices=5*size, $fn=5*size)
union(){
        translate([-0.7*size,-0.2*size])
        text(text="S", size=size, font="Liberation sans");
        translate([-0.4*size,-0.7*size])
        text(text="G", size=size, font="Liberation sans");
}

