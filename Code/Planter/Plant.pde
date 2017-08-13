class Plant
{
  float plantHeight;
  float xPos, yPos, diameter; 
  int leaves;
  color plantColor;

  Plant( float _plantHeight, float _xPos, float _yPos, int _leaves, color _plantColor, float _diameter)
  {
    plantHeight = _plantHeight;
    xPos = _xPos;
    yPos = _yPos;
    leaves = _leaves;
    plantColor = _plantColor;
    diameter = _diameter;
  }

  void display()
  {
    fill(plantColor);
    rect(xPos, yPos, 10, plantHeight);

    //draw leaves
    for (int i =0; i < leaves; i ++)
    {
      ellipse(xPos, yPos + 30 * i, diameter/(i+1), 10); 
      //diameter + i * 5
    }
  }
}