import java.awt.*;

class Chair extends Object {
  
  Chair(float x) {
    
    super(x);
    image = loadImage(sketchPath() + "/images/objects/chair.png");
    platform = false;
    hitbox = new Rectangle[1];
    hitbox[0] = new Rectangle((int)x+round(width/57.6), round(height/1.06), round(width/17.35), round(height/16.67));
        
  }
  
  void draw() {
    image(image, x, height-round(height/7.03), round(width/11.25), round(height/7.03));
    hitbox[0].setLocation((int)x+round(width/57.6), round(height/1.06));
  }
  
  void toggle() {
    rect(x+round(width/57.6), round(height/1.06), round(width/17.35), round(height/16.67));
  }
  
};
