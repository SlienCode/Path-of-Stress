import java.awt.*;

class Car extends Object {

  Car(int x,int y) {

    super(x, y);
    image = loadImage("C:/Users/ATHGEO/Desktop/Path_of_Stress/images/objects/red_car.png");

    leftsize = 200;
    upsize = 420;
    rightsize = 200;

    hitboxleft = new Point[leftsize];
    hitboxup = new Point[upsize];
    hitboxright = new Point[rightsize];

    for (int i = 0; i < leftsize; i++) {
      if (i<=130) {
        hitboxleft[i] = new Point(x+48, y-i+257);
      } else if (i<=154) {
        hitboxleft[i] = new Point(x+88, y-i+257);
      } else if (i<=178) {
        hitboxleft[i] = new Point(x+126, y-i+257);
      } else {
        hitboxleft[i] = new Point(x+164, y-i+257);
      }
    }

    for (int i = 0; i < upsize; i++) {
      if (i<=40) {
        hitboxup[i] = new Point(x+i+47, y+126);
      } else if (i<=78) {
        hitboxup[i] = new Point(x+i+47, y+102);
      } else if (i<=115) {
        hitboxup[i] = new Point(x+i+47, y+78);
      } else if (i<=286) {
        hitboxup[i] = new Point(x+i+47, y+56);
      } else {
        hitboxup[i] = new Point(x+i+47, y+118);
      }
    }

    for (int i = 0; i < rightsize; i++) {
      if (i<=138) {
        hitboxright[i] = new Point(x+467, y-i+256);
      } else {
        hitboxright[i] = new Point(x+333, y-i+257);
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
