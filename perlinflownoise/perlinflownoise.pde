float noiseZoom = 0.05;
int scl = 10;
int cols, rows;

float fr;
float zOff = 0;

PVector[] flowField;

Particle[] particles;

void setup() {
  size(800, 600);
  pixelDensity(1);

  cols = floor(width / scl);
  rows = floor(width / scl);
  flowField = new PVector[cols * rows];

  particles = new Particle[10000];
  for (int i =0; i<particles.length; i++)
  {
    particles[i] = new Particle();
  }
  background(255);
}

void draw() {
 // background(255);
  for (int y = 0; y < rows; y++)
  {
    for (int x = 0; x < cols; x++)
    {
      float angle = noise(x * noiseZoom, y * noiseZoom, zOff * noiseZoom) * TWO_PI*2.5;
      PVector v = PVector.fromAngle(angle);
      v.setMag(0.3);
      int index = x + y * cols;
      flowField[index] = v;
      stroke(0, 255);
      pushMatrix();
      translate(x * scl, y * scl);
      rotate(v.heading());
      //line(0, 0, scl, 0);
      popMatrix();
    }

    //zOff += 0.001f;
  }

  zOff += 0.02f;
  for (Particle p : particles) {
    p.follow(flowField);
    p.update();
    p.edges();
    p.show();
  }

  println(frameRate);
  /*
  fill(255, 0, 255, 255);
   stroke(255);
   textSize(32);
   fr = frameRate;
   textAlign(LEFT, TOP);
   text(String.valueOf((int)fr), 0, 0);*/
}