import java.awt.*;

class Bookshelf_Short extends Object {
  
  Bookshelf_Short(int x) {
    
    super(x);
    image = loadImage(sketchPath() + "/images/objects/bookshelf_short.png");
    platform = false;
    hitbox = new Rectangle[1];
    hitbox[0] = new Rectangle(x+11, y+696, 175, 206);
        
  }
  
  void draw() {
    image(image, x, y+516, 192, 384);
    hitbox[0].setLocation(x+11, y+696);
  }
  
  void toggle() {
    rect(x+11, y+696, 175, 206);
  }
  
};
