import java.awt.*;

class NPC {
  
  float x;
  int text_lines;
  PImage image;
  String message;
  boolean lock_on_player;
  boolean face_right;
 
  Rectangle hitbox;
  
  NPC(float x, String g, String message, int text_lines, boolean lop, boolean fr) {
    this.x = x;
    image = loadImage(sketchPath() + "/images/miscellaneous/NPC/" + g + ".png");
    this.message = message;
    this.text_lines = text_lines;
    face_right = fr;
    lock_on_player = lop;
    hitbox = new Rectangle((int)x-round(width/(1440/64.0)), round(height/(900/692.0)), round(width/(1440/256.0)), round(height/(900/208.0)));
        
  }
  
  NPC(float x, String g, String message, int text_lines) {
    this.x = x;
    image = loadImage(sketchPath() + "/images/miscellaneous/NPC/" + g + ".png");
    this.message = message;
    this.text_lines = text_lines;
    face_right = true;
    lock_on_player = true;
    hitbox = new Rectangle((int)x-round(width/(1440/64.0)), round(height/(900/692.0)), round(width/(1440/256.0)), round(height/(900/208.0)));
        
  }
  
  void draw() {
    
    hitbox.setLocation((int)x-round(width/(1440/64.0)), round(height/(900/692.0)));
    if (lock_on_player) {
      
      //look at the player
      if (x > player.x - level.move_x) { 
        scale(-1,1);
        image(image, -x - round(width/(1440/128.0)), height - round(height/(900/256.0)), round(width/(1440/128.0)), round(height/(900/256.0)));
        scale(-1,1);
      }
      else image(image, x, height - round(height/(900/256.0)), round(width/(1440/128.0)), round(height/(900/256.0)));
    }
    else
      if (face_right) image(image, x, height - round(height/(900/256.0)), round(width/(1440/128.0)), round(height/(900/256.0)));
      else {
        scale(-1,1);
        image(image, -x - round(width/(1440/128.0)), height - round(height/(900/256.0)), round(width/(1440/128.0)), round(height/(900/256.0)));
        scale(-1,1);
      }
      
  }
  
  void message() {
    
    //draw a blue tab
    image(game.image, width/2-round(width*(500.0/1440)), height/2-round(height*(250.0/900)), round(width*(1000.0/1440)), round(height*(400.0/900)));
    textSize(round(width*(48.0/1440))*2/3);
    textAlign(CENTER);
    fill(255); //white
    text(message, width/2, height/2-round(height*(text_lines*28.0/900)));
    game.npc_pause = true;
  }
  
  void toggle() {
    rect(x-round(width/(1440/64.0)), round(height/(900/692.0)), round(width/(1440/256.0)), round(height/(900/208.0)));
  }
  
};
