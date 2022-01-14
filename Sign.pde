import java.awt.*;

class Sign extends Object {
  
  Sign(int x) {
    
    super(x);
    image = loadImage(sketchPath() + "/images/objects/sign2.png");
    platform = true;
    hitbox = new Rectangle[1];
    hitbox[0] = new Rectangle(x+20, y+584, 27, 20);
        
  }
  
  void draw() {
    image(image, x, y+580, 64, 320);
    hitbox[0].setLocation(x+20, y+584);
  }
  
  void toggle() {
    rect(x+20, y+584, 27, 20);
  }
  
};
