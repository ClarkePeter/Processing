
class Population {
  Rocket[] rockets;

  ArrayList<Rocket> matingPool;

  Population(int popSize, int lifespan) {
    rockets = new Rocket[popSize];
    for (int i =0; i<rockets.length; i++)
    {
      rockets[i] = new Rocket(lifespan);
    }
    matingPool = new ArrayList<Rocket>();
    resetMatingPool();
  }

  void update() {
    for (Rocket r : rockets)
    {
      r.update();
    }
  }

  void show() {
    for (Rocket r : rockets)
    {
      r.show();
    }
  }

  void resetMatingPool()
  {
    
    if(matingPool != null)
    matingPool.clear();
  }

  void evaluate() {
    float maxFit = 0;

    for (Rocket r : rockets)
    {
      r.calcualteFitness();
      if (r.fitness > maxFit)
        maxFit = r.fitness;
    }

    for (Rocket r : rockets)
    {
      r.fitness /= maxFit;
    }
    
    // Average Fitness
    
    
    
    println(maxFit);


    resetMatingPool();
    for (Rocket r : rockets)
    {
      float n =r.fitness * 100;

      for (int j = 0; j<(int)n; j++)
      {
        matingPool.add(r);
      }
    }
  }

  void selection() {
    Rocket[] newRockets = new Rocket[rockets.length];

    for (int i = 0; i<rockets.length; i++)
    {
      int index = (int)random(matingPool.size());      

      DNA parentA = matingPool.get(index).dna;
      index = (int)random(matingPool.size());
      DNA parentB = matingPool.get(index).dna;

      DNA child = parentA.crossOver(parentB);
      child.mutation();
      newRockets[i] = new Rocket(child);
    }
    rockets= newRockets;
  }
}