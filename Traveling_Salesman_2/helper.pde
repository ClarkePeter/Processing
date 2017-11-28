int[] shuffle(int[]a, int num)
{
  int[] temp = null;

  for (int i=0; i<num; i++)
  {
    int indexA = floor(random(a.length));
    int indexB = floor(random(a.length));

    temp = swap(a, indexA, indexB);
  }

  return temp;
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

float CalcDistance(PVector[] p, int[] o) {
  float sum = 0;
  for (int i = 0; i < p.length-1; i++)
  {
    PVector cityA = p[o[i]];
    PVector cityB = p[o[i+1]];

    float d = dist(cityA.x, cityA.y, cityB.x, cityB.y);
    sum += d;
  }

  return sum;
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

void PrintInt(int[][] a1) {
  
  for(int i = 0; i<a1.length; i++)
  {
    PrintInt(a1[i]);
  }
  
}