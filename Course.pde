import java.awt.*;

class Course {
  //coordinates
  int x;
  int y;
  
  boolean visibility;
  
  //floating animation
  int floating_counter; //80 frames
  
  //image of the object
  PImage image;
  
  //hitboxes
  Rectangle hitbox;
  
  int courses_collected;
  
  Course() {
    visibility = false;
    hitbox = new Rectangle();
  }
  
  Course(int x,int y) {
    this.x = x;
    this.y = y;
    
    visibility = true;
    
    floating_counter = 0;
    
    image = loadImage(sketchPath() + "/images/objects/course.png");

    hitbox = new Rectangle(x, y, 64, 64);
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
    if (visibility) image(image, x, y, 64, 64);
    hitbox.setLocation(x, y);
  }
  
  void toggle() {
    if (visibility) rect(x, y, 64, 64);
  }
  
};
