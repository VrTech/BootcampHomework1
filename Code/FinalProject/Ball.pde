class Ball {

  float x;
  float y;
  float speed;
  float gravity;
  float w;
  float life = 255;

  float r, g, b;

  Ball(float tempX, float tempY, float tempW, float tempR, float tempG, float tempB) {
    x = tempX;
    y = tempY;
    w = tempW;

    r = tempR;
    g = tempG;
    b = tempB;

    speed = 0;
    gravity = 0.1;
  }

  void move() 
  {
    // Add gravity to speed
    speed = speed + gravity;
    // Add speed to y location
    y = y + speed;
    // If square reaches the bottom
    // Reverse speed
    if (y > height) 
    {
      // Dampening
      speed = speed * -0.8;
      y = height;
    }
    
    //w = width/20;
    w = life/2;
  }

  boolean finished() {
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
    fill(r, g, b, life);
    noStroke();
    //stroke(0,life);
    ellipse(x, y, w, w);
  }
}