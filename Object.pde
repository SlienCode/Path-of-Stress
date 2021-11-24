abstract class Object {
  
  //coordinates
  int x;
  int y;
  
  //image of the object
  PImage image;

  //hitboxes' sizes
  int leftsize;
  int upsize;
  int rightsize;
  
  //hitboxes
  Point[] hitboxleft;
  Point[] hitboxup;
  Point[] hitboxright;
  
  Object(int x, int y) {
    this.x = x;
    this.y = y;
  }
  
  abstract void draw();
  
  abstract void toggle();
  
};
