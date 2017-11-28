Ball ball;
float currentTime;

void setup() {
  size(800, 600);
  background(0, 0, 0, 255);
  ball = new Ball(150, 150, 0.1f, 0.1f, color(0, 0, 255, 255));
  currentTime = millis();
}

void draw() {
  background(0,0,0,255);
  ball.Update(millis() -currentTime);
  currentTime = millis();
  ball.Draw();
}

class Ball {
  private float _xPos, _yPos, _xVel, _yVel, _size;
  private color _col;

  Ball(float xPos, float yPos, float xVel, float yVel, color col) {
    this._xPos = xPos;
    this._yPos = yPos;
    this._xVel = xVel;
    this._yVel = yVel;
    this._col = col;
    this._size = 20;
  }


  public void Update(float timeDiff)
  {
    this._xPos += this._xVel * timeDiff;
    this._yPos += this._yVel * timeDiff;
    
    if((this._xPos + this._size>= width && this._xVel > 0) || (_xPos< 0 && _xVel <0))
    {
       _xVel*= -1;
    }
    
        if((this._yPos + this._size>= height && this._yVel > 0) || (_yPos< 0 && _yVel <0))
    {
       _yVel*= -1;
    }
  }
  public void Draw()
  {
    stroke(_col *0.5f);
    fill(_col);
    ellipse(_xPos, _yPos, _size, _size);
  }
}