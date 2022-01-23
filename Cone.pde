import java.awt.*;

class Cone extends Object {
  
  Cone(float x) {
    
    super(x);
    image = loadImage(sketchPath() + "/images/objects/cone.png");
    platform = false;
    hitbox = new Rectangle[1];
    hitbox[0] = new Rectangle((int)x, height-round(height/14.04), round(width/22.5), round(height/14.04));
        
  }
  
  void draw() {
    image(image, x, height-round(height/14.06), round(width/22.5), round(height/14.06));
    hitbox[0].setLocation((int)x, height-round(height/14.04));
  }
  
  void toggle() {
    rect(x, height-round(height/14.04), round(width/22.5), round(height/14.04));
  }
  
};
