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
  
  //hitboxes' sizes
  int size_of_array = 256;
  
  //hitboxes
  Point[] hitboxcourse;
  
  int courses_collected;
  
  Course() {
    visibility = false;
    hitboxcourse = new Point[0];
  }
  
  Course(int x,int y) {
    this.x = x;
    this.y = y;
    
    visibility = true;
    
    floating_counter = 0;
    
    image = loadImage("C:/Users/nickc/Desktop/Path_of_Stress/images/objects/course.png");

    hitboxcourse = new Point[size_of_array];
    
    for (int i = 0; i < size_of_array; i++) {
      if (i < size_of_array/4) {
        hitboxcourse[i] = new Point(x+(i), y);
      } else if (i < 2*size_of_array/4) {
        hitboxcourse[i] = new Point(x+(size_of_array/4), y+i-(size_of_array/4));
      } else if (i < 3*size_of_array/4) {
        hitboxcourse[i] = new Point(x+(size_of_array/4)-(i-(2*size_of_array/4)), y+(size_of_array/4));
      } else {
        hitboxcourse[i] = new Point(x, y+(i+1-3*size_of_array/4));
      }
    }
  }
  
  void floatingAnimation() {
    if (floating_counter < 5) y += 2;
    else if (floating_counter < 15) y += 1;
    else if (floating_counter < 25) y += 0;
    else if (floating_counter < 35) y += -1;
    else if (floating_counter < 45) y += -2;
    else if (floating_counter < 55) y += -1;
    else if (floating_counter < 65) y += 0;
    else if (floating_counter < 75) y += 1;
    else if (floating_counter < 80) y += 2;
    
    floating_counter++;
    if (floating_counter == 80) floating_counter = 0; //start the animation from scratch
  }
  
  /*void floatingAnimation() {
    if (floating_counter < 20) y += 1;
    else if (floating_counter < 60) y += -1;
    else if (floating_counter < 80) y += 1;
    
    floating_counter++;
    if (floating_counter == 80) floating_counter = 0; //start the animation from scratch
  }*/
  
  void draw() {
    floatingAnimation();
    if (visibility) image(image, x, y, 64, 64);
  }
  
  void toggle() {
    if (visibility) {
      for (int i = 0; i < hitboxcourse.length; i++) {
        rect((int) hitboxcourse[i].getX(),(int) hitboxcourse[i].getY(), 1, 1);
      }
    }
  }
  
};
