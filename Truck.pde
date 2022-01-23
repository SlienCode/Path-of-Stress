import java.awt.*;

class Truck extends Object {

  Truck(float x) {

    super(x);
    image = loadImage(sketchPath() + "/images/objects/truck.png");
    platform = false;
    hitbox = new Rectangle[2];
    hitbox[0] = new Rectangle((int)x+round(width/720.0), round(height/1.11), round(width/35.12), round(height/9.09));
    hitbox[1] = new Rectangle((int)x+round(width/34.49), round(height/1.65), round(width/1.81), round(height/2.51));
  }

  void draw() {
    image(image, x, height-round(height/1.76), round(width/1.61), round(height/1.76));
    hitbox[0].setLocation((int)x+round(width/720.0), round(height/1.11));
    hitbox[1].setLocation((int)x+round(width/34.49), round(height/1.65));
  }

  void toggle() {
    rect(x+round(width/720.0), round(height/1.11), round(width/35.12), round(height/9.09));
    rect(x+round(width/34.49), round(height/1.65), round(width/1.81), round(height/2.51));
  }

};
