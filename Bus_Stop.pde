import java.awt.*;

class Bus_Stop extends Object {
  
  Bus_Stop(float x) {
    
    super(x);
    image = loadImage(sketchPath() + "/images/objects/bus_stop.png");
    platform = true;
    hitbox = new Rectangle[1];
    hitbox[0] = new Rectangle((int)x+round(width/24.41), round(height/2.04), round(width/2.3), round(height/45));
        
  }
  
  void draw() {
    image(image, x, height-round(height/1.88), round(width/1.88), round(height/1.88));
    hitbox[0].setLocation((int)x+round(width/24.41), round(height/2.04));
  }
  
  void toggle() {
    rect(x+round(width/24.41), round(height/2.04), round(width/2.3), round(height/45));
  }
  
};
