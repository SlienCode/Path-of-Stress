
Player player;
Level level;
boolean free_right; //is the user holding the right arrow? if they aren't then it's free so -> true
boolean free_left; //is the user holding the left arrow? if they aren't then it's free so -> true
int x_motion; //how much the player should move on the x axis
int temp;

void setup(){
  size(1440, 900);
  noSmooth();
  level = new Level();
  player = new Player("male");
  free_right = true;
  free_left = true;
}

void draw() {
  
  background(60);
  temp = player.x;
  player.x += x_motion;
  level.draw();
  level.toggle(); //for dev mode
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
