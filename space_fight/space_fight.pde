Ship s;

void setup()
{
  size(500, 500);
  s = new Ship();
}

void draw()
{

  background(0);
  
    fill(255,0,0);
  rect(0,0,100,100);
  fill(255,255,0);
  rect(100,0,100,100);
  fill(0,255,0);
  rect(0,100,100,100);
  fill(0,0,255);
  rect(100,100,100,100);
  fill(255,0,255);
  translate(mouseX, mouseY);
  for( float a = 0; a < 360; a+=1){
    pushMatrix();
    rotate( radians(a) );
    ellipse( 30,0,10,10);
    popMatrix();
  }
}