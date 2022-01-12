import java.awt.*;

class Car extends Object {

  Car(int x,int y) {

    super(x, y);
    image = loadImage(sketchPath() + "/images/objects/car_red.png");

    hitbox = new Rectangle[4];
    hitbox[0] = new Rectangle(x, y+698, 64, 64);
    hitbox[1] = new Rectangle(x+64, y+698, 64+64, 64);
    hitbox[2] = new Rectangle(x+64+64, y+698, 64+64+64, 64);
    hitbox[3] = new Rectangle(x+64+64+64, y+698, 64+64+64+64, 64);
    
    /*
    for (int i = 0; i < leftsize; i++) {
      if (i<=130) {
        hitboxleft[i] = new Point(x+48, y+257-i);
      } else if (i<=154) {
        hitboxleft[i] = new Point(x+88, y+258-i);
      } else if (i<=179) {
        hitboxleft[i] = new Point(x+126, y+259-i);
      } else {
        hitboxleft[i] = new Point(x+164, y+260-i);
      }
    }

    for (int i = 0; i < upsize; i++) {
      if (i<=40) {
        hitboxup[i] = new Point(x+i+48, y+127);
      } else if (i<=79) {
        hitboxup[i] = new Point(x+i+47, y+104);
      } else if (i<=118) {
        hitboxup[i] = new Point(x+i+46, y+80);
      } else if (i<=288) {
        hitboxup[i] = new Point(x+i+45, y+56);
      } else {
        hitboxup[i] = new Point(x+i+44, y+119);
      }
    }

    for (int i = 0; i < rightsize; i++) {
      if (i<=138) {
        hitboxright[i] = new Point(x+468, y-i+257);
      } else {
        hitboxright[i] = new Point(x+333, y-i+258);
      }
    }
    */
  }

  void draw() {
    image(image, x, y+644, 512, 256);
    hitbox[0].setLocation(x, y+698);
    hitbox[1].setLocation(x+64, y+698);
    hitbox[2].setLocation(x+64+64, y+698);
    hitbox[3].setLocation(x+64+64+64, y+698);
  }

  void toggle() {
    rect(x+50, y+771, 50, 211);
    rect(x+100, y+750, 50, 211);
    rect(x+153, y+723, 38, 211);
    rect(x+191, y+699, 200, 211);
    //rect(x, y+698, 512, 212);
    /*
    for (int i = 0; i < leftsize; i++) {
      rect((int) hitboxleft[i].getX(),(int) hitboxleft[i].getY(), 1, 1);
    }

    for (int i = 0; i < upsize; i++) {
      rect((int) hitboxup[i].getX(),(int) hitboxup[i].getY(), 1, 1);
    }

    for (int i = 0; i < rightsize; i++) {
      rect((int) hitboxright[i].getX(),(int) hitboxright[i].getY(), 1, 1);
    }
    */
  }

};
