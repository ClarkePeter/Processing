import java.util.Collections;

PImage img;
ArrayList<ColorCounter> cc;

void setup()
{
  cc = new ArrayList<ColorCounter>();

  size(1000, 800); 
  img = loadImage("image.png"); //<>//

  for (int i = 0; i < img.width; i++)
  {
    for (int j  = 0; j < img.height; j++)
    {
      checkPixel(img.get(i, j));
    }
  }
  //order(); //<>//
}

void checkPixel(color col)
{
  if (cc.size() == 0)
  {
    cc.add(new ColorCounter(col));
  } else {
    Boolean found = false; 
    for (int i=0; i<cc.size(); i++)
    {
      ColorCounter colCount = cc.get(i); 

      if (colCount.col == col)// - band && currHue < checkHue + band)
      {
        colCount.count = colCount.count + 1; 
      }
    }
    if (!found)
    {
      cc.add(new ColorCounter(col));
    }
  }
}


void order()
{
  cc.sort(new AComparator());
}

void draw()
{
  background(255); 

  int numBars = cc.size(); 

  image(img, 0, 0);
  for (int i=0; i<numBars; i++)
  {
    fill(cc.get(i).col); 
    arc(width / 2, height - 150, 300, 300, 0, TWO_PI); 
  }
}


class AComparator implements java.util.Comparator {
  int compare(Object o1, Object o2) {
    int c1 = ((ColorCounter) o1).count; 
    int c2 = ((ColorCounter) o2).count; 

    return c2-c1;
  }
}