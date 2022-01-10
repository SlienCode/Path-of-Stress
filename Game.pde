import processing.sound.*;

class Game {
  
  PImage image;
  boolean free_right; //is the user holding the right arrow? if they aren't then it's free so -> true
  boolean free_left; //is the user holding the left arrow? if they aren't then it's free so -> true
  int x_motion; //how much the player should move on the x axis
  int temp;
  boolean pause;
  
  Game() {
    level = new Level(1);
    free_right = true;
    free_left = true;
    pause = false;
  }
  
  void draw() {
    
    temp = player.x;
    
    level.draw();
    level.toggle(); //draw object and course hitboxes
    player.draw();
    
    //DISPLAY FPS
    if (menu.fps) {
      fill(0, 255, 0); //green
      textSize(menu.text_size*0.8);
      text(frameRate, width+20, 30); 
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
    if ((key == ESC) && !pause) { //press ESC while playing
      key = 0;
      pause = true;
      noLoop();
      sound.pause();
    } else if ((key == ESC) && pause) { //press ESC while paused
      key = 0;
      pause = false;
      loop();
      sound.play();
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
