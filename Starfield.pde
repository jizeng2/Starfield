Particle [] stars;
int myX=300;
int myY=300;
void setup()
{
  size (600, 600);
  background(0);
  stars = new Particle[200];
  for (int i = 0; i < stars.length; i++)
  {
    if (i % 30 == 0)
      stars[i] = new JumboParticle();
    else if (i % 15 == 0)
      stars[i] = new OddballParticle();
    else
      stars[i] = new NormalParticle();
  }
}
void draw()
{
  background(0);
  for (int i = 0; i < stars.length; i++)
  {
    stars[i].show();
    stars[i].move();
  }
}
void mousePressed()
{
  myX=mouseX;
  myY=mouseY;
  for (int j = 0; j < stars.length; j++)
  {
    if (j % 30 == 0)
      stars[j] = new JumboParticle();
    else if (j % 15 == 0)
      stars[j] = new OddballParticle();
    else
      stars[j] = new NormalParticle();
  }
}
class NormalParticle implements Particle
{
  double dX, dY, speed, angle;
  int myColor;
  NormalParticle()
  {
    speed=Math.random()*2;
    angle=Math.random()*6.28;
    dX=myX;
    dY=myY;
    myColor = color((int)(Math.random() * 255) + 50, (int)(Math.random() * 255) + 50, (int)(Math.random() * 255) + 50);
  }
  public void move()
  {
    dX= dX+(Math.cos(angle)*speed);
    dY= dY+(Math.sin(angle)*speed);
  }
  public void show()
  {
    noStroke();
    fill(myColor);
    ellipse((int)dX, (int)dY, 8, 8);
  }
}
interface Particle
{
  public void show();
  public void move();
}
class OddballParticle implements Particle
{
  double dX, dY, speed, angle;
  int myColor;
  OddballParticle()
  {
    speed=Math.random()*5;
    angle=Math.random()*3;
    dX=Math.random()*300;
    dY=Math.random()*200;
    myColor = color((int)(Math.random() * 255) + 50, (int)(Math.random() * 255) + 50, (int)(Math.random() * 255) + 50);
  }
  public void move()
  {
    dX= dX+(Math.cos(angle)*speed);
    dY= dY+(Math.sin(angle)*speed);
  }
  public void show()
  {
    noStroke();
    fill(myColor);
    ellipse((int)dX, (int)dY, 8, 8);
  }
}
class JumboParticle extends NormalParticle
{
  public void show()
  {
    noStroke();
    fill(179, 227, 156);
    ellipse((float)dX, (float)dY, 20, 20);
  }
}