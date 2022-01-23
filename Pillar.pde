import java.awt.*;

class Pillar extends Object {
  
  Pillar(float x) {
    
    super(x);
    image = loadImage(sketchPath() + "/images/objects/pillar.png");
    platform = true;
    hitbox = new Rectangle[1];
    hitbox[0] = new Rectangle((int)x+round(width/53.33), round(height/1.49), round(width/10.51), round(height/45.0));
        
  }
  
  void draw() {
    image(image, x, height-round(height/2.81), round(width/7.5), round(height/2.81));
    hitbox[0].setLocation((int)x+round(width/53.33), round(height/1.49));
  }
  
  void toggle() {
    rect(x+round(width/53.33), round(height/1.49), round(width/10.51), round(height/45.0));
  }
  
};
