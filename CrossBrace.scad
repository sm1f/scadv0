// Copyright Stephen Morrisson 2017
// All rights reserved

//  Loom Frame

use <myCube.scad>
use <Flang.scad>
use <myBaseParts.scad>



module HalfCrossBrace(c, xBase, yBase, zBase)
{
    xVal = 1;
    xRidge = 1;
    yRidge = 1;
    zRidge = 1;

    yRidge = 1;
    
    xyzCube(c, xBase, yBase, zBase);
    transCube(c, 0, 0, zBase, 1,1,1);
    transCube(c, xRidge + xVal, 0, zBase, 1,1,1);
    
    transCube(c, xBase - (2 * xRidge) - xVal, 0, zBase, 1,1,1);
    transCube(c, xBase - xRidge, 0, zBase, xRidge, yRidge, zRidge);
}

module CrossBrace(c, xBase, yBase, zBase, ySpacer, xSide)
{
    yMax = ySpacer + (2.0 * yBase);
    
    HalfCrossBrace("green", xBase, yBase, zBase);
    translate([0,yBase + ySpacer,0])
        HalfCrossBrace("blue", xBase, yBase, zBase);
    transCube("red", 0, 0, 0, xSide, yMax, zBase);
    transCube(c, xBase - xSide, 0, 0, xSide, yMax, zBase);
}

scale([1.6,1.6,1.6])
scale([3,3,1])
CrossBrace("green", 20, 1, 1, 3, 1);

