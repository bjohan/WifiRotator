/*difference(){
    rotate([0, 90, 0])
    cylinder(70,42,42);
    translate([0,-45, 20])
    cube([70, 90, 70]);
}*/

module servoHoles(t){
    w = 41;
    h = 21;
    r = 1.75;
    cube([h, w, t]);
    
    c = w/2;
    dist = 46;
    translate([h/2, c-dist/2, 0])
        cylinder(t, r, r);
    translate([h/2, c+dist/2, 0])
        cylinder(t, r, r);
}

module antennaHoles(t){
    r = 2;
    cylinder(t,r,r);
    translate([50, 0, 0])
        cylinder(t,r,r);
}


module oProfile(t, w, h, l){
    difference(){
        cube([l, w,h]);
        translate([0,t,t])
        cube([l, w-2*t,h-2*t]);
    }
}
module uProfile(t, w, h, l){
    difference(){
        cube([l, w,h]);
        translate([0,t,t])
        cube([l, w-2*t,h-t]);
    }
}

module openBox(t, x, y, z){
    difference(){
        cube([x, y, z]);
        translate([t,t,t])
        cube([x-2*t, y-2*t,z-t]);
    }
}

module antennaBend(){
    
    difference(){
        oProfile(3, 15, 20, 70);
        translate([10, 15/2, 0])
        antennaHoles(3);
    }
    translate([0,0,120])
        rotate([0,90,0])
            oProfile(3, 15, 20, 100);
    difference(){
    translate([-90, 0, 120])
        oProfile(3, 15, 20, 110);

    //translate([-80, 15/2, 140-3])
    //    hornHoles(3);
    }
}

module antennaHolder(){
    
    difference(){
        translate([-10, 0 ,0])
        uProfile(3, 23, 23, 80);
        translate([10, 23/2, 0])
        antennaHoles(3);
    }
   
}

module hornHoles(t){
    r = 0.5;
    cylinder(t,r,r);
    translate([27, 0, 0])
        cylinder(t,r,r);
}
module servoHornFlange(){
    rotate([90, 0, 0])
    difference(){
        cylinder(3, 16, 16);
        
        translate([-27/2, 0, 0])
            hornHoles(3);
        rotate([0, 0, 90])
            translate([-27/2, 0, 0])
                hornHoles(3);
    }
}
module antennaPart(){
    translate([16, 26, 16])
        servoHornFlange();
    translate([16, 0, 16])
        servoHornFlange();
    antennaHolder();
    translate([-50-10, -25+23/2, 0])
        openBox(3,50,50,50);
}

module servoHolder(){
    x = 45;
    y = 60;
    z = 40;
    t = 3;
    r = 2;
    d = 5;
    difference(){
        cube([x, y, z]);
         translate([t, 0, t])
            cube([x-t, y, z-t]);
        translate([t, y/2-41/2, z/2-21/2])
            rotate([0, -90, 0])
                servoHoles(4);
        
        translate([t+d, d, 0])
            cylinder(t, r, r);
        translate([t+d, y-d, 0])
            cylinder(t, r, r);
        translate([x-d, 0 , 0]){
            translate([0, d, 0])
                cylinder(t, r, r);
            translate([0, y-d, 0])
                cylinder(t, r, r);
            
        }
        translate([x/2, y/2, 0]){
            translate([-27/2, 0, 0])
                hornHoles(3);
            rotate([0, 0, 90])
                translate([-27/2, 0, 0])
                    hornHoles(3);
            }
    }
    
    
}

antennaPart();
//servoHoles(3);
//rotate([90, 0, 0])
//servoHolder();
