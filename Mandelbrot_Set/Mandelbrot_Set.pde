float minVal = -2;
float maxVal = 2;

void setup()
{
  size(400, 400);
  // background(0);
  pixelDensity(1);
}

void draw()
{
  background(255);
  int maxInterations = 50;
  loadPixels();
  for (int x = 0; x<width; x++)
  {
    for (int y = 0; y<height; y++)
    {

      float a = map(x, 0, width, minVal, maxVal);
      float b = map(y, 0, height, minVal, maxVal);

      int n = 0;

      float ca = a;
      float cb = b;

      while (n < maxInterations) {
        float aa = a* a - b*b;
        float bb = 2 * a * b;

        a = aa + ca;
        b = bb + cb;

        if (abs(a + b) > 16)
        {
          break;
        }

        n++;
      }


      int bright = int(map(n, 0, maxInterations, 0, 255));

      if (n == maxInterations)
      {
        bright = 0;
      }
      //if(n == 100)
      //{
      //  bright = 255;
      //}

      pixels[x+y*width] = color(bright, 5);
    }
  } 
  updatePixels();
}