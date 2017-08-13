class Box {

  float x;
  float y;
  float speed;
  float gravity;
  float w;
  float life = 255;
  float Rotation;

  float r, g, b;

  Box(float tempX, float tempY, float tempW, float _Rotation, float tempR, float tempG, float tempB) {
    
    x = tempX;
    y = tempY;
    w = tempW;

    r = tempR;
    g = tempG;
    b = tempB;

    Rotation = _Rotation;
    life = w;

    speed = 0;
    gravity = 0.1;
  }

  void move() 
  {
    //Rotation += 0.01;
    //w = width/20;
    w = life;
  }

  boolean finished() {
    // Boxs fade out
    life--;
    if (life < 0) {
      return true;
    } else {
      return false;
    }
  }

  void display() {
    // Display the circle
    //stroke(0,life);
    //rotate(cos(30));

    //First Square
    pushMatrix();
    fill(r, g, b,life/2);
    noStroke();
    translate(width/2, height/2);
    translate(0, 0);
    rotate(Rotation);  
    rectMode(CENTER);
    rect(0, 0, 400 ,w);
    popMatrix();

    //rect(x, y, w, w);
  }
}