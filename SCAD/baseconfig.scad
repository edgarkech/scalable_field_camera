/*
Here we define some variables which are independent from the camera format
*/


// some generic variables
$fn = 60; // we are using 60 fragments for cylinders and similar objects

// we are including a format specific configuration sheet - but make sure to include only one!

//include <config_4x5.scad>;
 include <config_5x7.scad>;
// include <config_8x10.scad>;

// Arca Swiss tripod plate
// caution: some Arca Swiss compatible tripod heads may have slight variations
// vArca_length = xx; // the length is irrelevant here
vArca_width = 38;
vArca_height = 7;
vArcaBase_cutout = 4;
vArcaBase_height = 1.5;


