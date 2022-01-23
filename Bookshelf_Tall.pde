import java.awt.*;

class Bookshelf_Tall extends Object {
  
  Bookshelf_Tall(float x) {
    
    super(x);
    image = loadImage(sketchPath() + "/images/objects/bookshelf_tall.png");
    platform = false;
    hitbox = new Rectangle[1];
    hitbox[0] = new Rectangle((int)x+round(width/130.91), round(height/1.44), round(width/8.23), round(height/3.24));
        
  }
  
  void draw() {
    image(image, x, height-round(height/2.34), round(width/7.5), round(height/2.34));
    hitbox[0].setLocation((int)x+round(width/130.91), round(height/1.44));
  }
  
  void toggle() {
    rect(x+round(width/130.91), round(height/1.44), round(width/8.23), round(height/3.24));
  }
  
};
