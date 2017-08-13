Plant tree1,tree2;

void setup()
{
  size (1980,1080);
  background(120,200,255);
  noStroke();
  smooth();
  
  tree1 = new Plant(500,200,100, 5, color(10,200,10),50);
  tree2 = new Plant(400,400,70, 5, color(200,200,10),70);
}

void draw()
{
  tree1.display();
  tree2.display();
  
  //ground
  fill(90,230,90);
  rect(0,350,700,150);
}