class Menu {
    
  PImage image_main_menu_background;
  PImage image_secondary_menu_background;
  PImage image_thumb1;
  PImage image_thumb2;
  PImage image_thumb3;
  PImage image_thumb4;
  PImage image_return_arrow_red;
  PImage image_return_arrow_yellow;
  PImage image_right_arrow_red;
  PImage image_right_arrow_yellow;
  PImage image_left_arrow_red;
  PImage image_left_arrow_yellow;
  PImage image_up_arrowC;
  PImage image_down_arrowC;
  PImage image_tab_blue1;
  PImage image_tab_blue2;
  PImage image_tab_black;
  PImage image_tab_white;
  PImage image_tab_red;
  PImage image_tab_yellow;
  PImage image_tabS_red;
  PImage image_tabS_yellow;
  PImage image_course;
  PImage image_character0;
  PImage image_character1;
  PImage image_character2;
  PImage image_character3;
  
  String menu_state;
  int text_size;
  int x_size;
  int y_size;
  
  int return_x;
  int return_y;
  boolean mouse_over_return;
  
  //main menu
  int start_game_x;
  int start_game_y;
  int settings_x;
  int settings_y;
  int exit_game_x;
  int exit_game_y;
  boolean mouse_over_start_game;
  boolean mouse_over_settings;
  boolean mouse_over_exit_game;

  //character menu
  String[] characters;
  int character;
  int character_x;
  int character_y;
  int select_x;
  int select_y;
  boolean character_selected;
  boolean mouse_over_next_character;
  boolean mouse_over_previous_character;
  boolean mouse_over_select;
  boolean mouse_over_displayed_character;


  //level menu
  boolean level_1;
  boolean level_2;
  boolean level_3;
  boolean level_4;
  int play_x;
  int play_y;
  boolean mouse_over_play;
  int next_level_x;
  int next_level_y;
  int previous_level_x;
  int previous_level_y;
  boolean mouse_over_next_level;
  boolean mouse_over_previous_level;
  
  //settings menu
  boolean fps;
  boolean hitboxes;
  boolean mouse_over_display_fps;
  boolean mouse_over_display_hitboxes;
  int music_volume;
  float volume;
  int music_volume_up_x;
  int music_volume_up_y;
  boolean mouse_over_music_volume_up;
  int music_volume_down_x;
  int music_volume_down_y;
  boolean mouse_over_music_volume_down;

