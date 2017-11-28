int numSides = 1;

void setup()
{
  size(1000, 1000);
  frameRate(1);
}

void draw() {
  background(0);
  drawShape(width / 2, height / 2, width/2, numSides);
  fill(0, 0, 255);
  textSize(40);
  text(numSides, 0, 40);
  numSides++;

}

void drawShape(int xOff, int yOff, float radius, int n) {
  stroke(255);
  for (int i = 0; i<n; i++)
  {
    float angle = map(i, 0, n, 0, TWO_PI);
    float angle2 = map((i+1)%n, 0, n, 0, TWO_PI);

    float x1 = radius * cos(angle) + xOff;
    float y1 = radius * sin(angle) + yOff;      
    float x2 = radius * cos(angle2) + xOff;
    float y2 =radius * sin(angle2) + yOff;
    
    line(x1, y1, x2, y2);
    line(x1, y1, xOff, yOff);
    line(x2, y2, xOff, yOff);
  }
}