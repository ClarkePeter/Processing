class Blob {
  PVector pos;
  float r;
  PVector vel;

  Blob(float x, float y, float r) {
    pos = new PVector(x, y);
    this.r = r;
    vel = PVector.random2D();
    vel.mult(random(2, 5));
  }

  void update() {
    this.pos.add(this.vel);

    if (pos.x>width || pos.x < 0) {
      vel.x *= -1;
    }

    if (pos.y>height || pos.y < 0) {
      vel.y *= -1;
    }
  }

  void show() {
    noFill();
    stroke(0);
    strokeWeight(1);
    ellipse(pos.x, pos.y, r*2, r*2);
  }
}