  Menu() {
    
    //images
    image_main_menu_background = loadImage(sketchPath() + "/images/backgrounds/sky_aueb.png");
    image_secondary_menu_background = loadImage(sketchPath() + "/images/backgrounds/sky.png");
    image_thumb1 = loadImage(sketchPath() + "/images/thumbnails/1st_thumb.png");
    image_thumb2 = loadImage(sketchPath() + "/images/thumbnails/2nd_thumb.png");
    image_thumb3 = loadImage(sketchPath() + "/images/thumbnails/3rd_thumb.png");
    image_thumb4 = loadImage(sketchPath() + "/images/thumbnails/4th_thumb.png");
    image_return_arrow_red = loadImage(sketchPath() + "/images/arrows/return_arrow_red.png");
    image_return_arrow_yellow = loadImage(sketchPath() + "/images/arrows/return_arrow_yellow.png");
    image_right_arrow_red = loadImage(sketchPath() + "/images/arrows/right_arrow_red.png");
    image_right_arrow_yellow = loadImage(sketchPath() + "/images/arrows/right_arrow_yellow.png");
    image_left_arrow_red = loadImage(sketchPath() + "/images/arrows/left_arrow_red.png");
    image_left_arrow_yellow = loadImage(sketchPath() + "/images/arrows/left_arrow_yellow.png");
    image_up_arrowC = loadImage(sketchPath() + "/images/arrows/up_arrowC.png");
    image_down_arrowC = loadImage(sketchPath() + "/images/arrows/down_arrowC.png");
    image_tab_blue1 = loadImage(sketchPath() + "/images/tabs/tab_blue1.png");
    image_tab_blue2 = loadImage(sketchPath() + "/images/tabs/tab_blue2.png");
    image_tab_black = loadImage(sketchPath() + "/images/tabs/tab_black.png");
    image_tab_white = loadImage(sketchPath() + "/images/tabs/tab_white.png");
    image_tab_red = loadImage(sketchPath() + "/images/tabs/tab_black.png");
    image_tab_yellow = loadImage(sketchPath() + "/images/tabs/tab_black.png");
    image_tabS_red = loadImage(sketchPath() + "/images/tabs/tabS_red.png");
    image_tabS_yellow = loadImage(sketchPath() + "/images/tabs/tabS_yellow.png");
    image_course = loadImage(sketchPath() + "/images/objects/course.png");

    
    text_size = 60;
    x_size = text_size*9;
    y_size = text_size;
    
    fps = true;
    hitboxes = false;
    
    menu_state = "MAIN MENU";
    
    //available characters
    characters = new String[4];
    characters[0] = "male";
    image_character0 = loadImage(sketchPath() + "/images/characters/" + characters[0] + "/idle0.png");
    characters[1] = "female";
    image_character1 = loadImage(sketchPath() + "/images/characters/" + characters[1] + "/idle0.png");
    characters[2] = "thanos";
    image_character2 = loadImage(sketchPath() + "/images/characters/" + characters[2] + "/idle0.png");
    characters[3] = "athanasia";
    image_character3 = loadImage(sketchPath() + "/images/characters/" + characters[3] + "/idle0.png");
     
    return_x = width;
    return_y = height;
    mouse_over_return = false;
    
    start_game_x = width/2;
    start_game_y = height/2 - (text_size + text_size/4);
    settings_x = width/2;
    settings_y = height/2;
    exit_game_x = width/2;
    exit_game_y = height/2 + (text_size + text_size/4);
    mouse_over_start_game = false;
    mouse_over_settings = false;
    mouse_over_exit_game = false;
    
    character = 0;
    character_x = width/2;
    character_y = height/2;
    select_x = width/2;
    select_y = height;
    character_selected = false;
    mouse_over_next_character = false;
    mouse_over_previous_character = false;
    mouse_over_select = false;
    mouse_over_displayed_character = false;
    
    levelReset();
    
    play_x = width/2;
    play_y = height;
    mouse_over_play = false;
    
    next_level_x = width;
    next_level_y = height/2;
    previous_level_x = 0;
    previous_level_y = height/2;
    mouse_over_next_level = false;
    mouse_over_previous_level = false;
    
    mouse_over_display_fps = false;
    mouse_over_display_hitboxes = false;
    music_volume = 5;
    volume = music_volume*0.03;
    music_volume_up_x = width/2;
    music_volume_up_y = 60;
    mouse_over_music_volume_up = false;
    music_volume_down_x = width/2;
    music_volume_down_y = 180;
    mouse_over_music_volume_down = false;
  }
  
  void draw() {
    if (menu_state == "MAIN MENU") {
      mainMenu();
    } else if (menu_state == "CHARACTER MENU") {
      characterMenu();
    } else if (menu_state == "LEVEL MENU") {
      levelMenu();
    } else if (menu_state == "SETTINGS MENU") {
      settingsMenu();
    }
    displayFps();
  }
  
