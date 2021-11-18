
class Level {
  
  PImage background;
  
  Object[] objects = new Object[3];
  
  Level() {
    objects[0] = new Cone(648, 836);
    objects[1] = new Hydrant(500, 772);
    objects[2] = new Bench(800, 708);
  }
  
  void draw() {
    for (Object object: objects)
      object.draw();
  }
  
  void toggle() { //toggles the hitbox visability
    for (Object object: objects)
      object.toggle();
  }
  
};
