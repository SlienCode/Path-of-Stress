import java.awt.*;

class Truck extends Object {

  Truck(int x,int y) {

    super(x, y);
    image = loadImage(sketchPath() + "/images/objects/truck0.png");

    hitbox = new Rectangle[2];
    hitbox[0] = new Rectangle(x+20, y+805, 43, 102);
    hitbox[1] = new Rectangle(x+43, y+544, 792, 358);
  }

  void draw() {
    image(image, x, y+388, 448*2, 256*2);
    hitbox[0].setLocation(x, y+805);
    hitbox[1].setLocation(x+43, y+544);
  }

  void toggle() {
    rect(x, y+805, 43, 102);
    rect(x+43, y+544, 792, 358);
  }

};
