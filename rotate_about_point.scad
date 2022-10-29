
    
module rotate_about_pt(a, v, pt){
    translate(pt)
        rotate(a, v)
            translate(-pt)
                children();
} 

rotate_about_pt($t*90, 0, [10, 0, 0])
cylinder(center = true, r=10, h=1, $fn=3); 
    