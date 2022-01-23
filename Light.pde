import java.awt.*;

class Light extends Object {
  
  PImage image1;
  PImage image2;
  PImage image3;
  int counter;
  
  Light(float x) {
    super(x);
    
    counter = 0;
    image1 = loadImage(sketchPath() + "/images/objects/light1.png");
    image2 = loadImage(sketchPath() + "/images/objects/light2.png");
    image3 = loadImage(sketchPath() + "/images/objects/light3.png");
    platform = true;
    hitbox = new Rectangle[1];
    hitbox[0] = new Rectangle((int)x+(round(width/72.0)), round(height/1.54), round(width/53.33), round(height/45.0));
        
  }
  
  void draw() {
    animation();
    image(image, x, height-round(height/2.81), round(width/22.5), round(height/2.81));
    hitbox[0].setLocation((int)x+(round(width/72.0)), round(height/1.54));
  }
  
  void toggle() {
    rect(x+(round(width/72.0)), round(height/1.54), round(width/53.33), round(height/45.0));
  }
  
  void animation() {
    if (counter < 300) image = image1;
    else if (counter < 400) image = image2;
    else if (counter < 700) image = image3;
    else counter = -1;
    
    counter++;
  }
  
};
