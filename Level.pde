class Level {

  SoundFile music;
  
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
    
    music = tracks[year];
    
    courses_collected = 0;
    
    courseImage = loadImage(sketchPath() + "/images/objects/course.png");
    
    if (year == 1) {
      backgroundFront = loadImage(sketchPath() + "/images/backgrounds/1st_year_front.png");
      backgroundBack = loadImage(sketchPath() + "/images/backgrounds/1st_year_back.png");
      
      x_dim = 2160;
      y = -25;
      
      bg_motion = 1;
       
      objects = new Object[10];
      objects[0] = new Cone(648, 0);
      objects[1] = new Bin(1112, 0);
      //npcs[0] = new Npc(1800, 0);
      objects[2] = new Light(1536, 0);
      objects[3] = new Bench(2136, 0);
      objects[4] = new Bus_Stop(2500, 0);
      objects[5] = new Sign(3400, 0);
      objects[6] = new Car(3710, 0);
      objects[7] = new Bin(4744, 0);
      objects[8] = new Hydrant(5436, 0);
      objects[9] = new Tree(5800, 0);
      
      courses = new Course[10];
      courses[0] = new Course(900, 420); //difficulty: 1
      courses[1] = new Course(1526, 114); //difficulty: 2
      courses[2] = new Course(2050, 130); //difficulty: 3
      courses[3] = new Course(2400, 740); //difficulty: 0
      courses[4] = new Course(3000, 250); //difficulty: 2
      courses[5] = new Course(3830, 160); //difficulty: 3
      courses[6] = new Course(4430, 740); //difficulty: 0
      courses[7] = new Course(5100, 310); //difficulty: 1
      courses[8] = new Course(5720, 300); //difficulty: 2
      courses[9] = new Course(6550, 340); //difficulty: 2
      
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
      //objects[] = new ();
      //objects[] = new ();
      //objects[] = new ();
      //objects[] = new ();
      //objects[] = new ();
      //objects[] = new ();
      //objects[] = new ();
      //objects[] = new ();
      //objects[] = new ();
      //objects[] = new ();
      
      courses = new Course[8];
      courses[0] = new Course(0, 0);
      courses[1] = new Course(0, 0);
      courses[2] = new Course(0, 0);
      courses[3] = new Course(0, 0);
      courses[4] = new Course(0, 0);
      courses[5] = new Course(0, 0);
      courses[6] = new Course(0, 0);
      courses[7] = new Course(0, 0);
      
      right_border = 6255;
    }
    else if (year == 3) {
      backgroundBack = loadImage(sketchPath() + "/images/backgrounds/3rd_year.png");
      
      objects = new Object[0];
      //objects[] = new ();
      //objects[] = new ();
      //objects[] = new ();
      //objects[] = new ();
      //objects[] = new ();
      //objects[] = new ();
      //objects[] = new ();
      //objects[] = new ();
      //objects[] = new ();
      //objects[] = new ();
      
      courses = new Course[10];
      courses[0] = new Course(0, 0);
      courses[1] = new Course(0, 0);
      courses[2] = new Course(0, 0);
      courses[3] = new Course(0, 0);
      courses[4] = new Course(0, 0);
      courses[5] = new Course(0, 0);
      courses[6] = new Course(0, 0);
      courses[7] = new Course(0, 0);
      courses[8] = new Course(0, 0);
      courses[9] = new Course(0, 0);
      
      x_dim = 7200;
      y = 0;
      
      bg_motion = 6;
      
      right_border = 9115;
    }
    else if (year == 4) {
      backgroundBack = loadImage(sketchPath() + "/images/backgrounds/4th_year.png");
      
      objects = new Object[10];
      objects[0] = new Car(900, 0);
      objects[1] = new Light(1500, 0);
      objects[2] = new Hydrant(2000, 0);
      objects[3] = new Bin(2400, 0);
      objects[4] = new Sign(2920, 0);
      objects[5] = new Truck(3370, 0);
      objects[6] = new Bin(4360, 0);
      objects[7] = new Tree(5000, 0);
      objects[8] = new Car(5960, 0);
      objects[9] = new Sign(6750, 0);
      
      courses = new Course[8];
      courses[0] = new Course(800, 280); //1
      courses[1] = new Course(1900, 170); //2
      courses[2] = new Course(2520, 130); //2
      courses[3] = new Course(3200, 740); //0
      courses[4] = new Course(4560, 95); //3
      courses[5] = new Course(5550, 290); //2
      courses[6] = new Course(6200, 260); //1
      courses[7] = new Course(7350, 410); //4
      
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
