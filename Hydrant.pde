import java.awt.*;

class Hydrant extends Object {
  
  Hydrant(int x,int y) {
    
    super(x, y);
    image = loadImage(sketchPath() + "/images/objects/hydrant.png");

    hitbox = new Rectangle[1];
    hitbox[0] = new Rectangle(x, y+32, 64, 128);
  }
  
  void draw() {
    image(image, x, y, 64, 128);
    hitbox[0].setLocation(x, y+32);
  }
  
  void toggle() {
    rect(x, y+32, 64, 128);
  }
  
};
