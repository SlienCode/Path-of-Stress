import java.awt.*;

class Degree {
  
  PImage degree[]; //12 degree animations
  PImage image;
  int counter;
  int frames;
  
  Degree() {
    
    counter = 0;
    frames = 5;
    degree = new PImage[12];
    for (int i = 0; i <12; i++) {
      degree[i] = loadImage(sketchPath() + "/images/miscellaneous/degree/degree" + i + ".png");
    }
        
  }
  
  void draw() {
    animation();
    image(image, width/2-round(width/22.5), height/2-round(height/3.75), round(width/11.25), round(height/7.03));
  }
  
  void animation() {
    if (counter < 3*frames) image = degree[0];
    else if (counter < 4*frames) image = degree[1];
    else if (counter < 5*frames) image = degree[2];
    else if (counter < 6*frames) image = degree[3];
    else if (counter < 7*frames) image = degree[4];
    else if (counter < 8*frames) image = degree[5];
    else if (counter < 9*frames) image = degree[6];
    else if (counter < 10*frames) image = degree[7];
    else if (counter < 11*frames) image = degree[8];
    else if (counter < 12*frames) image = degree[9];
    else if (counter < 13*frames) image = degree[10];
    else if (counter < 14*frames) image = degree[11];
    else counter = -1;
    
    counter++;
  }
  
};
