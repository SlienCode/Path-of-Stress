
class Player {
  
  String gender;
  Level level;
  
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
  
  Player(String g) {
    
    gender = g;
    
    //default coordinates untill player moves
    x = 128;
    y = 644;
    
    reverse = false;
    
    level = new Level();
    walk_counter = -1;
    jump_counter = -1;
    idle = new PImage[3];
    jump = new PImage[3];
    walk = new PImage[8];
    for (int i = 0; i <3; i++) {
      idle[i] = loadImage("C:/Users/nickc/Desktop/Path_of_Stress/images/player/" + gender + "/idle" + i + ".png");
      jump[i] = loadImage("C:/Users/nickc/Desktop/Path_of_Stress/images/player/" + gender + "/jump" + i + ".png");
    }
    for (int i = 0; i < 8; i++) {
      walk[i] = loadImage("C:/Users/nickc/Desktop/Path_of_Stress/images/player/" + gender + "/walk" + i + ".png");
    }
  }
  
  void draw() {
    
    //rect(x + 32, y+256, 48, -8); //hitbox
    //rect(x + 32, y+250, 10, 10);
    //rect(x + 80, y+250, 10, 10);
    textSize(40);
    text("x: ", 100, 100);
    text(x, 160, 100);
    text("y: ", 100, 160);
    text(y, 160, 160);
    
    image = idle[0]; //default standing position image
    
    //check which animation shall be applied
    animation();
    
    if (jump_counter == -1 && !onGround()) { //if the player is not jumping and is not standing on ground, apply gravity
      y+=10;
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
      for (int i = 0; i < 64; i++) {
        for (int j = 0; j < 10; j++ ) { //take into consideration the gravity
          if ((x + 32 == (int)level.cone.hitboxup[i].getX() || x + 80 == (int)level.cone.hitboxup[i].getX()) && y + 256 + j == (int)level.cone.hitboxup[i].getY()) {
            y += j;
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
      return true;
    } 
    else {
     for (int i = 0; i < 64; i++) {
        for (int j = 0; j < 8; j++ ) { //take into consideration the player steps
          if (x + 80 + j == (int)level.cone.hitboxleft[i].getX() && y + 256 == (int)level.cone.hitboxleft[i].getY()) { //check the left walls
            x = (int)level.cone.hitboxleft[i].getX() - 80 - 16 + 1; //numbers that work for some reason
            return true;
          }
          else if (x + 32 + j == (int)level.cone.hitboxright[i].getX() && y + 256 == (int)level.cone.hitboxright[i].getY()) { //check the right walls
            x = (int)level.cone.hitboxright[i].getX() - 32 + 1; //numbers that work for some reason
            return true;
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
    
    if (jump_counter >= 10 && jump_counter <= 20) return -7; //go up 5 pixels
    else if (jump_counter > 20 && jump_counter <= 30) return -5; //go up 2 pixels (slow down mode)
    else if (jump_counter >= 30 && jump_counter <= 35) return -4; //go up just 1 pixel (almost done going up)
    else if (jump_counter >= 35 && jump_counter <= 40) return -2; //go up just 1 pixel (almost done going up)
    else if (jump_counter >= 40 && jump_counter <= 45) return 0; //go up just 1 pixel (almost done going up)
    else if (jump_counter >= 45 && jump_counter <= 50) return 6; //go down 3 pixels
 
    return 0; //otherwise, don't touch the y axis
  }
  
};
