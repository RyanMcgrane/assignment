/* Author: Ryan McGrane
   Date: 11/12/2017
   Description : Sci FI HUD
*/


PImage startScreen, finalScreen;
int stage;
float angle = TWO_PI;
float health = 100;
float MAX_HEALTH = 100;
float rectWidth = 200;

Planet sun;
Radar radar1;

void setup()
{
  
    //put your own screen size in this 
    size(1300, 720);
    sun = new Planet(50, 0, 0);
    sun.spawnMoons(5,1);
    radar1 = new Radar(width / 2, height / 2, 100, 0.5, color(0, 255, 0));
    
    
    stage = 1;
    //Assignment of each image(BG Image) to a variable
    //Fill in the "loadImage("");" with the name of your image with its file type, eg loadImage("MainMenu.jpg");
    startScreen = loadImage("finalScreen.jpg");
   
}

void draw()
{
    
    if(stage==1)
     {
         image(startScreen, 0, 0, 1300, 720);
         String text = "Enter the hud";
         textSize(26);
         text(text,550 ,400);
    }
 
    if(stage==2)
    {
        
        background(0);
        translate(width/2, height/4);
       
        sun.hud();
        sun.show();
        sun.orbit();
        
        radar1.render();
        radar1.update();
        radar1.health();
        
        pushMatrix();        //Basically means save everything before
        translate(-600, -200);
        stroke(0, 255, 0);
        fill(255, 255, 255);
        rect(0, -200, 500, 500);
         
        popMatrix();
    }

}

void mousePressed()
{
  //Code Bringing you from startScreen to secondScreen when mouse is clicked within your chosen co-ordinates
  if(stage==1)
  {
   if (mouseX < 700 && mouseX > 600 & mouseY< 410 && mouseY > 350)
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
   }
  
  
}