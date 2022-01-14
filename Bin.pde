import java.awt.*;

class Bin extends Object {
  
  Bin(int x, int g) {
    
    super(x);
    image = loadImage(sketchPath() + "/images/objects/bin" + g + ".png");
    platform = false;
    hitbox = new Rectangle[1];
    hitbox[0] = new Rectangle(x+3, y+744, 184, 158);
        
  }
  
  void draw() {
    image(image, x, y+708, 192, 192);
    hitbox[0].setLocation(x+3, y+744);
  }
  
  void toggle() {
    rect(x+3, y+744, 184, 158);
  }
  
};
