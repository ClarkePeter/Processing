class Ball {
  
  PVector pos;
  PVector vel;
  PVector acc;
  
  color col;
  
  Ball(){
    pos = new PVector(random(width),random(height));
    vel = PVector.random2D().mult(random(10));
    acc = new PVector(0,0);
    
    col = color(random(255), random(255), random(255));
  }
}