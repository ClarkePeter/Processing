Star[] stars = new Star[800];
float speed;

void setup() {
  size(800, 800);
  for (int i=0; i<stars.length; i++)
  {
    stars[i] =new Star();
  }
}

void draw() {
  speed =20;
  background(0);
 translate( width * mouseX  / width, height * mouseY / height);
  for (int i=0; i<stars.length; i++)
  {
    stars[i].update();
    stars[i].show();
  }
}