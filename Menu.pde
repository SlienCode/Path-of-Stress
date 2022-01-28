class Menu {
  
  PImage image_main_menu_background;
  PImage image_secondary_menu_background;
  PImage image_thumb1;
  PImage image_thumb2;
  PImage image_thumb3;
  PImage image_thumb4;
  PImage image_thumb2_locked;
  PImage image_thumb3_locked;
  PImage image_thumb4_locked;
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
  PImage image_character4;
  PImage image_character5;
  
  Flag flag;
  
  String menu_state;
  
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
  int character_temp;
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
  boolean year_locked;
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
  boolean coordinates;
  boolean mouse_over_display_fps;
  boolean mouse_over_display_hitboxes;
  boolean mouse_over_display_coordinates;
  float volume;
  
  int master_volume;
  int master_x;
  int master_y;
  int master_volume_x;
  int master_volume_up_y;
  int master_volume_down_y;
  boolean mouse_over_master_volume_up;
  boolean mouse_over_master_volume_down;
  
  int music_volume;
  int music_x;
  int music_y;
  int music_volume_x;
  int music_volume_up_y;
  int music_volume_down_y;
  boolean mouse_over_music_volume_up;
  boolean mouse_over_music_volume_down;
  
  int sfx_volume;
  int sfx_x;
  int sfx_y;
  int sfx_volume_x;
  int sfx_volume_up_y;
  int sfx_volume_down_y;
  boolean mouse_over_sfx_volume_up;
  boolean mouse_over_sfx_volume_down;
  
  boolean credits_shown;
  Degree degree;

  Menu() {
    
    //images
    image_main_menu_background = loadImage(sketchPath() + "/images/backgrounds/sky_aueb.png");
    image_secondary_menu_background = loadImage(sketchPath() + "/images/backgrounds/sky.png");
    image_thumb1 = loadImage(sketchPath() + "/images/thumbnails/1st_thumb.png");
    image_thumb2 = loadImage(sketchPath() + "/images/thumbnails/2nd_thumb.png");
    image_thumb3 = loadImage(sketchPath() + "/images/thumbnails/3rd_thumb.png");
    image_thumb4 = loadImage(sketchPath() + "/images/thumbnails/4th_thumb.png");
    image_thumb2_locked = loadImage(sketchPath() + "/images/thumbnails/2nd_thumb_locked.png");
    image_thumb3_locked = loadImage(sketchPath() + "/images/thumbnails/3rd_thumb_locked.png");
    image_thumb4_locked = loadImage(sketchPath() + "/images/thumbnails/4th_thumb_locked.png");
    image_return_arrow_red = loadImage(sketchPath() + "/images/miscellaneous/arrows/return_arrow_red.png");
    image_return_arrow_yellow = loadImage(sketchPath() + "/images/miscellaneous/arrows/return_arrow_yellow.png");
    image_right_arrow_red = loadImage(sketchPath() + "/images/miscellaneous/arrows/right_arrow_red.png");
    image_right_arrow_yellow = loadImage(sketchPath() + "/images/miscellaneous/arrows/right_arrow_yellow.png");
    image_left_arrow_red = loadImage(sketchPath() + "/images/miscellaneous/arrows/left_arrow_red.png");
    image_left_arrow_yellow = loadImage(sketchPath() + "/images/miscellaneous/arrows/left_arrow_yellow.png");
    image_up_arrowC = loadImage(sketchPath() + "/images/miscellaneous/arrows/up_arrowC.png");
    image_down_arrowC = loadImage(sketchPath() + "/images/miscellaneous/arrows/down_arrowC.png");
    image_tab_blue1 = loadImage(sketchPath() + "/images/miscellaneous/tabs/tab_blue1.png");
    image_tab_blue2 = loadImage(sketchPath() + "/images/miscellaneous/tabs/tab_blue2.png");
    image_tab_black = loadImage(sketchPath() + "/images/miscellaneous/tabs/tab_black.png");
    image_tab_white = loadImage(sketchPath() + "/images/miscellaneous/tabs/tab_white.png");
    image_tab_red = loadImage(sketchPath() + "/images/miscellaneous/tabs/tab_red.png");
    image_tab_yellow = loadImage(sketchPath() + "/images/miscellaneous/tabs/tab_yellow.png");
    image_tabS_red = loadImage(sketchPath() + "/images/miscellaneous/tabs/tabS_red.png");
    image_tabS_yellow = loadImage(sketchPath() + "/images/miscellaneous/tabs/tabS_yellow.png");
    image_course = loadImage(sketchPath() + "/images/objects/course.png");

    flag = new Flag(round(width*(672.0/1440)), round(height*(521.0/900)), round(width*(128.0/1440)), round(height*(128.0/900)));
    
    menu_state = "MAIN MENU";
    
    //available characters
    characters = new String[6];
    characters[0] = "male";
    image_character0 = loadImage(sketchPath() + "/images/characters/" + characters[0] + "/idle0.png");
    characters[1] = "female";
    image_character1 = loadImage(sketchPath() + "/images/characters/" + characters[1] + "/idle0.png");
    characters[2] = "thanos";
    image_character2 = loadImage(sketchPath() + "/images/characters/" + characters[2] + "/idle0.png");
    characters[3] = "athanasia";
    image_character3 = loadImage(sketchPath() + "/images/characters/" + characters[3] + "/idle0.png");
    characters[4] = "emo_male";
    image_character4 = loadImage(sketchPath() + "/images/characters/" + characters[4] + "/idle0.png");
    characters[5] = "emo_female";
    image_character5 = loadImage(sketchPath() + "/images/characters/" + characters[5] + "/idle0.png");
     
    return_x = width;
    return_y = height;
    mouse_over_return = false;
    
    start_game_x = width/2;
    start_game_y = height/2-round(height*(75.0/900));
    settings_x = width/2;
    settings_y = height/2;
    exit_game_x = width/2;
    exit_game_y = height/2+round(height*(75.0/900));
    mouse_over_start_game = false;
    mouse_over_settings = false;
    mouse_over_exit_game = false;
    
    character = 0;
    character_temp = 0;
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
    year_locked = false;
    play_x = width/2;
    play_y = height;
    mouse_over_play = false;
    
    next_level_x = width;
    next_level_y = height/2;
    previous_level_x = 0;
    previous_level_y = height/2;
    mouse_over_next_level = false;
    mouse_over_previous_level = false;
    
    fps = false;
    hitboxes = false;
    coordinates = false;
    mouse_over_display_fps = false;
    mouse_over_display_hitboxes = false;
    mouse_over_display_coordinates = false;
    
    master_volume = 5;
    master_x = round(width*(100.0/1440));
    master_y = round(height*(422.0/900));
    master_volume_x = master_x+round(width*(180.0/1440));
    master_volume_up_y = master_y+round(height*(37.0/900));
    master_volume_down_y = master_volume_up_y+round(height*(100.0/900));
    mouse_over_master_volume_up = false;
    mouse_over_master_volume_down = false;
    
    music_volume = 5;
    music_x = round(width*(570.0/1440));
    music_y = round(height*(422.0/900));
    music_volume_x = music_x+round(width*(150.0/1440));
    music_volume_up_y = music_y+round(height*(37.0/900));
    music_volume_down_y = music_volume_up_y+round(height*(100.0/900));
    mouse_over_music_volume_up = false;
    mouse_over_music_volume_down = false;
    
    sfx_volume = 5;
    sfx_x = round(width*(1060.0/1440));
    sfx_y = round(height*(422.0/900));
    sfx_volume_x = sfx_x+round(width*(100.0/1440));
    sfx_volume_up_y = sfx_y+round(height*(37.0/900));
    sfx_volume_down_y = sfx_volume_up_y+round(height*(100.0/900));
    mouse_over_sfx_volume_up = false;
    mouse_over_sfx_volume_down = false;
    
    credits_shown = false;
    degree = new Degree();
    
    volume = 0.04;
    
    //********************************************************************************************************
    //round(width*(.0/1440)))   round(height*(.0/900)))   round(width*(60.0/1440)))
    //********************************************************************************************************
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
    } else if (menu_state == "CREDITS MENU") {
      creditsMenu();
    }
    displayFps();
    displayCoordinates();
  }
  
  void mousePressed() {
    if (menu_state == "MAIN MENU") { //MAIN MENU
      if (mouse_over_start_game) { //click on START GAME option
        sounds[2].amp(volume * sfx_volume * (master_volume/10.0));
        sounds[2].play();
        if (!character_selected){
          menu_state = "CHARACTER MENU";
        } else {
          level_1 = true;
          menu_state = "LEVEL MENU";
        }
      } else if (mouse_over_settings) { //click on SETTINGS option
        sounds[2].amp(volume * sfx_volume * (master_volume/10.0));
        sounds[2].play();
        menu_state = "SETTINGS MENU";
      } else if (mouse_over_exit_game) { //click on EXIT GAME option
        exit();
      }
      
    } else if (menu_state == "CHARACTER MENU") { //CHARACTER MENU
      if (mouse_over_return) { //click on RETURN option
          sounds[0].amp(volume * sfx_volume * (master_volume/10.0));
          sounds[0].play();
        if (!character_selected){
          character_temp = 0;
          menu_state = "MAIN MENU";
        } else {
          character_temp = character;
          level_1 = true;
          menu_state = "LEVEL MENU";
        }
      } else if (mouse_over_next_character) { //click on NEXT CHARACTER option
          sounds[8].amp(volume * sfx_volume * (master_volume/10.0));
          sounds[8].play();
        if (character_temp+1 == characters.length) {
          character_temp = 0;
        } else {
          character_temp++;
        }
      } else if (mouse_over_previous_character) { //click on PREVIOUS CHARACTER option
          sounds[5].amp(volume * sfx_volume * (master_volume/10.0));
          sounds[5].play();
        if (character_temp-1 == -1) {
          character_temp = characters.length-1;
        } else {
          character_temp--;
        }
      } else if (mouse_over_select) { //click on SELECT option
        sounds[2].amp(volume * sfx_volume * (master_volume/10.0));
        sounds[2].play();
        character = character_temp;
        character_selected = true;
        level_1 = true;
        menu_state = "LEVEL MENU";
      }
    } else if (menu_state == "LEVEL MENU") { //LEVEL MENU
      if (mouse_over_return) { //click on RETURN option
          levelReset();
          sounds[0].amp(volume * sfx_volume * (master_volume/10.0));
          sounds[0].play();
          menu_state = "MAIN MENU";
      } else if (mouse_over_next_level) { //click on NEXT LEVEL option
          sounds[8].amp(volume * sfx_volume * (master_volume/10.0));
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
          sounds[5].amp(volume * sfx_volume * (master_volume/10.0));
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
        } else if (level_2 && game.courses_collected >= 6) {
          level = levels[1];
          startGame();
        } else if (level_3 && game.courses_collected >= 12) {
          level = levels[2];
          startGame();
        } else if (level_4 && game.courses_collected >= 18) {
          level = levels[3];
          startGame();
        }
      }
    } else if (menu_state == "SETTINGS MENU") { //SETTINGS MENU
      if (mouse_over_return) { //click on RETURN option
          sounds[0].amp(volume * sfx_volume * (master_volume/10.0));
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
      } else if (mouse_over_display_coordinates) { //click on DISPLAY COORDINATES option
        if (!coordinates) {
          coordinates = true;
        } else {
          coordinates = false;
        }
      } else if (mouse_over_master_volume_up) {
        if (master_volume < 9) {
          master_volume++;
          for (SoundFile iter : sounds) iter.amp(volume * sfx_volume * (master_volume/10.0));
          music.amp(volume * music_volume * (master_volume/10.0));
        }
      } else if (mouse_over_master_volume_down) {
        if (master_volume > 0) {
          master_volume--;
          for (SoundFile iter : sounds) iter.amp(volume * sfx_volume * (master_volume/10.0));
          music.amp(volume * music_volume * (master_volume/10.0));
        }
      } else if (mouse_over_music_volume_up) {
        if (music_volume < 9) {
          music_volume++;
          music.amp(volume * music_volume * (master_volume/10.0));
        }
      } else if (mouse_over_music_volume_down) {
        if (music_volume > 0) {
          music_volume--;
          music.amp(volume * music_volume * (master_volume/10.0));
        }
      } else if (mouse_over_sfx_volume_up) {
        if (sfx_volume < 9) {
          sfx_volume++;
          for (SoundFile iter : sounds) iter.amp(volume * sfx_volume * (master_volume/10.0));
        }
      } else if (mouse_over_sfx_volume_down) {
        if (sfx_volume > 0) {
          sfx_volume--;
          for (SoundFile iter : sounds) iter.amp(volume * sfx_volume * (master_volume/10.0));
        }
      }
    } else if (menu_state == "CREDITS MENU") { //CREDITS MENU
      if (mouse_over_return) { //click on RETURN option
          sounds[0].amp(volume * sfx_volume * (master_volume/10.0));
          sounds[0].play();
          credits_shown = true;
          levelReset();
          menu_state = "MAIN MENU";
      }
    }
  }
  
  void mainMenu() {
    image(image_main_menu_background, 0, 0, width, height);
    flag.draw();
    
    if (hitboxes) {
      fill(255, 0, 255); //pink
      rect(start_game_x-round(width*(180.0/1440)), start_game_y-round(height*(53.0/900)), round(width*(360.0/1440)), round(height*(67.0/900))); //hitbox of START GAME button
      rect(settings_x-round(width*(180.0/1440)), settings_y-round(height*(53.0/900)), round(width*(360.0/1440)), round(height*(67.0/900))); //hitbox of SETTINGS button
      rect(exit_game_x-round(width*(180.0/1440)), exit_game_y-round(height*(53.0/900)), round(width*(360.0/1440)), round(height*(67.0/900))); //hitbox of EXIT GAME button
    }
    
    textSize(round(width*(60.0/1440)));
    
    //check if the mouse is over the START GAME option
    if (mouseX > start_game_x-round(width*(180.0/1440)) && mouseX < start_game_x+round(width*(180.0/1440)) && mouseY > start_game_y-round(height*(53.0/900)) && mouseY < start_game_y+round(height*(15.0/900))) {
      mouse_over_start_game = true;
      fill(255, 200, 45); //yellow
    } else {
      mouse_over_start_game = false;
      fill(235, 15, 15); //red
    }
    text("START GAME", start_game_x, start_game_y);
    
    //check if the mouse is over the SETTINGS option
    if (mouseX > settings_x-round(width*(180.0/1440)) && mouseX < settings_x+round(width*(180.0/1440)) && mouseY > settings_y-round(height*(53.0/900)) && mouseY < settings_y+round(height*(15.0/900))) {
      mouse_over_settings = true;
      fill(255, 200, 45); //yellow
    } else {
      mouse_over_settings = false;
      fill(235, 15, 15); //red
    }
    text("SETTINGS", settings_x, settings_y);
    
    //check if the mouse is over the EXIT GAME option
    if (mouseX > exit_game_x-round(width*(180.0/1440)) && mouseX < exit_game_x+round(width*(180.0/1440)) && mouseY > exit_game_y-round(height*(53.0/900)) && mouseY < exit_game_y+round(height*(15.0/900))) {
      mouse_over_exit_game = true;
      fill(255, 200, 45); //yellow
    } else {
      mouse_over_exit_game = false;
      fill(235, 15, 15); //red
    }
    text("EXIT GAME", exit_game_x, exit_game_y);
  }
  
  void characterMenu() {
    image(image_secondary_menu_background, 0, 0, width, height);
 
    if (hitboxes) {
      fill(255, 0, 255); //pink
      rect(return_x-round(width*(131.0/1440)), return_y-round(height*(130.0/900)), round(width*(130.0/1440)), round(height*(130.0/900))); //hitbox of RETURN to menu button
      rect(character_x+round(width*(249.0/1440)), character_y-round(height*(65.0/900)), round(width*(130.0/1440)), round(height*(130.0/900))); //hitbox of NEXT CHARACTER button
      rect(character_x-round(width*(380.0/1440)), character_y-round(height*(65.0/900)), round(width*(130.0/1440)), round(height*(130.0/900))); //hitbox of PREVIOUS CHARACTER button
      rect(select_x-round(width*(185.0/1440)), select_y-round(height*(205.0/900)), round(width*(369.0/1440)), round(height*(130.0/900))); //hitbox of SELECT button
    }
    
    //check if the mouse is over the RETURN option
    if (mouseX > return_x-round(width*(131.0/1440)) && mouseX < return_x && mouseY > return_y-round(height*(130.0/900)) && mouseY < return_y) {
      mouse_over_return = true;
      image(image_return_arrow_yellow, return_x-round(width*(130.0/1440)), return_y-round(height*(130.0/900)), round(width*(130.0/1440)), round(height*(130.0/900)));
    } else {
      mouse_over_return = false;
      image(image_return_arrow_red, return_x-round(width*(130.0/1440)), return_y-round(height*(130.0/900)), round(width*(130.0/1440)), round(height*(130.0/900)));
    }
    
    //check if the mouse if over the NEXT CHARACTER option
    if (mouseX > character_x+round(width*(249.0/1440)) && mouseX < character_x+round(width*(380.0/1440)) && mouseY > character_y-round(height*(65.0/900)) && mouseY < character_y+round(height*(65.0/900))) {
      mouse_over_next_character = true;
      image(image_right_arrow_yellow, character_x+round(width*(250.0/1440)), character_y-round(height*(65.0/900)), round(width*(130.0/1440)), round(height*(130.0/900)));
    } else {
      mouse_over_next_character = false;
      image(image_right_arrow_red, character_x+round(width*(250.0/1440)), character_y-round(height*(65.0/900)), round(width*(130.0/1440)), round(height*(130.0/900)));
    }
    
    //check if the mouse if over the PREVIOUS CHARACTER option
    if (mouseX > character_x-round(width*(380.0/1440)) && mouseX < character_x-round(width*(250.0/1440)) && mouseY > character_y-round(height*(65.0/900)) && mouseY < character_y+round(height*(65.0/900))) {
      mouse_over_previous_character = true;
      image(image_left_arrow_yellow, character_x-round(width*(380.0/1440)), character_y-round(height*(65.0/900)), round(width*(130.0/1440)), round(height*(130.0/900)));
    } else {
      mouse_over_previous_character = false;
      image(image_left_arrow_red, character_x-round(width*(380.0/1440)), character_y-round(height*(65.0/900)), round(width*(130.0/1440)), round(height*(130.0/900)));
    }
    
    //check if the mouse if over the SELECT option
    if (mouseX > select_x-round(width*(185.0/1440)) && mouseX < select_x+round(width*(249.0/1440)) && mouseY > select_y-round(height*(205.0/900)) && mouseY < select_y-round(height*(75.0/900))) {
      mouse_over_select = true;
      image(image_tabS_yellow, select_x-round(width*(180.0/1440)), select_y-round(height*(200.0/900)), round(width*(360.0/1440)), round(height*(120.0/900)));
      fill(235, 15, 15); //red
    } else {
      mouse_over_select = false;
      image(image_tabS_red, select_x-round(width*(180.0/1440)), select_y-round(height*(200.0/900)), round(width*(360.0/1440)), round(height*(120.0/900)));
      fill(255, 200, 45); //yellow
    }
    textSize(round(width*(60.0/1440)*1.4));
    text("SELECT", select_x, select_y-round(height*(115.0/900)));
    
    //display tab
    image(image_tab_blue1, character_x-round(width*(200.0/1440)), character_y-round(height*(200.0/900)), round(width*(400.0/1440)), round(height*(400.0/900)));
    
    //display character
    if (character_temp == 0) {
      image(image_character0, character_x-round(width*(100.0/1440)), character_y-round(height*(220.0/900)), round(width*(192.0/1440)), round(height*(384.0/900)));
    } else if (character_temp == 1) {
       image(image_character1, character_x-round(width*(100.0/1440)), character_y-round(height*(220.0/900)), round(width*(192.0/1440)), round(height*(384.0/900)));
    } else if (character_temp == 2) {
       image(image_character2, character_x-round(width*(100.0/1440)), character_y-round(height*(220.0/900)), round(width*(192.0/1440)), round(height*(384.0/900)));
    } else if (character_temp == 3) {
       image(image_character3, character_x-round(width*(100.0/1440)), character_y-round(height*(220.0/900)), round(width*(192.0/1440)), round(height*(384.0/900)));
    } else if (character_temp == 4) {
       image(image_character4, character_x-round(width*(100.0/1440)), character_y-round(height*(220.0/900)), round(width*(192.0/1440)), round(height*(384.0/900)));
    } else if (character_temp == 5) {
       image(image_character5, character_x-round(width*(100.0/1440)), character_y-round(height*(220.0/900)), round(width*(192.0/1440)), round(height*(384.0/900)));
    }
  }
  
  void levelMenu() {
    image(image_secondary_menu_background, 0, 0, width, height);
    
    year_locked = false;
    
    if (hitboxes) {
      fill(255, 0, 255); //pink
      rect(return_x-round(width*(130.0/1440)), return_y-round(height*(130.0/900)), round(width*(130.0/1440)), round(height*(130.0/900))); //hitbox of RETURN to menu button
      rect(play_x-round(width*(200.0/1440)), play_y-round(height*(240.0/900)), round(width*(400.0/1440)), round(height*(160.0/900))); //hitbox of PLAY button
    }
    
    //check if the mouse is over the RETURN option
    if (mouseX > return_x-round(width*(131.0/1440)) && mouseX < return_x && mouseY > return_y-round(height*(130.0/900)) && mouseY < return_y) {
      mouse_over_return = true;
      image(image_return_arrow_yellow, return_x-round(width*(130.0/1440)), return_y-round(height*(130.0/900)), round(width*(130.0/1440)), round(height*(130.0/900)));
    } else {
      mouse_over_return = false;
      image(image_return_arrow_red, return_x-round(width*(130.0/1440)), return_y-round(height*(130.0/900)), round(width*(130.0/1440)), round(height*(130.0/900)));
    }
    
    //check if the mouse if over the PLAY option
    if (mouseX > play_x-round(width*(205.0/1440)) && mouseX < play_x+round(width*(204.0/1440)) && mouseY > play_y-round(height*(245.0/900)) && mouseY < play_y-round(height*(75.0/900))) {
      mouse_over_play = true;
      image(image_tabS_yellow, play_x-round(width*(200.0/1440)), play_y-round(height*(240.0/900)), round(width*(400.0/1440)), round(height*(160.0/900)));
      fill(235, 15, 15); //red
    } else {
      mouse_over_play = false;
      image(image_tabS_red, play_x-round(width*(200.0/1440)), play_y-round(height*(240.0/900)), round(width*(400.0/1440)), round(height*(160.0/900)));
      fill(255, 200, 45); //yellow
    }
    textSize(round(width*(60.0/1440)*2));
    text("PLAY", play_x, play_y-round(height*(125.0/900)));
    
    if (!level_4) { //if you are not being displayed the last level you have the option to view the NEXT one
      if (hitboxes) {
        fill(255, 0, 255); //pink
        rect(next_level_x-round(width*(156.0/1440)), next_level_y-round(height*(130.0/900)), round(width*(130.0/1440)), round(height*(130.0/900))); //hitbox of NEXT LEVEL button
      }
      //check if the mouse if over the NEXT LEVEL option
      if (mouseX > next_level_x-round(width*(156.0/1440)) && mouseX < next_level_x-round(width*(26.0/1440)) && mouseY > next_level_y-round(height*(130.0/900)) && mouseY < next_level_y) {
        mouse_over_next_level = true;
        image(image_right_arrow_yellow, next_level_x-round(width*(155.0/1440)), next_level_y-round(height*(130.0/900)), round(width*(130.0/1440)), round(height*(130.0/900)));
      } else {
        mouse_over_next_level = false;
        image(image_right_arrow_red, next_level_x-round(width*(155.0/1440)), next_level_y-round(height*(130.0/900)), round(width*(130.0/1440)), round(height*(130.0/900)));
      }
    }
    
    if (!level_1) { //if you are not being displayed the first level you have the option to view the PREVIOUS one
      if (hitboxes) {
        fill(255, 0, 255); //pink
        rect(previous_level_x+round(width*(25.0/1440)), previous_level_y-round(height*(130.0/900)), round(width*(130.0/1440)), round(height*(130.0/900))); //hitbox of PREVIOUS LEVEL button
      }
      //check if the mouse if over the PREVIOUS LEVEL option
      if (mouseX > previous_level_x+round(width*(25.0/1440)) && mouseX < previous_level_x+round(width*(155.0/1440)) && mouseY > previous_level_y-round(height*(130.0/900)) && mouseY < previous_level_y) {
        mouse_over_previous_level = true;
        image(image_left_arrow_yellow, previous_level_x+round(width*(25.0/1440)), previous_level_y-round(height*(130.0/900)), round(width*(130.0/1440)), round(height*(130.0/900)));
      } else {
        mouse_over_previous_level = false;
        image(image_left_arrow_red, previous_level_x+round(width*(25.0/1440)), previous_level_y-round(height*(130.0/900)), round(width*(130.0/1440)), round(height*(130.0/900)));
      }
    }
    
    fill(255, 255, 255); //white
    textSize(round(width*(60.0/1440))); 
    if (level_1) {
      level = levels[0];
      mouse_over_previous_level = false;
      image(image_thumb1, round(width*(420.0/1440)), round(height*(100.0/900)), round(width*(600./1440)), round(height*(350.0/900)));
      text("1st year", width/2, height/2+round(height*(70.0/900)));
    } else if (level_2) {
      level = levels[1];
      text("2nd year", width/2, height/2+round(height*(70.0/900))); 
      if (game.courses_collected < 6) {
        image(image_thumb2_locked, round(width*(420.0/1440)), round(height*(100.0/900)), round(width*(600./1440)), round(height*(350.0/900)));
        textSize(round(width*(60.0/1440)*3/5));
        if (6 - game.courses_collected > 1) {
          text("You  need  to  pass  " + (6 - game.courses_collected) + "  more  courses  to  unlock  this  year !", round(width*(720.0/1440)), round(height*(600.0/900)));
        } else {
          text("You  need  to  pass  1  more  course  to  unlock  this  year !", round(width*(720.0/1440)), round(height*(600.0/900)));
        }
        year_locked = true;
      } else {
        image(image_thumb2, round(width*(420.0/1440)), round(height*(100.0/900)), round(width*(600./1440)), round(height*(350.0/900)));
      }
    } else if (level_3) {
      level = levels[2];
      text("3rd year", width/2, height/2+round(height*(70.0/900)));
      if (game.courses_collected < 12) {
        image(image_thumb3_locked, round(width*(420.0/1440)), round(height*(100.0/900)), round(width*(600./1440)), round(height*(350.0/900)));
        textSize(round(width*(60.0/1440)*3/5));
        if (12 - game.courses_collected > 1) {
          text("You  need  to  pass  " + (12 - game.courses_collected) + "  more  courses  to  unlock  this  year !", round(width*(720.0/1440)), round(height*(600.0/900)));
        } else {
          text("You  need  to  pass  1  more  course  to  unlock  this  year !", round(width*(720.0/1440)), round(height*(600.0/900)));
        }
        year_locked = true;
      } else {
        image(image_thumb3, round(width*(420.0/1440)), round(height*(100.0/900)), round(width*(600./1440)), round(height*(350.0/900)));
      }
    } else if (level_4) {
      level = levels[3];
      mouse_over_next_level = false;
      text("4th year", width/2, height/2+round(height*(70.0/900)));
      if (game.courses_collected < 18) {
        image(image_thumb4_locked, round(width*(420.0/1440)), round(height*(100.0/900)), round(width*(600./1440)), round(height*(350.0/900)));
        textSize(round(width*(60.0/1440)*3/5));
        if (18 - game.courses_collected > 1) {
          text("You  need  to  pass  " + (18 - game.courses_collected) + "  more  courses  to  unlock  this  year !", round(width*(720.0/1440)), round(height*(600.0/900)));
        } else {
          text("You  need  to  pass  1  more  course  to  unlock  this  year !", round(width*(720.0/1440)), round(height*(600.0/900)));
        }
        year_locked = true;
      } else {
        image(image_thumb4, round(width*(420.0/1440)), round(height*(100.0/900)), round(width*(600./1440)), round(height*(350.0/900)));
      }
    }
    if (!year_locked) {
      if (level.courses_collected < level.courses.length) {
        textSize(round(width*(60.0/1440)*3/4));
        text(level.courses.length - level.courses_collected + "  courses  left  to  pass !", round(width*(720./1440)), round(height*(600.0/900)));  
      } else {
        textSize(round(width*(60.0/1440)*3/5));
        text("You  have  passed  all  the  courses  from  this  year !", round(width*(720./1440)), round(height*(595.0/900)));
      }
    }
    
    image(image_course, round(width*(58.0/1440)), round(height*(188.0/900)), round(width*(32.0/1440)), round(height*(32.0/900)));
    fill(220, 220, 220); //light grey
    textSize(round(width*(60.0/1440)*0.4));
    text("X", round(width*(106.0/1440)), round(height*(213.0/900)));
    fill(255, 215, 0); //gold
    textSize(round(width*(60.0/1440)*3/4));
    textAlign(LEFT);
    text(game.courses_collected, round(width*(122.0/1440)), round(height*(218.0/900)));
    
    displayCharacter();
    
    textAlign(CENTER);
  }
  
  void settingsMenu() {
    image(image_secondary_menu_background, 0, 0, width, height);
    
    textAlign(LEFT);
    
    if (hitboxes) {
      fill(255, 0, 255); //pink
      rect(return_x-round(width*(131.0/1440)), return_y-round(height*(130.0/900)), round(width*(130.0/1440)), round(height*(130.0/900))); //hitbox of RETURN to menu button
      rect(round(width*(20.0/1440)), round(height*(20.0/900)), round(width*(50.0/1440)), round(height*(50.0/900))); //hitbox of DISPLAY FPS button
      rect(round(width*(20.0/1440)), round(height*(80.0/900)), round(width*(50.0/1440)), round(height*(50.0/900))); //hitbox of DISPLAY HITBOXES button
      rect(round(width*(20.0/1440)), round(height*(140.0/900)), round(width*(50.0/1440)), round(height*(50.0/900))); //hitbox of DISPLAY COORDINATES button
      rect(master_volume_x, master_volume_up_y, round(width*(65.0/1440)), round(height*(33.0/900))); //hitbox of MASTER VOLUME UP button
      rect(master_volume_x, master_volume_down_y, round(width*(65.0/1440)), round(height*(33.0/900))); //hitbox of MASTER VOLUME DOWN button
      rect(music_volume_x, music_volume_up_y, round(width*(65.0/1440)), round(height*(33.0/900))); //hitbox of MUSIC VOLUME UP button
      rect(music_volume_x, music_volume_down_y, round(width*(65.0/1440)), round(height*(33.0/900))); //hitbox of MUSIC VOLUME DOWN button
      rect(sfx_volume_x, sfx_volume_up_y, round(width*(65.0/1440)), round(height*(33.0/900))); //hitbox of SFX VOLUME UP button
      rect(sfx_volume_x, sfx_volume_down_y, round(width*(65.0/1440)), round(height*(33.0/900))); //hitbox of SFX VOLUME DOWN button
    }
    
    //check if the mouse is over the RETURN option
    if (mouseX > return_x-round(width*(131.0/1440)) && mouseX < return_x && mouseY > return_y-round(height*(130.0/900)) && mouseY < return_y) {
      mouse_over_return = true;
      image(image_return_arrow_yellow, return_x-round(width*(130.0/1440)), return_y-round(height*(130.0/900)), round(width*(130.0/1440)), round(height*(130.0/900)));
    } else {
      mouse_over_return = false;
      image(image_return_arrow_red, return_x-round(width*(130.0/1440)), return_y-round(height*(130.0/900)), round(width*(130.0/1440)), round(height*(130.0/900)));
    }
    
    //check if mouse is over DISPLAY FPS option
    if (mouseX > round(width*(20.0/1440)) && mouseX < round(width*(70.0/1440)) && mouseY > round(height*(20.0/900)) && mouseY < round(height*(70.0/900))) {
      mouse_over_display_fps = true;
    } else {
      mouse_over_display_fps = false;
    }
    
    //check if mouse is over DISPLAY HITBOXES option
    if (mouseX > round(width*(20.0/1440)) && mouseX < round(width*(70.0/1440)) && mouseY > round(height*(80.0/900)) && mouseY < round(height*(130.0/900))) {
      mouse_over_display_hitboxes = true;
    } else {
      mouse_over_display_hitboxes = false;
    }
    
    //check if mouse is over DISPLAY COORDINATES option
    if (mouseX > round(width*(20.0/1440)) && mouseX < round(width*(70.0/1440)) && mouseY > round(height*(140.0/900)) && mouseY < round(height*(190.0/900))) {
      mouse_over_display_coordinates = true;
    } else {
      mouse_over_display_coordinates = false;
    }
    
    //check if mouse is over MASTER VOLUME UP option
    if (mouseX > master_volume_x && mouseX < master_volume_x+round(width*(65.0/1440)) && mouseY > master_volume_up_y && mouseY < master_volume_up_y+round(height*(33.0/900))) {
      mouse_over_master_volume_up = true;
    } else {
      mouse_over_master_volume_up = false;
    }
    
    //check if mouse is over MASTER VOLUME DOWN option
    if (mouseX > master_volume_x && mouseX < master_volume_x+round(width*(65.0/1440)) && mouseY > master_volume_down_y && mouseY < master_volume_down_y+round(height*(33.0/900))) {
      mouse_over_master_volume_down = true;
    } else {
      mouse_over_master_volume_down = false;
    }
    
    //check if mouse is over MUSIC VOLUME UP option
    if (mouseX > music_volume_x && mouseX < music_volume_x+round(width*(65.0/1440)) && mouseY > music_volume_up_y && mouseY < music_volume_up_y+round(height*(33.0/900))) {
      mouse_over_music_volume_up = true;
    } else {
      mouse_over_music_volume_up = false;
    }
    
    //check if mouse is over MUSIC VOLUME DOWN option
    if (mouseX > music_volume_x && mouseX < music_volume_x+round(width*(65.0/1440)) && mouseY > music_volume_down_y && mouseY < music_volume_down_y+round(height*(33.0/900))) {
      mouse_over_music_volume_down = true;
    } else {
      mouse_over_music_volume_down = false;
    }
    
    //check if mouse is over SFX VOLUME UP option
    if (mouseX > sfx_volume_x && mouseX < sfx_volume_x+round(width*(65.0/1440)) && mouseY > sfx_volume_up_y && mouseY < sfx_volume_up_y+round(height*(33.0/900))) {
      mouse_over_sfx_volume_up = true;
    } else {
      mouse_over_sfx_volume_up = false;
    }
    
    //check if mouse is over SFX VOLUME DOWN option
    if (mouseX > sfx_volume_x && mouseX < sfx_volume_x+round(width*(65.0/1440)) && mouseY > sfx_volume_down_y && mouseY < sfx_volume_down_y+round(height*(33.0/900))) {
      mouse_over_sfx_volume_down = true;
    } else {
      mouse_over_sfx_volume_down = false;
    }
    
    fill(255, 255, 255); //white
    textSize(round(width*(60.0/1440)*0.8));
    
    if (!fps) {
      image(image_tab_black, round(width*(25.0/1440)), round(height*(25.0/900)), round(width*(40.0/1440)), round(height*(40.0/900)));
    } else {
      image(image_tab_white, round(width*(25.0/1440)), round(height*(25.0/900)), round(width*(40.0/1440)), round(height*(40.0/900)));
    }
    text("display  fps", round(width*(80.0/1440)), round(height*(60.0/900)));
    
    if (!hitboxes) {
      image(image_tab_black, round(width*(25.0/1440)), round(height*(85.0/900)), round(width*(40.0/1440)), round(height*(40.0/900)));
    } else {
      image(image_tab_white, round(width*(25.0/1440)), round(height*(85.0/900)), round(width*(40.0/1440)), round(height*(40.0/900)));
    }
    text("display  hitboxes", round(width*(80.0/1440)), round(height*(120.0/900)));
    
    if (!coordinates) {
      image(image_tab_black, round(width*(25.0/1440)), round(height*(145.0/900)), round(width*(40.0/1440)), round(height*(40.0/900)));
    } else {
      image(image_tab_white, round(width*(25.0/1440)), round(height*(145.0/900)), round(width*(40.0/1440)), round(height*(40.0/900)));
    }
    text("display  coordinates", round(width*(80.0/1440)), round(height*(180.0/900)));
    
    image(image_up_arrowC, master_volume_x, master_volume_up_y, round(width*(65.0/1440)), round(height*(33.0/900)));
    image(image_down_arrowC, master_volume_x, master_volume_down_y, round(width*(65.0/1440)), round(height*(33.0/900)));
    fill(255);
    text("master", master_x, master_y+round(height*(120.0/900)));
    fill(0);
    text(master_volume, master_volume_x+round(width*(17.0/1440)), master_y+round(height*(120.0/900)));
    
    image(image_up_arrowC, music_volume_x, music_volume_up_y, round(width*(65.0/1440)), round(height*(33.0/900)));
    image(image_down_arrowC, music_volume_x, music_volume_down_y, round(width*(65.0/1440)), round(height*(33.0/900)));
    fill(255);
    text("music", music_x, music_y+round(height*(120.0/900)));
    fill(0);
    text(music_volume, music_volume_x+round(width*(17.0/1440)), music_y+round(height*(120.0/900)));
    
    image(image_up_arrowC, sfx_volume_x, sfx_volume_up_y, round(width*(65.0/1440)), round(height*(33.0/900)));
    image(image_down_arrowC, sfx_volume_x, sfx_volume_down_y, round(width*(65.0/1440)), round(height*(33.0/900)));
    fill(255);
    text("sfx", sfx_x, sfx_y+round(height*(120.0/900)));
    fill(0);
    text(sfx_volume, sfx_volume_x+round(width*(17.0/1440)), sfx_y+round(height*(120.0/900)));
    
    textAlign(CENTER);
  }
  
  void displayCharacter() {
    if (character_selected) {
      if (hitboxes) {
        fill(255, 0, 255); //pink
        rect(round(width*(35.0/1440)), round(height*(35.0/900)), round(width*(144.0/1440)), round(height*(144.0/900)));
      }
      
      if (mouseX > round(width*(35.0/1440)) && mouseX < round(width*(179.0/1440)) && mouseY > round(height*(35.0/900)) && mouseY < round(height*(179.0/900))) {
        image(image_tab_blue2, round(width*(40.0/1440)), round(height*(40.0/900)), round(width*(134.0/1440)), round(height*(134.0/900)));
        mouse_over_displayed_character = true;
      } else {
        image(image_tab_blue1, round(width*(40.0/1440)), round(height*(40.0/900)), round(width*(134.0/1440)), round(height*(134.0/900)));
        mouse_over_displayed_character = false;
      }
      
      //display character on tab
      if (character == 0) {
        image(image_character0, round(width*(76.0/1440)), round(height*(32.0/900)), round(width*(64.0/1440)), round(height*(128.0/900)));
      } else if (character == 1) {
        image(image_character1, round(width*(76.0/1440)), round(height*(32.0/900)), round(width*(64.0/1440)), round(height*(128.0/900)));
      } else if (character == 2) {
        image(image_character2, round(width*(76.0/1440)), round(height*(32.0/900)), round(width*(64.0/1440)), round(height*(128.0/900)));
      } else if (character == 3) {
        image(image_character3, round(width*(76.0/1440)), round(height*(32.0/900)), round(width*(64.0/1440)), round(height*(128.0/900)));
      } else if (character == 4) {
        image(image_character4, round(width*(76.0/1440)), round(height*(32.0/900)), round(width*(64.0/1440)), round(height*(128.0/900)));
      } else if (character == 5) {
        image(image_character5, round(width*(76.0/1440)), round(height*(32.0/900)), round(width*(64.0/1440)), round(height*(128.0/900)));
      }
    }
  }
  
  void startGame() {
    transition_counter = 0;
    player = new Player(characters[character]); 
  }
  
  void levelReset() {
    level_1 = false;
    level_2 = false;
    level_3 = false;
    level_4 = false;
  }
  
  void creditsMenu() {
    image(image_secondary_menu_background, 0, 0, width, height);
    degree.draw();
    
    //check if the mouse is over the RETURN option
    if (mouseX > return_x-round(width*(131.0/1440)) && mouseX < return_x && mouseY > return_y-round(height*(130.0/900)) && mouseY < return_y) {
      mouse_over_return = true;
      image(image_return_arrow_yellow, return_x-round(width*(130.0/1440)), return_y-round(height*(130.0/900)), round(width*(130.0/1440)), round(height*(130.0/900)));
    } else {
      mouse_over_return = false;
      image(image_return_arrow_red, return_x-round(width*(130.0/1440)), return_y-round(height*(130.0/900)), round(width*(130.0/1440)), round(height*(130.0/900)));
    }
    
    fill(255, 215, 0); //gold
    textAlign(CENTER);
    
    textSize(round(width*(60.0/1440)));
    text("CONGRATULATIONS    FOR    GRADUATING", width/2, round(height*(120.0/900)));
    
    textSize(round(width*(60.0/1440)*2/3));
    text("GRADUATION    CERTIFICATE", width/2, height/2-round(height*(80.0/900)));
    
    fill(0);
    textSize(round(width*(60.0/1440)));
    text("THANKS   FOR   PLAYING   OUR   GAME", width/2, height/2+round(height*(120.0/900)));
    textSize(round(width*(60.0/1440)*3/4));
    text("NICK    CHRISTODOULOU", width/2, height/2+round(height*(200.0/900)));
    text("THANOS    GEORGAKAKIS", width/2, height/2+round(height*(250.0/900)));
  }
  
  void displayFps() {
    //display FPS
    if (fps) {
      textAlign(CENTER);
      fill(0, 255, 0); //green
      textSize(round(width*(60.0/1440)*0.8));
      text(frameRate, width+round(width*(20.0/1440)), round(height*(30.0/900))); 
    }
  }

  void displayCoordinates() {
    //display COORDINATES
    if (coordinates && !on_menu) {
      textAlign(LEFT);
      fill(0); //black
      textSize(round(width*(60.0/1440)*0.8));
      text("x ", round(width*(30.0/1440)), round(height*(40.0/900)));
      text(int((player.x-width*(8.0/1440))/step), round(width*(90.0/1440)), round(height*(40.0/900)));
      text("y ", round(width*(30.0/1440)), round(height*(80.0/900)));
      text(int((-player.y+height*(644.0/900))*(900.0/height)), round(width*(90.0/1440)), round(height*(80.0/900)));
      textAlign(CENTER);
    }
  }
};
