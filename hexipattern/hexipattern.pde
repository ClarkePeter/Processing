Hexi[] hexs;
int scl = 50;
int rows, cols;

void setup() {
  size(400, 400);
  surface.setResizable(true);
  rows = 10;
  cols =10;
  hexs = new Hexi[cols*rows];
  
  for (int j = 0; j< rows; j++)
  {
    for (int i =0; i<cols; i++)
    {
      hexs[j + i * rows] = new Hexi(scl * cos(PI / 6) + i * scl * 2 * cos(PI / 6),scl + scl * j * 2, scl);
    }
  }
}

void draw() { 
  background(0,255,0);
  for (Hexi h : hexs)
  {
    h.draw();
  }
}