import java.awt.*;

class Desk extends Object {
  
  Desk(float x) {
    
    super(x);
    image = loadImage(sketchPath() + "/images/objects/desk.png");
    platform = false;
    hitbox = new Rectangle[1];
    hitbox[0] = new Rectangle((int)x+29, (int)y+798, 229, 104);
        
  }
  
  void draw() {
    image(image, x, y+708, 288, 192);
    hitbox[0].setLocation((int)x+29, (int)y+798);
  }
  
  void toggle() {
    rect(x+29, y+798, 229, 104);
  }
  
};
