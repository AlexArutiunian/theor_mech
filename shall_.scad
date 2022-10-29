x = $t * 40;
y = $t * 40;
x1 = $t * 60;

//recommended FPS: 30, steps: 100

pole = 4;
test_rotate = 0;

module rotate_about_pt(a, v, pt){
    translate(pt)
        rotate(a, v)
            translate(-pt)
                children();
} 
//system of coordinats by object
if(test_rotate){
    translate([50,0,0])
    rotate_about_pt(-$t*360, [0,0,1], [0,10,0]) 
    union(){
        translate([0,9,0])
        color("Red") cube([1,1,1.2]);
        cube([20,10,1]);
    }
}
//rotate_about_pt($t*360, [0,0,1], [0,0,0])

translate([20,-10,0]) rotate_about_pt(90, [0,0,1], [20,10,0])
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
}

//first pole
if(pole == 1){
    if(x <= 20){
        translate([x, 0, 0])
        union(){
            translate([19,9,0])
            color("Red") cube([1,1,1.2]);
            cube([20,10,1]);
        }
    }
    else if(x >= 20){
        if((-y + 20) >= -10){
            translate([20,-y + 20,0])
            union(){
                translate([19,9,0])
                color("Red") cube([1,1,1.2]);
                cube([20,10,1]);
            }
        }
        else{
            translate([20,-10,0])
            rotate_about_pt(($t - 0.75)*360, [0,0,1], [20,10,0])
            union(){
                translate([19,9,0])
                color("Red") cube([1,1,1.2]);
                cube([20,10,1]);
            }
        }    
    } 
}

// second pole
if(pole == 2){
    if(x <= 30){
        translate([x, 0, 0])
        union(){
            translate([19,0,0])
            color("Red") cube([1,1,1.2]);
            cube([20,10,1]);
        }   
    }
    else if(x >= 30){
        translate([30,0,0])
        rotate_about_pt(($t - 0.75)*360, [0,0,1], [20,0,0])
        union(){
            translate([19,0,0])
            color("Red") cube([1,1,1.2]);
            cube([20,10,1]);
        }
    }    
}
//third pole
if(pole == 3){
     if(x1 <= 25){
        translate([2*x1, 0, 0])
        union(){
            translate([0,9,0])
            color("Red") cube([1,1,1.2]);
            cube([20,10,1]);
        }   
    }
    else if(x1 >= 25 && x1 <= 40){
        translate([50,0,0])
        rotate_about_pt(-($t - 0.42)*360, [0,0,1], [0,10,0])
        union(){
            translate([0,9,0])
            color("Red") cube([1,1,1.2]);
            cube([20,10,1]);
        }
    } 
    else if(x1 >= 40 && x1 <= 50){
        translate([50,-x1 + 40,0])
        rotate_about_pt(-90, [0,0,1], [0,10,0])
        union(){
            translate([0,9,0])
            color("Red") cube([1,1,1.2]);
            cube([20,10,1]);
        }
    }    
}
//fourth pole
if(pole == 4){
    if(x <= 20){
        translate([2*x, 0, 0])
        union(){
            translate([0,0,0])
            color("Red") cube([1,1,1.2]);
            cube([20,10,1]);
        } 
    } 
    else{
        translate([40,0,0])
        rotate_about_pt(-($t - 0.5)*180, [0,0,1], [0,0,0])
        union(){
            translate([0,0,0])
            color("Red") cube([1,1,1.2]);
            cube([20,10,1]);
        }  
    }    
}    
