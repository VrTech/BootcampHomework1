int Size = 100;
int Padding = 2;
int Spacing = Size + Padding;
int Column = 50;
int Amount = 1000;

int PosX[] = new int[Amount];
int PosY[] = new int[Amount];

void setup()
{
   fullScreen();
   //size(500,500);
   int x = 0;
   int y = 1;
   
   //Adjust Positions
   for(int i = 0; i < Amount ; i ++)
   {
     PosX[i] = x * Spacing;
     PosY[i] = y * Spacing;
     x++;

     if(i >= Column * y)
     {
      x = 0;
      y++; 
     }
   }
}

void draw()
{
  for(int i = 0 ; i < Amount;i++)
  {
    noStroke();
    fill(random(155,255),random(155,255),random(155,255));
    rect(PosX[i],PosY[i],Size,Size);
  }
}