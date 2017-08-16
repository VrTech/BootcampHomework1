
var Fade = function (position, width, height, Duration) {
    this.acceleration = createVector(0, 0.05);
    this.velocity = createVector(random(-1, 1), random(-1, 0));
    this.position = position.copy();
    this.width = width;
    this.height = height;

    this.Duration = Duration;
    this.Timer = 0;
    this.Direction = random(-1, 1);
};

Fade.prototype.run = function () {
    this.update();
    this.display();
};

// Method to update position
Fade.prototype.update = function () {
    this.velocity.add(this.acceleration);
    this.Timer++;
    //this.position.add(this.velocity);
    // this.position.x += random(-1, 1);
    // this.position.y += random(-1, 1);
};

// Method to display
Fade.prototype.display = function () {
    noStroke();
    fill(44, 232, 12, 150);
    rectMode(CORNER);
    var w;
    if (this.Direction > 0) {
        w = lerp(0, this.width, this.Timer / this.Duration);
        if (this.Timer / this.Duration < 1) {
            rect(0, 0, w, this.height);
        }
        else {
            rect(w - width, 0, this.width, this.height);
        }
    }
    else {
        w = lerp(this.width,0, this.Timer / this.Duration);
        if (this.Timer / this.Duration < 1) {
            rect(0, 0, w, this.height);
        }
        else {
            rect(w - width, 0, this.width, this.height);
        }
    }

};

// Is the Fade still useful?
Fade.prototype.isDead = function () {
    if (this.Timer / this.Duration > 2) {
        return true;
    } else {
        return false;
    }
};

var Fades = function () {
    this.Fades = [];
};

Fades.prototype.add = function (position, width, height, life) {
    this.Fades.push(new Fade(position, width, height, life));
};

Fades.prototype.run = function () {
    for (var i = this.Fades.length - 1; i >= 0; i--) {
        var p = this.Fades[i];
        p.run();
        if (p.isDead()) {
            this.Fades.splice(i, 1);
        }
    }
};