x = $t * 40;

//translate([0,0,-0.2])cylinder(0.1,100,100);

//recommended FPS: 30, steps: 100

pole = 40;
test_rotate = 0;

module rotate_about_pt(a, v, pt){
    translate(pt)
        rotate(a, v)
            translate(-pt)
                children();
} 

// sk

    

// 3D move

/* A - - - - B
   |         |
   |         |
   D - - - - C
Object in projection at OX is this figure. 
It rotates about poles-points: A, B, C, D
*/

// first pole - point A

if(pole == 10){
    if(x <= 25){
        translate([x*(8 / 5), -x*(6 / 5), x*(2 / 5)])
        {
            union(){
                translate([0,9,0])
                color("Red") cube([1,1,1.5]);
                translate([0,9+0.5,-0.5])
                color("Blue") union(){
                    translate([0, 0, 0]) cube([30,0.7,0.7]);
                    translate([0, -20, 0]) cube([0.7,20,0.7]);
                    cube([0.7,0.7,10]);
                }  
            }          
            color([0.5, 1, 0.0], 0.8) cube([20,10,1]); 
        }    
    }
    else if(x >= 25){
        translate([40,-30,10])
        rotate_about_pt(($t - 0.625)*250, [0,0,1], [0,10,0])
        {
            union(){
                translate([0,9,0])
                color("Red") cube([1,1,1.5]);
                translate([0,9+0.5,-0.5])
                color("Blue") union(){
                    translate([0, 0, 0]) cube([30,0.7,0.7]);
                    translate([0, -20, 0]) cube([0.7,20,0.7]);
                    cube([0.7,0.7,10]);
                }  
            }          
            color([0.5, 1, 0], 0.8) cube([20,10,1]); 
        } 
    }    
}

// second pole - point B

if(pole == 20){
    if(x <= 25){
        translate([x*(4 / 5), -x*(2 / 5), x*(2 / 5)])
        {
            union(){
                translate([19,9,0])
                color("Red") cube([1,1,1.5]);
                translate([19.5,9+0.5,-0.5])
                color("Blue") union(){
                    translate([-30, 0, 0]) cube([30,0.7,0.7]);
                    translate([0, -20, 0]) cube([0.7,20,0.7]);
                    cube([0.7,0.7,10]);
                }  
            }          
            color([0.5, 1, 0.0], 0.8) cube([20,10,1]); 
        }    
    }
    else if(x >= 25){
        translate([20,-10,10])
        rotate_about_pt(($t - 0.625)*250, [0,0,1], [20,10,0])
        {
            union(){
                translate([19,9,0])
                color("Red") cube([1,1,1.5]);
                translate([19.5,9+0.5,-0.5])
                color("Blue") union(){
                    translate([-30, 0, 0]) cube([30,0.7,0.7]);
                    translate([0, -20, 0]) cube([0.7,20,0.7]);
                    cube([0.7,0.7,10]);
                }  
            }          
            color([0.5, 1, 0.0], 0.8) cube([20,10,1]);  
        } 
    }    
}

// third pole - point C

if(pole == 30){
    if(x <= 30){
        translate([x, 0, x/3]){
            union(){
                translate([19,0,0])
                color("Red") cube([1,1,1.2]);
                translate([19.5,-0.5,-0.5])
                color("Blue") union(){
                    translate([-30, 0, 0]) cube([30,0.7,0.7]);
                    cube([0.7,20,0.7]);
                    cube([0.7,0.7,10]);
                }  
            }          
            color([0.5, 1, 0.0], 0.8) cube([20,10,1]);  
        } 
    }
    else if(x >= 30){
        translate([30,0,10])
        rotate_about_pt(($t - 0.75)*370, [0,0,1], [20,0,0]){
        union(){
                translate([19,0,0])
                color("Red") cube([1,1,1.2]);
                translate([19.5,-0.5,-0.5])
                color("Blue") union(){
                    translate([-30, 0, 0]) cube([30,0.7,0.7]);
                    cube([0.7,20,0.7]);
                    cube([0.7,0.7,10]);
                }  
            }          
            color([0.5, 1, 0.0], 0.8) cube([20,10,1]); 
        }
    }    
}

// fourth pole - point D

if(pole == 40){
    if(x <= 25){
        translate([2*x, -x*(4 / 5), x * (2 / 5)]){
            union(){
                translate([0,0,0])
                color("Red") cube([1,1,1.2]);
                translate([-0.5,-0.5,-0.5])
                color("Blue") union(){
                    translate([0, 0, 0]) cube([30,0.7,0.7]);
                    cube([0.7,20,0.7]);
                    cube([0.7,0.7,10]);
                }  
            }          
            color([0.5, 1, 0.0], 0.8) cube([20,10,1]);  
        } 
    }
    else if(x >= 25){
        translate([50,-20,10])
        rotate_about_pt(($t - 0.625)*250, [0,0,1], [0,0,0]){
            union(){
                translate([0,0,0])
                color("Red") cube([1,1,1.2]);
                translate([-0.5,-0.5,-0.5])
                color("Blue") union(){
                    translate([0, 0, 0]) cube([30,0.7,0.7]);
                    cube([0.7,20,0.7]);
                    cube([0.7,0.7,10]);
                }  
            }          
            color([0.5, 1, 0.0], 0.8) cube([20,10,1]); 
        } 
    }    
}


if(test_rotate){
    translate([20,-10,10])
    rotate_about_pt(-$t*360, [0,0,1], [20,10,0]) 
    union(){
        translate([19,9,0])
        color("Red") cube([1,1,1.2]);
        cube([20,10,1]);
    }
}

//start location

color([0.3, 0.3, 0, 0.1]) union(){
    translate([19,9,0])
    color("Red") cube([1,1,1.2]);
    translate([0,9,0])
    color("Red") cube([1,1,1.2]);
    translate([0,0,0])
    color("Red") cube([1,1,1.2]);
    translate([19,0,0])
    color("Red") cube([1,1,1.2]);
    cube([20,10,2]);
    translate([40,-1,0])cube([1,1,10]);
    translate([40,-20,0])cube([1,1,10]);
    translate([49,-20,0])cube([1,1,10]);
    translate([49,-1,0])cube([1,1,10]);
}

// finish location
translate([20,-10,10]) rotate_about_pt(90, [0,0,1], [20,10,0])
color([0.3, 0.3, 0, 0.1]) union(){
    translate([19,9,0])
    color("Red") cube([1,1,1.2]);
    translate([0,9,0])
    color("Red") cube([1,1,1.2]);
    translate([0,0,0])
    color("Red") cube([1,1,1.2]);
    translate([19,0,0])
    color("Red") cube([1,1,1.2]);
    cube([20,10,2]);
    translate([0,0,-10])cube([20,10,2]);
}
