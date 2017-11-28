void calcFitness() {
  for (int i=0; i<numOfPop; i++)
  {
    float d = CalcDistance(cities, population[i] );
    if (d < recordDistance) {
      recordDistance = d;
      bestEver = population[i];
    }
    fitness[i] = 1/d;
  }
}

void normalizeFitness()
{
  float sum = 0;
  for (int i = 0; i<fitness.length; i++)
  {
    sum += fitness[i];
  }
  for (int i = 0; i<fitness.length; i++)
  {
    fitness[i] = fitness[i]/sum;
  }
}

void nextGeneration()
{
  int[][] newPopulation = new int[numOfPop][numOfCities];

  for (int i = 0; i<numOfPop; i++) {
    int[] order = pickOne(population, fitness);
    order = mutate(order, 0.1f);
    newPopulation[i] = order;
  }

  population = newPopulation;
}

int[] pickOne(int[][] pop, float[] fit) {
  int index = 0;
  float r = random(1);

  while (r > 0)
  {
    if (index < 0)
      index = 0;

    r = r - fit[index];

    index++;
  }
  index--;

  if (index > 0)
  {
    return slice(pop[index]);
  } else {
    return slice(pop[0]);
  }
}

int[] mutate(int[] order, float rate)
{
  shuffle(order, 1);
  return order;
}