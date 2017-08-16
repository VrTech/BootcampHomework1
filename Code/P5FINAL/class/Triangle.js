
var Triangle = function (position, size, lifespan) {
    this.acceleration = createVector(0, 0.05);
    this.velocity = createVector(random(-1, 1), random(-1, 0));
    this.position = position.copy();
    this.lifespan = lifespan;
    this.size = size;
  
    this.Direction = random(-1, 1);
    this.Timer = 0;
  };
  
  Triangle.prototype.run = function () {
    this.update();
    this.display();
  };
  
  // Method to update position
  Triangle.prototype.update = function () {
    this.velocity.add(this.acceleration);
    //this.position.add(this.velocity);
    this.lifespan -= 2;
    this.position.x += random(-10, 10);
    this.position.y += random(-5, 5);
    this.Timer+= 0.01;
  };
  
  // Method to display
  Triangle.prototype.display = function () {
    noStroke();
    push();
    translate(width/2, height/2);
    fill(200, 232, 220,200);
    rectMode(CENTER);
    rotate(this.Timer);
    triangle(this.position.x - this.size, this.position.y, this.position.x, this.position.y - this.size, this.position.x + this.size, this.position.y);
    pop();
  };
  
  // Is the Triangle still useful?
  Triangle.prototype.isDead = function () {
    if (this.lifespan < 0) {
      return true;
    } else {
      return false;
    }
  };
  
  var Triangles = function () {
    this.Triangles = [];
  };
  
  Triangles.prototype.add = function (position, width, height, life) {
    this.Triangles.push(new Triangle(position, width, height, life));
  };
  
  Triangles.prototype.run = function () {
    for (var i = this.Triangles.length - 1; i >= 0; i--) {
      var p = this.Triangles[i];
      p.run();
      if (p.isDead()) {
        this.Triangles.splice(i, 1);
      }
    }
  };