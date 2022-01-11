import java.awt.*;

class Bench extends Object {
  
  Bench(int x,int y) {
    
    super(x, y);
    image = loadImage(sketchPath() + "/images/objects/bench.png");

    hitbox = new Rectangle[1];
    hitbox[0] = new Rectangle(x, y+150, 192, 32);
     
  }
  
  void draw() {
    image(image, x, y, 192, 192);
    hitbox[0].setLocation(x, y+150);
  }
  
  void toggle() {
    rect(x, y+150, 192, 32);
  }
  
};
