import java.awt.*;

class Cone {
  
  //coordinates
  int x;
  int y;
  
  PImage image;
  
  Point[] hitboxleft;
  Point[] hitboxup;
  Point[] hitboxright;
  
  Cone(int x, int y) {
    this.x = x;
    this.y = y;
    
    image = loadImage("C:/Users/nickc/Desktop/Path_of_Stress/images/objects/cone.png");
    
    hitboxleft = new Point[64];
    hitboxup = new Point[64];
    hitboxright = new Point[64];
    
    for (int i = 0; i < 64; i++) {
      hitboxleft[i] = new Point(x, y-i+64);
      hitboxup[i] = new Point(x+i, y);
      hitboxright[i] = new Point(x+63, y-i + 64);
    }
  }
  
  void draw() {
    image(image, x, y, 64, 64); 
  }
  
  void print() {
    for (int i = 0; i < 64; i++) {
      rect((int) hitboxleft[i].getX(),(int) hitboxleft[i].getY(), 1, 1);
      rect((int) hitboxup[i].getX(),(int) hitboxup[i].getY(), 1, 1);
      rect((int) hitboxright[i].getX(),(int) hitboxright[i].getY(), 1, 1);
    }
  }
  
};
