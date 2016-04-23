module s3003Servo(){
    
    cube([20, 40.5, 36.1]);
    translate([0, -15/2, 26.6]){
        difference(){
        cube([20, 55.5, 2]);
        d = 48; //46???
        
        translate([5, 55.5/2-d/2, 0])
            cylinder(20, 3, 3);
        translate([15, 55.5/2-d/2, 0])
            cylinder(20, 3, 3);
        translate([5, 55.5/2+d/2, 0])
            cylinder(20, 3, 3);
        translate([15, 55.5/2+d/2, 0])
            cylinder(20, 3, 3);
        }
    }
    
    translate([10, 10, 36.1])
        cylinder(5, 3, 3);
    
    
}

//s3003Servo();