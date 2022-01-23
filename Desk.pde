import java.awt.*;

class Desk extends Object {
  
  Desk(float x) {
    
    super(x);
    image = loadImage(sketchPath() + "/images/objects/desk.png");
    platform = false;
    hitbox = new Rectangle[1];
    hitbox[0] = new Rectangle((int)x+round(width/49.66), round(height/1.13), round(width/6.29), round(height/8.65));
        
  }
  
  void draw() {
    image(image, x, height-round(height/4.60), round(width/5.0), round(height/4.60));
    hitbox[0].setLocation((int)x+round(width/49.66), round(height/1.13));
  }
  
  void toggle() {
    rect(x+round(width/49.66), round(height/1.13), round(width/6.29), round(height/8.65));
  }
  
};
