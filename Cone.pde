import java.awt.*;

class Cone extends Object {
  
  Cone(int x,int y) {
    
    super(x, y);
    image = loadImage(sketchPath() + "/images/objects/cone.png");
    
    hitbox = new Rectangle[1];
    hitbox[0] = new Rectangle(x, y+836, 64, 64);
        
  }
  
  void draw() {
    image(image, x, y+836, 64, 64);
    hitbox[0].setLocation(x, y+836);
  }
  
  void toggle() {
    rect(x, y+836, 64, 64);
  }
  
};