  void mousePressed() {
    if (menu_state == "MAIN MENU") { //MAIN MENU
      if (mouse_over_start_game) { //click on START GAME option
        sounds[2].amp(volume);
        sounds[2].play();
        if (!character_selected){
          menu_state = "CHARACTER MENU";
        } else {
          level_1 = true;
          menu_state = "LEVEL MENU";
        }
      } else if (mouse_over_settings) { //click on SETTINGS option
        sounds[2].amp(volume);
        sounds[2].play();
        menu_state = "SETTINGS MENU";
      } else if (mouse_over_exit_game) { //click on EXIT GAME option
        exit();
      }
      
    } else if (menu_state == "CHARACTER MENU") { //CHARACTER MENU
      if (mouse_over_return) { //click on RETURN option
          sounds[0].amp(volume);
          sounds[0].play();
          menu_state = "MAIN MENU";
      } else if (mouse_over_next_character) { //click on NEXT CHARACTER option
          sounds[8].amp(volume);
          sounds[8].play();
        if (character+1 == characters.length) {
          character = 0;
        } else {
          character++;
        }
      } else if (mouse_over_previous_character) { //click on PREVIOUS CHARACTER option
          sounds[5].amp(volume);
          sounds[5].play();
        if (character-1 == -1) {
          character = characters.length-1;
        } else {
          character--;
        }
      } else if (mouse_over_select) { //click on SELECT option
        sounds[2].amp(volume);
        sounds[2].play();
        character_selected = true;
        level_1 = true;
        menu_state = "LEVEL MENU";
      }
    } else if (menu_state == "LEVEL MENU") { //LEVEL MENU
      if (mouse_over_return) { //click on RETURN option
          levelReset();
          sounds[0].amp(volume);
          sounds[0].play();
          menu_state = "MAIN MENU";
      } else if (mouse_over_next_level) { //click on NEXT LEVEL option
          sounds[8].amp(volume);
          sounds[8].play();
         if (level_1) {
           level_1 = false;
           level_2 = true;
         } else if (level_2) {
           level_2 = false;
           level_3 = true;
         } else if (level_3) {
           level_3 = false;
           level_4 = true;
         }
      } else if (mouse_over_previous_level) { //click on PREVIOUS LEVEL option
          sounds[5].amp(volume);
          sounds[5].play();
         if (level_2) {
           level_2 = false;
           level_1 = true;
         } else if (level_3) {
           level_3 = false;
           level_2 = true;
         } else if (level_4) {
           level_4 = false;
           level_3 = true;
         }
      } else if (mouse_over_displayed_character) { //click on DISPLAYED CHARACTER option
        levelReset();
        menu_state = "CHARACTER MENU";
      } else if (mouse_over_play) { //click on PLAY option
        if (level_1) {
          level = levels[0];
          startGame();
        } else if (level_2 && game.courses_collected >= 5) {
          level = levels[1];
          startGame();
        } else if (level_3 && game.courses_collected >= 10) {
          level = levels[2];
          startGame();
        } else if (level_4 && game.courses_collected >= 15) {
          level = levels[3];
          startGame();
        }
      }
    } else if (menu_state == "SETTINGS MENU") { //SETTINGS MENU
      if (mouse_over_return) { //click on RETURN option
          sounds[0].amp(volume);
          sounds[0].play();
          menu_state = "MAIN MENU";
      } else if (mouse_over_display_fps) { //click on DISPLAY FPS option
        if (!fps) {
          fps = true;
        } else {
          fps = false;
        }
      } else if (mouse_over_display_hitboxes) { //click on DISPLAY HITBOXES option
        if (!hitboxes) {
          hitboxes = true;
        } else {
          hitboxes = false;
        }
      } else if (mouse_over_music_volume_up) {
        if (music_volume < 9) {
          music_volume++;
          volume = music_volume*0.03;
          music.amp(volume);
        }
      } else if (mouse_over_music_volume_down) {
        if (music_volume > 0) {
          music_volume--;
          volume = music_volume*0.03;
          music.amp(volume);
        }
      }
    }
  }
  
  void mainMenu() {
    image(image_main_menu_background, 0, 0, 1440, 900);
    
    if (hitboxes) {
      fill(255, 0, 255); //pink
      rect(start_game_x - x_size/3, start_game_y - y_size + y_size/8, x_size*2/3, y_size*9/8); //hitbox of START GAME button
      rect(settings_x - x_size/3, settings_y - y_size + y_size/8, x_size*2/3, y_size*9/8); //hitbox of SETTINGS button
      rect(exit_game_x - x_size/3, exit_game_y - y_size + y_size/8, x_size*2/3, y_size*9/8); //hitbox of EXIT GAME button
    }
    
    textSize(text_size);
    //check if the mouse is over the START GAME option
    if (mouseX > (start_game_x - x_size/3) && mouseX < (start_game_x + x_size/3) && mouseY > (start_game_y - y_size + (y_size/8)) && mouseY < (start_game_y + y_size/4)) {
      mouse_over_start_game = true;
      fill(255, 200, 45); //yellow
    } else {
      mouse_over_start_game = false;
      fill(235, 15, 15); //red
    }
    text("START GAME", start_game_x, start_game_y);
    
    //check if the mouse is over the SETTINGS option
    if (mouseX > (settings_x - x_size/3) && mouseX < (settings_x + x_size/3) && mouseY > (settings_y - y_size + y_size/8) && mouseY < (settings_y + y_size/4)) {
      mouse_over_settings = true;
      fill(255, 200, 45); //yellow
    } else {
      mouse_over_settings = false;
      fill(235, 15, 15); //red
    }
    text("SETTINGS", settings_x, settings_y);
    
    //check if the mouse is over the EXIT GAME option
    if (mouseX > (exit_game_x - x_size/3) && mouseX < (exit_game_x + x_size/3) && mouseY > (exit_game_y - y_size + y_size/8) && mouseY < (exit_game_y + y_size/4)) {
      mouse_over_exit_game = true;
      fill(255, 200, 45); //yellow
    } else {
      mouse_over_exit_game = false;
      fill(235, 15, 15); //red
    }
    text("EXIT GAME", exit_game_x, exit_game_y);
  }
  
