import processing.sound.*;
SoundFile file;

ArrayList<Fade> fades;
ArrayList<Box> boxes;
ArrayList<Circle> circles;
ArrayList<Ball> balls;
ArrayList<Line> lines;
ArrayList<RandomLine> randomlines;

//For MusicRecorder
char[] KeysRecord;
float Timer;
float Room;

void setup()
{
  background(255);
  //fullScreen();
  size(1980, 1080);
  smooth();
  boxes = new ArrayList<Box>();
  circles = new ArrayList<Circle>();
  balls = new ArrayList<Ball>();
  lines = new ArrayList<Line>();
  randomlines = new ArrayList<RandomLine>();
}

void draw()
{
  background(255);
  //MusicRecorder();
  DrawBalls();
  DrawLines();
  DrawCircles();
  DrawBoxes();
  DrawRandomLines();
  //DrawFades();
}

void MusicRecorder()
{
  Timer++;
  if (Timer % 15 == 0)
  {
    Room += 0.25;
  }
          println(Room);
   if (Timer % 120 == 0 && Room % 2 == 0)
    {
      key = 'q';
      keyPressed();
    }
    //if (Timer % 46 == 0 && Room % 2 == 0)
    //{
    //  key = 'q';
    //  keyPressed();
    //}
    if (Timer % 120 == 0 && Room % 2 == 1)
    {
      key = 'a';
      keyPressed();
    }
    if (Timer % 60 == 0)
    {
      key = 'd';
      keyPressed();
    }
}


void mousePressed() 
{
  print("Mouse");
  // A new ball object is added to the ArrayList (by default to the end)
}

void keyPressed() {

  if (key == CODED) 
  {
    //if (keyCode == UP) 
    //{
    //  print("A");
    //}
  }
  if (key == 'q' || key == 'Q')
  {
    PlaySound("moon.mp3");
    print("Q");
    boxes.add(new Box(width/2, height/2, 300, 0, 255, 50, 50));
  }

  if (key == 'w' || key == 'W')
  {
    PlaySound("clay.mp3");
    print("W");
    circles.add(new Circle(width/2, height/2, width/2, 255, 143, 87));
  }

  if (key == 'e' || key == 'E')
  {
    float Offset = width/4;
    PlaySound("splits.mp3");
    print("E");
    balls.add(new Ball(random(0+ Offset, width- Offset), random(0, height), 0, 0, 0, 0));
  }



  if (key == 'r' || key == 'R')
  {
    PlaySound("ufo.mp3");
    print("R");
    circles.add(new Circle(random(0, width), random(0, height), random(100, 120), 75, 200, 75));
  }

  if (key == 'a' || key == 'A')
  {
    int rnd = (int)random(1, 3);

    //lines.add(new Line(new PVector(random(0,width),random(0,height)), new PVector(random(0,width),random(0,height)), 9, 150, 200, 150)); 
    int Offset = width/6;
    switch(rnd)
    {
    case 1:
      lines.add(new Line(new PVector(Offset+0, height/2 + 50), new PVector(width - Offset, height/2 + 50), 9, 150, 200, 150)); 
      lines.add(new Line(new PVector(Offset+0, height/2), new PVector(width - Offset, height/2), 9, 150, 200, 150)); 
      lines.add(new Line(new PVector(Offset+0, height/2 - 50), new PVector(width - Offset, height/2 - 50), 9, 150, 200, 150)); 
      break;
    case 2:
      lines.add(new Line(new PVector(width - Offset, height/2 + 50), new PVector(Offset, height/2 + 50), 9, 150, 200, 150)); 
      lines.add(new Line(new PVector(width - Offset, height/2), new PVector(Offset, height/2), 9, 150, 200, 150)); 
      lines.add(new Line(new PVector(width - Offset, height/2 - 50), new PVector(Offset, height/2 - 50), 9, 150, 200, 150)); 
      break;
    }


    //switch(rnd)
    //{
    //case 1:    
    //  lines.add(new Line(new PVector(0, 0), new PVector(width, height), 9, 150, 200, 150)); 
    //  break;
    //case 2:    
    //  lines.add(new Line(new PVector(0, height), new PVector(width, 0), 9, 150, 200, 150)); 
    //  break;
    //case 3:    
    //  lines.add(new Line(new PVector(width, 0), new PVector(0, height), 9, 150, 200, 150)); 
    //  break;
    //case 4:    
    //  lines.add(new Line(new PVector(width, height), new PVector(0, 0), 9, 150, 200, 150)); 
    //  break;
    //}

    PlaySound("strike.mp3");
    print("A");
  }

  if (key == 's' || key == 'S')
  {
    PlaySound("squiggle.mp3");
    for (int i = 0; i < 4; i++)
    {
      randomlines.add(new RandomLine(new PVector(width/2, height/2), 50, 173, 216, 230));
    }
    print("S");
  }

  if (key == 'd' || key == 'D')
  {
    PlaySound("piston-1.mp3");
    print("S");
  }

  if (key == 'i' || key == 'I')
  {
    PlaySound("clay2.mp3");
    print("I");
  }

  if (key == 'o' || key == 'O')
  {
    PlaySound("corona.mp3");
    print("O");
  }

  if (key == 'p' || key == 'P')
  {
    PlaySound("confetti.mp3");
    print("P");
  }
}

void DrawBoxes()
{
  for (int i = boxes.size()-1; i >= 0; i--) 
  {
    // An ArrayList doesn't know what it is storing so we have to cast the object coming out
    Box box = boxes.get(i);
    box.move();
    box.display();
    if (box.finished()) 
    {
      // Items can be deleted with remove()
      boxes.remove(i);
    }
  }
}

void DrawCircles()
{
  for (int i = circles.size()-1; i >= 0; i--) 
  {
    // An ArrayList doesn't know what it is storing so we have to cast the object coming out
    Circle circle = circles.get(i);
    circle.move();
    circle.display();
    if (circle.finished()) 
    {
      // Items can be deleted with remove()
      circles.remove(i);
    }
  }
}

void DrawBalls()
{
  for (int i = balls.size()-1; i >= 0; i--) 
  { 
    // An ArrayList doesn't know what it is storing so we have to cast the object coming out
    Ball ball = balls.get(i);
    ball.move();
    ball.display();
    if (ball.finished()) 
    {
      // Items can be deleted with remove()
      balls.remove(i);
    }
  }
}

void DrawLines()
{
  for (int i = lines.size()-1; i >= 0; i--) 
  { 
    // An ArrayList doesn't know what it is storing so we have to cast the object coming out
    Line line = lines.get(i);
    line.move();
    line.display();
    if (line.finished()) 
    {
      // Items can be deleted with remove()
      lines.remove(i);
    }
  }
}

void DrawRandomLines()
{
  for (int i = randomlines.size()-1; i >= 0; i--) 
  { 
    // An ArrayList doesn't know what it is storing so we have to cast the object coming out
    RandomLine randomline = randomlines.get(i);
    randomline.move();
    randomline.display();
    if (randomline.finished()) 
    {
      // Items can be deleted with remove()
      randomlines.remove(i);
    }
  }
}

void PlaySound(String Path)
{
  file = new SoundFile(this, Path);
  file.play();
}