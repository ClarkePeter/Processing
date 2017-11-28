class Hexi {
  float posX, posY;
  float scale;

  Hexi() {
    posX = 0;
    posY = 0;
    scale = 1;
  }

  Hexi(float x, float y, float s) {
    posX = x;
    posY = y;
    scale = s;
  }

  void draw() {
    stroke(255,255,255,0);
    fill(255);

    beginShape(TRIANGLE_FAN);
    vertex(posX, posY);
    vertex(posX, posY - scale);
    vertex(posX + scale * cos(PI/ 6), posY - scale * sin(PI / 6));
    vertex(posX + scale * cos(PI/ 6), posY + scale * sin(PI / 6)); 
    vertex(posX, posY + scale);
    vertex(posX - scale * cos(PI/ 6), posY + scale * sin(PI / 6)); 
    vertex(posX - scale * cos(PI/ 6), posY - scale * sin(PI / 6));
    vertex(posX, posY - scale);
    endShape();
  }
}