  void characterMenu() {
    image(image_secondary_menu_background, 0, 0, 1440, 900);
 
    if (hitboxes) {
      fill(255, 0, 255); //pink
      rect(return_x - 131, return_y - 130, 130, 130); //hitbox of RETURN to menu button
      rect(character_x+249, character_y-65, 130, 130); //hitbox of NEXT CHARACTER button
      rect(character_x-380, character_y-65, 130, 130); //hitbox of PREVIOUS CHARACTER button
      rect(select_x-185, select_y-205, 370, 130); //hitbox of SELECT button
    }
    
    //check if the mouse is over the RETURN option
    if (mouseX > (return_x-131) && mouseX < return_x && mouseY > (return_y-130) && mouseY < return_y) {
      mouse_over_return = true;
      image(image_return_arrow_yellow, return_x-130, return_y-130, 130, 130);
    } else {
      mouse_over_return = false;
      image(image_return_arrow_red, return_x-130, return_y-130, 130, 130);
    }
    
    //check if the mouse if over the NEXT CHARACTER option
    if (mouseX > character_x+249 && mouseX < character_x+250+130 && mouseY > character_y-65 && mouseY < character_y-65+130) {
      mouse_over_next_character = true;
      image(image_right_arrow_yellow, character_x+250, character_y-65, 130, 130);
    } else {
      mouse_over_next_character = false;
      image(image_right_arrow_red, character_x+250, character_y-65, 130, 130);
    }
    
    //check if the mouse if over the PREVIOUS CHARACTER option
    if (mouseX > character_x-380 && mouseX < character_x-380+130 && mouseY > character_y-65 && mouseY < character_y-65+130) {
      mouse_over_previous_character = true;
      image(image_left_arrow_yellow, character_x-380, character_y-65, 130, 130);
    } else {
      mouse_over_previous_character = false;
      image(image_left_arrow_red, character_x-380, character_y-65, 130, 130);
    }
    
    //check if the mouse if over the SELECT option
    if (mouseX > select_x-185 && mouseX < select_x-180+365 && mouseY > select_y-205 && mouseY < select_y-200+125) {
      mouse_over_select = true;
      image(image_tabS_yellow, select_x-180, select_y-200, 360, 120);
      fill(235, 15, 15); //red
    } else {
      mouse_over_select = false;
      image(image_tabS_red, select_x-180, select_y-200, 360, 120);
      fill(255, 200, 45); //yellow
    }
    textSize(text_size*1.4);
    text("SELECT", select_x, select_y-115);
    
    //display tab
    image(image_tab_blue1, character_x-200, character_y-200, 400, 400);
    
    //display character on tab
    if (character == 0) {
      image(image_character0, character_x-100, character_y-220, 192, 384);
    } else if (character == 1) {
      image(image_character1, character_x-100, character_y-220, 192, 384);
    } else if (character == 2) {
      image(image_character2, character_x-100, character_y-220, 192, 384);
    } else if (character == 3) {
      image(image_character3, character_x-100, character_y-220, 192, 384);
    }
  }
  
