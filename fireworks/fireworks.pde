PVector gravity;
ArrayList<Firework> fireworks;

void setup() {
  size(800, 600);
 //   fullScreen();
  colorMode(HSB);
  stroke(255);
  strokeWeight(4);
  gravity = new PVector(0, 0.2);
  fireworks = new ArrayList<Firework>();
  background(0);

}

void draw() {

  ArrayList<Integer> removeIndex = new ArrayList<Integer>();

  if (random(1) < 0.15)
    fireworks.add(new Firework());

  fill(0, 50);
  noStroke();
  rect(0, 0, width, height);
  for (Firework f : fireworks)
  {
    f.update();
    f.show();


    if (f.done())
    {
      removeIndex.add(fireworks.indexOf(f));
    }
  }

  for (int i = removeIndex.size() - 1; i>=0; i--)
  {
    fireworks.remove((int)removeIndex.get(i));
  }
}