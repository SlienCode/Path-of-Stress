import java.awt.*;

class Car extends Object {

  Car(int x,int y) {

    super(x, y);
    image = loadImage(sketchPath() + "/images/objects/car_red.png");

    hitbox = new Rectangle[5];
    hitbox[0] = new Rectangle(x+50, y+772, 64, 211);
    hitbox[1] = new Rectangle(x+114, y+748, 39, 211);
    hitbox[2] = new Rectangle(x+153, y+724, 38, 211);
    hitbox[3] = new Rectangle(x+191, y+700, 142, 211);
    hitbox[4] = new Rectangle(x+333, y+764, 134, 211);
  }

  void draw() {
    image(image, x, y+644, 512, 256);
    hitbox[0].setLocation(x+50, y+772);
    hitbox[1].setLocation(x+114, y+748);
    hitbox[2].setLocation(x+153, y+724);
    hitbox[3].setLocation(x+191, y+700);
    hitbox[4].setLocation(x+333, y+764);
  }

  void toggle() {
    rect(x+50, y+772, 64, 211);
    rect(x+114, y+748, 39, 211);
    rect(x+153, y+724, 38, 211);
    rect(x+191, y+700, 142, 211);
    rect(x+333, y+764, 134, 211);
  }

};
