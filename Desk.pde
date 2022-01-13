import java.awt.*;

class Desk extends Object {
  
  Desk(int x,int y) {
    
    super(x, y);
    image = loadImage(sketchPath() + "/images/objects/desk.png");
    
    hitbox = new Rectangle[1];
    hitbox[0] = new Rectangle(x+29, y+798, 229, 104);
        
  }
  
  void draw() {
    image(image, x, y+708, 288, 192);
    hitbox[0].setLocation(x+29, y+798);
  }
  
  void toggle() {
    rect(x+29, y+798, 229, 104);
  }
  
};
