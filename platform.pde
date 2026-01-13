import fisica.*;
FWorld world;


color white          = #FFFFFF;
color black          = #000000;
color cyan           = #00FFFF;
color colorIce       = #99d9ea;
color middleGreen    = #22b14c;
color rightGreen     = #a8e61d;
color leftGreen      = #d3f9bc;
color centerGreen    = #004F00;
color intGreen       = #24e61e; 
color treeTrunkBrown = #9c5a3c;
color spikeGrey      = #b4b4b4;
color bridge         = #f5e49c;
color green          = #4FD859;
color red            = #DB3128;
color blue           = #DB3128;
color orange         = #F7AE1B;
color brown          = #8E630D;

PImage map, ice, stone, treeTrunk, treeIntersect, treeMiddle, treeLeft, treeRight, spike, Bridge;
int gridSize = 32;
float zoom = 1.5;
boolean upkey, downkey, leftkey, rightkey, spacekey, qkey, wkey, akey, skey, dkey, ekey;
FPlayer player;


void setup() {
 
  size(600, 600);
  Fisica.init(this);
  loadImages();
  //map = loadImage("map.png");
  loadWorld(map);
  loadPlayer();
}

void loadImages() {
  map =           loadImage("map.png");
  ice =           loadImage("ice.png");
  treeTrunk =     loadImage("tree_trunk.png"); 
  stone =         loadImage("brick.png");
  treeMiddle =    loadImage("treetop_center.png");
  treeLeft =      loadImage ("treetop_w.png");
  treeRight =     loadImage ("treetop_e.png");
  treeIntersect = loadImage ("tree_intersect.png"); 
  spike =         loadImage ("spike.png");
  Bridge =        loadImage ("bridge_center.png"); 
}
void loadWorld(PImage img) {
  world = new FWorld(-20000, -20000, 20000, 20000);
  world.setGravity(0, 900);
  
  for (int y = 0; y < img.height; y++) {
    for (int x = 0; x < img.width; x++) {
      color c = map.get(x, y);
        FBox b = new FBox (gridSize, gridSize);
        b.setPosition(x*gridSize, y*gridSize);
        b.setStatic(true);
        if (c == black) {
        b.attachImage(stone); 
        b.setFriction(7);
        b.setName("stone");
        world.add(b);
       }
        if (c == colorIce) {
        b.attachImage(ice); 
        b.setFriction(0);
        b.setName("ice");
        world.add(b);
        }
         if (c == middleGreen) {
        b.attachImage(treeMiddle); 
        b.setFriction(4);
        b.setName("treeMiddleL");
        world.add(b);
    }
      if (c == leftGreen) {
        b.attachImage(treeLeft); 
        b.setFriction(4);
        b.setName("treeLeftL");
        world.add(b);
    }
      if (c == rightGreen) {
        b.attachImage(treeRight); 
        b.setFriction(4);
        b.setName("treeRightL");
        world.add(b);
    }
    if (c == intGreen ) {
        b.attachImage(treeIntersect); 
        b.setFriction(4);
        b.setName("treeIntL");
        world.add(b);
    }
      if (c == treeTrunkBrown) {
        b.attachImage(treeTrunk); 
        b.setSensor(true);
        b.setName("treeTrunk");
        world.add(b);
    }
    if (c == spikeGrey) {
        b.attachImage(spike);   
        b.setName("spike");
        world.add(b);
    }
    if (c == bridge) {
        b.attachImage(Bridge);   
        b.setName("bridge");
        world.add(b);
    }
  }
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

void actworld() {
  player.act();
//for (int i = 0; i < terrain.size(); i++) {
 //  FBox b = terrain.get(i);
  // if (b instanceof FBride) ((Fbridge) b) .act();
 //}
 
  
  
}


void drawWorld() {
  pushMatrix();
  translate( -player.getX()*zoom+width/2, -player.getY()*zoom+height/2);
  scale(zoom);
  world.step();
  world.draw();
  popMatrix();
}
