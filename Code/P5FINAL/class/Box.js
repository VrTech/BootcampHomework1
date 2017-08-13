
var Box = function (position, width, height, lifespan) {
  this.acceleration = createVector(0, 0.05);
  this.velocity = createVector(random(-1, 1), random(-1, 0));
  this.position = position.copy();
  this.lifespan = lifespan;
  this.width = width;
  this.height = height;

  this.Direction = random(-1, 1);
};

Box.prototype.run = function () {
  this.update();
  this.display();
};

// Method to update position
Box.prototype.update = function () {
  this.velocity.add(this.acceleration);
  //this.position.add(this.velocity);
  this.lifespan -= 2;
  // this.position.x += random(-1, 1);
  // this.position.y += random(-1, 1);
};

// Method to display
Box.prototype.display = function () {
  noStroke();
  fill(232, 44, 12, 200);
  rectMode(CENTER);

  if (this.Direction > 0) {
    rect(this.position.x, this.position.y, this.width, this.lifespan);
  }
  else {
    rect(this.position.x, this.position.y, this.lifespan,this.height );
  }
};

// Is the Box still useful?
Box.prototype.isDead = function () {
  if (this.lifespan < 0) {
    return true;
  } else {
    return false;
  }
};

var Boxes = function () {
  this.Boxs = [];
};

Boxes.prototype.add = function (position, width, height, life) {
  this.Boxs.push(new Box(position, width, height, life));
};

Boxes.prototype.run = function () {
  for (var i = this.Boxs.length - 1; i >= 0; i--) {
    var p = this.Boxs[i];
    p.run();
    if (p.isDead()) {
      this.Boxs.splice(i, 1);
    }
  }
};