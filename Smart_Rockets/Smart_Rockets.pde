
int popSize = 25;
int lifespan = 600;
PVector target;

int count = 0;
int rx = 150;
int ry = 400;
int rw = 300;
int rh = 40;

float maxForce = 0.2f;

Population population;

void setup() {
  size(800, 600);
  population = new Population(popSize, lifespan);
  target = new PVector(width/2, 300);
}

void draw() {
  background(0);
  count++;

  if (count >= lifespan) {
    //population = new Population(popSize, lifespan);
    population.evaluate();
    population.selection();
    count = 0;
  }
  fill(255);
  rect(rx, ry, rw, rh);
  ellipse(target.x, target.y, 20, 20);

  population.update(); 
  population.show();
}