
class Level {
  
  PImage background;
  
  Cone cone = new Cone(500, 836);
  
  void draw() {
    image(cone.image, cone.x, cone.y, 64, 64);
  }
  
  void print() {
    cone.print();
  }
};
