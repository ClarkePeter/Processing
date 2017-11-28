int[] vals = {0, 1, 2,3,4,5,6,7,8,9};

void setup() {
  size(400, 300);
}

void draw() {
  background(0);
  int largestI = -1;
  for (int i = 0; i<vals.length -1; i++)
  {
    if (vals[i] < vals[i+1])
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
    for (int j= 0; j<vals.length; j++)
    {
      if (vals[j] > vals[largestI]) {
        largestJ = j;
      }
    }
    if (largestJ != -1)
    {
      vals = swap(vals, largestI, largestJ);

      int[] endArray = getEndOfArray(vals, largestI+1);
      vals = getStartOfArray(vals, largestI+1);
      endArray = reverseInts(endArray);
      
      vals = appendInts(vals, endArray); 
      
      //textSize(64);
      //String s = "";
      //for(int i=0; i < vals.length; i++)
      //{
      //  s += vals[i];
      //}
      
      //fill(255);
      //text(s,20,height/2);
      
    }
  }
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