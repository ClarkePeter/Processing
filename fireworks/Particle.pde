
class Particle {
  PVector pos;
  PVector vel;
  PVector acc;
  Boolean firework;
  float lifespan;
  float hu;

  Particle(float x, float y, Boolean exploder,float hu)
  {
    this.pos = new PVector(x, y);
    this.acc = new PVector(0, 0);
    this.hu = hu;
    this.firework = !exploder;
    lifespan = random(100, 255);

    if (!exploder)
      this.vel = new PVector(0, random(-30, -5)); 
    else
    {
      this.vel = PVector.random2D();
      this.vel.mult(random(2, 50));
    }
  }

  Boolean done()
  {
    return lifespan<=0?true:false;
  }

  void applyForce(PVector force) {
    acc.add(force);
  }

  void update() {

    if (!firework)
    {
      this.vel.mult(0.8);
      lifespan -= 4;
    }

    vel.add(acc);
    pos.add(vel);
    acc.mult(0);
  }

  void show() {
    if (!firework)
    {
      strokeWeight(2);
      stroke(hu,255,255, lifespan);
    } else {
      strokeWeight(4);
      stroke(hu,255,255,255);
    }
    point(pos.x, pos.y);
  }
}