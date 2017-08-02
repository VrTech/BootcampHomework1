String printThis = "Your sketch is: ";
int r = 242;
int g = 221;
int b = 216;

int radius = 500;
int Clouds;
int[] PosX;
int[] PosY;

void setup()
{
  
  size(1980, 1080);
  PosX = new int[10];
  PosY = new int[10];
  Clouds = 5;
  for(int i = 0; i < Clouds;i++)
  {
    float RanNo = random(0,width);
    PosX[i] = int(RanNo);
    float RanH = random(0,height/4);
    PosY[i] = int(RanH);
  }
}



void draw() 
{
  //Update
  //clear();
  background(r,g,b);
  //PosX[1]--;

   DrawSun();
   DrawClouds(Clouds);
   DrawMoutain();
   DrawTower(3);
}

void DrawClouds(int Amount)
{
  for (int i = 0; i < Amount; i++)
  {
    noStroke();
    fill(245,245,245);
    ellipse(PosX[i],height/2 - 200 - PosY[i],200,100);
    
    noStroke();
    fill(245,245,245);
    ellipse(100 + PosX[i],height/2 - 200 - PosY[i],200,100);
    
    noStroke();
    fill(245,245,245);
    ellipse(50 + PosX[i],height/2 - 250 - PosY[i],200,100);
    
    //Shadow
    noStroke();
    fill(255,255,255,100);
    ellipse(50 + PosX[i],height/2 + 300,200,50);
    
    PosX[i] += 2;
    
    if(PosX[i] - 300 > width)
    {
      PosX[i] = -300;
    }
  }
}

void DrawSun()
{
  //ellipse
  noStroke();
  fill(213,79,79);
  ellipse(width/2,height/2,radius,radius);
  
  //ellipse
  fill(196,64,64);
  //ellipse(width/2,height/2,radius,radius);
  arc(width/2,height/2,radius,radius,radians(270),radians(450));
}

void DrawMoutain()
{
    //Tri
  int TriSize = 300;
  int TriOffsetY = 250;
  fill(200,200,200);
  triangle(width/2 - TriSize,height/2 + TriOffsetY, width/2+TriSize,height/2  + TriOffsetY,width/2,height/2 - TriSize  + TriOffsetY);
 
  //Tri Shade
  fill(190,190,190);
  triangle(width/2,height/2 + TriOffsetY, width/2+TriSize,height/2  + TriOffsetY,width/2,height/2 - TriSize  + TriOffsetY);
 
 //Tri Shadow
  int TriSSize = 300;
  int TriSOffsetY = 250;
  fill(190,190,190,90);
  triangle(width/2 - TriSSize,height/2 + TriSOffsetY, width/2+TriSSize,height/2  + TriSOffsetY,width/2,height/2 + (TriSSize  + TriSOffsetY) - 150);
 
  //Tri Shadow Shade

  fill(200,200,200,30);
  triangle(width/2,height/2 + TriSOffsetY, width/2+TriSSize,height/2  + TriSOffsetY,width/2,height/2 + (TriSSize  + TriSOffsetY) - 150);
 
}

void DrawTower(int Level)
{
  int LevelHeight = 100;
  int RoofPos = -50;
  int RoofSize = 100;
  
  for(int i = 0; i < Level;i++)
  {
  int RectSize = 100;
  //rectangles
  fill(255,0,0);
  rectMode(CENTER);
  rect(width/2 + 205,height/2 + (i*LevelHeight),RectSize,RectSize);
  
  //rectangles
  fill(150,0,0);
  rectMode(CENTER);
  rect(width/2 + 205 + (RectSize/2),height/2 + (i*LevelHeight),RectSize/1.5,RectSize);
  
  //rectangles
  fill(104,25,10);
  rectMode(CENTER);
  rect(width/2 + 215,height/2 + RoofPos + (i*LevelHeight),RoofSize * 1.5,RoofSize/4);
  
  //rectangles

    fill(55,16,15);
  rectMode(CENTER);
  rect(width/2 + 215 + (RoofSize/2),height/2 + RoofPos + (i*LevelHeight),(RoofSize/1.25),RoofSize/4);
  }
  
  int TopPos = -310;
  fill(50,50,50);
  triangle(width/2 + 135,height/2 + RoofPos + ((Level)*LevelHeight) + TopPos,width/2 + 215 + RoofSize,height/2 + RoofPos + ((Level)*LevelHeight) + TopPos,width/2 + 175 + (RoofSize/2),height/2 + RoofPos + ((Level)*LevelHeight) - 75  + TopPos);
}