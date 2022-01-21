import java.awt.*;

class Chair extends Object {
  
  Chair(float x) {
    
    super(x);
    image = loadImage(sketchPath() + "/images/objects/chair.png");
    platform = false;
    hitbox = new Rectangle[1];
    hitbox[0] = new Rectangle((int)x+25, (int)y+846, 83, 54);
        
  }
  
  void draw() {
    image(image, x, y+772, 128, 128);
    hitbox[0].setLocation((int)x+25, (int)y+846);
  }
  
  void toggle() {
    rect(x+25, y+846, 83, 54);
  }
  
};
