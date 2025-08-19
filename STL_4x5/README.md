# 4&times;5 parts list

**We put our format specific STL files in here, so we get a complete set of STL files for building a camera in the specified format**

## Printed parts

All parts can be printed on any decent 3D printer with sufficient build volume 
- for 4x5" a smaller printer with about 190x190x100mm build volume is sufficient

Print settings vary slightly for the different parts - if not explicitly mentioned use
- 0.2mm layers or better
- 4 walls
- 4 bottom/top layers
- when printing with PETG, use at least 15-20% more infill as hinted below, below numbers are for PLA
The tolerances between the parts are quite tight, so you have to sand them. I recommend sanding the dovetail parts with 400 wet sanding paper. 

### printed parts list
- body, infill 30%, support for overhang angles over 60 degrees, support touching the build plate
- front lid, infill 30%, no supports
- front lid dovetail, infill 30%, no supports
- focusing block, infill 100%, no supports
- focusing wheel, infill 100%, no supports
- back plate, 30% infill, no supports
- locking rails (1x original, 1x mirrored), infill 100%, no supports
- locking levers (1x original, 1x mirrored), infill 100%, no supports
- rails, min 40% infill, support for overhang angles over 60 degrees
- slider, min 50% infill, no supports
- front standard, min 50% infill, support for overhang angles over 80 degrees, support everywhere, do not print the standard in its upright position, but layed down to its back side
- front standard tilt plates (2x) min 50% infill, support for overhang angles over 80 degrees, support touching the build plate
- pulling lever plate, 100% infill, no supports
- pulling levers (1x original, 1x mirrored), 100% infill, no supports
- lensboard carrier, min 40% infill, support for overhang angles over 60 degrees, support touching the build plate
- lensboard lower clamp, 100% infill, no supports
- lensboard upper clamp, 100% infill, no supports
- ground glass frame, infill 30%, no supports,
- ground glass clamps, 100% infill, no supports
- tripod plate, min 50% infill, no supports
- only needed when not using a bellows from standard cameras: bellows front frame, min 50% infill, no supports
- only needed when not using a bellows from standard cameras: bellows back frame, min 50% infill, no supports

### non-printed parts
- bellows, for 4x5" order the bellows from standardcameras.com or from eBay or from aliexpress (e.g. from ecbuyonline2008 aka eTone)
- focusing rod: T6, 2 or 4mm lead, 160mm length
- T6 nut (brass) 
- flange coupler 6mm
- M5 threaded rod, 200mm
- M5x20 screw (1x)
- M5x10 knurled nuts (3x)
- M5x10...12 screws with knurled heads (2x)
- M5x12...16 screws with knurled heads (2x)
- M5 press-in nuts (5x)
- countersunk screws 3x12 (about 35x)
- countersunk screws 2x10 (about 10x)
- ground glass 127x101mm
- about 600mm of 1.25mm spring steel wire for the ground glass frame
- about 100mm of 0.75mm spring steel wire for the pulling lever mechanism

## some hints & sources:
### bellows
History has shown that standardcameras is sometimes out of stock for the bellows.
- Alternative 1: build your own bellows (sorry, no howto from me, but there are lots of excellent sources!)
- Alternative 2: Find a replacement bellows for another field camera (e.g. Linhof Technika 4x5, Toyo 45A, Horseman, HD/HF/FA 45, ...). 

Make sure to get squared bellows with a front measurement of something between 88 and 98mm (default is 94mm) and a back measurement of something between 141 and 153mm (default is 144mm).

You have to create your own STLs for the bellow frames from the according SCAD files. In the config_4x5.scad file find the variables "vBellowsFrontInner_l" and "vBellowsBackInner_l" and change them to the measurements of your bellows - don't change anything else unless you have a really good reason for it. Let OpenSCAD render your SCAD files and export to STL.

### bellows frames (in case you are not using bellows from standard cameras):
The bellows frames consist of two individual parts (inner and outer frame), but I modeled them as one piece for easier modeling and printing. 
They are just "linked" together via the bottom 0.1mm (for easier printing). Just use a knife to split inner and outer frame and clean up the edges.

### dove tails:
the fit of the various dove tails may be very tight in the beginning. So I'd recommend pre-assembling the dovetails and trying to move the parts. If it is too tight, use fine sandpaper until there is only very little friction. It shouldn't get wobbly.

### front standart:
don't try to print the front standart in its upright position. Lay it down ot its back side and make sure to allow support everywhere.
Assembling:
- Make sure the dove tails of slider and front standard aren't too tight (see section "dove tails")
- put slider and front standard together before assembling the pulling lever mechanism.

### pulling levers assembly
- pulling levers and pulling lever plate: put them together and rotate the pulling levers on their axis until there is no noticable friction. If the holes in the levers are too small, use a 8mm drill bit (just by hand) to widen it.
- pulling lever plate: make sure that little horizontal hole is open (if not, you could use either a 1.5mm drill bit or a hot wire to push it open). This is where you put the spring wire through and bend it on both sides almost to a right angle (let's say 110 degrees). Don't cut the spring steel wire too short before final assembly.
- see the pictures in the pictures/version_1.0 folder https://github.com/edgarkech/scalable_field_camera/tree/master/pictures/version_1.0 

### assembling the front standard
- start with slider and front standard, otherwise it may be difficult to get the front standard onto the slider with the pulling levers already assembled.
- pre-assemble pulling lever plate, spring wire and pulling levers
- put the pulling assembly to the bottom of the slider and screw it to the slider.
- see again the pictures in the pictures/version_1.0 folder https://github.com/edgarkech/scalable_field_camera/tree/master/pictures/version_1.0 

### focusing rod:
Find "T6 lead screw" with fitting brass nuts on aliexpress, ebay or your preferred source, similar to this offer: https://www.aliexpress.com/item/32507277503.html. 
Take either 2mm or 4mm lead with 200mm length. 
Cut it to about 160 to 165mm. 
Press the nut into the 10mm hole of the rail lever. 
Secure it with one small screw and file down everything hanging over
- see again the pictures in the pictures/version_1.0 folder https://github.com/edgarkech/scalable_field_camera/tree/master/pictures/version_1.0 

### focusing wheel:
Find "6mm flange coupler" on aliexpress, ebay or your preferred source, similar to this offer: https://www.aliexpress.com/item/4000208248034.html.
Press it into the Focusing wheel and align the side holes with the threads, so you can screw in the tiny screws.

### threaded inserts:
Find "M5 threaded insert" on aliexpress, ebay or your preferred source. I am using M5x6x7 brass insert similar to this: https://www.ebay.com/itm/M5x-5-16mm-Injection-Molding-Nut-Brass-Knurled-Thread-Inserts-Nuts/332250787457. 
Make them hot and press them into the according holes using a M5 threaded rod or a longer screw.

### knobs:
All knobs are quite standard M5 screws or nuts. 
3x nut M5, one for swing and two for the lid. 
2x M5x16 for tilt, 2x M5x12 for shift (the flat ones). 
Also one M5x12 for the tripod plate. 
I prefer stainless steel but anything else with similar size will do.
