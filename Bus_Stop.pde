import java.awt.*;

class Bus_Stop extends Object {
  
  Bus_Stop(int x) {
    
    super(x);
    image = loadImage(sketchPath() + "/images/objects/bus_stop.png");
    platform = true;
    hitbox = new Rectangle[1];
    hitbox[0] = new Rectangle(x+59, y+438, 625, 20);
        
  }
  
  void draw() {
    image(image, x, y+420, 768, 480);
    hitbox[0].setLocation(x+59, y+438);
  }
  
  void toggle() {
    rect(x+59, y+438, 625, 20);
  }
  
};
