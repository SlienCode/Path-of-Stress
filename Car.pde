import java.awt.*;

class Car extends Object {

  Car(int x,int y) {

    super(x, y);
    image = loadImage("C:/Users/ATHGEO/Desktop/Path_of_Stress/images/objects/red_car.png");

    leftsize = 202+3;
    upsize = 420;
    rightsize = 202+1;

    hitboxleft = new Point[leftsize];
    hitboxup = new Point[upsize];
    hitboxright = new Point[rightsize];

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
      if (i<=39) {
        hitboxup[i] = new Point(x+i+49, y+127);
      } else if (i<=77) {
        hitboxup[i] = new Point(x+i+49, y+104);
      } else if (i<=115) {
        hitboxup[i] = new Point(x+i+49, y+80);
      } else if (i<=284) {
        hitboxup[i] = new Point(x+i+49, y+56);
      } else {
        hitboxup[i] = new Point(x+i+49, y+119);
      }
    }

    for (int i = 0; i < rightsize; i++) {
      if (i<=138) {
        hitboxright[i] = new Point(x+468, y-i+257);
      } else {
        hitboxright[i] = new Point(x+333, y-i+258);
      }
    }
  }

  void draw() {
    image(image, x, y, 512, 256); 
  }

  void toggle() {
    for (int i = 0; i < leftsize; i++) {
      rect((int) hitboxleft[i].getX(),(int) hitboxleft[i].getY(), 1, 1);
    }

    for (int i = 0; i < upsize; i++) {
      rect((int) hitboxup[i].getX(),(int) hitboxup[i].getY(), 1, 1);
    }

    for (int i = 0; i < rightsize; i++) {
      rect((int) hitboxright[i].getX(),(int) hitboxright[i].getY(), 1, 1);
    }
  }

};
