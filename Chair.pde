import java.awt.*;

class Chair extends Object {
  
  Chair(int x,int y) {
    
    super(x, y);
    image = loadImage(sketchPath() + "/images/objects/chair.png");
    
    hitbox = new Rectangle[1];
    hitbox[0] = new Rectangle(x+25, y+846, 83, 54);
        
  }
  
  void draw() {
    image(image, x, y+772, 128, 128);
    hitbox[0].setLocation(x+25, y+846);
  }
  
  void toggle() {
    rect(x+25, y+846, 83, 54);
  }
  
};