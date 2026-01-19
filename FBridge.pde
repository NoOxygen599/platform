 class FBridge extends FGameObject {
  
  FBridge(float x, float y) {
    super();
    setPosition(x, y);
    setName("bridge");
    attachImage(Bridge);
    setStatic(true); 
  }
   void act() {
      println("bridge"); 
     if(isTouching("player")) {
       setSensor(true); 
       setStatic(false); 
     }
   }
}
