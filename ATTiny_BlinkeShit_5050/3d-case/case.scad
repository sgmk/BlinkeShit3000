$fn = 96;

cover = 0.12;


module
rotate([180,0,0]) union(){
linear_extrude(height = 5, center = true, convexity = 10)
		import(file = "case_grid.dxf", layer = "grid");

difference(){
    minkowski(){
    translate([0,0,-0]) linear_extrude(height = 4, center = true, convexity = 10)
		import(file = "case_grid.dxf", layer = "border");
        sphere(d=1);
    }
    translate([0,0,-0.6])linear_extrude(height = 5, center = true, convexity = 10)
		import(file = "case_grid.dxf", layer = "inner");
    translate([7,40,-1]) cube([11, 10, 5], center=true);
    translate([6,0,-0.6]) cube([8, 10, 5], center=true);
    translate([0,0,-0.5-cover])linear_extrude(height = 6, center = true, convexity = 10)
		import(file = "case_grid.dxf", layer = "cut");
    translate([0,0,-0.5-cover]) linear_extrude(height = 6, center = true, convexity = 10)
		import(file = "case_grid.dxf", layer = "LED");
  }
}

// thin coverlayer
/*
difference(){
translate([0,0,2.5]) linear_extrude(height = 0.12, center = true, convexity = 10)
		import(file = "case_grid.dxf", layer = "border");
    #translate([9,26.5,-0.6]) cylinder(20, d=2, center=true, $fn=30);
}
*/

// lid


rotate([180,0,0]) translate([75,0,2.5]) difference(){
    minkowski(){
translate([0,0,-1]) linear_extrude(height = 6, center = true, convexity = 10)
		import(file = "case_grid.dxf", layer = "Topborder");
        sphere(d=2);
    }
    translate([0,0,-1.6]) linear_extrude(height = 8, center = true, convexity = 10)
		import(file = "case_grid.dxf", layer = "Tobinner");
    linear_extrude(height = 6, center = true, convexity = 10)
		import(file = "case_grid.dxf", layer = "LED");
    translate([0,0,0])linear_extrude(height = 7, center = true, convexity = 10)
		import(file = "case_grid.dxf", layer = "cut");
    translate([7.5,40,-1]) cube([11, 10, 5], center=true);
    translate([6,0,-0.6]) cube([8, 10, 5], center=true);
    
}
