class Planet {
  float radius;
  float angle;
  float orbitSpeed;
  float distance;
  Planet[] planets;
  PVector v;
  PShape globe;

  Planet(float r, float d, float o, PImage img) {
    v = PVector.random3D();
    this.radius = r; 
    this.angle = random(0, TWO_PI);
    this.distance = d;
    v.mult(this.distance);
    orbitSpeed = 10 * (o / r);
    noStroke();
    noFill();
    globe = createShape(SPHERE, radius);
    globe.setTexture(img);
  }

  void orbit() {
    angle += orbitSpeed;
    if (planets != null) {
      for (int i = 0; i < planets.length; i++)
      {
        planets[i].orbit();
      }
    }
  }

  void spawnMoons(int total, int level) {
    planets = new Planet[total];
    for (int i = 0; i < planets.length; i++)
    {
      float r = (radius / (2*(level+1)));
      float d = random(radius+r, 2*(radius+r));
      float o = random(0.01, 0.04);
      
      planets[i] = new Planet(r, d, o, textures[(int)(random(0,textures.length))]);
      if (level < 1) {
        int num = int(random(0,3));//int(random(0, 4));
        planets[i].spawnMoons(num, level+1);
      }
    }
  }

  void show() {
    pushMatrix();
    noStroke();
    fill(255);
    
    PVector v2 = new PVector(1,0,1);
    PVector p = v.cross(v2);
    
    rotate(angle,p.x,p.y,p.z);
    
    
    translate(v.x,v.y,v.z);
    rotate(angle,p.x,p.y,p.z);
    
    //ellipse(0, 0, radius*2, radius*2);
    //sphere(radius);
    shape(globe);
    
    if (planets != null)
    {
      for (int i=0; i<planets.length; i++)
      {
        planets[i].show();
      }
    }
    popMatrix();
  }
}