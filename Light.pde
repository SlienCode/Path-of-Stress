import java.awt.*;

class Light extends Object {
  
  PImage image1;
  PImage image2;
  PImage image3;
  int counter;
  
  Light(int x) {
    super(x);
    
    counter = 0;
    image1 = loadImage(sketchPath() + "/images/objects/light1.png");
    image2 = loadImage(sketchPath() + "/images/objects/light2.png");
    image3 = loadImage(sketchPath() + "/images/objects/light3.png");
    platform = true;
    hitbox = new Rectangle[1];
    hitbox[0] = new Rectangle(x+20, y+584, 27, 20);
        
  }
  
  void draw() {
    animation();
    image(image, x, y+580, 64, 320);
    hitbox[0].setLocation(x+20, y+584);
  }
  
  void toggle() {
    rect(x+20, y+584, 27, 20);
  }
  
  void animation() {
    if (counter < 300) image = image1;
    else if (counter < 400) image = image2;
    else if (counter < 700) image = image3;
    else counter = -1;
    
    counter++;
  }
  
};
