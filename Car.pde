import java.awt.*;

class Car extends Object {

  Car(float x, int g) {

    super(x);
    image = loadImage(sketchPath() + "/images/objects/car" + g + ".png");
    platform = false;
    hitbox = new Rectangle[5];
    hitbox[0] = new Rectangle((int)x+round(width/28.8), round(height/1.16), round(width/64), round(height/4.26));
    hitbox[1] = new Rectangle((int)x+round(width/12.63), round(height/1.20), round(width/36.92), round(height/4.26));
    hitbox[2] = new Rectangle((int)x+round(width/9.41), round(height/1.24), round(width/37.89), round(height/4.26));
    hitbox[3] = new Rectangle((int)x+round(width/7.54), round(height/1.28), round(width/10.14), round(height/4.26));
    hitbox[4] = new Rectangle((int)x+round(width/4.32), round(height/1.17), round(width/10.75), round(height/4.26));
  }

  void draw() {
    image(image, x, height-round(height/3.55), round(width/2.81), round(height/3.55));
    hitbox[0].setLocation((int)x+round(width/28.8), round(height/1.16));
    hitbox[1].setLocation((int)x+round(width/12.63), round(height/1.20));
    hitbox[2].setLocation((int)x+round(width/9.41), round(height/1.24));
    hitbox[3].setLocation((int)x+round(width/7.54), round(height/1.28));
    hitbox[4].setLocation((int)x+round(width/4.32), round(height/1.17));
  }

  void toggle() {
    rect(x+round(width/28.8), round(height/1.16), round(width/22.5), round(height/4.26));
    rect(x+round(width/12.63), round(height/1.20), round(width/36.92), round(height/4.26));
    rect(x+round(width/9.41), round(height/1.24), round(width/37.89), round(height/4.26));
    rect(x+round(width/7.54), round(height/1.28), round(width/10.14), round(height/4.26));
    rect(x+round(width/4.32), round(height/1.17), round(width/10.75), round(height/4.26));
  }

};
