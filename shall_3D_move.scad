x = $t * 40;

//recommended FPS: 30, steps: 100

module rotate_about_pt(a, v, pt){
    translate(pt)
        rotate(a, v)
            translate(-pt)
                children();
} 
// 3D move

/* A - - - - B
   |         |
   |         |
   D - - - - C
Object in projection at OX is this figure. 
It rotates about poles-points: A, B, C, D
*/

shall("A");


module rot(){
    rotate([90, 0, 0]) translate([20, 17, 30])
    text("ω", size = 7);
    translate([30,-30,20])
    union(){
        translate([0,0,-5]) cylinder(5,0.2,0.2);
        cylinder(3,0.8,0);
        $fn = 100;
    } 
}  

module pole_X(x, y, z, x1, y1, z1, cx, cy){
    union(){
        translate([x,y,z])
        color("Red") cube([1,1,1.5]);
        translate([x1,y1,z1])
        color("Blue") union(){
            translate(cx) cube([30,0.7,0.7]);
            translate(cy) cube([0.7,20,0.7]);
            cube([0.7,0.7,10]);
        }  
    }          
    color([0.5, 1, 0.0], 0.8) cube([20,10,1]); 
}    
    

module pole_A(){
    pole_X(0,9,0,0,9.5,-0.5,[0,0,0],[0,-20,0]);   
}

module pole_B(){
    pole_X(19,9,0,19.5,9.5,-0.5, [-30,0,0],[0,-20,0]);  
}

module pole_C(){
    pole_X(19,0,0,19.5,-0.5,-0.5, [-30,0,0],[0,0,0]);   
}

module pole_D(){
    pole_X(0,0,0,-0.5,-0.5,-0.5, [0,0,0],[0,0,0]);
}

module vect(abs_a){
    color ("Red")union(){
    translate([0,0,abs_a]) cylinder(2,0.5,0);    
    cylinder(abs_a, 0.3, 0.3);
    $fn = 100;
    }    
} 

// first pole - point A
module shall(pole){
    if(pole == chr(65)){
       
        if(x <= 25){
            translate([0,10,0])
            rotate(atan(4), [0,1,0]) 
            rotate(acos(13/sqrt(10*26)), [1,0,0])
            vect(sqrt(1600 + 1000));     
            translate([x*(8 / 5), -x*(6 / 5), x*(2 / 5)])
            {
                 pole_A();
            }    
        }
        else if(x >= 25){
            rot();
            translate([40,-30,10])
            rotate_about_pt(($t - 0.625)*250, [0,0,1], [0,10,0])
            {
                pole_A();
            } 
        }    
    }

    // second pole - point B

    if(pole == chr(66)){
          
        if(x <= 25){
            translate([20,10,0])
            rotate(atan(2), [0,1,0])
            rotate(acos(5/sqrt(30)), [1,0,0])
            vect(sqrt(600)); 
            translate([x*(4 / 5), -x*(2 / 5), x*(2 / 5)])
            {
                pole_B();
            }    
        }
        else if(x >= 25){
            rot();
            translate([20,-10,10])
            rotate_about_pt(($t - 0.625)*250, [0,0,1], [20,10,0])
            {
                pole_B(); 
            } 
        }    
    }

    // third pole - point C

    if(pole == chr(67)){
        
        if(x <= 30){
            translate([20,0,0])
            rotate(atan(3), [0,1,0]) 
            vect(sqrt(900 + 100));  
            translate([x, 0, x/3]){
                pole_C();
            } 
        }
        else if(x >= 30){
            rot();
            translate([30,0,10])
            rotate_about_pt(($t - 0.75)*370, [0,0,1], [20,0,0]){
                pole_C();
            }
        }    
    }

    // fourth pole - point D

    if(pole == chr(68)){

        if(x <= 25){
            translate([0,0,0])
            rotate(atan(5), [0,1,0])
            rotate(acos(26/sqrt(30*26)), [1,0,0])
            vect(sqrt(2500+400+100));      
            translate([2*x, -x*(4 / 5), x * (2 / 5)]){
                pole_D();
            } 
        }
        else if(x >= 25){
            rot();    
            translate([50,-20,10])
            rotate_about_pt(($t - 0.625)*250, [0,0,1], [0,0,0]){
               pole_D();
            } 
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
}
