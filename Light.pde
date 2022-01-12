import java.awt.*;

class Light extends Object {
  
  Light(int x,int y) {
    
    super(x, y);
    image = loadImage(sketchPath() + "/images/objects/light.png");
    
    hitbox = new Rectangle[1];
    hitbox[0] = new Rectangle(x+20, y+584, 27, 16);
        
  }
  
  void draw() {
    image(image, x, y+580, 64, 320);
    hitbox[0].setLocation(x+20, y+584);
  }
  
  void toggle() {
    rect(x+20, y+584, 27, 16);
  }
  
};
