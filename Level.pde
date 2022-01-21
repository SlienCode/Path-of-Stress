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
  
  float bg_motion;
  
  float fg_x; //frontground x
  float bg_x; //background x
  float move_x; //objects and courses x coordinate initializer

  Flag flag;

  Object[] objects;
  Course[] courses;
  
  boolean[] passed; //tests which courses the player took before leaving the game
  
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
      
      x_dim = round(width*1.5);
      y = -round(height/36);
      
      bg_motion = step/8;
      
      flag = new Flag(width/1.26, height/2.13, width/40.0, height/25.0);
      
      objects = new Object[10];
      objects[0] = new Cone(width*0.45);
      objects[1] = new Bin(width*0.77, 1);
      objects[2] = new Sign(width*1.07, 1);
      objects[3] = new Bench(width*1.48);
      objects[4] = new Bus_Stop(width*1.74);
      objects[5] = new Light(width*2.36);
      objects[6] = new Car(width*2.58, 2);
      objects[7] = new Bin(width*3.29, 2);
      objects[8] = new Hydrant(width*3.77);
      objects[9] = new Tree(width*4.03);
      
      courses = new Course[10];
      courses[0] = new Course(width*0.63, height*0.47); //difficulty: 1
      courses[1] = new Course(width*1.06, height*0.13); //difficulty: 2
      courses[2] = new Course(width*1.42, height*0.14); //difficulty: 3
      courses[3] = new Course(width*1.67, height*0.83); //difficulty: 0
      courses[4] = new Course(width*2.08, height*0.28); //difficulty: 2
      courses[5] = new Course(width*2.66, height*0.18); //difficulty: 3
      courses[6] = new Course(width*3.08, height*0.83); //difficulty: 0
      courses[7] = new Course(width*3.54, height*0.34); //difficulty: 1
      courses[8] = new Course(width*3.97, height*0.33); //difficulty: 2
      courses[9] = new Course(width*4.55, height*0.38); //difficulty: 2
      
      right_border = 5*width;
    }
    else if (year == 2) {
      backgroundBack = loadImage(sketchPath() + "/images/backgrounds/2nd_year.png");
      
      objects = new Object[0];
      courses = new Course[0];
      
      x_dim = 5040;
      y = 0;
      
      bg_motion = 6;
      
      objects = new Object[18];
      objects[0] = new Chair(800);
      objects[1] = new Desk(900);
      objects[2] = new Chair(1150);
      objects[3] = new Chair(1480);
      objects[4] = new Desk(1400);
      objects[5] = new Bookshelf_Short(1880);
      objects[6] = new Chair(2130);
      objects[7] = new Pillar(2350);
      objects[8] = new Pillar(2910);
      objects[9] = new Bookshelf_Tall(3490);
      objects[10] = new Chair(3830);
      objects[11] = new Desk(3750);
      objects[12] = new Bookshelf_Short(4110);
      objects[13] = new Chair(4430);
      objects[14] = new Pillar(4745);
      objects[15] = new Chair(5100);
      objects[16] = new Chair(5200);
      objects[17] = new Desk(5300);
      
      courses = new Course[8];
      courses[0] = new Course(990, 370); //1
      courses[1] = new Course(1580, 260); //2
      courses[2] = new Course(2150, 400); //1
      courses[3] = new Course(2700, 750); //0
      courses[4] = new Course(3110, 122); //3
      courses[5] = new Course(4000, 200); //2
      courses[6] = new Course(4810, 250); //4
      courses[7] = new Course(5600, 400); //1
      
      right_border = 6240;
    }
    else if (year == 3) {
      backgroundBack = loadImage(sketchPath() + "/images/backgrounds/3rd_year.png");
      
      objects = new Object[30];
      objects[0] = new Chair(880);
      objects[1] = new Desk(800);
      objects[2] = new Chair(1050);
      objects[3] = new Bookshelf_Tall(1400);
      objects[4] = new Chair(1700);
      objects[5] = new Ladder(2050);
      objects[6] = new Closet(2150);
      objects[7] = new Closet(2380);
      objects[8] = new Closet(2610);
      objects[9] = new Chair(3050);
      objects[10] = new Bookshelf_Short(3200);
      objects[11] = new Chair(3650);
      objects[12] = new Chair(3880);
      objects[13] = new Chair(4020);
      objects[14] = new Desk(3750);
      objects[15] = new Desk(4000);
      objects[16] = new Ladder(4600);
      objects[17] = new Bookshelf_Tall(4700);
      objects[18] = new Desk(5060);
      objects[19] = new Closet(5350);
      objects[20] = new Closet(5580);
      objects[21] = new Ladder(5820);
      objects[22] = new Chair(6420);
      objects[23] = new Chair(6600);
      objects[24] = new Desk(6520);
      objects[25] = new Bookshelf_Tall(7000);
      objects[26] = new Bookshelf_Short(7174);
      objects[27] = new Chair(7550);
      objects[28] = new Ladder(7880);
      objects[29] = new Desk(7990);
      
      courses = new Course[10];
      courses[0] = new Course(960, 290); //1
      courses[1] = new Course(1650, 110); //2
      courses[2] = new Course(2480, 434); //0
      courses[3] = new Course(3600, 214); //3
      courses[4] = new Course(4400, 110); //2
      courses[5] = new Course(5080, 300); //1
      courses[6] = new Course(5740, 180); //1
      courses[7] = new Course(6400, 210); //3
      courses[8] = new Course(7430, 750); //0
      courses[9] = new Course(8350, 120); //2
      
      x_dim = 7200;
      y = 0;
      
      bg_motion = 6;
      
      right_border = 9115;
    }
    else if (year == 4) {
      backgroundBack = loadImage(sketchPath() + "/images/backgrounds/4th_year.png");
      
      objects = new Object[10];
      objects[0] = new Car(900, 1);
      objects[1] = new Sign(1500, 3);
      objects[2] = new Hydrant(2000);
      objects[3] = new Bin(2400, 2);
      objects[4] = new Sign(2920, 2);
      objects[5] = new Truck(3370);
      objects[6] = new Bin(4360, 1);
      objects[7] = new Tree(5000);
      objects[8] = new Car(5960, 3);
      objects[9] = new Light(6750);
      
      courses = new Course[8];
      courses[0] = new Course(800, 280); //1
      courses[1] = new Course(1900, 170); //2
      courses[2] = new Course(2520, 130); //2
      courses[3] = new Course(3200, 750); //0
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
    if ((player.x >= width/2 - (width/22.5) - (width/180.0)) && (player.x <= right_border - width/2 - (width/22.5) - (width/90.0) && !player.still)) {
      if (player.x_motion > 0) {
        
        bg_x -= bg_motion;
        if (year == 1) {
          flag.x -= bg_motion;
          fg_x -= width/360.0;
        }
        
        for (Object object: objects) object.x -= step;
        for (Course course: courses) course.x -= step;
        move_x += step; //to reset the objects when leaving/finishing the level
      }
    }
    if ((player.x >= width/2 - (width/22.5)) && (player.x <= right_border - width/2 - (width/22.5) - (width/180.0) && !player.still)) {
      if (player.x_motion < 0) {
        
         bg_x += bg_motion;
        if (year == 1) {
          flag.x += bg_motion;
          fg_x += width/360.0;
        }
        
        for (Object object: objects) object.x += step;
        for (Course course: courses) course.x += step;
        move_x -= step; //to reset the objects when quiting the level
      }
    }
    
    image(backgroundBack, bg_x, y, x_dim, height);
    if (year == 1 ) //only the first year has a frontground
    image(backgroundFront, fg_x, 0, 3*width, height);
    
    if (year == 1) flag.draw();
    
    if (menu.hitboxes) {
      fill(235, 15, 15); //red
      toggleObjects();
      fill(255, 215, 0); //gold
      toggleCourses();
    }
    
    for (Object object: objects) object.draw();
    for (Course course: courses) course.draw();
    
    displayCoursesCollected();
  }
  
  //resets the coordinates when quiting or finishing a level
  void reset() {
    level.bg_x = 0;
    level.fg_x = 0;
    if (game.quit) restoreCourses();
    for (Object object: objects) object.x += move_x;
    for (Course course: courses) course.x += move_x;
    flag = new Flag(width/1.26, height/2.13, width/40.0, height/25.0);
    move_x = 0;
    
  }

  //toggles objects hitbox visibility
  void toggleObjects() {
    for (Object object: objects) object.toggle();
  }
  
  //toggles courses hitbox visibility
  void toggleCourses() {
    for (Course course: courses) course.toggle();
  }
  
  void restoreCourses() {
    
    for (int i = 0; i < courses.length; i++)
      if (passed[i]) {
        courses[i].passed = false;
        level.courses_collected --;
      }
  }
  
  void makeTemp() {
    
    passed = new boolean[courses.length];
    for (int i = 0; i < courses.length; i++) passed[i] = false;
    
  } 
  
  
  void displayCoursesCollected() {
    //display courses collected
    image(courseImage, width/2-116, 30, 64, 64);
    textAlign(LEFT);
    fill(220, 220, 220); //light grey
    textSize(menu.text_size*0.8);
    text("x  ", width/2-16, 80);
    fill(255, 215, 0); //gold
    textSize(menu.text_size*3/2);
    text(courses_collected, width/2+42, 92);
  }
};
