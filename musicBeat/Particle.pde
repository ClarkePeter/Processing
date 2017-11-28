class Particle
{
  PVector pos, vel, acc;
  float size;
  int life;
  Boolean alive;

  Particle() {
    pos = new PVector(width/2, height/2);
    vel = PVector.random2D().mult(0.5);
    acc = new PVector(0, 0);
    size = random(1, 10);
    life = floor(random(10, 300));
    alive= true;
  }

  void update() {
    pos.add(vel);

    vel.add(acc);
    acc.mult(0);
    life--;
    if (pos.x < 0 || pos.x > width || pos.y < 0 || pos.y > height || life <=0)
    {
      alive = false;
    }
  }

  void applyForce(PVector p)
  {
    acc.add(p);
  }

  void show() {
    fill(255, life);
    ellipse(pos.x, pos.y, size, size);
  }
}