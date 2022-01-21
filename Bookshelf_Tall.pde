import java.awt.*;

class Bookshelf_Tall extends Object {
  
  Bookshelf_Tall(float x) {
    
    super(x);
    image = loadImage(sketchPath() + "/images/objects/bookshelf_tall.png");
    platform = false;
    hitbox = new Rectangle[1];
    hitbox[0] = new Rectangle((int)x+11,(int) y+624, 175, 278);
        
  }
  
  void draw() {
    image(image, x, y+516, 192, 384);
    hitbox[0].setLocation((int)x+11, (int)y+624);
  }
  
  void toggle() {
    rect(x+11, y+624, 175, 278);
  }
  
};
