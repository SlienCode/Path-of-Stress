import java.awt.*;

class Tree extends Object {
  
  Tree(int x,int y) {
    
    super(x, y);
    image = loadImage(sketchPath() + "/images/objects/tree_platform.png");
    
    hitbox = new Rectangle[2];
    hitbox[0] = new Rectangle(x+108, y+814, 95, 16);
    hitbox[1] = new Rectangle(x+288, y+764, 103, 16);
        
  }
  
  void draw() {
    image(image, x, y+420, 480, 480);
    hitbox[0].setLocation(x+108, y+814);
    hitbox[1].setLocation(x+288, y+764);
  }
  
  void toggle() {
    rect(x+108, y+814, 95, 16);
    rect(x+288, y+764, 103, 16);
  }
  
};
