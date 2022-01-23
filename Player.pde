class Player {
  
  String character;
  
  //coordinates
  float x;
  float y;
  
  float x_motion;
  
  boolean free_right; //is the user holding the right arrow? if they aren't then it's free so -> true
  boolean free_left; //is the user holding the left arrow? if they aren't then it's free so -> true
  boolean free_jump; //is the user holding the space button? if they aren't then it's free so -> true
  boolean free_up; //is the user holding the space button? if they aren't then it's free so -> true
  
  
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
    
    //default coordinates untill player moves
    x = round(width/11.25);
    y = height - round(height/3.51);
    
    free_right = true;
    free_left = true;
    free_jump = true;
    free_up = true;
    
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
    
    hitbox_player = new Rectangle((int)x + round(width/45), (int)y + round(height/18.75), round(width/22.86), round(height/4.33));
    hitbox_feet = new Rectangle((int)x + round(width/60), (int)y + round(height/3.63), round(width/18.23), round(height/112.5));
      
  }
  
  void draw() {
    
    image = idle[0]; //default standing position image
    
    if (!still) { //if you are not kissing a wall
      x += x_motion; //if you didn't kiss a wall, move x
      if (walk_counter == 0 && jump_counter == -1 && onGround()) { //if you are walking and if you are not trying to jump and if you are not in the air
        sounds[9].amp(menu.volume * menu.sfx_volume * (menu.master_volume/10.0));
        sounds[9].play();
      }
      if (walk_counter == 20 && jump_counter == -1 && onGround()) { //if you are walking and if you are not trying to jump and if you are not in the air
        sounds[9].amp(menu.volume * menu.sfx_volume * (menu.master_volume/10.0));
        sounds[9].play();
      }
    }
    
    animation(); //check which animation shall be applied
    
    if (jump_counter == -1 && !onGround()) { //if the player is not jumping, apply gravity
      y += height/60.0;
      image = jump[2];
    }
    else y += jump(); //otherwise, start jump
    
    collectedCourses(); //count collected courses
    npcEncounter();
    
    //off screen borders
    if (y > height - round(height/3.51)) y = height - round(height/3.51);
    
    if (x < width/2 - round(width/22.5)) printPlayer((int)x); //if the player is at the start of the level, print them based on variable x behind the middle of the screen
    
    else if (x > level.right_border - width/2 - round(width/22.5)) printPlayer((int)x - (level.right_border - width)); //if the player is at the end of the level, print them based on variable x after the middle of the screen
    
    else printPlayer(width/2 - round(width/22.5)); //if the player is at the middle of the level, print them exactly in the middle of the screen
  }
  
  //checks if the player is standing on solid ground
  boolean onGround() {
    if (y == height - round(height/3.51)) return true; //literally the ground (y border)
    else {
      Rectangle temp = new Rectangle((int)hitbox_feet.getX(), (int)hitbox_feet.getY() + round(height/60), round(width/22.86), round(height/112.5));
      for (Object object: level.objects) { //for every object in the level;
        for (Rectangle hitboxiter: object.hitbox) {
          if (temp.intersects(hitboxiter)) {
            if (jump_counter == -1 || jump_counter >= 40) {
              y = (int)hitboxiter.getY() - round(height/3.51);
              jump_counter = -1;
            }
            return true;
          }
        }
      }
    }
    return false;
  }
  
  //checks if the player is kissing a wall
  boolean onKiss() {
    if (x <= round(width/180)) { //literally the left wall (-x border)
      x = round(width/180);
      if (x_motion > 0) //if you want to go right, you are allowed
        x += x_motion;
      return true;
    }
    else {
      //we need to round the the number with the higher absolute value
      Rectangle temp;
      if (x_motion < 0) temp = new Rectangle(floor((float)hitbox_feet.getX() + x_motion), (int)hitbox_feet.getY(), round(width/22.86), round(height/112.5));
      else temp = new Rectangle(ceil((float)hitbox_feet.getX() + x_motion), (int)hitbox_feet.getY(), round(width/22.86), round(height/112.5));
      for (Object object: level.objects) { //for every object in the level
        if (!object.platform) {
          for (Rectangle hitboxiter: object.hitbox) {
            if (temp.intersects(hitboxiter)) {
              if (x_motion > 0) return true;
              else return true;
            }
          }
        }
      }
    }
    return false;
  }
  
  //prints the player in the right position
  private void printPlayer(int x) {
   
     hitbox_player.setLocation((int)x + round(width/60), (int)y + round(height/18.75));
     hitbox_feet.setLocation((int)x + round(width/45), (int)y + round(height/3.63));
     if (menu.hitboxes) {
       fill(255, 215, 0); //gold
       rect(x + round(width/60), y + round(height/18.75), round(width/18.23), round(height/4.33));
       fill(235, 15, 15); //red
       rect(x + round(width/45), y + round(height/3.63), round(width/22.86), round(height/112.5));
     }
     if (reverse) { //if the player is walking towards the left, flip the image if needed 
       scale(-1,1);
       image(image, - x - round(width/11.25), y, round(width/11.25), round(height/3.51));
       scale(-1,1);
     }
     else image(image, x, y, round(width/11.25), round(height/3.51)); //else don't flip it
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
  
  private float jump() {
    if (jump_counter == 9) {
      sounds[4].amp(menu.volume * menu.sfx_volume * (menu.master_volume/10.0));
      sounds[4].play();
    }
    if (jump_counter >= 10 && jump_counter <= 20) return -(height/90.0); //go up 10 pixels
    else if (jump_counter > 20 && jump_counter <= 30) return -(height/128.57); //go up 7 pixels (slow down mode)
    else if (jump_counter >= 30 && jump_counter <= 35) return -(height/225.0); //go up just 4 pixel (almost done going up)
    else if (jump_counter >= 35 && jump_counter <= 40) return 0; //stay still
    else if (jump_counter >= 40 && jump_counter <= 45) { //check if the player is about to hit a hitbox before they go down 5 pixels
      if (onGround()) {
        jump_counter = -1;
        return 0;
      }
      else return (height/180.0);
    }
    else if (jump_counter >= 45 && jump_counter <= 50) { //check if the player is about to hit a hitbox before they go down 10 pixels
      if (onGround()) {
        jump_counter = -1;
        return 0;
      }
    else return (height/90.0);
    }
    return 0; //otherwise, don't touch the y axis
  }
  
  //count collected courses
  private void collectedCourses() {
    for (int i = 0; i < level.courses.length; i++) {
      if (hitbox_player.intersects(level.courses[i].hitbox) && (!level.courses[i].passed)) {
        level.courses[i].passed = true;
        level.courses_collected += 1;
        level.passed[i] = true;
        sounds[1].amp(menu.volume * menu.sfx_volume * (menu.master_volume/10.0));
        sounds[1].play();
        return;
      }
    }
  }
  
  //npc speech test
  private void npcEncounter() {
    
  }
  
  //make it so that holding a button won't execute keyPressed continuously using free_right and free_left
  void keyPressed() {
    if (game.npc_pause && free_up && key != ESC) {
      game.npc_pause = false;
      if (keyCode == RIGHT || key == 'd' || key == 'D') free_right = false;
      else if (keyCode == LEFT || key == 'a' || key == 'A') free_left = false;
      else if (key == ' ') free_jump = false;
      else if (keyCode == UP || key == 'w' || key == 'W') free_up = false;
    }
    else {
      if ((keyCode == RIGHT || key == 'd' || key == 'D') && free_right) {
        x_motion = step;
        player.walk_counter = 0;
        free_right = false;
        player.reverse = false; //don't flip the image, head to the right
      }
      else if ((keyCode == LEFT || key == 'a' || key == 'A') && free_left) {
        x_motion = -step;
        player.walk_counter = 0;
        free_left = false;
        player.reverse = true; //flip the image, head to the left
      }
      if (key == ' ') {
        //if we are on the ground, jump
        if (player.onGround() && free_jump && jump_counter == -1) {
          player.jump_counter = 0;
        }
        free_jump = false;
      }
      if ((keyCode == UP || key == 'w' || key == 'W') && free_up) {
        free_up = false;
        for (NPC npc: level.npcs)
          if (hitbox_player.intersects(npc.hitbox)) npc.message();
      }
    }
  }
  
  void keyReleased() {
    if (keyCode == RIGHT || key == 'd' || key == 'D') {
      if (free_left) { //if the user is not holding the left arrow, you can stop the animations
        x_motion = 0;
        player.walk_counter = -1;
      }
      else {
        player.x_motion = -step;
        player.reverse = true; //flip the image, head to the left
      }
      free_right = true; //user let go of the right arrow
    }
    else if (keyCode == LEFT || key == 'a' || key == 'A') {
      if (free_right) { //if the user is not holding the right arrow, you can stop the animations
        x_motion = 0;
        player.walk_counter = -1;
      }
      else {
        player.x_motion = step;
        player.reverse = false; //don't flip the image, head to the right
      }
      free_left = true; //user let go of the left arrow
    }
    if (key == ' ') free_jump = true;
    if (keyCode == UP || key == 'w' || key == 'W') free_up = true;
  }
};
