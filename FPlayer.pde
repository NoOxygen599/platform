class FPlayer extends FGameObject {
  
  
  FPlayer() {
    super();
    setPosition(700, 0);
    setName("player");
    setRotatable(false);
    setFillColor(red);
  }
  
  void act() {
    handleInput();
    if (isTouching("spike")){
      setPosition(700, 0);  
  }
  }
  
  void handleInput() {
     float vy = getVelocityY();
    float vx = getVelocityX();
    if (akey) setVelocity(-200, vy); 
    if (dkey) setVelocity(200, vy); 
    if (wkey) setVelocity(vx, -300);
  }
  
  

  
  
  
 
}
