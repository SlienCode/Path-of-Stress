class Level {

  PImage background;

  Object[] objects = new Object[2];
  Course[] courses = new Course[2];
  
  int courses_collected = 0;

  Level() {
    //objects[0] = new Cone(648, 836);
    //objects[2] = new Course(600, 600);
    //objects[4] = new Cone (540, 760);
    objects[0] = new Hydrant(500, 772);
    objects[1] = new Car(800,644);
    //objects[3] = new Bench(800, 708);
    
    courses[0] = new Course(600,600);
    courses[1] = new Course(800,400);
  }

  void draw() {
    for (Object object: objects) object.draw();
    for (Course course: courses) course.draw();
  }

  //toggles the hitbox visability
  void toggle() {
    for (Object object: objects) object.toggle();
    for (Course course: courses) course.toggle();
  }

};
