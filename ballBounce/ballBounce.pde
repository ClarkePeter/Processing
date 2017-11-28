Ball[] balls;
int numBalls = 500;

void setup()
{
  size(1000, 750);
  balls = new Ball[numBalls];

  for (int i = 0; i<balls.length; i++)
  {
    balls[i] = new Ball();
  }
}

void draw()
{
 // background(0);

  for (Ball ball : balls)
  {
    ball.acc.add(0, 0.098);

    ball.pos.add(ball.vel);
    ball.vel.add(ball.acc);
    ball.acc.mult(0);

    if (ball.pos.x -5> width)
    {
      ball.pos.x = 0;
    }

    if (ball.pos.x < -5)
    {
      ball.pos.x = width+5;
    }
    if (ball.pos.y+5 > height)
    {
      ball.vel.y = - abs(ball.vel.y) * 0.85;
      ball.vel.x = ball.vel.x * 0.85;
    }

    fill(ball.col,10);
    noStroke();
    ellipse(ball.pos.x, ball.pos.y, 20, 20);
  }
}