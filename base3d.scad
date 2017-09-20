

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


module rhCylinder(c, rRadius, z)
{
    //color(c) cylindar();
}
