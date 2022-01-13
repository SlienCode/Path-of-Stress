import java.awt.*;

class Closet extends Object {
  
  Closet(int x,int y) {
    
    super(x, y);
    image = loadImage(sketchPath() + "/images/objects/closet.png");
    
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
