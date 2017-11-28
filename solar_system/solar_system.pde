import peasy.*;
import peasy.org.apache.commons.math.*;
import peasy.org.apache.commons.math.geometry.*;

Planet sun;
PeasyCam cam;

PImage sunTexture;
PImage[] textures = new PImage[3];

void setup() {

  sunTexture = loadImage("sun.jpg");  
  textures[0] = loadImage("mars.jpg");  
  textures[1] = loadImage("earth.jpg");  
  textures[2] = loadImage("mercury.jpg");

  size(600, 600, P3D);
  sun = new Planet(100, 0, 0, sunTexture);
  sun.spawnMoons(5, 0);
  cam =new PeasyCam(this, 500);
}

void draw() {
  background(0);
  pointLight(255, 255, 255, 0, 0, 0);
  int z = mouseX;
  pointLight(255, 255, 255, -50, -50, z);
  pointLight(255, 255, 255, 50, -50, z);
  pointLight(255, 255, 255, 50, 50, z);
  pointLight(255, 255, 255, -50, 50, z);
  sun.orbit();
  sun.show();
}