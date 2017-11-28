Pixel[] ranPixels;

void setup()
{
  size(500, 500);
  ranPixels = new Pixel[width * height];
  for (int i=0; i<width; i++)
  {
    for (int j=0; j<height; j++)
    {
      ranPixels[i] = new Pixel(i, j);
    }
  }
}

void draw()
{
  background(0);
  for (Pixel p : ranPixels)
  {
    stroke(p.col);
    point(p.pos.x, p.pos.y);
  }
}