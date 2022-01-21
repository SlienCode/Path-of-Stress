import java.awt.*;

class Ladder extends Object {
  
  Ladder(float x) {
    
    super(x);
    image = loadImage(sketchPath() + "/images/objects/ladder.png");
    platform = true;
    hitbox = new Rectangle[2];
    hitbox[0] = new Rectangle((int)x+18, (int)y+544, 83, 20);
    hitbox[1] = new Rectangle((int)x+18, (int)y+722, 83, 20);
        
  }
  
  void draw() {
    image(image, x, y+516, 120, 384);
    hitbox[0].setLocation((int)x+18, (int)y+544);
    hitbox[1].setLocation((int)x+18, (int)y+722);
  }
  
  void toggle() {
    rect(x+18, y+544, 83, 20);
    rect(x+18, y+722, 83, 20);
  }
  
};
