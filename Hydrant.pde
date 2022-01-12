import java.awt.*;

class Hydrant extends Object {
  
  Hydrant(int x,int y) {
    
    super(x, y);
    image = loadImage(sketchPath() + "/images/objects/hydrant.png");

    hitbox = new Rectangle[1];
    hitbox[0] = new Rectangle(x, y+804, 64, 128);
  }
  
  void draw() {
    image(image, x, y+772, 64, 128);
    hitbox[0].setLocation(x, y+804);
  }
  
  void toggle() {
    rect(x, y+804, 64, 128);
  }
  
};
