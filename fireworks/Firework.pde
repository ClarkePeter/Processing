

class Firework {
  Particle firework;
  Boolean exploded;
  float hu;

  ArrayList<Particle> particles;

  Firework() {
    hu = random(255);
    firework = new Particle(random(width), height, false, hu);
    particles = new ArrayList<Particle>();
    exploded = false;
  }

  Boolean done()
  {
    return(particles.size() <=0 && exploded);
    //return exploded;//(exploded && particles.size() == 0);
  }

  void update() 
  {
    ArrayList<Integer> removeIndex = new ArrayList<Integer>();

    for (Particle p : particles)
    {
      p.applyForce(gravity);
      p.update();
      if (p.done()) {
        //remove p
        removeIndex.add(particles.indexOf(p));
      }
    }

    for (int i = removeIndex.size() - 1; i>=0; i--)
    {
      particles.remove((int)removeIndex.get(i));
    }


    if (!exploded)
    {
      firework.applyForce(gravity);
      firework.update();
      firework.show();

      if (firework.vel.y >= 0)
      {
        exploded = true;
        Explode();
      }
    }
  }


  void Explode()
  {
    for (int i=0; i<100; i++)
    {
      particles.add(new Particle(firework.pos.x, firework.pos.y, true, hu));
    }
  }

  void show() {
    if (!exploded) {
      firework.show();
    }
    for (Particle p : particles)
    {
      p.show();
    }
  }
}