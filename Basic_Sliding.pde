PImage homescreen;
PImage player;
PImage idle;
PImage walk1, walk2, walk3, mid1, walk4, walk5, walk6, mid2;
int x;
int y = 123;
boolean jump = false;
int counter = -1; //10 frames of animation
int walk = -1; //80 frames of animation
int input = 0;
boolean allow = true;
boolean noano = true;
boolean lastaction = true; //true for right, false for left
boolean left = false; //face left

void setup(){
  homescreen = loadImage("C:/Users/nickc/Desktop/unnamed.jpg");
  idle = loadImage("C:/Users/nickc/Desktop/male.png");
  walk1 = loadImage("C:/Users/nickc/Desktop/walk1.png");
  walk2 = loadImage("C:/Users/nickc/Desktop/walk2.png");
  walk3 = loadImage("C:/Users/nickc/Desktop/walk3.png");
  mid1 = loadImage("C:/Users/nickc/Desktop/mid1.png");
  walk4 = loadImage("C:/Users/nickc/Desktop/walk4.png");
  walk5 = loadImage("C:/Users/nickc/Desktop/walk5.png");
  walk6 = loadImage("C:/Users/nickc/Desktop/walk6.png");
  mid2 = loadImage("C:/Users/nickc/Desktop/mid2.png");
  //player.resize(64, 128);
  size(1000, 1000);
  noSmooth();
}

void draw() {
  image(homescreen, x, 0);
  image(homescreen, x+homescreen.width, 0);
  image(homescreen, x-homescreen.width, 0);
  background(60);
  
  x += input;
  
  
  
  if (counter == -1) y +=10; //gravity. If the jumping animation is not running, apply gravity
  else y+= jump();
  if (y >=  385) y=384;
  if (x<=0) x=1;
  if (x>=901) x=900;
  
  if (walk == -1) player = idle; //load the default image of the player
  else player = walk();
  pushMatrix();
  if (left) {scale(-1,1); image(player, -x - 64, y, 64, 128); } else
  image(player, x, y, 64, 128);
  popMatrix();
  System.out.println(x);
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == RIGHT) {
      input = 8;
      if (noano) {
        walk = 1;
        noano = false;
        left = false;
        lastaction = true;
      }
    }
    if (keyCode == LEFT) {
      input = -8;
      if (noano) {
        walk = 1;
        noano = false;
        if (lastaction) {left = true; lastaction = false;}
      }
    }
    if (keyCode == UP) {
      //if we are on the ground, jump
      if (y == 384 && allow) counter = 10;
      allow = false;
    }
  }
}

void keyReleased() {
  if (key == CODED) {
    if (keyCode == RIGHT) {
      input = 0;
      walk = -1;
      noano = true;
    }
    if (keyCode == LEFT) {
      input = 0;
      walk = -1;
      noano = true;
    }
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

private PImage walk() {
  
  PImage result = walk1;
  if (walk <= 5) result = walk1;
  else if(walk <= 10) result = walk2;
  else if(walk <= 15) result = walk3;
  else if(walk <= 20) result = mid1;
  else if(walk <= 25) result = walk4;
  else if(walk <= 30) result = walk5;
  else if(walk <= 35) result = walk6;
  else if(walk <= 40) result = mid2;
  
  walk++;
  if (walk == 41) walk = 1;
  return result;
}
