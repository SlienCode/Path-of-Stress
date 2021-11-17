import java.awt.*;

class Cone {
  
  //coordinates
  int x;
  int y;
  
  PImage image;
  
  Point[] hitbox;
  
  Cone(int x, int y) {
    this.x = x;
    this.y = y;
    image = loadImage("C:/Users/nickc/Desktop/Path_of_Stress/images/objects/cone.png");
    hitbox = new Point[192];
    
    for (int i = 0; i < 64; i++) {
      hitbox[i] = new Point(x,y-i+63);
      hitbox[i+64] = new Point(x+i, y);
      hitbox[i+128] = new Point(x+63, y-i + 63);
    }
  }
  
  void print() {
    for (int i = 0; i < 192; i++) {
      rect((int) hitbox[i].getX(),(int) hitbox[i].getY(), 1, 1);
    }
  }
  
};
