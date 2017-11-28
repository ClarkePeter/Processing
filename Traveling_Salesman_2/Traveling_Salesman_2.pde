PVector[] cities; //<>//
int numOfCities = 15;

float recordDistance;
int[] bestEver;

int numOfPop = 100;

int[][] population;
float[] fitness;

int mutations = 0;

void setup()
{

  size(800, 600);
  recordDistance = Float.MAX_VALUE;
  cities = new PVector[numOfCities];
  int[] order = new int[numOfCities];
  fitness = new float[numOfPop];

  for (int i=0; i<numOfCities; i++)
  {
    cities[i] = new PVector(random(width), random(height));
    order[i] = i;
  }

  population = new int[numOfPop][numOfCities];

  for (int i=0; i<numOfPop; i++)
  {
    population[i] = shuffle(slice(order), 100);
  }
  calcFitness();
}


void draw()
{
  mutations++;
  background(0);

  // GA
  calcFitness();
  normalizeFitness();
  nextGeneration();

  println(mutations);

  // DISPLAY CITIES
  stroke(255, 0, 255);
  noFill();
  strokeWeight(4);
  beginShape();
  for (int i = 0; i<bestEver.length; i++)
  {
    int n = bestEver[i];
    vertex(cities[n].x, cities[n].y);
  }
  endShape();

  fill(255);
  strokeWeight(1);

  for (PVector c : cities)
  {
    ellipse(c.x, c.y, 8, 8);
  }
}