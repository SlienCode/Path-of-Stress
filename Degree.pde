import java.awt.*;

class Degree {
  
  PImage image;
  PImage image0;
  PImage image1;
  PImage image2;
  PImage image3;
  PImage image4;
  PImage image5;
  PImage image6;
  PImage image7;
  PImage image8;
  PImage image9;
  PImage image10;
  PImage image11;
  int counter;
  int frames;
  
  Degree() {
    
    counter = 0;
    frames = 5;
    image0 = loadImage(sketchPath() + "/images/degree/degree0.png");
    image1 = loadImage(sketchPath() + "/images/degree/degree1.png");
    image2 = loadImage(sketchPath() + "/images/degree/degree2.png");
    image3 = loadImage(sketchPath() + "/images/degree/degree3.png");
    image4 = loadImage(sketchPath() + "/images/degree/degree4.png");
    image5 = loadImage(sketchPath() + "/images/degree/degree5.png");
    image6 = loadImage(sketchPath() + "/images/degree/degree6.png");
    image7 = loadImage(sketchPath() + "/images/degree/degree7.png");
    image8 = loadImage(sketchPath() + "/images/degree/degree8.png");
    image9 = loadImage(sketchPath() + "/images/degree/degree9.png");
    image10 = loadImage(sketchPath() + "/images/degree/degree10.png");
    image11 = loadImage(sketchPath() + "/images/degree/degree11.png");
        
  }
  
  void draw() {
    println(counter);
    animation();
    image(image, width/2-64, height/2, 128, 128);
  }
  
  void animation() {
    if (counter < 3*frames) image = image0;
    else if (counter < 4*frames) image = image1;
    else if (counter < 5*frames) image = image2;
    else if (counter < 6*frames) image = image3;
    else if (counter < 7*frames) image = image4;
    else if (counter < 8*frames) image = image5;
    else if (counter < 9*frames) image = image6;
    else if (counter < 10*frames) image = image7;
    else if (counter < 11*frames) image = image8;
    else if (counter < 12*frames) image = image9;
    else if (counter < 13*frames) image = image10;
    else if (counter < 14*frames) image = image11;
    else counter = -1;
    
    counter++;
  }
  
};
