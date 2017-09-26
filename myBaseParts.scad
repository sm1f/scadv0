// Copyright Stephen Morrisson 2017
// All rights reserved

// {xyz, trans, rot} UBar


use <myCube.scad>
use <myCylinder.scad>



module xyzUBar(cB, cL, cR, xBase, yBase, zBase, 
    xLeft, zLeft, xRight, zRight)
{
    xyzCube(cB, xBase, yBase, zBase);
    transCube(cL, 0, 0, zBase, xLeft, yBase, zLeft);
    transCube(cR, xBase - xRight, 0, zBase, xRight, yBase, zRight);
}

xyzUBar("red", "green", "blue", 10, 14, 1, 2, 3, 4, 5);

module transUBar(c, xO, yO, zO, xB, yB, zB, xL, zL, xR, zR)
{
    translate([xO, yO, zO]) xyzUBar(c, c, c, xB, yB, zB, xL, zL, xR, zR);
}
//transUBar("orange", -10, -10, -1,  4, 2, 1, 1, 1, 2, 2);


module rotUBar(c, rotX, rotY, rotZ, xO, yO, zO,
    xB, yB, zB, xL, zL, xR, zR)
{
    rotate([rotX, rotY, rotZ]) transUBar(c, xO, yO, zO, xB, yB, zB,
        xL, zL, xR, zR);
}
rotUBar("orange", 90, 180, 270, -10, -10, -1,  4, 2, 1, 1, 1, 2, 2);
