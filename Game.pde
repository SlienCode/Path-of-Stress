class Game {
  
  int courses_collected;
  
  PImage image;
  boolean pause;
  
  int resume_game_x;
  int resume_game_y;
  boolean mouse_over_resume_game;
  int leave_game_x;
  int leave_game_y;
  boolean mouse_over_leave_game;
  
  Game() {
    
    courses_collected = 0;
    
    image = loadImage(sketchPath() + "/images/tabs/tab.png");
    
    resume_game_x = width/2;
    resume_game_y = height/2-50;
    mouse_over_resume_game = false;
    leave_game_x = width/2;
    leave_game_y = height/2+50;
    mouse_over_leave_game = false;
    
    pause = false;
  }
  
  void draw() {
    if (!pause) {
      
      player.still = player.onKiss();
      
      level.draw();
      player.draw();
    }
    else gameMenu();
    
    if (player.x >= level.right_border) leaveGame();
    
    menu.displayFps();
    menu.displayCoordinates();
  }
  
  //make it so that holding a button won't execute keyPressed continuously using free_right and free_left
  void keyPressed() {
    player.keyPressed();
    if ((key == ESC) && !pause) { //press ESC while playing
      key = 0;
      pauseGame();
    } else if ((key == ESC) && pause) { //press ESC while paused
      key = 0;
      resumeGame();
    }
  }
  
  void keyReleased() {
    player.keyReleased();
  }
  
  void mousePressed() {
    if (pause) {
      if (mouse_over_resume_game) {
        resumeGame();
      } else if (mouse_over_leave_game) {
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
    pause = false;
    on_menu = true;
    player.x = 128;
    level.reset();
    playMusic();
    menu.draw();
  }
  
  void gameMenu() {
    image(image, width/2-250, height/2-170, 500, 300);
    textSize(menu.text_size);
    if (menu.hitboxes) {
      fill(255, 0, 255); //pink
      rect(resume_game_x-200, resume_game_y-60, 400, 80); //hitbox of RESUME GAME button
      rect(leave_game_x-200, leave_game_y-60, 400, 80); //hitbox of LEAVE GAME button
    }
    if (mouseX > resume_game_x-200 && mouseX < resume_game_x+200 && mouseY > resume_game_y-60 && mouseY < resume_game_y+20) {
      mouse_over_resume_game = true;
      fill(255, 200, 45); //yellow
    } else {
      mouse_over_resume_game = false;
      fill(235, 15, 15); //red
    }
    text("RESUME GAME", resume_game_x, resume_game_y);
    if (mouseX > leave_game_x-200 && mouseX < leave_game_x+200 && mouseY > leave_game_y-60 && mouseY < leave_game_y+20) {
      mouse_over_leave_game = true;
      fill(255, 200, 45); //yellow
    } else {
      mouse_over_leave_game = false;
      fill(235, 15, 15); //red
    }
    text("LEAVE GAME", leave_game_x, leave_game_y);
  }
};
