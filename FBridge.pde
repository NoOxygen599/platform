 class FBridge extends FGameObject {
  
  FBridge(float x, float y) {
    super();
    setPosition(x, y);
    setName("bridge");
    attachImage(Bridge);
    setStatic(true); 
  }
   void act() {
     if(isTouching("player")) {
       setStatic(false); 
     }
   }
}
