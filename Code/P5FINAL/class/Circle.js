
var Circle = function(position,width,height,lifespan) {
    this.acceleration = createVector(0, 0.05);
    this.velocity = createVector(random(-1, 1), random(-1, 0));
    this.position = position.copy();
    this.lifespan = lifespan;
    this.width = width;
    this.height = height;
    this.Direction = random(-1,1);
  };
  
  Circle.prototype.run = function() {
    this.update();
    this.display();
  };
  
  // Method to update position
  Circle.prototype.update = function(){
    this.velocity.add(this.acceleration);
    //this.position.add(this.velocity);
    this.lifespan -= 2;
    this.position.y += (this.Direction > 0)?1:-1;
    this.width--;
    this.height--;
  };
  
  // Method to display
  Circle.prototype.display = function() {
    noStroke();
    fill(255,64,159,this.lifespan);
    ellipse(this.position.x, this.position.y, this.width, this.height);
  };
  
  // Is the Circle still useful?
  Circle.prototype.isDead = function(){
    if (this.lifespan < 0) {
      return true;
    } else {
      return false;
    }
  };
  
  var Circles = function() {
    this.Circles = [];
  };
  
  Circles.prototype.add = function(position,width,height,life) {
    this.Circles.push(new Circle(position,width,height,life));
  };
  
  Circles.prototype.run = function() {
    for (var i = this.Circles.length-1; i >= 0; i--) {
      var p = this.Circles[i];
      p.run();
      if (p.isDead()) {
        this.Circles.splice(i, 1);
      }
    }
  };