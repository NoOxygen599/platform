import fisica.*;
FWorld world;


color white = #FFFFFF;
color black = #000000;
color green = #4FD859;
color red   = #DB3128;
color blue  = #DB3128;
color orange= #F7AE1B;
color brown = #8E630D;

PImage map;
int gridSize = 32;

//KEYS
boolean upkey, downkey, leftkey, rightkey, spacekey, qkey, wkey, akey, skey, dkey, ekey;

void setup() {

  size(600, 600);
  Fisica.init(this);

  map = loadImage("map.png");
  loadWorold(map);
}
 void loadWorld(PImage img) {
world = new FWorld(-2000, -2000, 2000, 2000);
 world.setGravity(0, 900);
 
  for (int y = 0; y < map.height; y++) {
    for (int x = 0; x < map.width; x++) {
      color c = map.get(x, y);
      if (c == black) {
        print("#");
        FBox b = new FBox (gridSize, gridSize);
        b.setPosition(x*gridSize, y*gridSize);
        b.setStatic(true);
        world.add(b);
      } else {
        print(" ");
      }
    }
    println("");
  }
}

void draw() {
  background(white);
  world.step();
  world.draw();
}
