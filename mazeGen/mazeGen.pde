int cols, rows;
int w = 25;
Cell[] cells;
Cell[] stack;
Cell current;
Boolean stopped;

void setup() {
  size(1850, 950);
  cols = floor(width / w);
  rows = floor(height / w);
  cells = new Cell[rows * cols];
  stopped = false;

  frameRate(200);

  for (int j = 0; j < rows; j++)
  {
    for (int i = 0; i < cols; i++)
    {
      cells[i + j * cols] = new Cell(i, j, w);
    }
  }

  // might have to fix for pointer
  current = cells[0];
}

void draw() {

  if (!stopped)
  {
      background(255);
    for (Cell c : cells)
    {
      c.show();
    }

    current.visited =true;
    //current.highlight();
    Cell next = current.checkNeighbors();
    if (next != null)
    {
      // Step 1
      next.visited = true;

      // Step 2
      stack = addCellArray(stack, current);

      // Step 3
      removeWall(current, next);

      // Step 4
      current = next;
    } else {
      if (stack != null)
      {
        if (stack.length != 0)
        {
          //remove cell;
          current = stack[stack.length -1];
          stack = pop(stack);
        }
      } else {
        colorMode(HSB);

        for (int i =0; i<cols; i++)
        {
          for (int j = 0; j<rows; j++)
          {

            //highlight(i, j, color(360 * sqrt(i*i + j*j)/ (cols), 100, 100));
          }
        }

        //  highlight((int)random(0, cols), (int)random(0, rows), color(255, 0, 255));
        //  highlight((int)random(0, cols), (int)random(0, rows), color(255, 255, 0));
        stopped =true;
        save("temp.jpg");
        // save
      }
    }
  }
}

void highlight(float i, float j, color c)
{
  noStroke();
  float x = i*w;
  float y = j*w;
  fill(c);
  rect(x, y, w, w);
}

Cell[] pop(Cell[] c)
{
  if (c.length > 1)
  {
    Cell[] temp = new Cell[c.length - 1];
    for (int i = 0; i<temp.length; i++)
    {
      temp[i] = c[i];
    }
    return temp;
  } else {
    return null;
  }
}

void removeWall(Cell a, Cell b)
{
  int x = a.i - b.i;
  if (x == 1) {
    a.walls[3] = false;
    b.walls[1] = false;
  } else if (x == -1) {
    a.walls[1] = false;
    b.walls[3] = false;
  }

  int y = a.j - b.j;
  if (y == 1) {
    a.walls[0] = false;
    b.walls[2] = false;
  } else if (y == -1) {
    a.walls[2] = false;
    b.walls[0] = false;
  }
}

Cell[] addCellArray(Cell[] ca, Cell c)
{

  Cell[] tempC =null;
  if (ca != null) {
    tempC= new Cell[ca.length + 1];
    for (int i=0; i<tempC.length - 1; i++)
    {
      tempC[i] = ca[i];
    }

    tempC[ca.length] =c;
  } else {
    tempC = new Cell[1];
    tempC[0] = c;
  }

  return tempC;
}