import java.awt.*;

class Hydrant extends Object {
  
  Hydrant(float x) {
    
    super(x);
    image = loadImage(sketchPath() + "/images/objects/hydrant.png");
    platform = false;
    hitbox = new Rectangle[1];
    hitbox[0] = new Rectangle((int)x, round(height/1.11), round(width/22.5), round(height/7.03));
  }
  
  void draw() {
    image(image, x, height-round(height/7.2), round(width/22.5), round(height/7.2));
    hitbox[0].setLocation((int)x, round(height/1.11));
  }
  
  void toggle() {
    rect(x, y+(round(height/1.11)), round(width/22.5), round(height/7.03));
  }
  
};
