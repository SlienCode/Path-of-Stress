import java.awt.*;

class Bookshelf_Short extends Object {
  
  Bookshelf_Short(float x) {
    
    super(x);
    image = loadImage(sketchPath() + "/images/objects/bookshelf_short.png");
    platform = false;
    hitbox = new Rectangle[1];
    hitbox[0] = new Rectangle((int)x+round(width/130.91), round(height/1.30), round(width/8.23), round(height/4.37));
        
  }
  
  void draw() {
    image(image, x, height-round(height/2.29), round(width/7.5), round(height/2.29));
    hitbox[0].setLocation((int)x+round(width/130.91), round(height/1.30));
  }
  
  void toggle() {
    rect(x+round(width/130.91), round(height/1.30), round(width/8.23), round(height/4.37));
  }
  
};
