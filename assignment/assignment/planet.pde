 // Name of the class Planet
 class Planet {
   
    //Iniaising ssome variables giving the planet some attributes
    float radius;
    float angle;
    float distance;
    Planet[] planets;
    float orbitspeed;
    
    // Constructor of Planet with, 3 parameters r, d and o
    Planet(float r, float d, float o)
    {
       radius = r;
       
       //distance from the main star to other planets
       distance = d;
       angle = random(TWO_PI);
       orbitspeed = o; 
    }
    
    
    // function spawn moons. this is where we create the array initaitaisd above
    void spawnMoons(int total, int level)
    {
       // Creating the object array for the moons above
       planets = new Planet[total];
       
       // Loop to create new planets below
       for(int i = 0; i < planets.length; i++)
       {
         
         //varaiables to determine the size of the moons
          float r = radius/ (level * 2);
          float d = random(radius + (r + 40), radius + (r + 20) * 2);
          float o = random(-0.001, 0.003);
          
          //creating new planet for each element in the array
          planets[i] = new Planet(r, d, o);
          
          //The sun will call spawn moons with 0 then itl make a bunch of planets with level 1
          //Then theyll make a bunch of planets with level 2
          
          
          //Stops the moons being spawned infantely.
          if(level < 2)
          {
            
            //this decides how many moons each planet will have
            int num = int(random(0,4));
            
            //Creates moons for new planets
            planets[i].spawnMoons(num, level+1);
          }
       }
     
    }
    
    //Function to make the planets be in orbit
    void orbit()
    {
        angle = angle + orbitspeed;
        if(planets != null)
        {
           for(int i = 0; i < planets.length; i++)
           {
              planets[i].orbit(); 
           }
        }
    }
    
    //Draws the planets when called from main in the void draw() function
    void show()
    {
       //keeps the data of the translate function in betteween the push and pop matrix
       pushMatrix();
       fill(255, 100);
       
       rotate(angle);
       
       //Translates the next planet a distace away from the previous one.
       translate(distance, 0);
       ellipse(0,0, radius * 2, radius * 2);
       
       
       //prevents the null pointer exception from having.
       if(planets != null)
       {
         
         //Displaying the planets for the draw function
         for(int i = 0; i < planets.length; i++)
         {
            planets[i].show(); 
         }
       }
       
       popMatrix();

    }
    
    // Draws the shape of the window where the planets are shown.
    void hud()
    {
        background(51);
        fill(0);
        stroke(0, 155, 235);
        strokeWeight(2);
        
        beginShape();
        
        vertex(-650,0);
        vertex(-400, 180);
        vertex(400, 180);
        vertex(650, 0);
        vertex(200, -240);
        vertex(-200, -240);
       

      
        endShape(CLOSE);
        
    }
}