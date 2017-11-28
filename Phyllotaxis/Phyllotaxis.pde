int maxN = 5000;
float c = 5.0f;
float time = 0;

void setup() {
  size(500, 500,P2D);
  //fullScreen();
  noStroke();
  colorMode(HSB);
  //frameRate(60);
}

void draw() {
  background(0);
  fill(255);
  translate(width /2, height/2);
  for(int i = 0; i<maxN; i++)
  {
    float thi = i * time;
    float r = c * sqrt(i);
    
    fill((thi)%255,255,255);
    int x = (int)(r * cos(thi));
    int y = (int)(r * sin(thi));
    
    ellipse(x,y,5,5);
    
  }
  time += 0.0001;
  
  // calc r
  
  // calc thi
  //thi = n
}