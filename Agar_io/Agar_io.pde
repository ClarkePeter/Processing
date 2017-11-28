Blob[] blobs;
Blob blob;

void setup()
{
  noStroke();
  
  blobs = new Blob[10];//] = new Blob();
  for (int i=0; i<blobs.length; i++)
  {
    float x = random(-width, width * 2);
    float y = random(-width, width * 2);
    
    blobs[i] = new Blob(x, y,16);
  }
  blob = new Blob(width/2, height/2, 64);
  size(400, 400);
}

void draw()
{
  background(255,0,0);
  
  
  blob.update();
  translate(width/2-blob.pos.x, height/2-blob.pos.y);
  
  fill(0,0,0);
  rect(-width,-height, 3*width, 3*height);
  
  fill(255);
  blob.show();
  
  for(Blob b:blobs)
  {
    b.show();
  }
}