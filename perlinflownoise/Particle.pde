class Particle {
  PVector pos;
  PVector vel;
  PVector acc;
  float maxSpeed = 2;
  PVector prevPos;

  Particle()
  {
    pos = new PVector(random(width), random(height));
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
    prevPos = pos;
  }

  void update() {
    vel.add(this.acc);
    vel.limit(maxSpeed);
    pos.add(this.vel);
    prevPos = pos;
    acc.mult(0);
  }

  void applyForce(PVector force) {
    acc.add(force);
  }

  void show() {
   //strokeWeight(1);
   // stroke(0, 255);
    noStroke();
    fill(0,5);
    //point(pos.x, pos.y);
    //line(pos.x, pos.y, prevPos.x, prevPos.y);
    ellipse(pos.x, pos.y, 5, 5);
    updatePrev();
  }

  void updatePrev()
  {
    prevPos.x = pos.x;
    prevPos.y = pos.y;
  }

  void edges() {
    if (pos.x > width) {
      pos.x = 0;
      updatePrev();
    }
    if (pos.x < 0) {
      pos.x = width-1;
      updatePrev();
    }
    if (pos.y > height) {
      pos.y = 0;
      updatePrev();
    }
    if (pos.y < 0) {
      pos.y = height-1;
      updatePrev();
    }
  }

  void follow(PVector[] flow) {
    int x = floor(pos.x / scl);
    int y = floor(pos.y / scl);

    int index = x + y * cols;
    PVector force = flow[index];
    applyForce(force);
  }
}