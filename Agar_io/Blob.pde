class Blob {
  PVector pos;
  float radius;
  
  Blob(float x, float y, float r)
  {
    pos = new PVector(width/2, height/2);
    pos.x = x;
    pos.y = y;
    radius = r;
  }
  
  void show()
  {
    fill(255);
    ellipse(pos.x, pos.y, radius, radius);
  }
  
  void update(){
    PVector vel = new PVector(mouseX - width/2, mouseY-height/2);
    vel.setMag(3);
    pos.add(vel);
  }
}