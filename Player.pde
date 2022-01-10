class Player {
  
  String character;
  
  //coordinates
  int x;
  int y;
  
  boolean reverse; //when true, flip the image to head to the opposite direction
  
  PImage image; //player's image to be printed, it can change in each frame
  
  //animations
  int walk_counter; //40 frames
  int jump_counter; //50 frames
  PImage idle[]; //3 idle animations
  PImage jump[]; //3 jump animations
  PImage walk[]; //8 walk animations 
  
  Point[] hitboxplayer;
  
  Player(String c) {
    
    character = c;
    //print(character);
    
    //default coordinates untill player moves
    x = 128;
    y = 644;
    
    reverse = false;
    
    walk_counter = -1;
    jump_counter = -1;
    idle = new PImage[3];
    jump = new PImage[3];
    walk = new PImage[8];
    for (int i = 0; i <3; i++) {
      idle[i] = loadImage(sketchPath() + "/images/characters/" + character + "/idle" + i + ".png");
      jump[i] = loadImage(sketchPath() + "/images/characters/" + character + "/jump" + i + ".png");
    }
    for (int i = 0; i < 8; i++) {
      walk[i] = loadImage(sketchPath() + "/images/characters/" + character + "/walk" + i + ".png");
    }
      
  }
  
  void draw() {
    
    collectedCourses(); //count collected courses
    
    //draw player coordinates
    fill(255);
    textSize(40);
    text("x: ", 0, 35);
    text(x, 40, 35);
    text("y: ", 0, 75);
    text(y, 40, 75);
    
    image = idle[0]; //default standing position image
    x += game.x_motion;
    
    //check which animation shall be applied
    animation();
    if (jump_counter == -1 && !onGround()) { //if the player is not jumping and is not standing on ground, apply gravity
      y+=15;
      image = jump[2];
    }
    else y += jump(); //otherwise, start jump
    
    //off screen borders
    if (y > 644) y = 644;
    
    if (x < 720) {
      if (reverse) { //if the player is walking towards the left, flip the image if needed 
        scale(-1,1); 
        image(image, - x - 128, y, 128, 256);
        scale(-1,1);
      }
      else image(image, x, y, 128, 256); //else don't flip it
    }
    else if (x > level.right_border - 720) {
      if (reverse) { //if the player is walking towards the left, flip the image if needed 
        scale(-1,1); 
        image(image, - x + level.right_border - 1440 - 128, y, 128, 256);
        scale(-1,1);
      }
      else image(image, x - (level.right_border - 1440), y, 128, 256); //else don't flip it
    }
    else 
        if (reverse) { //if the player is walking towards the left, flip the image if needed 
          scale(-1,1); 
          image(image, - (width/2 - 64) - 128, y, 128, 256);
          scale(-1,1);
        }
        else image(image, width/2 - 64, y, 128, 256); //else don't flip it
  }
  
  //checks if the player is standing on solid ground
  boolean onGround() {
    if (y == 644) return true; //literally the ground (y border)
    else {
      for (Object object: level.objects) { //for every object in the level
       
      }
    }
    return false;
  }
  
  //checks if the player is kissing a wall
  boolean onKiss() {
    if (x <= 8) { //literally the left wall (-x border)
      x = 8;
      return true;
    }
    else if (x >= 7072) { //literally the right wall (+x border)
      x = 7072;
      return true;
    }
    else {
      for (Object object: level.objects) { //for every object in the level
       
       }
    }
    return false;
  }
  
  private void animation() {
    if (walk_counter != -1 && !onKiss()) { //walking animtion
      image = walk[walk_counter/5]; //each image plays for 5 frames
      walk_counter++;
      if (walk_counter == 40) walk_counter = 0; //start animation all over again if you reach the last frame
    }
    if(jump_counter != -1) { //jumping animation
      if (jump_counter < 10) image = jump[0];
      else if (jump_counter < 40) image = jump[1];
      else image = jump[2];
      jump_counter++;
      if (jump_counter == 50) jump_counter = -1; //stop animation and stop the jump
    }
  }
  
  private int jump() {
    if (jump_counter >= 10 && jump_counter <= 20) return -10; //go up 10 pixels
    else if (jump_counter > 20 && jump_counter <= 30) return -7; //go up 7 pixels (slow down mode)
    else if (jump_counter >= 30 && jump_counter <= 35) return -4; //go up just 4 pixel (almost done going up)
    else if (jump_counter >= 35 && jump_counter <= 40) return -0; //stay still
    else if (jump_counter >= 40 && jump_counter <= 45) { //check if the player is about to hit a hitbox before they go down 5 pixels
      if (onGround()) {
        jump_counter = -1;
        return 0;
      }
      else return 5;
    }
    else if (jump_counter >= 45 && jump_counter <= 50) { //check if the player is about to hit a hitbox before they go down 10 pixels
      if (onGround()) {
        jump_counter = -1;
        return 0;
      }
    else return 10;
    }
    return 0; //otherwise, don't touch the y axis
  }
  
  //count collected courses
  private void collectedCourses() {
    for (int i = 0; i < level.courses.length; i++) {
      for (Point hitboxplayer: hitboxplayer) {
        for (Point hitboxcourse: level.courses[i].hitboxcourse) {
          if (hitboxplayer.equals(hitboxcourse)) {
            level.courses_collected += 1;
            level.courses[i] = new Course();
            return;
          }
        }
      }
    }
  }
};
