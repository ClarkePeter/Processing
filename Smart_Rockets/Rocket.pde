class Rocket {
  PVector pos, vel, acc;
  DNA dna;
  float fitness = 0;
  Boolean completed = false;
  Boolean crashed = false;
  int stopCount;

  Rocket(int lifespan)
  {
    pos = new PVector(width/2, height);
    vel = new PVector(0, -1, 0);
    acc = new PVector(0, 0);
    this.dna = new DNA(lifespan);
    stopCount = lifespan;
  }

  Rocket(DNA dna)
  {
    pos = new PVector(width/2, height);
    vel = new PVector(0, 0, 0);
    acc = new PVector(0, 0);
    this.dna = dna;
    lifespan = dna.genes.length;
  }

  void applyForce(PVector force) {
    acc.add(force);
  }

  void update()
  {
    applyForce(dna.genes[count]);

    float d = dist(pos.x, pos.y, target.x, target.y);
    if (d < 20)
    {
      completed = true;
      pos = target;
      stopCount = count;
    }

    if (!completed && !crashed)
    {
      vel.add(acc);
      vel.limit(4);
      pos.add(vel);
      acc.mult(0);
    }

    if (pos.x > rx && pos.x < rx + rw && pos.y > ry && pos.y < ry + rh)
    {
      crashed = true;
    }

    if (pos.x > width || pos.x < 0 || pos.y > height|| pos.y <0)
    {
      crashed = true;
    }
  }

  void calcualteFitness()
  {

    float d = dist(pos.x, pos.y, target.x, target.y);
    fitness = map(d, 0, width, width, 0);
    if (completed)
    {
      fitness *= 50;// * (lifespan / stopCount);
    }

    if (crashed)
    {
      fitness /= 50;
    }
  }

  void show() {
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(vel.heading());
    rectMode(CENTER);
    noStroke();
    fill(255, 200 );
    rect(0, 0, 25, 5);
    rectMode(CORNER);
    popMatrix();
  }
}