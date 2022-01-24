class Level {

  SoundFile music;
  
  int year;
  
  PImage backgroundFront; // only the 1st Year has a frontground
  PImage backgroundBack;
  PImage courseImage;
  
  int x_dim; //x dimension
  // y dimension is always 900
  int y; //y to draw image
  // x to draw image is always 0
  
  int right_border; //right side border;
  
  float bg_motion;
  
  float fg_x; //frontground x
  float bg_x; //background x
  float move_x; //objects and courses x coordinate initializer

  Flag flag;

  Object[] objects;
  Course[] courses;
  NPC[] npcs;
  
  boolean[] passed; //tests which courses the player took before leaving the game
  
  int courses_collected;

  Level(int year) {
    move_x = 0;
    this.year = year;
    
    music = tracks[year];
    
    courses_collected = 0;
    
    courseImage = loadImage(sketchPath() + "/images/objects/course.png");
    
    if (year == 1) {
      backgroundFront = loadImage(sketchPath() + "/images/backgrounds/1st_year_front.png");
      backgroundBack = loadImage(sketchPath() + "/images/backgrounds/1st_year_back.png");
      
      x_dim = round(width*1.5);
      y = -round(height/36);
      
      bg_motion = step/8.0;
      
      flag = new Flag(width/1.26, height/2.13, width/40.0, height/25.0);
      
      objects = new Object[10];
      objects[0] = new Cone(width*0.45);
      objects[1] = new Bin(width*0.77, 1);
      objects[2] = new Sign(width*1.07, 1);
      objects[3] = new Bench(width*1.48);
      objects[4] = new Bus_Stop(width*1.74);
      objects[5] = new Light(width*2.36);
      objects[6] = new Car(width*2.58, 2);
      objects[7] = new Bin(width*3.29, 2);
      objects[8] = new Hydrant(width*3.77);
      objects[9] = new Tree(width*4.03);
      
      courses = new Course[10];
      courses[0] = new Course(width*0.63, height*0.47); //difficulty: 1
      courses[1] = new Course(width*1.06, height*0.13); //difficulty: 2
      courses[2] = new Course(width*1.42, height*0.14); //difficulty: 3
      courses[3] = new Course(width*1.67, height*0.83); //difficulty: 0
      courses[4] = new Course(width*2.08, height*0.28); //difficulty: 2
      courses[5] = new Course(width*2.66, height*0.18); //difficulty: 3
      courses[6] = new Course(width*3.08, height*0.83); //difficulty: 0
      courses[7] = new Course(width*3.54, height*0.34); //difficulty: 1
      courses[8] = new Course(width*3.97, height*0.33); //difficulty: 2
      courses[9] = new Course(width*4.55, height*0.38); //difficulty: 2
      
      npcs = new NPC[2];
      npcs[0] = new NPC(width*0.28, "1st_1", "H E LLO     TH E R E     A N D     W E LC O M E     TO     O U R     U N I V E R S I TY\nI F     Y O U     W I S H     TO     G R U A D U A TE      Y O U     N E E D     TO     P A S S\nA LL    3 6     C O U R S E S     A N D     G E T     TO     TH E     E N D     O F     E V E R Y\nS T A G E     A S     Q U I TTI N G     W I L L     N O T     S A V E     Y O U R     P R O G R E S S\n\nU S E     A     A N D     D     O R     TH E     A R R O W     P A D     TO     M O V E\nA N D     TH E     S P A C E     B A R     TO     J U M P\nB E S T     O F     LU C K     !", 7);
      npcs[1] = new NPC(width*3.60, "1st_2", "Y E S     I     J U S T     LI K E     TO     G O     F O R\nA     C O F F E E     F R O M     TI M E     TO     TI M E\nY E S     I     H A V E     M I S S E D     A     C O U P L E     O F     L E C T U R E S\nI     S T O P P E D     C O U N TI N G     A F T E R     1 2", 4);
      
      right_border = 5*width;
    }
    else if (year == 2) {
      backgroundBack = loadImage(sketchPath() + "/images/backgrounds/2nd_year.png");
      
      x_dim = round(width*3.5);
      y = 0;
      
      bg_motion = width/240.0;
      
      objects = new Object[18];
      objects[0] = new Chair(width*0.56);
      objects[1] = new Desk(width*0.63);
      objects[2] = new Chair(width*0.80);
      objects[3] = new Chair(width*1.03);
      objects[4] = new Desk(width*0.97);
      objects[5] = new Bookshelf_Short(width*1.31);
      objects[6] = new Chair(width*1.48);
      objects[7] = new Pillar(width*1.63);
      objects[8] = new Pillar(width*2.02);
      objects[9] = new Bookshelf_Tall(width*2.42);
      objects[10] = new Chair(width*2.66);
      objects[11] = new Desk(width*2.60);
      objects[12] = new Bookshelf_Short(width*2.85);
      objects[13] = new Chair(width*3.08);
      objects[14] = new Pillar(width*3.30);
      objects[15] = new Chair(width*3.54);
      objects[16] = new Chair(width*3.61);
      objects[17] = new Desk(width*3.70);
      
      courses = new Course[8];
      courses[0] = new Course(width*0.69, height*0.41); //1
      courses[1] = new Course(width*1.1, height*0.29); //2
      courses[2] = new Course(width*1.49, height*0.44); //1
      courses[3] = new Course(width*1.88, height*0.83); //0
      courses[4] = new Course(width*2.16, height*0.14); //3
      courses[5] = new Course(width*2.78, height*0.22); //2
      courses[6] = new Course(width*3.34, height*0.28); //4
      courses[7] = new Course(width*3.90, height*0.44); //1
      
      npcs = new NPC[5];
      npcs[0] = new NPC(width*2.22, "2nd_1", "TO D A Y     I S     S U C H     A     LO V E LY     D A Y\nS O     W H A T     D O     Y O U     S A Y     W E     G O     G R A B     A\nC O F F E E     A N D     TA L K     A B O U T     P O LI TI C S     H U H", 3);
      npcs[1] = new NPC(width*3.20, "2nd_2", "B E LI E V E     I T     O R     N O T     B U T\nS O M E     C O U R S E S     A R E     H A R D E R\nTH A N     O TH E R S     TO     P A S S  !", 3);
      npcs[2] = new NPC(width*1.16, "2nd_3", "I     M I G H T     A S     W E LL     S I T\nH E R E     S I N C E     I     C A N N O T     J U M P\nO V E R     TH I S     B O O K S H E L F   !", 3, false, false);
      npcs[3] = new NPC(width*0.90, "2nd_4", "I     D O     N O T     R E M E M B E R     \nA N Y     W O O D E N     TA B L E S     \nB E I N G     H E R E     B E F O R E", 3, false, true);
      npcs[4] = new NPC(width*0.48, "2nd_5", "E X C U S E     M E     F R I E N D\nC O U LD     Y O U     P L E A S E     TE LL     M E\nW H E R E     C L A S S     A LP H A     I S", 3);
      
      right_border = round(width*4.32);
    }
    else if (year == 3) {
      backgroundBack = loadImage(sketchPath() + "/images/backgrounds/3rd_year.png");
      
      x_dim = width*5;
      y = 0;
      
      bg_motion = width/240.0;
      
      objects = new Object[30];
      objects[0] = new Chair(width*0.61);
      objects[1] = new Desk(width*0.56);
      objects[2] = new Chair(width*0.73);
      objects[3] = new Bookshelf_Tall(width*0.97);
      objects[4] = new Chair(width*1.18);
      objects[5] = new Ladder(width*1.42);
      objects[6] = new Closet(width*1.49);
      objects[7] = new Closet(width*1.65);
      objects[8] = new Closet(width*1.81);
      objects[9] = new Chair(width*2.12);
      objects[10] = new Bookshelf_Short(width*2.22);
      objects[11] = new Chair(width*2.53);
      objects[12] = new Chair(width*2.69);
      objects[13] = new Chair(width*2.79);
      objects[14] = new Desk(width*2.60);
      objects[15] = new Desk(width*2.78);
      objects[16] = new Ladder(width*3.19);
      objects[17] = new Bookshelf_Tall(width*3.26);
      objects[18] = new Desk(width*3.52);
      objects[19] = new Closet(width*3.72);
      objects[20] = new Closet(width*3.88);
      objects[21] = new Ladder(width*4.04);
      objects[22] = new Chair(width*4.46);
      objects[23] = new Chair(width*4.58);
      objects[24] = new Desk(width*4.53);
      objects[25] = new Bookshelf_Tall(width*4.86);
      objects[26] = new Bookshelf_Short(width*4.98);
      objects[27] = new Chair(width*5.24);
      objects[28] = new Ladder(width*5.47);
      objects[29] = new Desk(width*5.55);
      
      courses = new Course[10];
      courses[0] = new Course(width*0.67, height*0.32); //1
      courses[1] = new Course(width*1.15, height*0.12); //2
      courses[2] = new Course(width*1.72, height*0.48); //0
      courses[3] = new Course(width*2.5, height*0.24); //3
      courses[4] = new Course(width*3.06, height*0.12); //2
      courses[5] = new Course(width*3.53, height*0.33); //1
      courses[6] = new Course(width*3.99, height*0.2); //1
      courses[7] = new Course(width*4.44, height*0.23); //3
      courses[8] = new Course(width*5.16, height*0.83); //0
      courses[9] = new Course(width*5.80, height*0.13); //2
      
      npcs = new NPC[4];
      npcs[0] = new NPC(width*0.89, "3rd_1", "TH E R E     A R E     N O     P I C TU R E S\nI N     TH E     B O O K S\nW H O     W O U LD     E V E N     R E A D     TH E S E", 3, false, true);
      npcs[1] = new NPC(width*1.30, "3rd_2" ,"TH E R E     I S     N O     W A Y\nI     A M     G E TTI N G     U P     TH E R E\nN O T     I N     A     S K I R T     A T     LE A S T", 3, false, true);
      npcs[2] = new NPC(width*2.97, "3rd_3", "C O U L D     Y O U     P L E A S E     N O T\nS TA N D     O N     TH E     TA B LE S     W I TH     \nY O U R     D I R TY     S H O E S\n\nJ U S T     W A LK     A R O U N D     TH E M     N E X T     TI M E", 5);
      npcs[3] = new NPC(width*5.35, "3rd_4", "Y E A H     I     D O     N O T     W A N N A     B R A G\nB U T     I     K N O W     H O W     TO     P R I N T\nH E LLO     W O R L D\n     I N     F I V E     D I F F E R E N T     LA N G U A G E S", 4);
      
      right_border = round(width*6.33);
    }
    else if (year == 4) {
      backgroundBack = loadImage(sketchPath() + "/images/backgrounds/4th_year.png");
      
      x_dim = round(width*3.75);
      y = 0;
      
      bg_motion = width/288.0;
      
      objects = new Object[10];
      objects[0] = new Car(width*0.63, 1);
      objects[1] = new Sign(width*1.04, 3);
      objects[2] = new Hydrant(width*1.39);
      objects[3] = new Bin(width*1.67, 2);
      objects[4] = new Sign(width*2.03, 2);
      objects[5] = new Truck(width*2.34);
      objects[6] = new Bin(width*3.03, 1);
      objects[7] = new Tree(width*3.47);
      objects[8] = new Car(width*4.14, 3);
      objects[9] = new Light(width*4.69);
      
      courses = new Course[8];
      courses[0] = new Course(width*0.56, height*0.31); //1
      courses[1] = new Course(width*1.32, height*0.19); //2
      courses[2] = new Course(width*1.75, height*0.14); //2
      courses[3] = new Course(width*2.22, height*0.83); //0
      courses[4] = new Course(width*3.17, height*0.11); //3
      courses[5] = new Course(width*3.85, height*0.32); //2
      courses[6] = new Course(width*4.31, height*0.29); //1
      courses[7] = new Course(width*5.10, height*0.45); //4
      
      npcs = new NPC[3];
      npcs[0] = new NPC(width*1.55, "4th_1", "R E M E M B E R     TO     R E C Y C LE\nS A V E     TH E     P LA N E T   !", 3);
      npcs[1] = new NPC(width*3.35, "4th_2", "Y O     I S     TH I S     TH E\nU N I V E R S I TY     Y O U     G O     TO\n\nI     H E A R D     TH E R E     I S     TH I S\nG I R L     W H O     K N O W S     H O W\nTO     P R I N T     H E LLO     W O R LD\nI N     F I V E     D I F F E R E N T     LA N G U A G E S\nC R A Z Y     S TU F F   !", 7);
      npcs[2] = new NPC(width*4.90, "4th_3", "S O M E     C O U R S E S     A R E     J U ST     M A D E\nTO     M A K E     Y O U R     LI F E     D I F F I C U  LT\n\nB U T     I F     Y O U     K E E P     T R Y I N G\nY O U     W I LL     E V E N TU A LLY     M A K E     IT", 5);
      
      right_border = round(width*5.37);
    }
    
  }

  void draw() {
    
    //move the background (and frontground if it exists) based on player movement
    if ((player.x >= width/2 - (width/22.5) - (width/180.0)) && (player.x <= right_border - width/2 - (width/22.5) - (width/90.0) && !player.still)) {
      if (player.x_motion > 0) {
        
        bg_x -= bg_motion;
        if (year == 1) {
          flag.x -= bg_motion;
          fg_x -= width/360.0;
        }
        
        for (Object object: objects) object.x -= step;
        for (Course course: courses) course.x -= step;
        for (NPC npc: npcs) npc.x  -= step;
        move_x += step; //to reset the objects when leaving/finishing the level
      }
    }
    if ((player.x >= width/2 - (width/22.5)) && (player.x <= right_border - width/2 - (width/22.5) - (width/180.0) && !player.still)) {
      if (player.x_motion < 0) {
        
         bg_x += bg_motion;
        if (year == 1) {
          flag.x += bg_motion;
          fg_x += width/360.0;
        }
        
        for (Object object: objects) object.x += step;
        for (Course course: courses) course.x += step;
        for (NPC npc: npcs) npc.x  += step;
        move_x -= step; //to reset the objects when quiting the level
      }
    }
    
    image(backgroundBack, bg_x, y, x_dim, height);
    if (year == 1 ) //only the first year has a frontground
    image(backgroundFront, fg_x, 0, 3*width, height);
    
    if (year == 1) flag.draw();
    
    if (menu.hitboxes) {
      fill(235, 15, 15); //red
      toggleObjects();
      fill(255, 215, 0); //gold
      toggleCourses();
      toggleNPC();
    }
    
    for (Object object: objects) object.draw();
    for (Course course: courses) course.draw();
    for (NPC npc: npcs) npc.draw();
    
    displayCoursesCollected();
  }
  
  //resets the coordinates when quiting or finishing a level
  void reset() {
    level.bg_x = 0;
    level.fg_x = 0;
    if (game.quit) restoreCourses();
    for (Object object: objects) object.x += move_x;
    for (Course course: courses) course.x += move_x;
    for (NPC npc: npcs) npc.x += move_x;
    flag = new Flag(width/1.26, height/2.13, width/40.0, height/25.0);
    move_x = 0;
    
  }

  //toggles objects hitbox visibility
  void toggleObjects() {
    for (Object object: objects) object.toggle();
  }
  
  //toggles courses hitbox visibility
  void toggleCourses() {
    for (Course course: courses) course.toggle();
  }
  
  //toggles npc hitbox visibility
  void toggleNPC() {
    for (NPC npc: npcs) npc.toggle();
  }
  
  void restoreCourses() {
    
    for (int i = 0; i < courses.length; i++)
      if (passed[i]) {
        courses[i].passed = false;
        level.courses_collected --;
      }
  }
  
  void makeTemp() {
    
    passed = new boolean[courses.length];
    for (int i = 0; i < courses.length; i++) passed[i] = false;
    
  } 
  
  
  void displayCoursesCollected() {
    //display courses collected
    image(courseImage, width/2-int(Math.round(width*(116.0/1440))), int(Math.round(height*(28.0/900))), int(Math.round(width*(64.0/1440))), int(Math.round(height*(64.0/900))));
    textAlign(LEFT);
    fill(220, 220, 220); //light grey
    textSize(int(Math.round(width*(60.0/1440))*0.8));
    text("x  ", width/2-int(Math.round(width*(16.0/1440))), int(Math.round(height*(80.0/900))));
    fill(255, 215, 0); //gold
    textSize(int(Math.round(width*(60.0/1440))*3/2));
    text(courses_collected, width/2+int(Math.round(width*(42.0/1440))), int(Math.round(height*(92.0/900))));
  }
};
