import java.awt.*;

class Course {
  //coordinates
  float x;
  float y;
  
  //depending on window size, adjust floating animation
  float floating_div;
  
  //determins whether the player has passed this course or not
  boolean passed;
  
  //floating animation
  int floating_counter; //80 frames
  
  //image of the object
  PImage image;
  
  //hitboxes
  Rectangle hitbox;
  
  int courses_collected;
  
  Course(float x,float y) {
    this.x = x;
    this.y = y;
    
    passed = false;
    
    if (height >= 1080) floating_div = 3;
    else if (height >= 900) floating_div = 4;
    else if (height >= 768) floating_div = 5;
    else floating_div = 6;
    
    floating_counter = 0;
    
    image = loadImage(sketchPath() + "/images/objects/course.png");

    hitbox = new Rectangle((int)x, (int)y, round(width/22.5), round(height/14.04));
  }
  
  void floatingAnimation() {
    if ((floating_counter < 7.5) && (floating_counter % floating_div) == 0) y += 2;
    else if ((floating_counter < 22.5) && (floating_counter % floating_div == 0)) y += 1;
    else if ((floating_counter < 37.5) && (floating_counter % floating_div == 0)) y += 0;
    else if ((floating_counter < 52.5) && (floating_counter % floating_div == 0)) y += -1;
    else if ((floating_counter < 67.5) && (floating_counter % floating_div == 0)) y += -2;
    else if ((floating_counter < 82.5) && (floating_counter % floating_div == 0)) y += -1;
    else if ((floating_counter < 97.5) && (floating_counter % floating_div == 0)) y += 0;
    else if ((floating_counter < 112.5) && (floating_counter % floating_div == 0)) y += 1;
    else if ((floating_counter < 120) && (floating_counter % floating_div == 0)) y += 2;
    
    floating_counter++;
    if (floating_counter == 120) floating_counter = 0; //start the animation from scratch
  }
  
  void draw() {
    floatingAnimation();
    if (!passed) image(image, x, y, round(width/22.5), round(height/14.04));
    hitbox.setLocation((int)x, (int)y);
  }
  
  void toggle() {
    if (!passed) rect(x, y, round(width/22.5), round(height/14.04));
  }
  
};
