import java.awt.*;

class Sign extends Object {
  
  Sign(int x,int y) {
    
    super(x, y);
    image = loadImage(sketchPath() + "/images/objects/sign0.png");
    
    hitbox = new Rectangle[1];
    hitbox[0] = new Rectangle(x+20, y+672, 27, 16);
        
  }
  
  void draw() {
    image(image, x, y+644, 64, 256);
    hitbox[0].setLocation(x+20, y+672);
  }
  
  void toggle() {
    rect(x+20, y+672, 27, 16);
  }
  
};
