class Player {
  
  String character;
  
  //coordinates
  int x;
  int y;
  
  int x_motion;
  
  boolean free_right; //is the user holding the right arrow? if they aren't then it's free so -> true
  boolean free_left; //is the user holding the left arrow? if they aren't then it's free so -> true
  
  boolean reverse; //when true, flip the image to head to the opposite direction
  
  boolean still;
  
  PImage image; //player's image to be printed, it can change in each frame
  
  //animations
  int walk_counter; //40 frames
  int jump_counter; //50 frames
  PImage idle[]; //3 idle animations
  PImage jump[]; //3 jump animations
  PImage walk[]; //8 walk animations 
  
  Rectangle hitbox_player;
  Rectangle hitbox_feet;
  
  Player(String c) {
    
    character = c;
    //print(character);
    
    //default coordinates untill player moves
    x = 128;
    y = 644;
    
    free_right = true;
    free_left = true;
    
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
    
    hitbox_player = new Rectangle(x + 32, y + 48, 63, 208);
    hitbox_feet = new Rectangle(x + 24, y + 248, 79, 8);
      
  }
  
  void draw() {
    
    //draw player coordinates
    fill(255);
    textSize(40);
    text("x ", 30, 40);
    text(x, 90, 40);
    text("y ", 30, 80);
    text(y, 90, 80);
    
    image = idle[0]; //default standing position image
    
    //still = onKiss();
    
    if (!still) x += x_motion; //if you didn't kiss a wall, move x
    
    animation(); //check which animation shall be applied
    
    if (jump_counter == -1 && !onGround()) { //if the player is not jumping, apply gravity
      y += 15;
      image = jump[2];
    }
    else y += jump(); //otherwise, start jump
    
    //y += y_motion; //if you are not on ground, move y
    
    collectedCourses(); //count collected courses
    
    //off screen borders
    if (y > 644) y = 644;
    
    if (x < width/2 - 64) printPlayer(x); //if the player is at the start of the level, print them based on variable x behind the middle of the screen
    
    else if (x > level.right_border - width/2 - 64) printPlayer(x - (level.right_border - 1440)); //if the player is at the end of the level, print them based on variable x after the middle of the screen
    
    else printPlayer(width/2 - 64); //if the player is at the middle of the level, print them exactly in the middle of the screen
  }
  
  //checks if the player is standing on solid ground
  boolean onGround() {
    if (y == 644) return true; //literally the ground (y border)
    else {
      Rectangle temp = new Rectangle((int)hitbox_feet.getX(), (int)hitbox_feet.getY() + 15, 63, 8);
      for (Object object: level.objects) { //for every object in the level;
        for (Rectangle hitboxiter: object.hitbox) {
          if (temp.intersects(hitboxiter)) {
            y -= (int)hitbox_feet.getY() + 8 - (int)hitboxiter.getY();
            return true;
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
      if (x_motion > 0) //if you want to go right, you are allowed
        x += x_motion;
      return true;
    }
    else {
      Rectangle temp = new Rectangle((int)hitbox_feet.getX() + x_motion, (int)hitbox_feet.getY(), 63, 8);
      for (Object object: level.objects) { //for every object in the level
        for (Rectangle hitboxiter: object.hitbox) {
          if (temp.intersects(hitboxiter)) {
            if (x_motion > 0) return true;
            else return true;
          }
        }
      }
    }
    return false;
  }
  
  //prints the player in the right position
  private void printPlayer(int x) {
   
     hitbox_player.setLocation(x + 24, y + 48);
     hitbox_feet.setLocation(x + 32, y + 248);
     if (menu.hitboxes) {
       fill(255, 0, 255); //pink
       rect(x + 24, y + 48, 79, 208);
       fill(255); //white
       rect(x + 32, y + 248, 63, 8);
     }
     if (reverse) { //if the player is walking towards the left, flip the image if needed 
       scale(-1,1); 
       image(image, - x - 128, y, 128, 256);
       scale(-1,1);
     }
     else image(image, x, y, 128, 256); //else don't flip it
  }
  
  private void animation() {
    if (walk_counter != -1 && !still) { //walking animtion
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
    else if (jump_counter >= 35 && jump_counter <= 40) return 0; //stay still
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
      if (hitbox_player.intersects(level.courses[i].hitbox)) {
        level.courses_collected += 1;
        game.courses_collected += 1;
        level.courses[i] = new Course();
        return;
      }
    }
  }
  
  //make it so that holding a button won't execute keyPressed continuously using free_right and free_left
  void keyPressed() {
    if (key == CODED) {
      if (keyCode == RIGHT && free_right) {
        x_motion = 8;
        player.walk_counter = 0;
        free_right = false;
        player.reverse = false; //don't flip the image, head to the right
      }
      else if (keyCode == LEFT && free_left) {
        x_motion = -8;
        player.walk_counter = 0;
        free_left = false;
        player.reverse = true; //flip the image, head to the left
      }
      if (keyCode == UP) {
        //if we are on the ground, jump
        if (player.onGround()) {
          player.jump_counter = 0;
        }
      }
    }
  }
  
  void keyReleased() {
    if (key == CODED) {
      if (keyCode == RIGHT) {
        if (free_left) { //if the user is not holding the left arrow, you can stop the animations
          x_motion = 0;
          player.walk_counter = -1;
        }
        free_right = true; //user let go of the right arrow
      }
      else if (keyCode == LEFT) {
        if (free_right) { //if the user is not holding the right arrow,you can stop the animations
          x_motion = 0;
          player.walk_counter = -1;
        }
        free_left = true; //user let go of the left arrow
      }
    }
  }
};
