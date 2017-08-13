
var Line = function(position,width,height,duration) {
  this.acceleration = createVector(0, 0.05);
  this.velocity = createVector(random(-1, 1), random(-1, 0));
  this.position = position.copy();
  this.width = width;
  this.height = height;
  this.X = 0;
  this.duration = duration;

  this.Timer = 0;

  this.YOffset = 25;
  this.XOffset = 25;
  this.Length = 200;
};

Line.prototype.run = function() {
  this.update();
  this.display();
};

// Method to update position
Line.prototype.update = function(){
  this.velocity.add(this.acceleration);
  this.position.add(this.velocity);
  this.Timer++;
  this.X = lerp(0, width - this.XOffset, this.Timer/this.duration);
};

// Method to display
Line.prototype.display = function() {
  
  stroke(61,153,148);
  strokeWeight(10);
  strokeCap(ROUND);
  line( (this.X + this.Length) - this.XOffset,height/2 - this.YOffset,this.X - this.XOffset,height/2-this.YOffset);
  line( (this.X + this.Length) - this.XOffset,height/2               ,this.X -      this.XOffset,height/2);
  line( (this.X + this.Length) - this.XOffset,height/2 + this.YOffset,this.X - this.XOffset,height/2+this.YOffset);
};

// Is the Line still useful?
Line.prototype.isDead = function(){
  if (this.Timer/this.duration > 1) {
    return true;
  } else {
    return false;
  }
};

var Lines = function() {
  this.Lines = [];
};

Lines.prototype.add = function(position,width,height,life) {
  this.Lines.push(new Line(position,width,height,life));
};

Lines.prototype.run = function() {
  for (var i = this.Lines.length-1; i >= 0; i--) {
    var p = this.Lines[i];
    p.run();
    if (p.isDead()) {
      this.Lines.splice(i, 1);
    }
  }
};