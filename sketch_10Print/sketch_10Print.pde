PVector pos;
float spacing = 5;

float time = 0;

void setup()
{
  size(1000, 800);
  pos = new PVector(0, 0);
  background(0);
}

void draw()
{
  //background(0);

  stroke(255);
  if (random(1) < time)
  {
    line(pos.x, pos.y, pos.x+spacing, pos.y+spacing);
  } else {
    line(pos.x, pos.y+spacing, pos.x+spacing, pos.y);
  }
  
  pos.x += spacing;
  
  if(pos.x > width)
  {
    pos.y += spacing;
    pos.x = 0;
  }
  
  if(pos.y > height)
  {
    pos.y = 0;
    //background(0);
    noLoop();
  }
  
  time+=0.0001;
}