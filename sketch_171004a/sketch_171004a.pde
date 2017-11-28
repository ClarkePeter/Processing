PImage img;
long extend = 3032970;
long count = 1;

void setup() {
  size(600, 436);
}

void draw() {
  String url = "http://a.espncdn.com/combiner/i?img=/i/headshots/nba/players/full/" + extend + ".png";
  // Load image from a web server
  try {
    img = loadImage(url, "png");

    background(0, 255, 0);
    //image(img, 0, 0);

    img.save(count + ".png");
    count++;
  } 
  catch(Exception e) {
    background(255, 0, 0);
  }
  fill(255);
  textSize(20);
  text("Number:" + extend, 0, 20);
  extend++;
}