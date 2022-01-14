import java.awt.*;

class Pillar extends Object {
  
  Pillar(int x) {
    
    super(x);
    image = loadImage(sketchPath() + "/images/objects/pillar.png");
    platform = true;
    hitbox = new Rectangle[1];
    hitbox[0] = new Rectangle(x+27, y+604, 137, 20);
        
  }
  
  void draw() {
    image(image, x, y+580, 192, 320);
    hitbox[0].setLocation(x+27, y+604);
  }
  
  void toggle() {
    rect(x+27, y+604, 137, 20);
  }
  
};
