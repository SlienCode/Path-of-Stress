import processing.sound.*; //<>//

Level[] levels;
Game game;
Menu menu;
SoundFile sound;
Player player;
Level level;

boolean on_menu;
PFont myFont;

void setup() {
  size(1440, 900);
  noSmooth();
  
  levels = new Level[4];
  for (int i = 0; i < 4; i++) levels[i] = new Level(i+1);
  
  menu = new Menu();
  game = new Game();
  
  frameRate(60);
  sound = new SoundFile(this, sketchPath() + "/music/menu.wav");
  sound.amp(menu.volume);
  sound.play();
  sound.loop();
  myFont = createFont(sketchPath() + "/font/ARCADECLASSIC.TTF", 128);
  textFont(myFont);
  textAlign(CENTER);
  on_menu = true;
  
}

void draw() { 
 
   if (on_menu) {
     menu.draw(); 
   }
   else game.draw();
  
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
