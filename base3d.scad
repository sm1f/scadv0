
//Copyright Stephen Morrisson 2017

module xyzCube(c, x, y, z)
{
    color(c) cube([x, y, z], false);
}

module rotCube(c, rotX, rotY, rotZ, x, y, z)
{
    rotate([rotX, rotY, rotZ]) xyzCube(c, x, y, z);
}

module transCube(c, xOffset, yOffset, zOffset, x, y, z)
{
    translate([xOffset, yOffset, zOffset]) xyzCube(c, x, y, z);
}

module trCube(c, rotX, rotY, rotZ, xO, yO, zO, x, y, z)
{
    translate([xO, yO, zO])
    rotate([rotX, rotY, rotZ])
    xyzCube(c, x, y, z);
}

/*
trCube("yellow", 0,0,0, 0,0,0, 2, 3, 4);
trCube("green", 45, 45, 45, 4, 3, 1, 5, 6, 7);
trCube("blue", 0, 0, 45, 20, 0, 0, 5, 6, 7);
trCube("orange", 0,0,0, -10, 0, 0, 1,1,1);
trCube("orange", 45,0,0, -15, 0, 0, 1,1,1);
trCube("orange", 0,45,0, -20, 0, 0, 1,1,1);
trCube("orange", 0,0,45, -25, 0, 0, 1,1,1);
*/

module rhCylinder(c, rRadius, z)
{
    color(c) translate([rRadius, rRadius, 0.5 * z])
        cylinder(h=z, r=rRadius, center=true);
}
//rhCylinder("blue", 2, 1);
//translate([-15,-10,0]) rhCylinder("red", 2, 1);


module transCylinder(c, xO, yO, zO, rRadius, z)
{
    translate([xO,yO,zO]) rhCylinder(c, rRadius, z);
}
transCylinder("yellow", 0,0,0, 5, 2);
transCylinder("green", -15,15,0, 5, 2);

/*
rot cylinder: does it make sense?
module rotCylinder(c, rotX, rotY, rotZ, rRadius, z)
{
    rotate([rotX,rotY,rotZ])
        rhCylinder(c, rRadius, z);
}
translate([10, 0, 0]) rotCylinder("orange", 45,0,0, 4, 3);
translate([20, 0, 0]) rotCylinder("orange", 45,0,0, 4, 3);
translate([30, 0, 0]) rotCylinder("orange", 45,0,0, 4, 3);
//rotCylinder("orange", 45,45,0, 4, 3);
//rotCylinder("orange", 45,45,45, 4, 3);

module trCylinder(c, rotX, rotY, rotZ, xO, yO, zO, rRadius, z)
{
    translate([xO, yO, zO])
    {
        rotCylinder(c, rotX, rotY, rotZ, rRadius, z);
    }
}
//trCylinder("blue", 90,0,0, 10, 0, 0, 4, 3);
//trCylinder("blue", 45,45,0, 20, 0, 0, 4, 3);
//trCylinder("blue", 45,45,45, 30, 0, 0, 4, 3);
//trCylinder("red", 45,0,0, 0, 15, 0, 4, 3);
//trCylinder("red", 0,45,0, 0, 25, 0, 4, 3);
//trCylinder("red", 0,0,45, 0, 35, 0, 4, 3);
*/