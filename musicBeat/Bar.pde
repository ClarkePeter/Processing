class Bar {
  float angle;
  float barWidth;
  float barHeight;
  
  Bar(float a, float h, float w)
  {
    angle = a;
    barHeight = h;
    barWidth = w;
  }
  
  void update(float h){
    barHeight = h;
  }
  
  void show() {
    pushMatrix();
    translate(width /2, height /2);
    rotate(angle);
    noStroke();
    fill(0,0,255,255);
    rect(0, 0, barWidth, barHeight);
    popMatrix();
  }
  
}