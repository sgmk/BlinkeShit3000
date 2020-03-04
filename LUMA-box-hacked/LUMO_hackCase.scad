



//14 9
WallThickness = 0.8;
StepThickness = 1.8;
Height = 8;
StepHeight = 1.6;

CoverHeight = 1.2;

translate([0,0,Height/2])
difference() {
  translate([35,22.5,0]) cube(size = [58,38,Height], center = true);
    
  for ( j = [1 : 1 : 4] ){  
    for ( i = [1 : 1 : 4] ){
    translate([i*14,j*9,0]) cube(size = [14-WallThickness,9-WallThickness,Height+1], center = true);
    
    }
  }  
  for ( j = [1 : 1 : 4] ){  
    for ( i = [1 : 1 : 4] ){
    translate([i*14,j*9,Height-StepHeight]) cube(size = [14-WallThickness+StepThickness,9-WallThickness+StepThickness,Height+1], center = true);
    
    }
  }  
}

//translate([80,0,CoverHeight/2+Height-CoverHeight])
translate([80,0,0])
difference() {
  translate([35,22.5,0]) cube(size = [58-1.2,38-1.2,CoverHeight], center = true);
    
  for ( j = [1 : 1 : 4] ){  
    for ( i = [1 : 1 : 4] ){
    translate([i*14,j*9,0]) cube(size = [14-WallThickness,9-WallThickness,CoverHeight+1], center = true);
    
    }
  }  
  
}