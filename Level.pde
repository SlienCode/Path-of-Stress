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
  
  int fg_x; //frontground x
  int bg_x; //background x

  Object[] objects = new Object[0];
  Course[] courses = new Course[0];
  
  int courses_collected = 0;

  Level(int year) {
    
    this.year = year;
    
    courseImage = loadImage(sketchPath() + "/images/objects/course.png");
    
    if (year == 1) {
      
       backgroundFront = loadImage(sketchPath() + "/images/backgrounds/1st_year_front.png");
       backgroundBack = loadImage(sketchPath() + "/images/backgrounds/1st_year_back.png");
       
       x_dim = 2160;
       y = -25;
       
       right_border = 7200;
     
    }
    
  }

  void draw() {
    
    
    //move the background (and frontground if it exists) based on player movement
    if ((player.x >= width/2 - 64 - 8) && (player.x <= right_border - width/2 - 64 - 16)) { 
      
      if (game.x_motion > 0)
        fg_x -= 4;
      if (game.x_motion > 0)
        bg_x -= 1;
    }
    if ((player.x >= width/2 - 64) && (player.x <= right_border - width/2 - 64 - 8)) {
      
      if (game.x_motion < 0)
        fg_x += 4;
      if (game.x_motion < 0)
        bg_x += 1;
    }
    
    image(backgroundBack, bg_x, y, x_dim, 900);
    if (year == 1 ) //only the first year has a frontground
    image(backgroundFront, fg_x, 0, 4320, 900);
    
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

  //toggles the hitbox visability
  void toggle() {
    for (Object object: objects) object.toggle();
    for (Course course: courses) course.toggle();
  }

};
