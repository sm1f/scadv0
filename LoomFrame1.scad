// Copyright Stephen Morrisson 2017
// All rights reserved

//  Loom Frame

use <myCube.scad>
use <Flang.scad>
use <myBaseParts.scad>

module LoomFrame1(c, xO, yO, zO, y)
{
    transCenterUpright("green", xO, yO, zO, y);
}
//LoomFrame1("red", 0,0,0,  12);

module transLeftHangerSupport(c, xO, yO, zO)
{
    translate([xO, yO, zO])
    {
        transCube(c, 0, 0, 0, 2.0, 1, 1);
        transCube(c, 0, 1, 0, 1, 1, 1);
    }
}
module transRightHangerSupport(c, xO, yO, zO)
{
    translate([xO, yO, zO])
    {
        //transCube("red", 0,0,0, 1,1,1);
        transCube(c, 0, 0, 0, 2.0, 1, 1);
        transCube(c, 1, 1, 0, 1, 1, 1);
    }
}

module CenterUpright(c, yB)
{
    transLeftHangerSupport(c, 0, 0, 0);
    transRightHangerSupport(c, 5, 0,0);
    
    transLeftHangerSupport(c, 0, yB - 2, 0);
    transRightHangerSupport(c, 5, yB - 2,0);
    
    transUBar(c, 2, 0, 0, 3, yB, 1, 1, 1, 1, 1);
} 

module transCenterUpright(c, xO, yO, zO, yB)
{
    translate([xO,yO,zO]) CenterUpright(c, yB);
}

scale([3, 3, 1])
scale([1.6,1.6,1.6]) transCenterUpright("green", -5,0,0, 12);
//transCenterUpright("blue", 0,0,0, 12);
