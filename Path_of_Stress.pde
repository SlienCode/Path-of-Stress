import processing.sound.*;

PImage image;
SoundFile file;
Player player;
Level level;
boolean free_right; //is the user holding the right arrow? if they aren't then it's free so -> true
boolean free_left; //is the user holding the left arrow? if they aren't then it's free so -> true
int x_motion; //how much the player should move on the x axis
int temp;

void setup(){
  size(1440, 900);
  noSmooth();
  file = new SoundFile(this, "C:/Users/ATHGEO/Desktop/Path_of_Stress/music/menu.wav");
  file.amp(0.02);
  file.play();
  file.loop();
  level = new Level();
  player = new Player("male");
  free_right = true;
  free_left = true;
}

void draw() {
  image = loadImage("C:/Users/ATHGEO/Desktop/Path_of_Stress/images/screens/aueb_pixel14-8.png");
  //background(image);
  //image = loadImage("C:/Users/ATHGEO/Desktop/Path_of_Stress/images/screens/unnamed.jpg");
  image(image, 0, 0, 1440, 900);
  temp = player.x;
  
  //display fps
  fill(0, 255, 0);
  text(frameRate, width-63, 36);
  
  level.draw();
  level.toggle(); //draw object and course hitboxes
  
  player.draw();
  
}

//make it so that holding a button won't execute keyPressed continuously using free_right and free_left
void keyPressed() { 
  if (key == CODED) {
    if (keyCode == RIGHT && free_right) {
      x_motion = 8;
      player.walk_counter = 0;
      free_right = false;
      player.reverse = false; //don't flip the image, head to the right
    }
    else if (keyCode == LEFT && free_left) {
      x_motion = -8;
      player.walk_counter = 0;
      free_left = false;
      player.reverse = true; //flip the image, head to the left
    }
    if (keyCode == UP) {
      //if we are on the ground, jump
      if (player.onGround()) {
        player.jump_counter = 0;
      }
    }
  }
}

void keyReleased() {
  if (key == CODED) {
    if (keyCode == RIGHT) {
      if (free_left) { //if the user is not holding the left arrow, you can stop the animations
        x_motion = 0;
        player.walk_counter = -1;
      }
      free_right = true; //user let go of the right arrow
    }
    else if (keyCode == LEFT) {
      if (free_right) { //if the user is not holding the right arrow,you can stop the animations
        x_motion = 0;
        player.walk_counter = -1;
      }
      free_left = true; //user let go of the left arrow
    }
  }
}
