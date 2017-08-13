PVector center;
float angle;
float radius;
float i = 0;
int Amount = 5;

float[] x,y;

void setup() {
  fullScreen();
  //size(1980, 1080);
  center = new PVector(width/2, height/2);
  //get the initial point
  //for you, this would be the initial location of the object
  PVector point = new PVector(width/2, height/2);

  //find the angle between the points
  float deltaX = center.x - point.x;
  float deltaY = center.y - point.y;
  angle = atan2(deltaX, deltaY);

  //find the radius of the circle
  radius = dist(center.x, center.y, point.x, point.y);
  
  x = new float[Amount];
  y = new float[Amount];
  
  ellipseMode(RADIUS);
}

void draw() {
  
  i+= 0.1;
  //DrawSpiral(Amount);
  DrawInvertSpiral(Amount);
  
}

void DrawSpiral(int Amount)
{
  for(int a = 0; a < Amount; a++)
  {
    int RandomNo = 0;
    println(i%2);
    if(i%3 > 1.5)
    {
    float Rnd = random(-25,25);
    RandomNo = int(Rnd);
    }
   //find the point based on the angle
  x[a] = center.x + cos(angle+(a*30))*(radius+i+RandomNo);
  y[a] = center.y + sin(angle+(a*30))*(radius+i+RandomNo);
  //draw the traveling point
  noStroke();
  fill(a*80+RandomNo,a*80,RandomNo);
  ellipse(x[a], y[a], 10, 10);
  //increment the angle to move the point
  angle += PI/360; 
  }
}

void DrawInvertSpiral(int Amount)
{
  for(int a = 0; a < Amount; a++)
  {
    int RandomNo = 0;
    println(i%2);
    if(i%3 > 1.5)
    {
    float Rnd = random(-25,25);
    RandomNo = int(Rnd);
    }
   //find the point based on the angle
  x[a] = center.x + cos(angle+(a*30))*(radius+i+RandomNo);
  y[a] = center.y + sin(angle+(a*30))*(radius+i+RandomNo);
  //draw the traveling point
  noStroke();
  fill(a*80+RandomNo,a*80,RandomNo);
  ellipse(x[a], y[a], 10, 10);
  //increment the angle to move the point
  angle -= PI/720; 
  }
}