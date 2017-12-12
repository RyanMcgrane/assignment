/* Author: Ryan McGrane
   Date: 11/12/2017
   Description : Sci FI HUD
*/

// imports the sound file.
import ddf.minim.*;

Minim minim;

//name of the instance of the sound 1 
AudioPlayer sound1, sound2;

//Creating objects of the two classes planet and radar.
Planet sun;
Radar radar1;

// Creating a name for the loaded imaged on the first screen
PImage finalScreen;

// Iniaitising variables for the following:
int stage;
float angle = TWO_PI;
float rectWidth = 200;
float health = 100;
float MAX_HEALTH = 100;


// Setup function
void setup()
{
    size(1300, 720);
    
    //i passed this to minim so it can load files from the data directory
    minim = new Minim(this);
    
    //Looks for the sound in the same folder
    sound1 = minim.loadFile("Thruster.wav");
    sound2 = minim.loadFile("radar.wav");
   
    //gives the planets their attributes
    sun = new Planet(50, 0, 0);
    sun.spawnMoons(5,1);
    radar1 = new Radar(width / 2, height / 2, 100, 0.5, color(0, 255, 0));
    
    
    stage = 1;
    //Assignment of each image(BG Image) to a variable
    //Fill in the "loadImage("");" with the name of your image with its file type, eg loadImage("MainMenu.jpg");
    finalScreen = loadImage("finalScreen.jpg");
   
}

// Draws everything
void draw()
{
    
    if(stage==1)
     {
         image(finalScreen, 0, 0, 1300, 720);
         PFont f = createFont("Algerian", 64);
         String text = "Enter the HUD";
         textFont(f);
         textSize(64);
         text(text,400 ,400);
    }
     
    //when the mouse is clicked brings you to the hud
    if(stage==2)
    {
        
        background(0);
        
        //Keeps the planets Displayed at the top
        translate(width/2, height/4);
       
        sun.hud();
        sun.show();
        sun.orbit();
        
        radar1.render();
        radar1.update();
        radar1.health();
        sound2.play();
        
        PFont f = createFont("Algerian", 28);
        String t = " ^^^";
        textFont(f);
        textSize(28);
        text(t,640 ,70);
       
    }

}

// If mouse is clicked do what syas in the if statements.
void mousePressed()
{
  //Code Bringing you from startScreen to secondScreen when mouse is clicked within your chosen co-ordinates
  if(stage==1)
  {
   if (mouseX < 860 && mouseX > 400 & mouseY< 410 && mouseY > 350)
    {
      stage = 2;
    } 
  }
  else if(stage==2)
  {
    //This code brings you back to the first screen from the second when the mouse is clicked within your chosen co=ordinates
    if(mouseX < 150 && mouseX > 50 & mouseY < 100 && mouseY > 50)
    {
      stage = 1;
    } 
   
  }
  
   if (health > 0 && mouseButton == LEFT)
   {
      health -= 10;
   }
   if (health < 100 && mouseButton == RIGHT)
   {
      health += 10;
      sound1.play();
     
   }
   
   if(health == 0 && mouseButton == RIGHT)
   {
      sound1.play();
   }
  
  
}