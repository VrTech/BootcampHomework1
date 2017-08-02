int i = 0;
String Placeholder = "";
String Message;
boolean TextIsShowing = false;

PImage img = new PImage();
PFont font = new PFont();

color BGcolor = color(125);
int a = 0;

int NarrativeIdx = 0;
String[] Narratives = 
{"Hello!",
"I'm taking with you.",
"Right here...",
"You are stuck on a mysterious island. Yes, really!"};

void setup()
{
  size(1980,1080);
  background(BGcolor);
  smooth(); 
  font = createFont("Quicksand-Bold.ttf",36);
  img = loadImage("CUBIC.png");
}

void draw()
{
  background(BGcolor);
  UpdateText();
  Display();
}

void Display()
{
  image(img,50,50);
}

void UpdateText()
{
  //MESSAGE SYSTEM
  if(Message != null)
  {
  if(i < Message.length())
    {
      Placeholder += Message.charAt(i);
      textFont(font);
      text(Placeholder, width/2 - width/3,height/2 + height/3,1600,400); 
      fill(255);
      i++; 
      delay(15);
      if(i == Message.length()) TextIsShowing = false;
    }
    else
    {
      textFont(font);
      text(Placeholder, width/2 - width/3,height/2 + height/3,1600,400); 
      fill(255);
    }
  }
  
  if(keyPressed)
  {
    if(key == ' ' && !TextIsShowing && NarrativeIdx < Narratives.length)
    {
      DisplayText(Narratives[NarrativeIdx],200);
      NarrativeIdx++;
    }
  }
}

void DisplayText(String text,int Miliseconds)
{
    i = 0;
    Placeholder = "";
    Message = text;
    TextIsShowing = true;
}