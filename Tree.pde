import java.awt.*;

class Tree extends Object {
  
  Tree(float x) {
    
    super(x);
    image = loadImage(sketchPath() + "/images/objects/tree_platform.png");
    platform = true;
    hitbox = new Rectangle[2];
    hitbox[0] = new Rectangle((int)x+round(width/13.33), round(height/1.11), round(width/15.16), round(height/45));
    hitbox[1] = new Rectangle((int)x+round(width/5.0), round(height/1.18), round(width/13.98), round(height/45));
        
  }
  
  void draw() {
    image(image, x, height-round(height/1.88), round(width/3.0), round(height/1.88));
    hitbox[0].setLocation((int)x+round(width/13.33), round(height/1.11));
    hitbox[1].setLocation((int)x+round(width/5.0), round(height/1.18));
  }
  
  void toggle() {
    rect(x+round(width/13.33), round(height/1.11), round(width/15.16), round(height/45));
    rect(x+round(width/5.0), round(height/1.18), round(width/13.98), round(height/45));
  }
  
};
