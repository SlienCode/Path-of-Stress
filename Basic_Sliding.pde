PImage homescreen;
PImage player;
int x;
int y = 123;
boolean jump = false;
int counter = -1; //10 frames of animation
int input = 0;
boolean allow = true;

void setup(){
  homescreen = loadImage("C:/Users/nickc/Desktop/unnamed.jpg");
  player = loadImage("C:/Users/nickc/Desktop/male1.png");
  //player.resize(64, 128);
  size(512,512);
  noSmooth();
}

void draw() {
  image(homescreen, x, 0);
  image(homescreen, x+homescreen.width, 0);
  image(homescreen, x-homescreen.width, 0);
  
  x += input;
  System.out.println(input);
  
  
  
  if (counter == -1) y +=10; //gravity. If the jumping animation is not running, apply gravity
  else y+= jump();
  if (y >=  385) y=384;
  if (x==-512) x=0;
  if (x==512) x=0;
  image(player, -x, y, 64, 128);
  //System.out.println(y);
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == RIGHT)
      input = -8;
    if (keyCode == LEFT)
      input = +8;
    if (keyCode == UP) {
      if (y == 384 && allow) counter = 10; allow = false; //if we are on the ground, jump
    }
  }
}

void keyReleased() {
  if (key == CODED) {
    if (keyCode == RIGHT)
      input = 0;
    if (keyCode == LEFT)
      input = 0;
    if (keyCode == UP)
      allow = true;
  }
}

/*does a simple jump
depending on the value of "step", the player will
either go up (at the start of the jump) or go down
(when the jumping animation is almost done) */

private int jump() {
  
  int result = 0; //the movement that will take place in this frame
  if (counter >= 5) result = -5; //go up 5 pixels
  else if (counter >= 2) result = -2; //go up 2 pixels (slow down mode)
  else if (counter >= 1) result = -1; //go up just 1 pixel (almost done going up)
  else if (counter == 0) result = 3; //go down 3 pixels
  counter--; //removing one animaiton frame, go to the next step
  
  return result;
}
