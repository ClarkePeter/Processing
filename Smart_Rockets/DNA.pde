class DNA {

  int len;
  PVector[] genes;

  DNA(int lifespan) 
  {
    genes = new PVector[lifespan];
    for (int i=0; i<lifespan; i++)
    {
      genes[i] = PVector.random2D();
      genes[i].setMag(maxForce);
    }
  }

  DNA(PVector[] genes) 
  {
    this.genes = genes;
  }

  DNA crossOver(DNA partner)
  {
    float mid = floor(random(0, genes.length));
    PVector[] newGenes = new PVector[lifespan];

    for (int i = 0; i<genes.length; i++)
    {
      if (i>mid) {
        newGenes[i] = genes[i];
      } else
      {
        newGenes[i] = partner.genes[i];
      }
    }
    return new DNA(newGenes);
  }

  void mutation() {
    for (int i = 0; i<genes.length; i++) {
      if (random(1) < 0.01) {
        genes[i] = PVector.random2D();
        genes[i].setMag(maxForce);
      }
    }
  }
}