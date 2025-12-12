import fisica.*;
FWorld world;


color white          = #FFFFFF;
color black          = #000000;
color cyan           = #00FFFF;
color ice            = #99d9ea;
color middleGreen    = #22b14c;
color topGreen       = #a8e61d;
color sideGreen      = #d3f9bc;
color centerGreen    = #004F00;
color treeTrunkBrown = #9c5a3c;
color spike          = #b4b4b4;
color green          = #4FD859;
color red            = #DB3128;
color blue           = #DB3128;
color orange         = #F7AE1B;
color brown          = #8E630D;

PImage map, ice, stone, treeTrunk;
int gridSize = 32;
float zoom = 1.5;
boolean upkey, downkey, leftkey, rightkey, spacekey, qkey, wkey, akey, skey, dkey, ekey;
FPlayer player;


void setup() {

  size(600, 600);
  Fisica.init(this);

  map = loadImage("map.png");
  loadWorld(map);
  loadPlayer();
}
void loadWorld(PImage img) {
  world = new FWorld(-20000, -20000, 20000, 20000);
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

void loadPlayer() {
  player = new FPlayer();
  world.add(player);
}

void draw() {
  background(white);
  drawWorld();
  player.act();
}

void drawWorld() {
  pushMatrix();
  translate( -player.getX()*zoom+width/2, -player.getY()*zoom+height/2);
  scale(zoom);
  world.step();
  world.draw();
  popMatrix();
}
