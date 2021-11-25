class Player {
  
  String gender;
  
  //coordinates
  int x;
  int y;
  
  int d; //distance from the closet hitbox, up to 15
  
  boolean reverse; //when true, flip the image to head to the opposite direction
  
  PImage image; //player's image to be printed, it can change in each frame
  
  //animations
  int walk_counter; //40 frames
  int jump_counter; //50 frames
  PImage idle[]; //3 idle animations
  PImage jump[]; //3 jump animations
  PImage walk[]; //8 walk animations 
  
  Point[] hitboxplayer;
  
  Player(String g) {
    
    gender = g;
    
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
      idle[i] = loadImage("C:/Users/ATHGEO/Desktop/Path_of_Stress/images/player/" + gender + "/idle" + i + ".png");
      jump[i] = loadImage("C:/Users/ATHGEO/Desktop/Path_of_Stress/images/player/" + gender + "/jump" + i + ".png");
    }
    for (int i = 0; i < 8; i++) {
      walk[i] = loadImage("C:/Users/ATHGEO/Desktop/Path_of_Stress/images/player/" + gender + "/walk" + i + ".png");
    }
    
    //player hitbox
    hitboxplayer = new Point[604];
    for (int i = 0; i < hitboxplayer.length; i++) {
      hitboxplayer[i] = new Point();
    }
    
    
  }
  
  void draw() {
    
    //draw feet hitbox
    fill(255);
    rect(x + 32, y+256, 64, -8);
    
    //rect(x + 32, y+250, 10, 10);
    //rect(x + 96, y+250, 10, 10);
    
    //player hitbox
    for (int i = 0; i < 86; i++) {
      hitboxplayer[i] = new Point((x+16+4)+i, (y+32+8));
      hitboxplayer[i+86] = new Point((x+16+4+1)+i, (y+256));
    }
    for (int i = 0; i < 216; i++) {
      hitboxplayer[i+172] = new Point((x+16+4), (y+40+1)+i);
      hitboxplayer[i+388] = new Point((x+112-6), (y+40)+i);
    }
    
    //draw player hitbox
    for (int i = 0; i < hitboxplayer.length; i++) rect((int) hitboxplayer[i].getX(),(int) hitboxplayer[i].getY(), 1, 1); 
    
    collectedCourses(); //count collected courses
    
    //draw player coordinates
    fill(255);
    textSize(40);
    text("x: ", 100, 100);
    text(x, 160, 100);
    text("y: ", 100, 160);
    text(y, 160, 160);
    
    image = idle[0]; //default standing position image
    player.x += x_motion;
    
    //check which animation shall be applied
    animation();
    if (jump_counter == -1 && !onGround()) { //if the player is not jumping and is not standing on ground, apply gravity
      y+=15;
      image = jump[2];
    }
    else y += jump(); //otherwise, start jump
    
    //off screen borders
    if (y > 644) y = 644;
    
    if (reverse) { //if the player is walking towards the left, flip the image if needed 
      scale(-1,1); 
      image(image, - x - 128, y, 128, 256);
    }
    else image(image, x, y, 128, 256); //else don't flip it
    
  }
  
  //checks if the player is standing on solid ground
  boolean onGround() {
    if (y == 644) return true; //literally the ground (y border)
    else {
      for (Object object: level.objects) { //for every object in the level
        for (int i = 0; i < object.upsize; i++) { //check if the player collides with its top
          for (d = 0; d < 15; d++) { //take into consideration the gravity
            if ((x + 32 == (int)object.hitboxup[i].getX() || x + 96 == (int)object.hitboxup[i].getX()) && y + 256 + d == (int)object.hitboxup[i].getY()) {
              y += d;
              return true;
            }
          }
        }
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
    else {
      for (Object object: level.objects) { //for every object in the level
       for (int i = 0; i < object.leftsize; i++) { //check if the player collides with its left
          for (int j = 0; j < 8; j++) { //take into consideration the player steps
            if (x + 96 - j == (int)object.hitboxleft[i].getX() && y + 256 == (int)object.hitboxleft[i].getY()) { //check the left walls
              x -= j + 1; //numbers that work for some reason
              return true;
            }
          }
       }
       for (int i = 0; i < object.rightsize; i++) { //check if the player collides with its right
         for (int j = 0; j < 8; j++) { //take into consideration the player steps
           if (x + 32 + j == (int)object.hitboxright[i].getX() && y + 256 == (int)object.hitboxright[i].getY()) { //check the right walls
              x += j + 1; //numbers that work for some reason
              return true;
            }
          }
        }
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
