abstract class Object {
  
  //coordinates
  int x;
  int y;
  
  //is platform or not
  boolean platform;
  
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
  
  Rectangle hitbox[];
  
  Object(int x) {
    this.x = x;
  }
  
  abstract void draw();
  
  abstract void toggle();
  
};
