class Level {

  PImage background;
  PImage image_course;

  Object[] objects = new Object[4];
  Course[] courses = new Course[8];
  
  int courses_collected = 0;

  Level() {
    image_course = loadImage(sketchPath() + "/images/objects/course.png");
    
    objects[0] = new Cone(50, 836);
    objects[1] = new Hydrant(400, 772);
    objects[2] = new Bench(625, 708);
    objects[3] = new Car(800, 644);
    
    courses[0] = new Course(100, 400);
    courses[1] = new Course(300, 400);
    courses[2] = new Course(500, 350);
    courses[3] = new Course(700, 410);
    courses[4] = new Course(900, 200);
    courses[5] = new Course(1100, 200);
    courses[6] = new Course(1300, 200);
    courses[7] = new Course(1400, 800);
  }

  void draw() {
    for (Object object: objects) object.draw();
    for (Course course: courses) course.draw();
    
    //display courses collected
    image(image_course, width/2-70, 20, 64, 64);
    textSize(64);
    fill(255, 215, 0);
    text("x", width/2, 75);
    text(courses_collected, width/2+50, 80);
  }

  //toggles the hitbox visability
  void toggle() {
    for (Object object: objects) object.toggle();
    for (Course course: courses) course.toggle();
  }

};
