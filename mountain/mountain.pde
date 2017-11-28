int seedNum; //<>//
PImage background; 

void setup() {
  size(1000, 500);
  seedNum = 100;
  colorMode(HSB);
  background = loadImage("bak.png");
}

void draw() {
  image(background, 0, 0);
  loadPixels();

  // drawMount((floor(0.15*height)), 200, color(27, 7, 150));
  for (int i = 8; i>0; i--)
  {
    noiseSeed(i+seedNum);
    drawMount(height - (i*80 - 5*i*i), 100, color(27, 7, i*15));
  }
  
  for(int i = 0; i<width; i++)
  {
    int high = 0;
    while(pixels[i+high*width] <= -5000000)
    {
      high++;
    }
    print(high);
    
    pixels[i+high*width] = color(255, 255,255,255);
    
  }

  updatePixels();
  
}

void drawMount(int offset, int range, color c)
{  
  for (int i = 0; i<width; i++)
  {
    int high = floor(offset + range * noise(i *0.01));
    if (high < height)
    {
      for (int j = high; j<height; j++)
      {

        float hu = hue(c);
        float sat = saturation(c);
        float bri = brightness(c)  +map(j, 0, height, 0, 100); //floor(0.5*(height - j*1.2));
        float alpha = 230;

        pixels[i+(j)*width] = color(hu, sat, bri, alpha);
      }
    }
  }
}

void mousePressed()
{
  seedNum = floor(random(1000));
}