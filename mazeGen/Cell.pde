class Cell {
  int i, j;
  int w;

  //top right bottom left
  Boolean[] walls = {true, true, true, true};
  Boolean visited = false;

  Cell(int i, int j, int w)
  {
    this.i = i;
    this.j = j;
    this.w = w;
  }

  void show()
  {
    noFill();
    stroke(0);
    strokeWeight(1);
    float x = i*w;
    float y = j*w;

    if (walls[0])
      line(x, y, x+w, y);
    if (walls[1])
      line(x+w, y, x+w, y+w);
    if (walls[2])
      line(x+w, y+w, x, y+w);
    if (walls[3])
      line(x, y+w, x, y);

    if (visited) {
      fill(255,255,255,100);
      noStroke();
      rect(x, y, w, w);
    }
  }

  Cell checkNeighbors()
  {
    Cell[] neighbors =null;
    Cell top = null;
    Cell left = null;
    Cell right = null;
    Cell bottom = null;

    int tempIndex = index(i, j-1);
    if (tempIndex != -1) {
      top = cells[index(i, j-1)];
    }

    tempIndex = index(i+1, j);
    if (tempIndex != -1) {
      right = cells[index(i+1, j)];
    }

    tempIndex = index(i, j+1);
    if (tempIndex != -1) {
      bottom = cells[index(i, j+1)];
    }
    tempIndex = index(i-1, j);
    if (tempIndex != -1) {
      left = cells[index(i-1, j)];
    }

    if (top != null)
    {
      if (!top.visited) {
        neighbors = addCellArray(neighbors, top);
      }
    }

    if (right != null)
    {
      if (!right.visited) {
        neighbors = addCellArray(neighbors, right);
      }
    }

    if (bottom != null)
    {
      if (!bottom.visited) {
        neighbors = addCellArray(neighbors, bottom);
      }
    }

    if (left != null)
    {
      if (!left.visited) {
        neighbors = addCellArray(neighbors, left);
      }
    }

    if (neighbors != null)
    {

      if (neighbors.length > 0)
      {
        int r = floor(random(0, neighbors.length));

        return neighbors[r];
      } else {
        return null;
      }
    } else {
      return null;
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

  int index(int ia, int ja) {
    if (ia < 0 || ja < 0 || ia > cols - 1 || ja > rows -1) {
      return -1;
    }
    return ia + ja * cols;
  }

  void highlight()
  {
    noStroke();
    float x = i*w;
    float y = j*w;
    fill(255, 255, 255);
    rect(x, y, w, w);
  }

}