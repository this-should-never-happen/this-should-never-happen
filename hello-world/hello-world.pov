// To run this "program", try something like:
// povray +A +AM2 +J +H800 +W1200 +D +P hello-world.pov

#include "shapes.inc"

camera {
  location <0, 0, -10>
  look_at <0, 0, 0>
}

light_source { <-10, 20, -10>, color rgb <1, 0, 0> }
light_source { <10, 20, -10>, color rgb <0, 0, 1> }

#declare Alice = union {
  sphere { <0, -0.8, 0>, 0.2 }
  cylinder { <0, -0.8, 0>, <0, 0.8, 0>, 0.2 }
  sphere { <0, 0.8, 0>, 0.2 }
};

#macro Bob(Start, Stop)
  union {
    intersection {
      torus { 0.4, 0.2 rotate <90, 0, 0> }
      #if (Stop - Start < 360)
        object { Wedge(Stop - Start) rotate 90*z rotate 90*y rotate Start*z }
      #end
    }
    sphere { <0.4, 0, 0>, 0.2 rotate <0, 0, Start> }
    sphere { <0.4, 0, 0>, 0.2 rotate <0, 0, Stop> }
    translate <0, -0.4, 0>
  }
#end

#declare Carol = -5.5;

union {
  union {
    object { Alice translate <-0.4, 0, 0> }
    object { Alice rotate <0, 0, 90> scale <0.4, 1, 1> }
    object { Alice translate <0.4, 0, 0> }
    translate <Carol, 0, 0>
  }

  union {
    object { Alice rotate <0, 0, 90> scale <0.5, 1, 1> translate <0, -0.4, 0> }
    object { Bob(0, 300) }
    translate <Carol + 1.4, 0, 0>
  }

  object { Alice translate <Carol + 2.3, 0, 0> }

  object { Alice translate <Carol + 2.8, 0, 0> }

  object { Bob(0, 360) translate <Carol + 3.8, 0, 0> }

  union {
    object { Alice matrix <1, 0, 0,  -0.2, 1, 0,  0, 0, 1,  -0.6, 0, 0> }
    object { Alice matrix <1, 0, 0,  0.2, 1, 0,  0, 0, 1,  -0.2, 0, 0> }
    object { Alice matrix <1, 0, 0,  -0.2, 1, 0,  0, 0, 1,  0.2, 0, 0> }
    object { Alice matrix <1, 0, 0,  0.2, 1, 0,  0, 0, 1,  0.6, 0, 0> }
    translate <Carol + 6, 0, 0>
  }

  object { Bob(0, 360) translate <Carol + 7.5, 0, 0> }

  union {
    object { Alice scale <1, 0.6, 1> translate <-0.3, -0.4, 0> }
    object { Bob(45, 180) scale <0.75, 1, 1> }
    translate <Carol + 8.7, 0, 0>
  }

  object { Alice translate <Carol + 9.3, 0, 0> }

  union {
    object { Bob(0, 360) scale <0.75, 1, 1> }
    object { Alice translate <0.3, 0, 0> }
    translate <Carol + 10.1, 0, 0>
  }

  union {
    object { Alice scale <1, 0.7, 1> translate <0, 0.3, 0> }
    object { Bob(270, 270) }
    translate <Carol + 11, 0, 0>
  }

  pigment { color rgb 1 }
}