  void levelMenu() {
    image(image_secondary_menu_background, 0, 0, 1440, 900);
    
    if (hitboxes) {
      fill(255, 0, 255); //pink
      rect(return_x - 131, return_y - 130, 130, 130); //hitbox of RETURN to menu button
      rect(play_x-205, play_y-245, 410, 170); //hitbox of PLAY button
    }
    
    //check if the mouse is over the RETURN option
    if (mouseX > (return_x-131) && mouseX < return_x && mouseY > (return_y-130) && mouseY < return_y) {
      mouse_over_return = true;
      image(image_return_arrow_yellow, return_x-130, return_y-130, 130, 130);
    } else {
      mouse_over_return = false;
      image(image_return_arrow_red, return_x-130, return_y-130, 130, 130);
    }
    
    //check if the mouse if over the PLAY option
    if (mouseX > play_x-205 && mouseX < play_x+205 && mouseY > play_y-245 && mouseY < play_y-75) {
      mouse_over_play = true;
      image(image_tabS_yellow, play_x-200, play_y-240, 400, 160);
      fill(235, 15, 15); //red
    } else {
      mouse_over_play = false;
      image(image_tabS_red, play_x-200, play_y-240, 400, 160);
      fill(255, 200, 45); //yellow
    }
    textSize(text_size*2);
    text("PLAY", play_x, play_y-125);
    
    if (!level_4) { //if you are not being displayed the last level you have the option to view the NEXT one
      if (hitboxes) {
        fill(255, 0, 255); //pink
        rect(next_level_x-156, next_level_y-130, 130, 130); //hitbox of NEXT LEVEL button
      }
      //check if the mouse if over the NEXT LEVEL option
      if (mouseX > next_level_x-156 && mouseX < next_level_x-26 && mouseY > next_level_y-130 && mouseY < next_level_y) {
        mouse_over_next_level = true;
        image(image_right_arrow_yellow, next_level_x-155, next_level_y-130, 130, 130);
      } else {
        mouse_over_next_level = false;
        image(image_right_arrow_red, next_level_x-155, next_level_y-130, 130, 130);
      }
    }
    
    if (!level_1) { //if you are not being displayed the first level you have the option to view the PREVIOUS one
      if (hitboxes) {
        fill(255, 0, 255); //pink
        rect(previous_level_x+25, previous_level_y-130, 130, 130); //hitbox of PREVIOUS LEVEL button
      }
      //check if the mouse if over the PREVIOUS LEVEL option
      if (mouseX > previous_level_x+25 && mouseX < previous_level_x+155 && mouseY > previous_level_y-130 && mouseY < previous_level_y) {
        mouse_over_previous_level = true;
        image(image_left_arrow_yellow, previous_level_x+25, previous_level_y-130, 130, 130);
      } else {
        mouse_over_previous_level = false;
        image(image_left_arrow_red, previous_level_x+25, previous_level_y-130, 130, 130);
      }
    }
    
    if (level_1) {
      level = levels[0];
      mouse_over_previous_level = false;
      image(image_thumb1, width/2-300, height/2-350, 600, 350);
      fill(255, 255, 255); //white
      textSize(text_size);
      text("LEVEL 1", width/2, height/2+80);
      fill(255, 215, 0); //gold
      textSize(text_size*3/2);
      text(10 - level.courses_collected, width/2+62, height/2+160);
    } else if (level_2) {
       level = levels[1];
      image(image_thumb2, width/2-300, height/2-350, 600, 350);
      fill(255, 255, 255); //white
      textSize(text_size);
      text("LEVEL 2", width/2, height/2+80);
      fill(255, 215, 0); //gold
      textSize(text_size*3/2);
      text(10 - level.courses_collected, width/2+62, height/2+160);
    } else if (level_3) {
       level = levels[2];
      image(image_thumb3, width/2-300, height/2-350, 600, 350);
      fill(255, 255, 255); //white
      textSize(text_size);
      text("LEVEL 3", width/2, height/2+80);
      fill(255, 215, 0); //gold
      textSize(text_size*3/2);
      text(8 - level.courses_collected, width/2+62, height/2+160);
    } else if (level_4) {
       level = levels[3];
      mouse_over_next_level = false;
      image(image_thumb4, width/2-300, height/2-350, 600, 350);
      fill(255, 255, 255); //white
      textSize(text_size);
      text("LEVEL 4", width/2, height/2+80);
      fill(255, 215, 0); //gold
      textSize(text_size*3/2);
      text(8 - level.courses_collected, width/2+62, height/2+160);
    }
    image(image_course, width/2-100, height/2+100, 64, 64);
    fill(220, 220, 220); //light grey
    textSize(text_size*0.8);
    text("X", width/2, height/2+150);
    

    image(image_course, 57, 188, 32, 32);
    fill(220, 220, 220); //light grey
    textSize(text_size*0.4);
    text("X", 107, 213);
    fill(255, 215, 0); //gold
    textSize(text_size*3/4);
    if (game.courses_collected < 10) {
      text(game.courses_collected, 138, 218);
    } else {
      text(game.courses_collected, 148, 218);
    }
    
    displayCharacter();
  }
  
