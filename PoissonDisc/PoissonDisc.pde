float r = 5;
int k = 30;

float w;
PVector[] grid;
ArrayList<PVector> active;

int cols;
int rows;
ArrayList<PVector> orded;



void setup()
{
  size(800, 600);
  background(0);
  fill(255);
  stroke(255);
  colorMode(HSB);
  // Step 0
  w = r / sqrt(2);
  cols = floor(width /w);
  rows = floor(height /w);

  grid = new PVector[floor(cols * rows)];
  active = new ArrayList<PVector>();
orded = new ArrayList<PVector>();
  for (int i=0; i<cols * rows; i++)
  {
    grid[i] = new PVector(-1, -1);
  }

  //Steop 1
  int x = floor(random(width));
  int y = floor(random(height));
  x = width/2;
  y = height/2;
  int i = floor(x / w);
  int j = floor(y/w);

  PVector pos = new PVector(x, y);

  active.add(pos);
  
  grid[i+j*cols] = pos;
}

void draw()
{
  background(0);

  while (active.size() > 0)
  {
    int randIndex = floor(random(active.size()));
    PVector pos = active.get(randIndex);
    Boolean found = false;

    for (int n = 0; n<k; n++)
    {      
      PVector sample = PVector.random2D();
      float m = random(r, 2*r);
      sample.setMag(m);
      sample.add(pos);
      

      int col = floor(sample.x/w);
      int row = floor(sample.y/w);
      if (col+row*cols > 0 && col+row*cols < grid.length)
      {

        if (grid[col+row*cols].x == -1 && grid[col+row*cols].y == -1)
        {


          Boolean ok = true;

          for (int i = -1; i<=1; i++)
          {
            for (int j=-1; j<=1; j++)
            {
              int neiIndex = int(i + col + (j+row) * cols);
              if (neiIndex > 0 && neiIndex < grid.length)
              {
                PVector neighbor = grid[neiIndex];

                float d = PVector.dist(sample, neighbor);
                if (neighbor != null)
                {
                  if (neighbor.x != -1 && neighbor.y != -1)
                  {
                    if (d<r)
                    {
                      ok = false;
                    }
                  }
                }
              }
            }
          }
          if (col + row*cols >= grid.length || col+row*cols < 0)
          {
            ok = false;
          }
          if (ok)
          {
            grid[col + row*cols] = sample;
            active.add(sample);
            orded.add(sample);
            found = true;

            //break?
          }
        }
      }
    }

    if (!found)
    {
      //active.splice(r,1);
      active.remove(randIndex);
    }
  }


  for (int i= 0; i<orded.size(); i++)
  {
    //if (grid[i] != null)
    {
      //if (grid[i].x != -1 && grid[i].y != -1)
      {
        stroke((i/50)%360, 255, 255);
        // stroke(255);
        strokeWeight(r/2);
        point(orded.get(i).x, orded.get(i).y);
      }
    }
  }

  //for (PVector a : active)
  //{
  //  stroke(250, 0, 255);
  //  strokeWeight(1);
  //  point(a.x, a.y);
  //}
}