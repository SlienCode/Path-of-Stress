import java.awt.*;

class Truck extends Object {

  Truck(int x) {

    super(x);
    image = loadImage(sketchPath() + "/images/objects/truck.png");
    platform = false;
    hitbox = new Rectangle[2];
    hitbox[0] = new Rectangle(x+2, y+808, 41, 99);
    hitbox[1] = new Rectangle(x+43, y+544, 796, 358);
  }

  void draw() {
    image(image, x, y+388, 896, 512);
    hitbox[0].setLocation(x+2, y+808);
    hitbox[1].setLocation(x+43, y+544);
  }

  void toggle() {
    rect(x+2, y+808, 41, 99);
    rect(x+43, y+544, 796, 358);
  }

};
