// Copyright Stephen Morrisson 2017
// All rights reserved

// rh Cent Cylinder
// rh Cylinder


module rhCentCylinder(c, rRadius, z)
{
    color(c) cylinder(h=z, r=rRadius, center=true);
}
rhCentCylinder("red", 3, 2);

module rhHalfCylinder(c, rRadius, z)
{
    negR = -1.0 * rRadius;
    rD = rRadius * 2.0;
    difference()
    {
	rhCentCylinder(c, rRadius, z);
//        transCylinder(c, negR, 0, 0, rRadius, z);
        //translate([-rD, 0, -z]) cube(rD, rD, z * 3.0);  
    }
}
rhHalfCylinder("red", 5, 3); 