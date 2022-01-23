import processing.sound.*;
import java.lang.*;

//variable used for the intro and main of the 1st and 4th year songs
boolean intro;

SoundFile music;
SoundFile tracks[];
SoundFile sounds[];
Level[] levels;
Game game;
Menu menu;
Player player;
Level level;

int transition_counter;
int flag_counter;

boolean on_menu;
PFont myFont;
PImage transition_screen; //just plain dark
PImage flag[]; //12 flag animations
float step;

void setup() {
  
  PImage icon = loadImage(sketchPath() + "/images/objects/course.png");
  surface.setIcon(icon);
  surface.setCursor(loadImage(sketchPath() + "/images/miscellaneous/cursor/cursor.png"), 9, 3);
  surface.setTitle("Path of Stress");
  fullScreen(FX2D);
  //size(1440, 900, FX2D);
  //size(1366, 768, FX2D);
  //size(800, 600, FX2D);
  
  step = width/180.0; //the step size in pixels the player will make
  
  tracks = new SoundFile[7];
  tracks[0] = new SoundFile(this, sketchPath() + "/music/menu.wav");
  tracks[1] = new SoundFile(this, sketchPath() + "/music/1st_year_intro.wav");
  tracks[2] = new SoundFile(this, sketchPath() + "/music/2nd_year.wav");
  tracks[3] = new SoundFile(this, sketchPath() + "/music/3rd_year.wav");
  tracks[4] = new SoundFile(this, sketchPath() + "/music/4th_year_intro.wav");
  tracks[5] = new SoundFile(this, sketchPath() + "/music/1st_year_main.wav");
  tracks[6] = new SoundFile(this, sketchPath() + "/music/4th_year_main.wav");
  
  sounds = new SoundFile[11];
  sounds[0] = new SoundFile(this, sketchPath() + "/sounds/back.wav");
  sounds[1] = new SoundFile(this, sketchPath() + "/sounds/collect.wav");
  sounds[2] = new SoundFile(this, sketchPath() + "/sounds/front.wav");
  sounds[3] = new SoundFile(this, sketchPath() + "/sounds/in.wav");
  sounds[4] = new SoundFile(this, sketchPath() + "/sounds/jump.wav");
  sounds[5] = new SoundFile(this, sketchPath() + "/sounds/left.wav");
  sounds[6] = new SoundFile(this, sketchPath() + "/sounds/lose.wav");
  sounds[7] = new SoundFile(this, sketchPath() + "/sounds/out.wav");
  sounds[8] = new SoundFile(this, sketchPath() + "/sounds/right.wav");
  sounds[9] = new SoundFile(this, sketchPath() + "/sounds/step1.wav");
  sounds[10] = new SoundFile(this, sketchPath() + "/sounds/win.wav");
  
  music = tracks[0];
  
  myFont = createFont(sketchPath() + "/font/ARCADECLASSIC.TTF", 128);
  
  levels = new Level[4];
  for (int i = 0; i < 4; i++) levels[i] = new Level(i+1);
  
  flag_counter = 0;
  flag = new PImage[12];
  for (int i = 0; i <12; i++) {
      flag[i] = loadImage(sketchPath() + "/images/miscellaneous/flag/flag" + i + ".png");
  }
  
  menu = new Menu();
  game = new Game();
  
  textFont(myFont);
  textAlign(CENTER);
  on_menu = true;
  
  transition_screen = loadImage(sketchPath() + "/images/backgrounds/transition.png");
  transition_counter = -1;
  
  playMusic();
  
}

void draw() {
  if (on_menu) menu.draw();
  else game.draw();
 
  if (intro && !game.pause) manageIntros();
  
  //if the game gets paused, we have to execute music.loop again, otherwise the music will stop playing after it finishes
  if (!intro && !music.isPlaying() && !game.pause && transition_counter == -1) music.loop();
  
  if (transition_counter != -1) transitionAnimation();
  
}

void transitionAnimation() {
  
  if (transition_counter == 0) {
    music.stop();
    if (on_menu) {
      sounds[3].amp(menu.volume * menu.sfx_volume * (menu.master_volume/10.0));
      sounds[3].play();
      level.makeTemp();
    }
    else {
      if (game.courses_collected == 36 && !menu.credits_shown) {
        sounds[10].amp(menu.volume * menu.sfx_volume * (menu.master_volume/10.0));
        sounds[10].play();
      } 
      else {
        sounds[7].amp(menu.volume * menu.sfx_volume * (menu.master_volume/10.0));
        sounds[7].play();
      }
    }
  }
  else if (transition_counter < 50) tint(255,transition_counter*10);
  else if (transition_counter == 50) 
    if (on_menu) on_menu = false;
    else {
      on_menu = true;
      player.x = 128;
      level.reset();
    }
  else if (transition_counter < 100) tint(255,260-((transition_counter-50)*10));
  
  transition_counter++;

  if (game.courses_collected == 36 && !menu.credits_shown) {
    if (transition_counter == 200) {
      playMusic();
      transition_counter = -1; 
    }
  } else {
    if (transition_counter == 100) {
      playMusic();
      transition_counter = -1; 
    }
  }
  
  if (transition_counter > 1 && transition_counter < 100) image(transition_screen, 0, 0, width, height);
  noTint();
}

void playMusic() {
  
  music.jump(0);
  music.stop();
  if (on_menu) music = tracks[0];
  else music = level.music;
  
  if (music == tracks[1]) {
    music.amp(menu.volume * menu.music_volume * (menu.master_volume/10.0));
    music.play();
    intro = true;
  }
  else if (music == tracks[4]) {
    music.amp(menu.volume * menu.music_volume * (menu.master_volume/10.0));
    music.play();
    intro = true;
  }
  else {
    intro = false;
    music.amp(menu.volume * menu.music_volume * (menu.master_volume/10.0));
    music.loop();
  }
  
}

void manageIntros() {
  
  if (!music.isPlaying()) {
    music.jump(0);
    music.stop();
    intro = false; //don't come in this funciton again
    if (music == tracks[1]) music = tracks[5];
    else music = tracks[6];
    music.amp(menu.volume * menu.music_volume * (menu.master_volume/10.0));
    music.loop();
  }
  
}

void mousePressed() {
  if (transition_counter == -1 ) {
    if (on_menu) menu.mousePressed();
    else game.mousePressed();
  }
}

void keyPressed() {

  if (!on_menu && transition_counter == -1) game.keyPressed();
  else
    if (key == ESC) key = 0;
}

void keyReleased() {
  if (transition_counter == -1 ) {
    if (!on_menu) game.keyReleased();
  }
}
