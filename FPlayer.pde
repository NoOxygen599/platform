class FPlayer extends FGameObject {
  
  int frame;
  int direction; 
 
  
  
  FPlayer() {
    super();
    frame = 0; 
    direction = R; 
    setPosition(700, 0);
    setName("player");
    setRotatable(false);
    setFillColor(red);
  }
  
  void act() {
    handleInput();
    collisions();
    animate(); 
  }
  
  void handleInput() {
    float vy = getVelocityY();
    float vx = getVelocityX();
    if (vy == 0) {
      action = idle;
    }
    if (akey) {
      setVelocity(-200, vy); 
      action = run;
      direction = L;
    }
    if (dkey) {
      setVelocity(200, vy); 
      action = run; 
      direction = R;
    }
    if (wkey) {
      setVelocity(vx, -300);
    }
    if (abs(vy) > 0.1)
    action = jump;
    
  }
  
  void animate() {
    if (frame >= action.length) frame = 0;
    if (frameCount % 5 == 0) {
      if (direction == R) attachImage(action[frame]);
      if (direction == L) attachImage(reverseImage(action[frame]));
      frame++;
    }
  }
  
  
  
void collisions() {
if (isTouching("spike")){
      setPosition(700, 0);  
  }
  //if (isTouching("ice")){
   //   setVelocity(handleInput(vx * 0.2)); 
 // }
}
  
  
 
}
