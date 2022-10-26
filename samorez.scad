rotate([0,0,$t*360])
union(){
    rotate([45, 0, 0])
    union(){
        cylinder(10, 0.5, 0.5);
        translate([0,0,10])
        rotate(a = -$t*360, v = [0.1*cos($t*360), 0.1*sin($t*360), 10]) 
        union(){    
            cylinder(0.5, 5, 9);
            color("Red") cube([5,0.5,1]);
        }    
    }
}   

color([0.5, 0.5, 0.5, 0.8]) cylinder(1,100,100);