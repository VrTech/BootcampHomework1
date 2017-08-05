import processing.sound.*;

SoundFile file;

int i = 0;
String Placeholder = "";
String Message;
boolean TextIsShowing = false;
boolean isChoosing = false;

PImage img = new PImage();
PFont font = new PFont();

color BGcolor = color(125);
int a = 0;

String Chapter = "Start";
String[]  CurrentNarrativeA,CurrentNarrativeB;
int NarrativeIdx = 0;
String Answer1,Answer2,Answer3;


boolean gotTorch = false;
boolean gotKnife = false;

String[] Narratives = 
{"Hello!",
"I'm taking with you.",
"Right here...",
"You are stuck on a mysterious island. Yes, really!",
"You realize that you are in somewhere on a mysterious island. What will you do? Choose wisely!"};

//Choosing Walkalong
String[] Walkalong =
{
 "You wander around for a while.",
 "There is nothing you can find more.",
 "However, you can't take one more step further and need to find a place to sleep."
};


//Choosing SearchAround
String[] SearchAround =
{
 "You wander around for a minute.",
 "Unexpectedly, you found something that you can take.",
 "However, you are so tired that you can carry only one thing."
};

//Choosing Knife
String[] Knife =
{
 "You keep this knife and walk along the island.",
 "There is no sign of people in this island",
 "However, you can't take one more step further and need to find a place to sleep."
};


//Choosing Torch
String[] Torch =
{
 "You keep this Torch and walk along the island.",
 "There is no sign of people in this island",
 "However, you can't take one more step further and need to find a place to sleep."
};

//Choosing Cave without Torch
String[] Cave =
{
 "You carefully step inside the cave a little by little.",
 "In the cave, there is no light sources at all",
 "You ended up so tired and were eaten by wolves."
};

//Choosing Cave with Torch
String[] CaveT =
{
 "You carefully step inside the cave a little by little.",
 "In the cave, there is no light sources at all.",
 "Luckily, you have a torch so you can see the way."
};

//Choosing Tree with Knife
String[] TreeK =
{
 "You heard some wolves howl.",
 "You ",
 "However, you can't take one more step further and need to find a place to sleep."
};

//Choosing Tree
String[] Tree =
{
 "You heard some wolves howl.",
 "You tried to fight them with your bare hands",
 "Unfortunately, you cannot make it and were eaten by wolves."
};



void setup()
{
  //fullScreen();
  size(1980,1080);
  background(BGcolor);
  font = createFont("Quicksand-Bold.ttf",36);
  img = loadImage("1.gif");
  smooth(1000);
  frameRate(300);
  textAlign(CENTER);
  DisplayText("\"Left click or Spacebar to continue\"");
}

void draw()
{

  //background(BGcolor);
  Sequence();
  Display();
  Subtitle();
  UpdateText();
  ShowButtons();
}

void Sound(String SoundPath)
{
   file = new SoundFile(this, "SoundPath");
   file.play(); 
}

void Sequence()
{
    if(Chapter == "Start")
    {
      CurrentNarrativeA = Walkalong;
      CurrentNarrativeB = SearchAround;

      switch(NarrativeIdx)
      {
      case 4  : img =loadImage("2.gif");break;
      case 5  : 
      Answer1 = "Walk along the island.";
      Answer2 = "Search around you.";
      isChoosing = true;
      break;
      }
    }
    
    if(Chapter == "Search around you.")
    {
      CurrentNarrativeA = Knife;
      CurrentNarrativeB = Torch;
      switch(NarrativeIdx)
      {
        case 3 :       
        Answer1 = "Get a blunt knife.";
        Answer2 = "Get a torch.";
        isChoosing = true;
      }
    }
    
    if(Chapter == "Walk along the island." || Chapter == "Get a blunt knife." || Chapter == "Get a torch.")
    {
      if(gotTorch)
      {
        CurrentNarrativeA = CaveT;
      }
      else
      {
       CurrentNarrativeA = Cave; 
      }
      
      CurrentNarrativeB = Tree;
      switch(NarrativeIdx)
      {
        case 3 :       
        Answer1 = "In the cave.";
        Answer2 = "Under a tree.";
        isChoosing = true;
      }
    }
 
}

void ShowButtons()
{
  if(isChoosing)
  {
    rectMode(CENTER);
    Button1(CurrentNarrativeA);
    Button2(CurrentNarrativeB);
  }
  
  rectMode(CORNER);
}

void Button1(String[] NextNarrative)
{
    int offset = 10;
    noStroke();
    fill(50,50,50,255);
    
    if(mouseX >= width/2 - 150 && mouseX <= width/2 + 150 && mouseY >= height/3 - (75/2) && mouseY <= height/3 + (75/2))
    {
      fill(255,200,200,255);
      if(mousePressed && (mouseButton == LEFT))
      {
        Chapter = Answer1;
        Narratives = NextNarrative;
        NarrativeIdx = 0;
        isChoosing = false;
        DisplayText(Narratives[NarrativeIdx]);
        NarrativeIdx++;
        
        if(Answer1 == "Get a blunt knife.")
        {
          gotKnife = true;
        }
      }
    }
    rect(width/2,height/3,500,75,25,25,25,25);
    
    //TEXT
    fill(255);
    textFont(font);
    text(Answer1, width/2 ,height/3 + offset); 

}
void Button2(String[] NextNarrative)
{
    int offset = 10;
    float H = height/3;
    int Hoff = 120;
    noStroke();
    fill(50,50,50,255);
    
    if(mouseX >= width/2 - 150 && mouseX <= width/2 + 150 && mouseY >= (H + Hoff) - (Hoff/2) && mouseY <= (H+Hoff) + (Hoff/2))
    {
      fill(255,200,200,255);
      if(mousePressed && (mouseButton == LEFT))
      {
      Chapter = Answer2;
      Narratives = NextNarrative;
      NarrativeIdx = 0;
      isChoosing = false;
      DisplayText(Narratives[NarrativeIdx]);
      NarrativeIdx++;
      
        if(Answer2 == "Get a torch.")
        {
          gotTorch = true;
        }
      }
    }
    rect(width/2,H + Hoff,500,75,25,25,25,25);
    
    //TEXT
    fill(255);
    textFont(font);
    text(Answer2, width/2 ,H + Hoff + offset); 
}

void Display()
{
  image(img,0,0,width,height);
  //EFFECT
  noStroke();
  fill((mouseY/4),(mouseX/4),200,75);
  rect(0,0,width,height);
}

void Subtitle()
{
  noStroke();
  fill(200,200,200,100);
  rect(0,height - 200,width,200);
}

void UpdateText()
{
  //MESSAGE SYSTEM
  if(Message != null)
  {
  if(i < Message.length())
    {
      Placeholder += Message.charAt(i);
      fill(255);
      textFont(font);
      text(Placeholder, width/2,height/2 + height/2.5); 
      i++; 
      if(i == Message.length()) TextIsShowing = false;
    }
    else
    {
      fill(255);
      textFont(font);
      text(Placeholder, width/2,height/2+ height/2.5); 
    }
  }
  
  if((keyPressed || mousePressed) && NarrativeIdx < Narratives.length)
  {
    if((key == ' ' || mouseButton == LEFT) && !TextIsShowing)
    {
      DisplayText(Narratives[NarrativeIdx]);
      NarrativeIdx++;
    }
  }
}

void DisplayText(String text)
{
    i = 0;
    Placeholder = "";
    Message = text;
    TextIsShowing = true;
}