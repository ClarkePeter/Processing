class Drop {
  float x, y;
  float ySpeed;
  float len;
  float z;

  Drop()
  {
    x = random(width);
    y = random(-height, 0);
    float expRan = random(0, 1);
    z = log(1-expRan) / (-1.5);
    z *= 4;
    len = map(z, 0, 20, 10, 20);
    ySpeed = map(z, 0, 20, 1, 20);
  }

  void fall() {
    y += ySpeed;
    float grav = map(z, 0, 20, 0, 0.2);
    ySpeed += grav;

    if (y > height) {
      y = random(-200, -100);
    float expRan = random(0, 1);
    z = log(1-expRan) / (-1.5);
    z *= 4;
      len = map(z, 0, 20, 10, 20);
      ySpeed = map(z, 0, 20, 1, 20);
    }
  }


  void show() {
    float thick = map(z, 0, 20, 1, 4);
    strokeWeight(thick);
    stroke(138, 43, 226);
    line(x, y, x, y+len);
  }
}