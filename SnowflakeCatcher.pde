Snowflake[] bob; //make rooms

void setup()
{
  //your code here
  background(0);
  size(400, 400);
  bob = new Snowflake[350]; // edit screenSize = 400!!!!!!
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
    x = (int) (Math.random()*400);
    y = (int) (Math.random()*400)-10;
    isMoving = true;
  }
  void show()
  {
    stroke(255);
    line(x, y-3, x, y+3);  // lines for the snowflake
    line(x-3, y, x+3, y);
    line(x-3, y+3, x+3, y-3);
    line(x+3, y-3, x-3, y+3);
  }
  void lookDown()
  {
    if((y < 400 && y > 0) && ((get(x,y+9) != color(0, 0, 0))))
    {
      isMoving = false;
    }
    else
      isMoving = true;
  }
  void erase()
  {
    stroke(0, 0, 0);
    fill(0);
    ellipse(x, y, 10, 10);
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
    if(y == 390)
    {
      y = 0;
      x = (int) (Math.random()*400);
    }
  }
}


