int Timer = 0;
int Counter = 0;

void setup()
{
  // You can change the framerate for the BPM?
  frameRate(60);
}

void draw()
{
  Timer++;
  if ( Timer % 60 == 0)
  {
     println(Counter);
     Counter++;
  }
}