// Copyright Stephen Morrisson 2017
// All rights reserved

use <myCube.scad>
use <myCylinder.scad>
use <RigidHeddleShed.scad>
use <LoomFrame1.scad>


module RigidHeddleLoom()
{
    aS = 1.6;
    
    yShed = 15.0;
    
   // rigid heddle shed
    transSimpleRigidShed("green", 0,-30,0, 1.6, 1.6, 1.6, yShed, 12); 
    
    transCenterUpright("green", -10,0,0, yShed * 2);
    transCenterUpright("green", -20,0,0, yShed * 2);
}
RigidHeddleLoom();





// heddle support



// frame
//rhCentCylinder("red", 3, 2);





















