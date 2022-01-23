import java.awt.*;

class Sign extends Object {
  
  Sign(float x, int g) {
    
    super(x);
    image = loadImage(sketchPath() + "/images/objects/sign" + g + ".png");
    platform = true;
    hitbox = new Rectangle[1];
    hitbox[0] = new Rectangle((int)x+(round(width/72.0)), round(height/1.54), round(width/53.33), round(height/45.0));
        
  }
  
  void draw() {
    image(image, x, height-round(height/2.81), round(width/22.5), round(height/2.81));
    hitbox[0].setLocation((int)x+(round(width/72.0)), round(height/1.54));
  }
  
  void toggle() {
    rect(x+(round(width/72.0)), round(height/1.54), round(width/53.33), round(height/45.0));
  }
  
};
