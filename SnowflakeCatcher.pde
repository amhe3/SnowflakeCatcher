Snowflake[] bob; //make rooms

void setup()
{
  //your code here
  background(0);
  size(300, 300);
  bob = new Snowflake[100];
  for(int i = 0; i < bob.length; i++)
  {
    bob[i] = new Snowflake(); //make snowflakes
  }
}
void draw()
{
  for(int i = 0; i < bob.length; i++)
  {
    bob[i].lookDown();
    bob[i].erase(); 
    bob[i].wrap();
    bob[i].move();
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
    x = (int) (Math.random()*300);
    y = (int) (Math.random()*300);
    isMoving = true;
    snowSize = 6;
  }
  void show()
  {
    fill(255);
    ellipse(x, y, snowSize, snowSize);
  }
  void lookDown()
  {
    if((y <= 300 && y >= 0) && ((get(x,y+8) != color(0, 0, 0))))
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
    if(y > 300)
    {
      y = 0;
      x = (int) (Math.random()*300);
    }
  }
}


