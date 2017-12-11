PImage startScreen, finalScreen;
int stage;
float angle = TWO_PI;

Planet sun;

void setup()
{
  
    //put your own screen size in this 
    size(1300, 720);
    sun = new Planet(50, 0, 0);
    sun.spawnMoons(5,1);
    
    
    stage = 1;
    //Assignment of each image(BG Image) to a variable
    //Fill in the "loadImage("");" with the name of your image with its file type, eg loadImage("MainMenu.jpg");
    startScreen = loadImage("finalScreen.jpg");
    finalScreen = loadImage("homeScreen.jpg");
}

void draw()
{
    
    if(stage==1)
     {
         image(startScreen, 0, 0, 1300, 720);
         pushMatrix();  //Basically means save everything before
         translate(600, 360);
         stroke(55, 129, 43);
         fill(255, 100, 0);
         rect(0, 0, 100, 50);
         
         popMatrix();   // This restores it back. Basically the code inbetween 
                        // Push and pop is in its own transformation world.
    }
 
    if(stage==2)
    {
        
        background(0);
        translate(width/2, height/2);
       
        sun.show();
        sun.orbit();
        
        pushMatrix();        //Basically means save everything before
        translate(100, 100);
        stroke(0, 255, 0);
        fill(255, 255, 255);
        rect(0, 0, 100, 50);
         
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
    if(mouseX < 700 && mouseX > 600 & mouseY < 410 && mouseY > 350)
    {
      stage = 1;
    } 
   
  }
  
}