PVector[] cities;
int numOfCities = 5;

float recordDistance;
int[] bestEver;

int[] order;
int[] population;

float totalPermutations;
float count;

void setup()
{
  size(400, 600);
  cities = new PVector[numOfCities];
  order = new int[numOfCities];
  for (int i=0; i<numOfCities; i++)
  {
    cities[i] = new PVector(random(width), random(height/2));
    order[i] = i;
  }

  float d = CalcDistance(cities, order);
  recordDistance = d;

  bestEver = slice(order);

  totalPermutations = Factorial(numOfCities);
  count=0;
}

PVector[] slice(PVector[] a, int i, int j)
{
  PVector[] temp = new PVector[j-i];
  for (int k = 0; k<j; k++)
  {
    temp[k] = a[k+i];
  }

  return temp;
}

public PVector[] slice(PVector[] a)
{
  return slice(a, 0, a.length);
}


int[] slice(int[] a, int i, int j)
{
  int[] temp = new int[j-i];
  for (int k = 0; k<j; k++)
  {
    temp[k] = a[k+i];
  }

  return temp;
}

public int[] slice(int[] a)
{
  return slice(a, 0, a.length);
}


void draw()
{

  count++;



  background(0);
  stroke(0,255,0);
  noFill();
  strokeWeight(1);
  beginShape();
  for (int i = 0; i<order.length; i++)
  {
    int n = order[i];
    vertex(cities[n].x, cities[n].y);
  }
  endShape();



  stroke(255, 0, 255);
  noFill();
  strokeWeight(4);
  beginShape();
  for (int i = 0; i<order.length; i++)
  {
    int n = bestEver[i];
    vertex(cities[n].x, cities[n].y);
  }
  endShape();

  float d = CalcDistance(cities, order);
  if (d < recordDistance) {
    recordDistance = d;
    bestEver = slice(order);
  }
  fill(255);
  strokeWeight(1);

  for (PVector c : cities)
  {
    ellipse(c.x, c.y, 8, 8);
  }

  textSize(64);
  stroke(255, 0, 255);
  fill(255);
  strokeWeight(1);

  float percentComp = 100 * count / totalPermutations;

  fill(255);
  text(nf(percentComp, 1, 2) + "%", 0, height-50);

  nextOrder();
}


int Factorial(int n) {
  if (n==1) {
    return 1;
  } else {
    return n*Factorial(n-1);
  }
}

void Swap(PVector[] a, int i, int j)
{
  PVector temp = a[i];
  a[i] = a[j];
  a[j] = temp;
}

float CalcDistance(PVector[] p, int[] o) {
  float sum = 0;
  for (int i = 0; i < order.length-1; i++)
  {
    PVector cityA = p[o[i]];
    PVector cityB = p[o[i+1]];

    float d = dist(cityA.x, cityA.y, cityB.x, cityB.y);
    sum += d;
  }

  return sum;
}



int[] appendInts(int[] a, int[] b)
{
  int[] temp = new int[a.length + b.length];

  for (int i = 0; i<a.length; i++)
  {
    temp[i] = a[i];
  }

  for (int i = 0; i<b.length; i++)
  {
    temp[i+a.length] = b[i];
  }

  return temp;
}

int[] reverseInts(int[] a)
{
  int[] temp = new int[a.length];
  for (int i = 0; i<a.length; i++)
  {
    temp[i] = a[a.length - i- 1];
  }

  return temp;
}

int[] getStartOfArray(int[]a, int b)
{
  if (b < a.length)
  {
    int[] temp = new int[b];
    for (int i=0; i<b; i++)
    {
      temp[i]= a[i];
    }

    return temp;
  } else {
    return null;
  }
}

int[] getEndOfArray(int[] a, int b)
{ 
  if (b < a.length)
  {
    int len = a.length - b;

    int[] temp = new int[len];

    for (int i=0; i<len; i++)
    {
      temp[i] = a[b+i];
    }

    return temp;
  } else {
    return null;
  }
}

int[] swap(int[] a, int i, int j) {
  int temp = a[i];
  a[i] = a[j];
  a[j] = temp;

  return a;
}

void PrintInt(int[] a1) {
  Boolean first = true;

  print("[");
  for (int a : a1) {
    if (first) {
      first = false;
      print(a);
    } else {
      print(", " + a);
    }
  }
  println("]");
}


void nextOrder()
{
  int largestI = -1;
  for (int i = 0; i<order.length -1; i++)
  {
    if (order[i] < order[i+1])
    {
      largestI = i;
    }
  }

  if (largestI == -1)
  {
    noLoop();
    println("Finished");
  } else {

    int largestJ = -1;
    for (int j= 0; j<order.length; j++)
    {
      if (order[j] > order[largestI]) {
        largestJ = j;
      }
    }
    if (largestJ != -1)
    {
      order = swap(order, largestI, largestJ);

      int[] endArray = getEndOfArray(order, largestI+1);
      order = getStartOfArray(order, largestI+1);
      endArray = reverseInts(endArray);

      order = appendInts(order, endArray);
    }
  }
}