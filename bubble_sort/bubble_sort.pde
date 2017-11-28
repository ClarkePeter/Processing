int[] numbers;
int num = 20;
int count = 0;
Boolean finished;

void setup() {
  size(1800, 500);

  numbers = new int[num];
  for (int i=0; i<num; i++)
  {
    numbers[i] = i;
  }

  for (int i = 0; i<num*3; i++)
  {
    swap(floor(random(num)), floor(random(num)));
  }

  finished = false;
}

void draw() {
  background(0);
  noStroke();
  fill(255, 0, 255);

  if (numbers[count] > numbers[count+1])
  {
    swap(count, count+1);
  }

  count++;
  if (count >= num - 1)
  {
    count = 0;
    num--;
  }



  if (num <= 1)
  {
    finished = true;
  }
  
  for (int i = 0; i<numbers.length; i++)
  {
    rect((i*width)/numbers.length, 0, width/numbers.length, numbers[i]*height/numbers.length);
  }
}

void swap(int i, int j)
{
  int temp = numbers[i];
  numbers[i] = numbers[j];
  numbers[j]= temp;
}