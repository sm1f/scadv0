

module xyzCube(c, x, y, z)
{
    color(c) cube([x, y, z], false);
}

module transCube(c, xOffset, yOffset, zOffset, x, y, z)
{
    translate([xOffset, yOffset, zOffset]) xyzCube(c, x, y, z);
}

module rotCube(c, rotX, rotY, rotZ, xO, yO, zO, x, y, z)
{
    rotate([rotX, rotY, rotZ]) transCube(c, xO, yO, zO, x, y, z);
}
//rotCube("yellow", 0,0,0, 0,0,0, 2, 3, 4);
//rotCube("green", 10, 20, 30, 4, 3, 1, 5, 6, 7);


module rhCentCylinder(c, rRadius, z)
{
    color(c) cylinder(h=z, r=rRadius, false);
}
//rhCentCylinder("red", 3, 2);

module rhCylinder(c, rRadius, z)
{
    translate([rRadius, rRadius, 0]) rhCentCylinder(c, rRadius, z);
}
//rhCylinder("red", 3, 2);

module transCylinder(c, xO, yO, zO, rRadius, z)
{
    translate([xO, yO, zO]) rhCylinder(c, rRadius, z);
}
//transCylinder("green", -10, 10, 4, 3, 2);

module rotCylinder(c, rotZ, xO, yO, zO, rRadius, z)
{
    rotate([0, 0, rotZ]) transCylinder(c, xO, yO, zO, rRadius, z);
}
rotCylinder("orange", 90, 3, 3, 3, 4, 5);

