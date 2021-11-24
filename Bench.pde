import java.awt.*;

class Bench extends Object {
  
  Bench(int x,int y) {
    
    super(x, y);
    image = loadImage("C:/Users/ATHGEO/Desktop/Path_of_Stress/images/objects/bench.png");

    leftsize = 42;
    upsize = 192;
    rightsize = 42;
    
    hitboxleft = new Point[42];
    hitboxup = new Point[192];
    hitboxright = new Point[42];
    
    for (int i = 0; i < 42; i++) {
      hitboxleft[i] = new Point(x, y-i+192);
      hitboxright[i] = new Point(x+191, y-i+192);
    }
    for (int i = 0; i < 192; i++) {
       hitboxup[i] = new Point(x+i, y+150);
    }
  }
  
  void draw() {
    image(image, x, y, 192, 192); 
  }
  
  void toggle() {
    for (int i = 0; i < 42; i++) {
      rect((int) hitboxleft[i].getX(),(int) hitboxleft[i].getY(), 1, 1);
      rect((int) hitboxright[i].getX(),(int) hitboxright[i].getY(), 1, 1);
    }
    for (int i = 0; i < 192; i++) {
      rect((int) hitboxup[i].getX(),(int) hitboxup[i].getY(), 1, 1);
    }
  }
  
};
