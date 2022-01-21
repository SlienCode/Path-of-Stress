import java.awt.*;

class Course {
  //coordinates
  float x;
  float y;
  
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
    
    floating_counter = 0;
    
    image = loadImage(sketchPath() + "/images/objects/course.png");

    hitbox = new Rectangle((int)x, (int)y, round(width/22.5), round(height/14.04));
  }
  
  void floatingAnimation() {
    if ((floating_counter < 5) && (floating_counter % 2 == 0))  y += 2;
    else if ((floating_counter < 15) && (floating_counter % 2 == 0)) y += 1;
    else if ((floating_counter < 25) && (floating_counter % 2 == 0))  y += 0;
    else if ((floating_counter < 35) && (floating_counter % 2 == 0))  y += -1;
    else if ((floating_counter < 45) && (floating_counter % 2 == 0))  y += -2;
    else if ((floating_counter < 55) && (floating_counter % 2 == 0)) y += -1;
    else if ((floating_counter < 65) && (floating_counter % 2 == 0)) y += 0;
    else if ((floating_counter < 75) && (floating_counter % 2 == 0)) y += 1;
    else if ((floating_counter < 80) && (floating_counter % 2 == 0)) y += 2;
    
    floating_counter++;
    if (floating_counter == 80) floating_counter = 0; //start the animation from scratch
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
