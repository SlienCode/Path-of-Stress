import processing.sound.*; //<>//

//variable used for the intro and main of the 1st and 4th year songs
boolean intro;

AudioSample music;
AudioSample tracks[];
Level[] levels;
Game game;
Menu menu;
Player player;
Level level;

boolean on_menu;
PFont myFont;

void setup() {
  
  size(1440, 900);
  noSmooth();
  
  tracks = new SoundFile[7];
  tracks[0] = new SoundFile(this, sketchPath() + "/music/menu.wav");
  tracks[1] = new SoundFile(this, sketchPath() + "/music/1st_year_intro.wav");
  tracks[2] = new SoundFile(this, sketchPath() + "/music/2nd_year.wav");
  tracks[3] = new SoundFile(this, sketchPath() + "/music/3rd_year.wav");
  tracks[4] = new SoundFile(this, sketchPath() + "/music/4th_year_intro.wav");
  tracks[5] = new SoundFile(this, sketchPath() + "/music/1st_year_main.wav");
  tracks[6] = new SoundFile(this, sketchPath() + "/music/4th_year_main.wav");
  
  music = tracks[0];
  
  myFont = createFont(sketchPath() + "/font/ARCADECLASSIC.TTF", 128);
  
  levels = new Level[4];
  for (int i = 0; i < 4; i++) levels[i] = new Level(i+1);
  
  menu = new Menu();
  game = new Game();
  
  frameRate(60);
  
  textFont(myFont);
  textAlign(CENTER);
  on_menu = true;
  
  playMusic();
  
}

void draw() { 
  
  if (intro && !game.pause) manageIntros();
  
  if (on_menu) {
    menu.draw(); 
  }
  else game.draw();
  
}

void playMusic() {
  
  music.jump(0);
  music.stop();
  if (on_menu) music = tracks[0];
  else music = level.music;
  
  if (music == tracks[1]) {
    music.amp(menu.volume);
    music.play();
    intro = true;
  }
  else if (music == tracks[4]) {
    music.amp(menu.volume);
    music.play();
    intro = true;
  }
  else {
    intro = false;
    music.amp(menu.volume);
    music.loop();
    
  }
  
}

void manageIntros() {
  
  if (!music.isPlaying()) {
    
    intro = false; //don't come in this funciton again
    if (music == tracks[1]) music = tracks[5];
    else music = tracks[6];
    music.amp(menu.volume);
    music.loop();
  }
  
}

void mousePressed() {
  if (on_menu) menu.mousePressed();
  else game.mousePressed();
}

void keyPressed() {
  if (!on_menu) game.keyPressed();
  else {
    if (key == ESC) key = 0;
  }
}

void keyReleased() {
  if (!on_menu) game.keyReleased();
}
