import java.awt.*;

class Flag {
  
  PImage degree[]; //12 degree animations
  PImage image;
  int counter;
  float x;
  float y;
  float flag_width;
  float flag_height;
  
  Flag(float x, float y, float flag_width, float flag_height) {
    
    this.x = x;
    this.y = y;
    this.flag_width = flag_width;
    this.flag_height = flag_height;
    
    counter = 0;
    degree = new PImage[12];
    for (int i = 0; i < 12; i++) {
      degree[i] = loadImage(sketchPath() + "/images/miscellaneous/flag/flag" + i + ".png");
    }
        
  }
  
  void draw() {
    animation();
    image(image, x, y, flag_width, flag_height);
  }
  
  void animation() {
    
  if (flag_counter <= 3) image = flag[0];
  else if (flag_counter <= 6) image = flag[1];
  else if (flag_counter <= 9) image = flag[2];
  else if (flag_counter <= 12) image = flag[3];
  else if (flag_counter <= 15) image = flag[4];
  else if (flag_counter <= 18) image = flag[5];
  else if (flag_counter <= 21) image = flag[6];
  else if (flag_counter <= 24) image = flag[7];
  else if (flag_counter <= 27) image = flag[8];
  else if (flag_counter <= 30) image = flag[9];
  else if (flag_counter <= 33) image = flag[10];
  else image = flag[11];
  
  flag_counter++;
  if (flag_counter == 37) flag_counter = 0;
  
  }
  
};
