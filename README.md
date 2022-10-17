# Scalable large format field camera - 4&times;5 - 5&times;7 - 8&times;10

_This is my attempt to create a scalable large format field camera design._

## Project goals:
- of course a 3d printable and usable large format field camera in 4x5" format. The design should be scalable to 5x7" or even 8x10" by just changing a handful of variables.
- Learning OpenSCAD. Learning to use it efficiently. Learning to do good parametric development/design.
- Learning git/github and sharing my code with other people
- Checking out the limits of home 3D printing with a very limited set of available tools

## Some technical goals:
- the design is inspired by old and established field cameras like Horseman 45HD/FA or Linhof Technika. But it is also inspired by Intrepid and Standard Camera
- compact and lightweight. Projected weight for the 4x5 version with ground glass but without lens is below 1500g. The "overall package" should be lightweight, so don't expect me to design a rail and front standard for holding big and heavy lenses. for 4x5": usable with lenses from 90-300mm. Shorter or longer lenses are not targeted.
- a small standard lens should be able to stay on the camera when it is closed (e.g. Fujinon-WS 150/6.3 or Symmar 135/5.6, ...)
- rise of about 25-30mm with a normal lens
- fall of about 10mm with a normal lens
- front/back tilt of about 10 degrees
- left/right swing of about 10 degrees
- left/right shift optionally (probably not with first release)
- all movements on the front standard, no movements on the back
- easy switchable from landscape to portrait format
- tripod mount with Arca Swiss type mount
- all parts must be either 3D-printable or easily available.
- no special tools required besides a decent 3D printer and some common tools like little files, screwdrivers, sanding paper, cutter, scissors, ...
- no exotic third party parts/components
- form follows function
- KISS

## Early design decisions:
- completely 3D printed rail and front standard mechanism - lots of dovetails :-)
- for the initial 4x5 version I will use a bellows from standard cameras (https://www.standardcameras.com/product/replacement-bellows-v1-0/). For now it's relatively easy available, cheap and already mounted into a frame. For later versions, I will probably switch over to another source and add my own bellows mounting frame. For working with alternative bellows see the hints in the README file in folder STL_4x5, since you will have to build customized bellows frames using SCAD files.
- for the 5x7 version I will use a bellows from ebay-shop "ecbuyonline2008" which is orginally for a Linhof Technika 5x7 IV or V
- for the focusing rod I will use 6mm rods with 2mm pitch
- due to some printing related problems (first layer), I will avoid printing small holes directly onto the printing bed (smaller than 5mm). If holes are required, they will have a little offset on the Z-axis of 0.5mm. This will allow a "clean" first layer with really good adhesion, while the holes are "pre-drilled" for most of their depth

## First findings after finishing the first functional prototype
- PETG printing is somehow okay, but PLA is more rigid. Although I will do further tests with PETG, PLA stays the preferred material. This applies especially to the dovetails.
- completely printed front standard with (more than) acceptable stability is possible
- overall design seems to be a good starting point for further optimizations

## to do / next steps
- more real world testing (first tests successful)
- work around the current -7/+7 degrees tilt restriction (low priority)
- mechanism to lock the front lid when folding (done)
- foldable hood for the ground glass
- OpenSCAD code clean up and refinement (done)
- releasing the OpenSCAD code and make this project real open source  (done)
- scaling up to 5x7" (done)
- re-evaluate 4x5" bellows options (different source, design for configurable bellows frames is done) 
- using the built-in github wiki for documentation

# Update 2020-05-23
The 5x7 version is also finished. Although the 5x7" version is technically identical to the 4x5", there have been some changes to all SCAD files and I didn't test all of them again with 4x5. 
So if you are brave enough to work with the SCAD files to generate your own (4x5") STLs, please check them against my original 4x5 STLs.

# Update 2022-10-17
In the past there were some rumours or jokes about creating the 8x10" version, but nobody seemed to be brave enough to start the upscaling project. Or maybe the initially brave people gave up in despair... 
Until today. I had a conversation with Miguel Mesa (https://www.facebook.com/miguemesa), who now wants to start scaling up the design to 8x10" - which would be another milestone for my design. 
Although I am still pausing most of my photographic and 3d printing related activities, I am really curious how my design may evolve. And I want to encourage all watchers interested in a 8x10" version to participate and maybe even contribute to this next milestone.   

**Some very kind people asked me about the possibility to show their appreciation by donating to me.**

If you really felt somehow obliged to do so, then you should use https://paypal.me/EdgarKech :-) .
But I am also happy if you post pictures of your build to https://www.facebook.com/groups/3dprinting.and.analog.photography/


