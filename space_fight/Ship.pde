class Ship 
{
  
  PVector mPos;
  PVector mVel;
  PVector mAcc;
  
  color mCol;
  
  Ship()
  {
    mVel = new PVector(0,0);
    mPos = new PVector(width/2,height/2);
    mAcc = new PVector(0,0);
    mCol = color(255);
  }
  
  void update()
  {
    
  }
  
  void draw() 
  {
    noStroke();
    fill(mCol);
    ellipse(mPos.x, mPos.y, 10,10);
    fill(0,0,0,255);
    ellipse(mPos.x, mPos.y, 5,5);
  }
}