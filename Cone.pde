import java.awt.*;

class Cone extends Object {
  
  Cone(int x,int y) {
    
    super(x, y);
    image = loadImage(sketchPath() + "/images/objects/cone.png");

    leftsize = 64;
    upsize = 64;
    rightsize = 64;
    
    hitboxleft = new Point[64];
    hitboxup = new Point[64];
    hitboxright = new Point[64];
    
    for (int i = 0; i < 64; i++) {
      hitboxleft[i] = new Point(x, y-i+64);
      hitboxup[i] = new Point(x+i, y);
      hitboxright[i] = new Point(x+63, y-i+64);
    }
  }
  
  void draw() {
    image(image, x, y, 64, 64); 
  }
  
  void toggle() {
    for (int i = 0; i < 64; i++) {
      rect((int) hitboxleft[i].getX(),(int) hitboxleft[i].getY(), 1, 1);
      rect((int) hitboxup[i].getX(),(int) hitboxup[i].getY(), 1, 1);
      rect((int) hitboxright[i].getX(),(int) hitboxright[i].getY(), 1, 1);
    }
  }
  
};
