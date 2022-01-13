import java.awt.*;

class Bookshelf_Big extends Object {
  
  Bookshelf_Big(int x,int y) {
    
    super(x, y);
    image = loadImage(sketchPath() + "/images/objects/bookshelf_big.png");
    
    hitbox = new Rectangle[1];
    hitbox[0] = new Rectangle(x+11, y+624, 175, 278);
        
  }
  
  void draw() {
    image(image, x, y+516, 192, 384);
    hitbox[0].setLocation(x+11, y+624);
  }
  
  void toggle() {
    rect(x+11, y+624, 175, 278);
  }
  
};
