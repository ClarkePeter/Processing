import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Bar[] bars;

Minim minim;
AudioPlayer song;
AudioInput input;
FFT fft;
Boolean paused;

PImage background;
PVector backgroundPos;

PImage logo;
int logoScale;

ArrayList<Particle> particles;

void setup()
{
  // size(1300, 750, P2D);
  fullScreen(P2D);

  background = loadImage("background.jpg");
  background.resize(width + 50, height + 50);
  backgroundPos = new PVector(-25, -25);

  minim = new Minim(this);
  song= minim.loadFile("song.mp3");
  input = minim.getLineIn();
  song.play();
  paused = false;
  fft = new FFT(song.bufferSize(), song.sampleRate());

  logoScale = 200;
  logo =loadImage("jedi.png");

  logo.resize(logoScale, logoScale);
  fft.forward(song.mix);
  bars = new Bar[fft.specSize()];
  for (int i=0; i<bars.length; i++)
  {
    bars[i] = new Bar( i * ((TWO_PI*1.4) / fft.specSize()), 200, TWO_PI * logoScale / fft.specSize());
  }

  particles = new ArrayList<Particle>();
}

void draw()
{

  background(0);
  if (!paused)
    update();



  image(background, backgroundPos.x - 25, backgroundPos.y-25);
  for (Bar b : bars)
  {
    b.show();
  }

  for (int i = particles.size()-1; i>=0; i--)
  {
    if (particles.get(i).alive)
    {
      float angDiff = PI/16;

      float randomAngle = random(particles.get(i).vel.heading() - angDiff, particles.get(i).vel.heading() + angDiff);
      PVector temp = PVector.fromAngle(randomAngle);

      particles.get(i).applyForce(temp.mult(bottomSum * 0.001f));

      particles.get(i).update();
      particles.get(i).show();
      particles.get(i).vel.mult(0.8f);
    } else {
      particles.remove(i);
    }
  }

  fill(0, 230);
  ellipse(width / 2, height / 2, logoScale + 10, logoScale+10);
  image(logo, (width - logoScale)/2, (height - logoScale)/2, logoScale, logoScale);
}

void mousePressed() {
  if (paused)
  {
    song.play();
    paused = false;
  } else {
    song.pause();
    paused = true;
  }
}

float bottomSum = 0;

void update()
{
  bottomSum = 0;

  for (int j = 0; j<random(100); j++)
  {
    particles.add(new Particle());
  }

  fft.forward(song.mix);

  for (int i=0; i<bars.length; i++)
  {
    bars[i].update(map(fft.getBand(i), 0, 80, 100, 600));
    if (bars[i].barHeight > 300)
      bars[i].update(300);

    if (i < 50)
    {
      bottomSum += fft.getBand(i);
    }
  }

  logoScale = floor(200 + (bottomSum * 0.07));




  backgroundPos.x += random(-3, 3);
  backgroundPos.y += random(-3, 3);


  if (backgroundPos.x > 25)
  {
    backgroundPos.x = 25;
  }

  if (backgroundPos.y > 25)
  {
    backgroundPos.y = 25;
  }

  if (backgroundPos.x < -25)
  {
    backgroundPos.x = -25;
  }

  if (backgroundPos.y < -25)
  {
    backgroundPos.y = -25;
  }
}