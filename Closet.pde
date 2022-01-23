import java.awt.*;

class Closet extends Object {
  
  Closet(float x) {
    
    super(x);
    image = loadImage(sketchPath() + "/images/objects/closet.png");
    platform = false;
    hitbox = new Rectangle[1];
    hitbox[0] = new Rectangle((int)x+round(width/130.91), round(height/1.54), round(width/6.20), round(height/2.83));
        
  }
  
  void draw() {
    image(image, x, height-round(height/2.81), round(width/5.63), round(height/2.81));
    hitbox[0].setLocation((int)x+round(width/130.91), round(height/1.54));
  }
  
  void toggle() {
    rect(x+round(width/130.91), round(height/1.54), round(width/6.20), round(height/2.83));
  }
  
};
