import java.awt.*;

class Ladder extends Object {
  
  Ladder(float x) {
    
    super(x);
    image = loadImage(sketchPath() + "/images/objects/ladder.png");
    platform = true;
    hitbox = new Rectangle[2];
    hitbox[0] = new Rectangle((int)x+round(width/80.0), round(height/1.65), round(width/17.35), round(height/45.0));
    hitbox[1] = new Rectangle((int)x+round(width/80.0), round(height/1.25), round(width/17.35), round(height/45.0));
        
  }
  
  void draw() {
    image(image, x, height-round(height/2.34), round(width/12.0), round(height/2.34));
    hitbox[0].setLocation((int)x+round(width/80.0), round(height/1.65));
    hitbox[1].setLocation((int)x+round(width/80.0), round(height/1.25));
  }
  
  void toggle() {
    rect(x+round(width/80.0), round(height/1.65), round(width/17.35), round(height/45.0));
    rect(x+round(width/80.0), round(height/1.25), round(width/17.35), round(height/45.0));
  }
  
};
