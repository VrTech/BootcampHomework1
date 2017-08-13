class Circle {

  float x;
  float y;
  float w;
  float life = 100;

  float r, g, b;

  Circle(float tempX, float tempY,float Size, float tempR, float tempG, float tempB) 
  {
    x = tempX;
    y = tempY;
    w = Size;

    r = tempR;
    g = tempG;
    b = tempB;
  }

  void move() 
  {
    //Size
  }

  boolean finished() {
    // Balls fade out
    life--;
    //w--;
    if (life < 0) {
      return true;
    } else {
      return false;
    }
  }

  void display() {
    // Display the circle
    fill(r, g, b, life);
    noStroke();
    //stroke(0,life);
    ellipse(x, y, w, w);
  }
 
}