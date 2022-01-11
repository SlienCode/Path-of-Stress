import processing.sound.*;

class Game {
  
  PImage image;
  int temp;
  boolean pause;
  
  Game() {
    level = new Level(1);
    pause = false;
  }
  
  void draw() {
    
    temp = player.x;
    
    player.still = player.onKiss();
    
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
    player.keyPressed();
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
    player.keyReleased();
  }
};
