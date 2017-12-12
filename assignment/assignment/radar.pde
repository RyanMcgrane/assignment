class Radar
{
  float cx, cy;
  float radius;
  float theta;
  float speed;
  float frequency;
  color c;
  
  Radar(float cx, float cy, float radius, float frequency, color c)
  {
    this.cx = cx;
    this.cy = cy;
    this.radius = radius;
    this.frequency = frequency;
    this.speed = (TWO_PI / 60.0) * frequency;
    this.theta = 0;
    this.c = c;
  }
  
  void update()
  {
    theta += speed;
  }
  
  void render()
  {
    translate(-200,0);
    stroke(0, 220, 200);
    strokeWeight(2);
    fill(0);
    ellipse(cx, cy, radius * 2, radius * 2);
    int trailLength = 8;
    float blueIntensity = 255 / (float)trailLength;
    for(int i = 0 ; i < trailLength ; i ++)
    {
      stroke(0, i * blueIntensity, 180);
      float x = cx + sin(theta + i * speed) * radius;
      float y = cy -cos(theta + i * speed) * radius;
      line(cx, cy, x, y);
    }
    
     float hour = hour();
     float min = minute();
     float second = second();
     
     noFill();
     strokeWeight(4);
     stroke(255,100,15);
     translate(650,360);
     rotate(-PI/2);
     
     float secondAngle = map(second, 0 , 60, 0 , TWO_PI);
     arc(0,0,300,300,0,secondAngle);
     
     stroke(255);
     float minuteAngle = map(min, 0 , 60, 0 , TWO_PI);
     arc(0,0,280,280,0,minuteAngle);
    
     stroke(13,255,16);
     float hourAngle = map(hour % 12, 0 , 12, 0 , TWO_PI);
     arc(0,0,260,260,0,hourAngle);
     
  }
  
  void health()
  {  
      translate(-200, -1100);
      String thruster = "Thruster Engage";
      textSize(26);
      text(thruster, 100, 80);
       // Change color
      if (health < 25)
      {
        fill(255, 0, 0);
      }  
      else if (health < 50)
      {
        fill(255, 200, 0);
      }
      else
      {
        fill(0, 255, 0);
      }
      
      // Draw bar
      noStroke();
      // Get fraction 0->1 and multiply it by width of bar
      float drawWidth = (health / MAX_HEALTH) * rectWidth;
      rect(100, 100, drawWidth, 50);
      
      // Outline
      stroke(0);
      noFill();
      rect(100, 100, rectWidth, 50);
  }
    
  
}