import processing.sound.*; //<>//

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
  menu = new Menu();
  game = new Game();
  
  sound = new SoundFile(this, sketchPath() + "/music/Menu.wav");
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
}

void keyPressed() {
  if (!on_menu) game.keyPressed();
}

void keyReleased() {
  if (!on_menu) game.keyReleased();
}
