import java.awt.*;

class Course {
  //coordinates
  int x;
  int y;
  
  boolean visibility;
  
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
    image = loadImage("C:/Users/ATHGEO/Desktop/Path_of_Stress/images/objects/course.png");

    visibility = true;

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
  
  void draw() {
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
