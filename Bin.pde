import java.awt.*;

class Bin extends Object {
  
  Bin(float x, int g) {
    
    super(x);
    image = loadImage(sketchPath() + "/images/objects/bin" + g + ".png");
    platform = false;
    hitbox = new Rectangle[1];
    hitbox[0] = new Rectangle((int)x+round(width/480), round(height/1.21), round(width/7.83), round(height/5.70));
        
  }
  
  void draw() {
    image(image, x, height-round(height/4.69), round(width/7.5), round(height/4.69));
    hitbox[0].setLocation((int)x+round(width/480), round(height/1.21));
  }
  
  void toggle() {
    rect(x+round(width/480), round(height/1.21), round(width/7.83), round(height/5.70));
  }
  
};