  void settingsMenu() {
    image(image_secondary_menu_background, 0, 0, 1440, 900);
    
    textAlign(LEFT);
    
    if (hitboxes) {
      fill(255, 0, 255); //pink
      rect(return_x - 131, return_y - 130, 130, 130); //hitbox of RETURN to menu button
      rect(20, 20, 50, 50); //hitbox of DISPLAY FPS button
      rect(20, 80, 50, 50); //hitbox of DISPLAY HITBOXES button
      rect(music_volume_up_x+240, music_volume_up_y-23, 65, 33); //hitbox of music_volume UP button
      rect(music_volume_down_x+240, music_volume_down_y-40, 65, 33); //hitbox of music_volume DOWN button
    }
    
    //check if the mouse is over the RETURN option
    if (mouseX > (return_x-131) && mouseX < return_x && mouseY > (return_y-130) && mouseY < return_y) {
      mouse_over_return = true;
      image(image_return_arrow_yellow, return_x-130, return_y-130, 130, 130);
    } else {
      mouse_over_return = false;
      image(image_return_arrow_red, return_x-130, return_y-130, 130, 130);
    }
    
    //check if mouse is over DISPLAY FPS option
    if (mouseX > 20 && mouseX < 70 && mouseY > 20 && mouseY < 70) {
      mouse_over_display_fps = true;
    } else {
      mouse_over_display_fps = false;
    }
    
    //check if mouse is over DISPLAY HITBOXES option
    if (mouseX > 20 && mouseX < 70 && mouseY > 80 && mouseY < 130) {
      mouse_over_display_hitboxes = true;
    } else {
      mouse_over_display_hitboxes = false;
    }
    
    //check if mouse is over music_volume UP option
    if (mouseX > music_volume_up_x+240 && mouseX < music_volume_up_x+305 && mouseY > music_volume_up_y-23 && mouseY < music_volume_up_y+10) {
      mouse_over_music_volume_up = true;
    } else {
      mouse_over_music_volume_up = false;
    }
    
    //check if mouse is over music_volume DOWN option
    if (mouseX > music_volume_down_x+240 && mouseX < music_volume_down_x+305 && mouseY > music_volume_down_y-40 && mouseY < music_volume_down_y-7) {
      mouse_over_music_volume_down = true;
    } else {
      mouse_over_music_volume_down = false;
    }
    
    fill(255, 255, 255); //white
    textSize(text_size*0.8);
    
    if (!fps) {
      image(image_tab_black, 25, 25, 40, 40);
    } else {
      image(image_tab_white, 25, 25, 40, 40);
    }
    text("display  fps", 80, 60);
    
    if (!hitboxes) {
      image(image_tab_black, 25, 85, 40, 40);
    } else {
      image(image_tab_white, 25, 85, 40, 40);
    }
    text("display  hitboxes", 80, 120);
    
    image(image_up_arrowC, music_volume_up_x+240, music_volume_up_y-23, 65, 33);
    image(image_down_arrowC, music_volume_down_x+240, music_volume_down_y-40, 65, 33);
    text("music", width/2+80, 120);
    fill(0);
    text(music_volume, width/2+257, 120);
    
    textAlign(CENTER);
  }
  
  void displayCharacter() {
    if (character_selected) {
      if (hitboxes) {
        fill(255, 0, 255); //pink
        rect(35, 35, 144, 144);
      }
      
      if (mouseX > 35 && mouseX < 35+144 && mouseY > 35 && mouseY < 35+144) {
        image(image_tab_blue2, 40, 40, 134, 134);
        mouse_over_displayed_character = true;
      } else {
        image(image_tab_blue1, 40, 40, 134, 134);
        mouse_over_displayed_character = false;
      }
      
      //display character on tab
      if (character == 0) {
        image(image_character0, 40+33, 40-8, 64, 128);
      } else if (character == 1) {
        image(image_character1, 40+33, 40-8, 64, 128);
      } else if (character == 2) {
        image(image_character2, 40+33, 40-8, 64, 128);
      } else if (character == 3) {
        image(image_character3, 40+33, 40-8, 64, 128);
      }
    }
  }
  
  void startGame() {
    on_menu = false;
    playMusic();
    player = new Player(characters[character]); 
  }
  
  void levelReset() {
    level_1 = false;
    level_2 = false;
    level_3 = false;
    level_4 = false;
  }
  
  void displayFps() {
    //display FPS
    if (fps) {
      fill(0, 255, 0); //green
      textSize(text_size*0.8);
      text(frameRate, width+20, 30); 
    }
  }
};
