// BlinkeShit Frame-Generator Version 3000


WallThickness = 1.2;
OuterWall = 1.8;
StepThickness = WallThickness + 0.8;
Height = 8;
StepHeight = 1.6;

CoverHeight = 1.2;

//LengthX = 80;
//WidthY = 60; 

SizeX = 14;
SizeY = 9;

GridNrX  = 4;
GridNrY = 4;


LengthX = GridNrX*SizeX+OuterWall*2;
WidthY = GridNrY*SizeY+OuterWall*2;

translate([0,0,Height/2])
difference() {
  translate([LengthX/2-OuterWall,WidthY/2-OuterWall,0]) cube(size = [LengthX,WidthY,Height], center = true);
   
  for ( j = [1 : 1 : GridNrY] ){  
    for ( i = [1 : 1 : GridNrX] ){
    translate([i*SizeX-SizeX/2,j*SizeY-SizeY/2,0]) cube(size = [SizeX-WallThickness,SizeY-WallThickness,Height+1], center = true);
    
    }
  }  
  
  
  
  for ( j = [1 : 1 : GridNrY] ){  
    for ( i = [1 : 1 : GridNrX] ){
    translate([i*SizeX-SizeX/2,j*SizeY-SizeY/2,Height-StepHeight]) cube(size = [SizeX-WallThickness+StepThickness,SizeY-WallThickness+StepThickness,Height+1], center = true);
    
    }
  }  
}



//translate([0,0,CoverHeight/2+Height-CoverHeight])
translate([80,0,CoverHeight/2])
difference() {
  translate([35,22.5,0]) cube(size = [LengthX-OuterWall*2,WidthY-OuterWall*2,CoverHeight], center = true);
    
  for ( j = [1 : 1 : 4] ){  
    for ( i = [1 : 1 : 4] ){
    translate([i*14,j*9,0]) cube(size = [14-WallThickness,9-WallThickness,CoverHeight+1], center = true);
    
    }
  }  
  
}


