Scalable large format field camera - 4x5 - 5x7 - 8x10

This is my attempt to create a scalable large format field camera design.

Project goals:
- of course a 3d printable and usable large format field camera in 4x5" format. The design should be scalable to 5x7" or even 8x10" by just changing a handful of variables.
- Learning OpenSCAD. Learning to use it efficiently. Learning to do good parametric development/design.
- Learning git/github and sharing my code with other people
- Checking out the limits of home 3D printing with a very limited set of available tools

Some technical goals:
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

Early design decisions:
- completely 3D printed rail and front standard mechanism - lots of dovetails :-)
- for the initial 4x5 version I will use a bellows from standard cameras (https://www.standardcameras.com/product/replacement-bellows-v1-0/). For now it's relatively easy available, cheap and already mounted into a frame. For later versions, I will probably switch over to another source and add my own bellows mounting frame.
- for the 5x7 version I will use a bellows from ebay-shop "ecbuyonline2008" which is orginally for a Linhof Technika 5x7 IV or V
- for the focusing rod I will use 6mm rods with 2mm pitch
- due to some printing related problems (first layer), I will avoid printing small holes directly onto the printing bed (smaller than 5mm). If holes are required, they will have a little offset on the Z-axis of 0.5mm. This will allow a "clean" first layer with really good adhesion, while the holes are "pre-drilled" for most of their depth

First findings after finishing the first functional prototype
- PETG printing is somehow okay, but PLA is more rigid. Although I will do further tests with PETG, PLA stays the preferred material. This applies especially to the dovetails.
- completely printed front standard with (more than) acceptable stability is possible
- overall design seems to be a good starting point for further optimizations

to do / next steps
- real world testing 
- work around the current -7/+7 degrees tilt restriction (low priority)
- mechanism to lock the front lid when folding
- foldable hood for the ground glass
- OpenSCAD code clean up and refinement
- releasing the OpenSCAD code and make this project real open source
- scaling up to 5x7" (means also designing bellows frames) 
- re-evaluate 4x5" bellows options (different source, also requiring the addition of my "own" bellows frames) 
- optimize slider locking mechanism
- using the built-in github wiki for documentation
