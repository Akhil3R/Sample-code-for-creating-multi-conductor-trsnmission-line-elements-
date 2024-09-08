// Gmsh script to create geometry of 10 wire cross-sections with air boundary

// Parameters
num_wires = 10;
wire_radius = 0.5;
wire_distance = 1.5;

// Air box parameters
air_margin = 5.0;
air_top = 5.0;
air_bottom = -5.0;

// Calculate air box dimensions
air_left = -air_margin;
air_right = (num_wires - 1) * wire_distance + air_margin;

// Create wire cross-sections
For i In {1:num_wires}
    x = (i-1) * wire_distance;
    y = 0;

    // Create center point
    Point(4*i-3) = {x, y, 0, 1.0};

    // Create points on the circle
    Point(4*i-2) = {x+wire_radius, y, 0, 1.0};
    Point(4*i-1) = {x, y+wire_radius, 0, 1.0};
    Point(4*i) = {x-wire_radius, y, 0, 1.0};

    // Create circle arcs
    Circle(3*i-2) = {4*i-2, 4*i-3, 4*i-1};
    Circle(3*i-1) = {4*i-1, 4*i-3, 4*i};
    Circle(3*i) = {4*i, 4*i-3, 4*i-2};

    // Create curve loop
    Curve Loop(i) = {3*i-2, 3*i-1, 3*i};

    // Create plane surface with name
    Plane Surface(i) = {i};
    Physical Surface(Sprintf("wire%g", i)) = {i};
EndFor

// Create air boundary box
point_start = 4*num_wires + 1;
Point(point_start) = {air_left, air_bottom, 0, 1.0};
Point(point_start + 1) = {air_right, air_bottom, 0, 1.0};
Point(point_start + 2) = {air_right, air_top, 0, 1.0};
Point(point_start + 3) = {air_left, air_top, 0, 1.0};

line_start = 3*num_wires + 1;
Line(line_start) = {point_start, point_start + 1};
Line(line_start + 1) = {point_start + 1, point_start + 2};
Line(line_start + 2) = {point_start + 2, point_start + 3};
Line(line_start + 3) = {point_start + 3, point_start};

// Create curve loop for air boundary
Curve Loop(num_wires + 1) = {line_start, line_start + 1, line_start + 2, line_start + 3};

// Create surface for air, excluding wire surfaces
Plane Surface(num_wires + 1) = {num_wires + 1, 1:num_wires};
Physical Surface("air") = {num_wires + 1};

// Synchronize the model
Coherence;
//+
Transfinite Curve {2, 1, 3, 5, 4, 6, 8, 7, 9, 11, 10, 12, 14, 13, 15, 17, 16, 18, 20, 19, 21, 23, 22, 24, 26, 25, 27, 29, 28, 30} = 30 Using Progression 1;
//+
Transfinite Curve {3, 6, 9, 12, 15, 18, 21, 24, 27, 30} = 15 Using Progression 1;
//+
Transfinite Curve {2, 1, 5, 4, 8, 7, 11, 10, 14, 13, 17, 16, 20, 19, 23, 22, 26, 25, 29, 28} = 7 Using Progression 1;
