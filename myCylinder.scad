// Copyright Stephen Morrisson 2017
// All rights reserved


module rhCentCylinder(c, rRadius, z)
{
    color(c) cylinder(h=z, r=rRadius, center=true);
}
rhCentCylinder("red", 3, 2);
