class Pixel{
  PVector pos;
  color col;
  
  Pixel(int i, int j)
  {
    pos = new PVector(i,j);
    col = color(random(255),random(255),random(255));
  }
}