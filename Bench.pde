import java.awt.*;

class Bench extends Object {
  
  Bench(float x) {
    
    super(x);
    image = loadImage(sketchPath() + "/images/objects/bench.png");
    platform = false;
    hitbox = new Rectangle[1];
    hitbox[0] = new Rectangle((int)x, round(height/1.05), round(width/7.5), round(height/21.43));
  }
  
  void draw() {
    image(image, x, height-round(height/4.69), round(width/7.5), round(height/4.69));
    hitbox[0].setLocation((int)x, height-round(height/21.42));
  }
  
  void toggle() {
    rect(x, round(height/1.05), round(width/7.5), round(height/21.43));
  }
  
};
