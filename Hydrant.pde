import java.awt.*;

class Hydrant extends Object {
  
  Hydrant(int x,int y) {
    
    super(x, y);
    image = loadImage(sketchPath() + "/images/objects/hydrant.png");

    leftsize = 96;
    upsize = 64;
    rightsize = 96;
    
    hitboxleft = new Point[96];
    hitboxup = new Point[64];
    hitboxright = new Point[96];
    
    for (int i = 0; i < 96; i++) {
      hitboxleft[i] = new Point(x, y-i+128);
      hitboxright[i] = new Point(x+63, y-i+128);
    }
    
    for (int i = 0; i < 64; i++) {
      hitboxup[i] = new Point(x+i, y+32);
    }
  }
  
  void draw() {
    image(image, x, y, 64, 128); 
  }
  
  void toggle() {
    for (int i = 0; i < 96; i++) {
      rect((int) hitboxleft[i].getX(),(int) hitboxleft[i].getY(), 1, 1);
      rect((int) hitboxright[i].getX(),(int) hitboxright[i].getY(), 1, 1);
    }
    for (int i = 0; i < 64; i++) {
      rect((int) hitboxup[i].getX(),(int) hitboxup[i].getY(), 1, 1);
    }
  }
  
};
