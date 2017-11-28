import peasy.*; //<>//
import peasy.org.apache.commons.math.*;
import peasy.org.apache.commons.math.geometry.*;

PVector[][] verticies;

int longCuts = 20;
int latCuts = 20;

float radius;

float time;

PeasyCam cam;

void setup() {
  cam = new PeasyCam(this, 100);
  size(500, 500, P3D);
  radius = 100;
  time = 0;
  verticies = new PVector[longCuts+1][latCuts+1];

  float inclination, azimuth;

  for (int i=0; i<latCuts+1; i++)
  {
    for (int j=0; j<longCuts+1; j++)
    {
      inclination = map(i, 0, latCuts, 0, PI);
      azimuth = map(j, 0, longCuts, -PI, PI);

      float x = radius * sin(inclination) * cos(azimuth);
      float y   = radius * sin(inclination) * sin(azimuth);
      float z = radius * cos(inclination);


      verticies[i][j] = new PVector(x, y, z);
    }
  }
}

void draw() {
  background(51);

  lights();
  spotLight(255, 255, 255, 1000, 1000, 1000, 0, -1, 0, TWO_PI, 600);

  for (int i = 0; i < latCuts; i++)
  {     
    fill(0, 255, 255);
    beginShape(TRIANGLE_STRIP);
    for (int j = 0; j < longCuts+1; j++)
    {     
      try {
        PVector v1 = verticies[i][j];
        vertex(v1.x, v1.y, v1.z);

        PVector v2 = verticies[i+1][j];
        vertex(v2.x, v2.y, v2.z);

        float normX, normY, normZ;  
        normX =v1.y * v2.z - v1.z*v2.y;
        normY =v1.z * v2.x - v1.x*v2.z;
        normZ =v1.x * v2.y - v1.y*v2.x;
        PVector norm = new PVector(normX, normY, normZ);
        norm.normalize();

        normal(norm.x, norm.y, norm.z);
      } 
      catch(Exception e) {
        println(i + "-" + j);
      }
    }
    endShape();
  }
}