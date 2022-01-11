class Level {

  int year;
  
  PImage backgroundFront; // only the 1st Year has a frontground
  PImage backgroundBack;
  PImage courseImage;
  
  int x_dim; //x dimension
  // y dimension is always 900
  int y; //y to draw image
  // x to draw image is always 0
  
  int right_border; //right side border;
  
  int bg_motion;
  
  int fg_x; //frontground x
  int bg_x; //background x
  int move_x; //objects and courses x coordinate initializer

  Object[] objects;
  Course[] courses;
  
  int courses_collected;

  Level(int year) {
    move_x = 0;
    this.year = year;
    
    courses_collected = 0;
    
    courseImage = loadImage(sketchPath() + "/images/objects/course.png");
    
    if (year == 1) {
      backgroundFront = loadImage(sketchPath() + "/images/backgrounds/1st_year_front.png");
      backgroundBack = loadImage(sketchPath() + "/images/backgrounds/1st_year_back.png");
      
      x_dim = 2160;
      y = -25;
      
      bg_motion = 1;
       
      objects = new Object[3];
      courses = new Course[8];
      
      objects[0] = new Cone(1600, 836);
      objects[1] = new Bench(800, 708);
      objects[2] = new Hydrant(6328, 772);
      
      courses[0] = new Course(300, 800);
      courses[1] = new Course(500, 800);
      courses[2] = new Course(700, 800);
      courses[3] = new Course(900, 800);
      courses[4] = new Course(1100, 800);
      courses[5] = new Course(1300, 800);
      courses[6] = new Course(1500, 800);
      courses[7] = new Course(1700, 800);
      
      
      right_border = 7200;
    }
    else if (year == 2) {
      backgroundBack = loadImage(sketchPath() + "/images/backgrounds/2nd_year.png");
      
      objects = new Object[0];
      courses = new Course[0];
      
      x_dim = 5040;
      y = 0;
      
      bg_motion = 6;
      
      objects = new Object[0];
      courses = new Course[8];
            
      courses[0] = new Course(300, 800);
      courses[1] = new Course(500, 800);
      courses[2] = new Course(700, 800);
      courses[3] = new Course(900, 800);
      courses[4] = new Course(1100, 800);
      courses[5] = new Course(1300, 800);
      courses[6] = new Course(1500, 800);
      courses[7] = new Course(1700, 800);
      
      right_border = 6255;
    }
    else if (year == 3) {
      backgroundBack = loadImage(sketchPath() + "/images/backgrounds/3rd_year.png");
      
      objects = new Object[0];
      courses = new Course[8];
            
      courses[0] = new Course(300, 800);
      courses[1] = new Course(500, 800);
      courses[2] = new Course(700, 800);
      courses[3] = new Course(900, 800);
      courses[4] = new Course(1100, 800);
      courses[5] = new Course(1300, 800);
      courses[6] = new Course(1500, 800);
      courses[7] = new Course(1700, 800);
      
      x_dim = 7200;
      y = 0;
      
      bg_motion = 6;
      
      right_border = 9115;
    }
    else if (year == 4) {
      backgroundBack = loadImage(sketchPath() + "/images/backgrounds/4th_year.png");
      
      objects = new Object[0];
      courses = new Course[8];
            
      courses[0] = new Course(300, 800);
      courses[1] = new Course(500, 800);
      courses[2] = new Course(700, 800);
      courses[3] = new Course(900, 800);
      courses[4] = new Course(1100, 800);
      courses[5] = new Course(1300, 800);
      courses[6] = new Course(1500, 800);
      courses[7] = new Course(1700, 800);
      
      x_dim = 5400;
      y = 0;
      
      bg_motion = 5;
      
      right_border = 7740;
    }
  }

  void draw() {
    //move the background (and frontground if it exists) based on player movement
    if ((player.x >= width/2 - 64 - 8) && (player.x <= right_border - width/2 - 64 - 16 && !player.still)) {
      if (player.x_motion > 0) {
        
        fg_x -= 4;
        bg_x -= bg_motion;
        
        for (Object object: objects) object.x -= 8;
        for (Course course: courses) course.x -= 8;
        move_x += 8; //to reset the objects when leaving/finishing the level
      }
    }
    if ((player.x >= width/2 - 64) && (player.x <= right_border - width/2 - 64 - 8 && !player.still)) {
      if (player.x_motion < 0) {
        
        fg_x += 4;
        bg_x += bg_motion;
        
        for (Object object: objects) object.x += 8;
        for (Course course: courses) course.x += 8;
        move_x -= 8; //to reset the objects when quiting the level
      }
    }
    
    image(backgroundBack, bg_x, y, x_dim, 900);
    if (year == 1 ) //only the first year has a frontground
    image(backgroundFront, fg_x, 0, 4320, 900);
    
    if (menu.hitboxes) {
      fill(255, 0, 255); //pink
      toggle();
    }
    
    for (Object object: objects) object.draw();
    for (Course course: courses) course.draw();
    
    //display courses collected
    image(courseImage, width/2-100, 30, 64, 64);
    fill(220, 220, 220); //light grey
    textSize(menu.text_size*0.8);
    text("X", width/2, 80);
    fill(255, 215, 0); //gold
    textSize(menu.text_size*3/2);
    text(courses_collected, width/2+62, 90);
  }
  
  //resets the coordinates when quiting or finishing a level
  void reset() {
    level.bg_x = 0;
    level.fg_x = 0;
    for (Object object: objects) object.x += move_x;
    for (Course course: courses) course.x += move_x;
    move_x = 0;
  }

  //toggles the hitbox visability
  void toggle() {
    for (Object object: objects) object.toggle();
    for (Course course: courses) course.toggle();
  }
};
