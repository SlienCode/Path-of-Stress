class Game {
  
  int courses_collected;
  
  PImage image;
  boolean pause;
  boolean npc_pause;
  boolean quit;
  boolean free_esc; //is the user holding the esc button? if they aren't then it's free so -> true
  
  int resume_game_x;
  int resume_game_y;
  boolean mouse_over_resume_game;
  int leave_game_x;
  int leave_game_y;
  boolean mouse_over_leave_game;
  
  Game() {
    
    courses_collected = 0;
    free_esc = true;
    
    image = loadImage(sketchPath() + "/images/miscellaneous/tabs/tab.png");
    
    resume_game_x = width/2;
    resume_game_y = height/2-int(Math.round(height*(50.0/900)));
    mouse_over_resume_game = false;
    leave_game_x = width/2;
    leave_game_y = height/2+int(Math.round(height*(50.0/900)));
    mouse_over_leave_game = false;

    pause = false;
    npc_pause = false;
  }
  
  void draw() {
    
    if (!pause && !npc_pause) {
      
      player.still = player.onKiss();
      
      level.draw();
      player.draw();
    }
    else if (pause) gameMenu();
    
    if (transition_counter == -1) {
      if (player.x >= level.right_border) {
        quit = false;
        leaveGame();
        if (courses_collected == 36 && !menu.credits_shown) {
          menu.menu_state = "CREDITS MENU";
        }
      }
    }
    
    menu.displayFps();
    menu.displayCoordinates();
  }
  
  //make it so that holding a button won't execute keyPressed continuously using free_right and free_left
  void keyPressed() {
    if (!pause) player.keyPressed();
    if ((key == ESC && !npc_pause) && free_esc) {
      free_esc = false;
      if (!pause) { //press ESC while playing
        key = 0;
        pauseGame();
      } else if ((key == ESC) && pause) { //press ESC while paused
        key = 0;
        resumeGame();
      }
    }
    else key = 0;
  }
  
  void keyReleased() {
    player.keyReleased();
    if (key == ESC) free_esc = true;
  }
  
  void mousePressed() {
    if (pause) {
      if (mouse_over_resume_game) {
        resumeGame();
      } else if (mouse_over_leave_game) {
        quit = true;
        leaveGame();
      }
    }
  }
  
  void pauseGame() {
    pause = true;
    music.pause();
  }
  
  void resumeGame() {
    pause = false;
    music.play();
  }
  
  void leaveGame() {
    if (!game.quit) for (boolean iter : level.passed) if (iter) game.courses_collected++;
    pause = false;
    transition_counter = 0;
  }
  
  void gameMenu() {
    image(image, width/2-int(Math.round(width*(250.0/1440))), height/2-int(Math.round(height*(170.0/900))), int(Math.round(width*(500.0/1440))), int(Math.round(height*(300.0/900))));
    textAlign(CENTER);
    textSize(int(Math.round(width*(60.0/1440))));
    if (menu.hitboxes) {
      fill(255, 0, 255); //pink
      rect(resume_game_x-int(Math.round(width*(200.0/1440))), resume_game_y-int(Math.round(height*(60.0/900))), int(Math.round(width*(400.0/1440))), int(Math.round(height*(80.0/900)))); //hitbox of RESUME GAME button
      rect(leave_game_x-int(Math.round(width*(200.0/1440))), leave_game_y-int(Math.round(height*(60.0/900))), int(Math.round(width*(400.0/1440))), int(Math.round(height*(80.0/900)))); //hitbox of LEAVE GAME button
    }
    if (mouseX > resume_game_x-int(Math.round(width*(200.0/1440))) && mouseX < resume_game_x+int(Math.round(width*(200.0/1440))) && mouseY > resume_game_y-int(Math.round(height*(60.0/900))) && mouseY < resume_game_y+int(Math.round(height*(20.0/900)))) {
      mouse_over_resume_game = true;
      fill(255, 200, 45); //yellow
    } else {
      mouse_over_resume_game = false;
      fill(235, 15, 15); //red
    }
    text("RESUME GAME", resume_game_x, resume_game_y);
    if (mouseX > leave_game_x-int(Math.round(width*(200.0/1440))) && mouseX < leave_game_x+int(Math.round(width*(200.0/1440))) && mouseY > leave_game_y-int(Math.round(height*(60.0/900))) && mouseY < leave_game_y+int(Math.round(height*(20.0/900)))) {
      mouse_over_leave_game = true;
      fill(255, 200, 45); //yellow
    } else {
      mouse_over_leave_game = false;
      fill(235, 15, 15); //red
    }
    text("LEAVE GAME", leave_game_x, leave_game_y);
  }

};
