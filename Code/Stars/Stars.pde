PVector position;
float radius = 0;
float theta = 0;

void setup() {

   size(500,500);
   background(255);
   position = new PVector(0,0);
}

void draw() {
   
   //background(100);
   position.x = radius * cos(frameCount);
   position.y = radius * sin(frameCount);
   
   noStroke();
   fill(255,0,0);
   ellipse(position.x + width/2, position.y + height/2, 1,1);
   radius += 0.1;
   
}