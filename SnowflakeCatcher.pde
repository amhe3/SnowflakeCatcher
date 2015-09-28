Snowflake[] bob = new Snowflake[1]; //make rooms

void setup()
{
  //your code here
  background(0);
  size(300, 300);
}
void draw()
{
  for(int i = 0; i < bob.length; i++)
  {
    bob[i] = new Snowflake(); //make snowflake
    bob[i].move();
    bob[i].lookDown();
    bob[i].wrap();
    bob[i].show();
    //bob[i].erase(); 
  }
}
void mouseDragged()
{
  //your code here
}

class Snowflake
{
  //class member variable declarations
  int x, y;
  boolean isMoving;
  Snowflake()
  {
    //class member variable initializations
    x = (int) (Math.random()*300);
    //y = (int) (Math.random()*300);
    y = 0;
    isMoving = true;
  }
  void show()
  {
    fill(255);
    ellipse(x, y, 5, 5);
  }
  void lookDown()
  {
    if(y <= 400 && y >= 0 && (get(x,y+8) != color(0, 0, 0)))
    {
      isMoving = false;
    }
    else
      isMoving = true;
  }
  void erase()
  {
    fill(0);
    ellipse(x, y, 7, 7);
  }
  void move()
  {
    if(isMoving == true)
    {
      y+=10;
    }
  }
  void wrap()
  {
    if(y > 300)
    {
      y = 0;
      x = (int) (Math.random()*300);
    }
  }
}


