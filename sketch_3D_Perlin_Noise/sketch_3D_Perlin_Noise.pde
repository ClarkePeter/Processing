int cols, rows;
int scl = 20;
int w = 2000;
int h = 1600;

float[][] terrain;


void setup()
{
  size(1024, 800, P3D);

  noiseSeed(5050);

  cols = w / scl;
  rows = h / scl;

  terrain = new float[cols][rows];
}



void draw()
{
  for (int y = 0; y<rows; y++)
  {
    for (int x = 0; x<cols; x++) 
    {
      terrain[x][y] = map(noise(x*0.04f, y*0.04f), 0, 1, -100, 100);
    }
  }



  background(0);
  stroke(255);
  noFill();
  translate(width/2, height/2 + 50);
  rotateX(PI/3);
  translate(-w/2, -h/2);

  for (int y =0; y<rows-1; y++)
  {
    beginShape(TRIANGLE_STRIP);
    for (int x = 0; x<cols; x++)
    {
      vertex(x*scl, y*scl, terrain[x][y]);
      vertex(x*scl, (y+1)*scl, terrain[x][y+1]);
      //rect(x*scl, y*scl, scl, scl);
    }

    endShape();
  }
}