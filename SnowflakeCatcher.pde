Snowflake[] bob; //make rooms

void setup()
{
  //your code here
  background(0);
  size(400, 400);
  bob = new Snowflake[200]; // edit screenSize = 400!!!!!!
  for(int i = 0; i < bob.length; i++)
  {
    bob[i] = new Snowflake(); //make snowflakes
  }
}
void draw()
{
  for(int i = 0; i < bob.length; i++)
  {
    bob[i].erase(); 
    bob[i].lookDown();
    bob[i].move();
    bob[i].wrap();
    bob[i].show();
  }
}
void mouseDragged()
{
  noStroke();
  fill(153, 204, 255);
  ellipse(mouseX, mouseY, 10, 10);
}

class Snowflake
{
  //class member variable declarations
  int x, y, snowSize;
  boolean isMoving;
  Snowflake()
  {
    //class member variable initializations
    x = (int) (Math.random()*screenSize);
    y = (int) (Math.random()*screenSize)-8;
    isMoving = true;
    snowSize = 8;
  }
  void show()
  {
    fill(255);
    ellipse(x, y, snowSize, snowSize);
  }
  void lookDown()
  {
    if((y < screenSize && y > 0) && ((get(x,y+9) != color(0, 0, 0))))
    {
      isMoving = false;
    }
    else
      isMoving = true;
  }
  void erase()
  {
    fill(0);
    ellipse(x, y, snowSize+2, snowSize +2);
  }
  void move()
  {
    if(isMoving == true)
    {
      y+=1;
    }
  }
  void wrap()
  {
    if(y == screenSize-snowSize-2)
    {
      y = 0;
      x = (int) (Math.random()*screenSize);
    }
  }
}


