class RandomLine {

  float x, x1;
  float y, y1;
  float s, d, speed;
  float life = 255;

  float Timer = 0;

  float r, g, b;

  RandomLine(PVector Pos, float Duration, float tempR, float tempG, float tempB) {

    x1=width/2;
    y1=height/2;

    x1 = Pos.x;
    y1 = Pos.y;

    life = Duration;

    r = tempR;
    g = tempG;
    b = tempB;

    speed = 0;
  }

  void move() 
  {
    y=y1+(height/50)-int(random(0,height/23));
    x=x1+(width/50)-int(random(0,width/23));
    strokeWeight(50);
    fill(0);
    line(x1, y1, x, y);
    x1=x;
    y1=y;
  }

  boolean finished() 
  {
    // Balls fade out
    life--;
    if (life < 0) {
      return true;
    } else {
      return false;
    }
  }

  void display() {
    // Display the circle
    stroke(r, g, b);

  }
}