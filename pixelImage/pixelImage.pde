PImage img;
float pxSize = 30;
int cols, rows;



void setup() {
  size(512, 512);
  img = loadImage("moonwalk.jpg");
  cols = floor(img.width / pxSize + 1);
  rows = floor(img.height / pxSize+ 1);
  frameRate(10);
  noStroke();
}

void draw() {
  background(0);
  for (int x = 0; x<cols; x++)
  {
    for (int y = 0; y<rows; y++)
    {

      color c= img.get((int)(x*pxSize), (int)(y*pxSize));
      fill(c);  
      rect(x*pxSize, y*pxSize, pxSize, pxSize);
    }
  }
  //pxSize = (int)map(mouseX, 0, width, 1, width/2);
  if (pxSize > 1)
    pxSize -= 0.1;
  cols = floor(img.width / pxSize + 1);
  rows = floor(img.height / pxSize + 1);
}