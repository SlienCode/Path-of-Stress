import java.awt.*;

class Closet extends Object {
  
  Closet(int x) {
    
    super(x);
    image = loadImage(sketchPath() + "/images/objects/closet.png");
    platform = false;
    hitbox = new Rectangle[1];
    hitbox[0] = new Rectangle(x+11, y+584, 232, 318);
        
  }
  
  void draw() {
    image(image, x, y+580, 256, 320);
    hitbox[0].setLocation(x+11, y+584);
  }
  
  void toggle() {
    rect(x+11, y+584, 232, 318);
  }
  
};
