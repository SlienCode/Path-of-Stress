abstract class Object {
  
  //coordinates
  int x;
  int y;
  int genre;
  
  //is platform or not
  boolean platform;
  
  //image of the object
  PImage image;
  
  Rectangle hitbox[];
  
  Object(int x) {
    this.x = x;
  }
  
  Object(int x, int genre) {
    this.x = x;
    this.genre = genre;
  }
  
  abstract void draw();
  
  abstract void toggle();
  
};
