



//14 9
WallThickness = 1.4;
StepThickness = 1.8;
Height = 8;
StepHeight = 1.4;
CoverHeight = 1.2;
/*

translate([0,0,Height/2])
difference() {
  translate([35,22.5,0]) cube(size = [59,39,Height], center = true);
    
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
*/


   
 //linear_extrude(height = 2, center = false, convexity = 10, twist = 0) import("2s_Border_inner.dxf", convexity=3);
 
  linear_extrude(height = 20, center = false, convexity = 10, twist = 0) import("2d_wall.dxf", convexity=3);

 
  //linear_extrude(height = 1.2, center = false, convexity = 10, twist = 0) import("2d_cover.dxf", convexity=3); 
  
  //translate([0,0,0]) linear_extrude(height = 8.2, center = false, convexity = 10, twist = 0) import("2d_randli.dxf", convexity=3);
  
  translate([0,0,0]) linear_extrude(height = 1.2, center = false, convexity = 10, twist = 0) import("2d_top.dxf", convexity=3);
 


