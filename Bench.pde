import java.awt.*;

class Bench extends Object {
  
  Bench(int x,int y) {
    
    super(x, y);
    image = loadImage(sketchPath() + "/images/objects/bench.png");

    hitbox = new Rectangle[1];
    hitbox[0] = new Rectangle(x, y+858, 192, 42);
  }
  
  void draw() {
    image(image, x, y+708, 192, 192);
    hitbox[0].setLocation(x, y+858);
  }
  
  void toggle() {
    rect(x, y+858, 192, 42);
  }
  
};
