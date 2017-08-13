class Line {

  float x1, x2;
  float y1, y2;
  float s,d, speed;
  float life = 255;

  float Timer = 0;

  float r, g, b;

  Line(PVector Pos1, PVector Pos2, float Duration, float tempR, float tempG, float tempB) {
    x1 = Pos1.x;
    y1 = Pos1.y;

    x2 = Pos2.x;
    y2 = Pos2.y;

    d = Duration;

    r = tempR;
    g = tempG;
    b = tempB;

    speed = 0;
  }

  void move() 
  {
    Timer+= 0.1;
    s = Timer/d;
    
    // Add speed to y location
    x1 = lerp(x1, x2, s);
    y1 = lerp(y1, y2, s);
    // If square reaches the bottom
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
    stroke(r,g,b,life);
    strokeWeight(40);
    //stroke(0,life);
    line(x1, y1, x2, y2);
  }
}