// Copyright Stephen Morrisson 2017
// All rights reserved

// Tab Flang

use <myCube.scad>
use <myCylinder.scad>

module rightSimpleTab(c, rRadius, z, xSpacer)
{
    yD = 2.0 * rRadius;
    xyzCube(c, xSpacer, yD, z);
    rightHalfCylinder(c, xSpacer, 0, 0, rRadius, z);
}

module rightTab(c, xO, yO, zO, rRadius, z, xSpacer)
{
    translate([xO, yO, zO])
    {
        rightSimpleTab(c, rRadius, z, xSpacer);
    }
}
rightTab("blue", 10, 0, 0, 3, 1, 4);

module rightFlang(c, xO, yO, zO, rRadius, z, xSpacer, rHole)
{
    rMid = rRadius - rHole;
    difference()
    {
        rightTab(c, xO, yO, zO, rRadius, z, xSpacer);
        transCylinder(c, xO + xSpacer - rRadius, yO + rMid, zO -1,
            rHole, z + 2.0); 
    }
}
rightFlang("green", 20,0,0, 3, 1, 4, 2);

module leftTab(c, xO, yO, zO, rRadius, z, xSpacer)
{
    mirror([1, 0, 0]) rightTab(c, -xO, yO, zO, rRadius, z, xSpacer);
}
leftTab("blue", -10,0,0, 3, 1, 4);

module leftFlang(c, xO, yO, zO, rRadius, z, xSpacer, rHole)
{
    mirror([1, 0, 0])
        rightFlang(c, -xO, yO, zO, rRadius, z, xSpacer, rHole);
}
leftFlang("green", -20,0,0, 3, 1, 4, 1);





