
// Copyright Stephen Morrisson 2017

use <base3d.scad>


// Right side of cylinder
module rhHalfCylinder(c, rRadius, z)
{
    negR = -1.0 * rRadius;
    rD = rRadius * 2.0;
    difference()
    {
        transCylinder(c, negR, 0, 0, rRadius, z);
        translate([-rD, 0, -z]) cube(rD, rD, z * 3.0);  
    }
}
rhHalfCylinder("red", 5, 3); 