abstract class Object {
  
  //coordinates
  float x;
  float y;
  int genre;
  
  //is platform or not
  boolean platform;
  
  //image of the object
  PImage image;
  
  Rectangle hitbox[];
  
  Object(float x) {
    this.x = x;
  }
  
  Object(float x, int genre) {
    this.x = x;
    this.genre = genre;
  }
  
  abstract void draw();
  
  abstract void toggle();
  
};
