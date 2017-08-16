
var xspacing = 14;    // Distance between each horizontal location
var w;                // Width of entire wave
var theta = 0.0;      // Start angle at 0
var amplitude = 950.0; // Height of wave
var period = 500.0;   // How many pixels before the wave repeats
var dx;               // Value for incrementing x
var yvalues,yvalues1,yvalues2;  // Using an array to store height values for the wave
var amplitude1 = 930.0; // Height of wave
var amplitude2 = 910.0; // Height of wave

var coswave = [];

var H = 0.1;



function setup() 
{
  canvas = createCanvas(windowWidth, 400);
  canvas.parent('sketch');

}

function draw() {
  canvas = createCanvas(windowWidth, 400);
  canvas.parent('sketch');
  background(243, 237, 237);

  // noStroke();
  // fill(200, 205, 150,180)
  // ellipse(width/2,height/2,width/5,width/5);
  // var TriOffset = width/8;
  // noStroke();
  // fill(205,254, 101)
  // triangle(width/2 + TriOffset,height/2, width/2 + 50 + TriOffset,height/2 - 35 ,width/2 + 50 + TriOffset,height/2 + 35 );

  calcWave();
  renderWave();

  textAlign(CENTER);
  textSize(36);
  fill(0);
  text("Great motion needs great sound", width/2,height/2);
}

function calcWave() {
  w = width+16;
  dx = (TWO_PI / period) * xspacing;
  yvalues = new Array(floor(w/xspacing));
  yvalues1 = new Array(floor(w/xspacing));
  yvalues2 = new Array(floor(w/xspacing));

  theta += 0.02;

  var M = -mouseY*2;

  var x = theta;
  for (var i = 0; i < yvalues.length; i++) {
    yvalues[i] = sin(x)*amplitude + M;
    x+=dx;
    var amount = map(i, 0, yvalues.length, 0, PI);
    coswave[i] = abs(cos(amount));
  }

  for (var i = 0; i < yvalues1.length; i++) {
    yvalues1[i] = sin(x)*amplitude1 + M;
    x+=dx;
  }

  for (var i = 0; i < yvalues2.length; i++) {
    yvalues2[i] = sin(x)*amplitude2 + M;
    x+=dx;
  }
}

function renderWave() {
  noStroke();
  // A simple way to draw the wave with an ellipse at each location
  for (var x = 0; x < yvalues.length; x++) {
    fill(200,200,255);
    ellipse(x*xspacing, height/2+yvalues[x] * (H -coswave[x]*H), 4, 4);
    fill(255,125,125);
    ellipse(x*xspacing, height/2+yvalues1[x] * (H -coswave[x]*H),3, 3 );
    fill(125,255,200);
    ellipse(x*xspacing, height/2+yvalues2[x] * (H -coswave[x]*H), 4,4);
  }
}