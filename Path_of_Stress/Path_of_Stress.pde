Player player;
boolean free_right; //is the user holding the right arrow? if they aren't then it's free so -> true
boolean free_left; //is the user holding the left arrow? if they aren't then it's free so -> true
boolean block_right;
boolean block_left;
int x_motion; //how much the player should move on the x axis

void setup() {
  size(1440, 900);
  noSmooth();
  
  player = new Player("male");
  free_right = true;
  free_left = true;
  block_right = false;
  block_left = false;
}

void draw() {
  
  background(0);
  player.x += x_motion;
  player.draw();
  
  checkCollision();
}

//make it so that holding a button won't execute keyPressed continuously using free_right and free_left
void keyPressed() { 
  if (key == CODED) {
    if (keyCode == RIGHT && free_right) {
      if (block_right) {
        x_motion = 0;
        player.walk_counter = -1;
      } else {
        x_motion = 8;
        player.walk_counter = 0;
        free_right = false;
        player.reverse = false; //don't flip the image, head to the right
      }
    }
    else if (keyCode == LEFT && free_left) {
      if (block_left) {
        x_motion = 0;
        player.walk_counter = -1;
      } else {
        x_motion = -8;
        player.walk_counter = 0;
        free_left = false;
        player.reverse = true; //flip the image, head to the left
      }
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

//check if player collides with objects
void checkCollision() {
  
  if (player.x>500-128 && player.x<=508-128 && player.y>544 && player.y<=644) {
      block_right = true;
      player.x = 500-128;
    } else {
      block_right = false;
    }
    
    if (player.x>=592 && player.x<600 && player.y>544 && player.y<=644) {
      block_left = true;
      player.x = 600;
    } else {
      block_left = false;
    }
    
    if (player.x>508-128 && player.x<592) {
      if (player.y > 544-9) {
        player.y = 544-9;
      }
    }
  
}
