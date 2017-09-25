// Copyright Stephen Morrisson 2017
// All rights reserved

use <myCube.scad>
use <myCylinder.scad>

// rigid heddle Shed

// A and B are slots (or wholes for ridit heddle
// count is the number of A
// One b for each A
module ShedAB(c, xBoarder, yBoarder, z, xA, yA, xB, yB, xSpacer, count)
{
    yMaxOpening = max(yA, yB);
    zBig = z * 3;
    
    xAB = xA + xB + xSpacer + xSpacer;
    xSize = xBoarder * 2.0 + count * xAB - xSpacer;
    ySize = yBoarder * 2.0 + yMaxOpening;
    
    difference()
    {
        xyzCube(c, xSize, ySize, z);
        {
            iCount = count - 1;
            for (i = [0: iCount])
            {
                xAO = xBoarder + (i * xAB);
                transCube(c, xAO, yBoarder, -z, xA, yA, zBig);
                xBO = xAO + xA + xSpacer;
                transCube(c, xBO, yBoarder, -z, xB, yB, zBig);  
            }
        }
    }
}
//ShedAB("green", 3, 3, 1, 1.6, 10, 1.6, 1.6, 1.6, 2);
//translate([-3,0,0]) ShedAB("green", 3, 3, 1, 2, 10, 3, 4, 1, 3);

module SimpleRigidShed(c, aBoarder, z, aOpenings, yA, count)
{
    //xyzCube("red", 1,1,1);
    a = aOpenings;
    ShedAB(c, aBoarder, aBoarder, z, a, yA, a, a, a, count); 
}
//SimpleRigidShed("blue", 1.6, 1.6, 1.6, 16.0, 20);

module transSimpleRigidShed(c, xO, yO, zO, aBoarder, z, aOpenings, yA, count)
{
    translate([xO, yO, zO])
        SimpleRigidShed(c, aBoarder, z, aOpenings, yA, count);
}
//transSimpleRigidShed("green", 2,3,4, 1.6, 1.6, 1.6, 16.0, 20);

// count must be even.
module transSimpleShed(c, xO, yO, zO, aBoarder, z, xHole, yHole, count)
{
    translate([xO, yO, zO])
    {
        ShedAB(c, aBoarder, aBoarder, z,
            xHole, yHole, xHole, yHole, xHole, count / 2);
    }
}
transSimpleShed("green", 2,3,4, 1.6, 1.6, 1.6, 16.0, 20);

