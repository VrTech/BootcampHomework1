
var Butterfly = function(position,width,height,duration) {
  this.acceleration = createVector(0, 0.05);
  this.velocity = createVector(random(-1, 1), random(-1, 0));
  this.position = position.copy();
  this.width = width;
  this.height = height;
  this.duration = duration;

  this.Timer = 0;

  this.x1 = width;
  this.y1 = height;
};

Butterfly.prototype.run = function() {
  this.update();
  this.display();
};

// Method to update position
Butterfly.prototype.update = function(){
    this.Timer++;
    this.position.y = this.y1+(random(-height/16,height/16));
    this.position.x = this.x1+(random(-width/16,width/16));

};

// Method to display
Butterfly.prototype.display = function() {
  
  strokeCap(ROUND);
  stroke(255,124, 26);
  strokeWeight(7);
  fill(0);
  line(this.x1, this.y1, this.position.x, this.position.y);
  this.x1=this.position.x;
  this.y1=this.position.y;

};

// Is the Butterfly still useful?
Butterfly.prototype.isDead = function(){
  if (this.Timer/this.duration > 1) {
    return true;
  } else {
    return false;
  }
};

var Butterflies = function() {
  this.Butterflies = [];
};

Butterflies.prototype.add = function(position,width,height,life) {
  this.Butterflies.push(new Butterfly(position,width,height,life));
};

Butterflies.prototype.run = function() {
  for (var i = this.Butterflies.length-1; i >= 0; i--) {
    var p = this.Butterflies[i];
    p.run();
    if (p.isDead()) {
      this.Butterflies.splice(i, 1);
    }
  }
};