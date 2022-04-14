import java.lang.*;
import javax.sound.sampled.AudioInputStream;
import javax.sound.sampled.AudioSystem;
import javax.sound.sampled.Clip;
import javax.sound.sampled.FloatControl;

//music stuff
AudioInputStream audioInput ;
int track_num;
Clip music;
Clip sfx;
FloatControl musicVolume;
FloatControl sfxVolume;
long musicFrame;
File tracks[];
File sounds[];
boolean mute;
boolean noMusic;
boolean noSFX;

//basic stuff
Level[] levels;
Game game;
Menu menu;
Player player;
Level level;

int splashscreen_counter;
int transition_counter;
int flag_counter;

boolean on_menu;
PFont myFont;
PImage splashscreen;
PImage transition_screen; //just plain dark
PImage flag[]; //12 flag animations
float step;

void setup() {
  
  fullScreen(FX2D);
  //size(1440, 900, FX2D);
  //size(1366, 768, FX2D);
  //size(800, 600, FX2D);
  
  
  try {
    
    PImage icon = loadImage(sketchPath() + "/images/objects/course.png");
    surface.setIcon(icon);
    surface.setCursor(loadImage(sketchPath() + "/images/miscellaneous/cursor/cursor.png"), 9, 3);
    surface.setTitle("Path of Stress");
    
    step = width/180.0; //the step size in pixels the player will make
    
    tracks = new File[5];
    tracks[0] = new File(sketchPath() + "/music/menu.wav");
    tracks[1] = new File(sketchPath() + "/music/1st_year.wav");
    tracks[2] = new File(sketchPath() + "/music/2nd_year.wav");
    tracks[3] = new File(sketchPath() + "/music/3rd_year.wav");
    tracks[4] = new File(sketchPath() + "/music/4th_year.wav");
    
    sounds = new File[11];
    sounds[0] = new File(sketchPath() + "/sounds/back.wav");
    sounds[1] = new File(sketchPath() + "/sounds/collect.wav");
    sounds[2] = new File(sketchPath() + "/sounds/front.wav");
    sounds[3] = new File(sketchPath() + "/sounds/in.wav");
    sounds[4] = new File(sketchPath() + "/sounds/jump.wav");
    sounds[5] = new File(sketchPath() + "/sounds/left.wav");
    sounds[6] = new File(sketchPath() + "/sounds/lose.wav");
    sounds[7] = new File(sketchPath() + "/sounds/out.wav");
    sounds[8] = new File(sketchPath() + "/sounds/right.wav");
    sounds[9] = new File(sketchPath() + "/sounds/step1.wav");
    sounds[10] = new File(sketchPath() + "/sounds/win.wav");
    
    audioInput = AudioSystem.getAudioInputStream(tracks[0]);
    track_num = 0;
    music = AudioSystem.getClip();
    music.open(audioInput);
    mute = false; //game is not on mute
    noMusic = false; //music is not on mute
    noSFX = false; //sound effects are not on mute
    
    musicFrame = 0;
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
    
    splashscreen = loadImage(sketchPath() + "/images/backgrounds/splashscreen.png");
    splashscreen_counter = -1;
    transition_screen = loadImage(sketchPath() + "/images/backgrounds/transition.png");
    transition_counter = -1;
    
    playMusic();
    
  }
  catch (Exception e) {
    e.printStackTrace();
  }
  
}

void draw() {
  
  try {
    
    if (splashscreen_counter < 350) {
      image(splashscreen, 0, 0, width, height);
      splashscreen_counter++;
    }
    else {
      if ((music.getMicrosecondPosition() >= (music.getMicrosecondLength()-50000))) {
        if (track_num == 1) {
          music.setMicrosecondPosition(14780000);
        }
        else if (track_num == 4) {
          music.setMicrosecondPosition(2660000);
        }
        else {
          music.setMicrosecondPosition(0);
        }
      }
      
      if (!music.isActive() && !game.pause && transition_counter == -1) {
        if (!mute && !noMusic) {
          musicVolume = (FloatControl) music.getControl(FloatControl.Type.MASTER_GAIN);
          musicVolume.setValue(1.2*(menu.music_volume+menu.master_volume-16));
          music.start();
        }
        else {
          musicVolume = (FloatControl) music.getControl(FloatControl.Type.MASTER_GAIN);
          musicVolume.setValue(-80);
          music.start();
        }
      }
      
      if (on_menu) menu.draw();
      else game.draw();
      
      if (transition_counter != -1) transitionAnimation();
    }
  }
  catch (Exception e) {
    e.printStackTrace();
  } 
}

void transitionAnimation() {
  
  try {
    
    if (transition_counter == 0) {
      music.stop();
      if (on_menu) {
        audioInput = AudioSystem.getAudioInputStream(sounds[3]);
        sfx = AudioSystem.getClip();
        sfx.open(audioInput);
        sfxVolume = (FloatControl) sfx.getControl(FloatControl.Type.MASTER_GAIN);
        sfxVolume.setValue(1.2*(menu.sfx_volume+menu.master_volume-16));
        if (!noSFX && !mute) sfx.start();
        level.makeTemp();
      }
      else {
        if (game.courses_collected == 36 && !menu.credits_shown) {
          audioInput = AudioSystem.getAudioInputStream(sounds[10]);
          sfx = AudioSystem.getClip();
          sfx.open(audioInput);
          sfxVolume = (FloatControl) sfx.getControl(FloatControl.Type.MASTER_GAIN);
          sfxVolume.setValue(1.2*(menu.sfx_volume+menu.master_volume-16));
          if (!noSFX && !mute) sfx.start();
        } 
        else {
          audioInput = AudioSystem.getAudioInputStream(sounds[7]);
          sfx = AudioSystem.getClip();
          sfx.open(audioInput);
          sfxVolume = (FloatControl) sfx.getControl(FloatControl.Type.MASTER_GAIN);
          sfxVolume.setValue(1.2*(menu.sfx_volume+menu.master_volume-16));
          if (!noSFX && !mute) sfx.start();
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
  catch (Exception e) {
    e.printStackTrace();
  }
}

void playMusic() {
  
  try {
    
    if (on_menu) {
      audioInput = AudioSystem.getAudioInputStream(tracks[0]);
      music = AudioSystem.getClip();
      music.open(audioInput);
      track_num = 0;
    }
    else {
      audioInput = AudioSystem.getAudioInputStream(level.track);
      music = AudioSystem.getClip();
      music.open(audioInput);
      track_num = level.year;
    }
  }
  catch (Exception e) {
    e.printStackTrace();
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
