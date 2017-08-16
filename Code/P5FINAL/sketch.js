var Speed = 300;

var song = [
  { note: "Q", duration: 1000 - Speed },
  { note: "A", duration: 1500 - Speed },
  { note: "Q", duration: 600 - Speed },
  { note: "A", duration: 900 - Speed },
  { note: "Q", duration: 1000 - Speed },
  { note: "A", duration: 1500 - Speed },
  { note: "Q", duration: 600 - Speed },
  { note: "A", duration: 900 - Speed },

  { note: "W", duration: 1000 - Speed },
  { note: "A", duration: 1500 - Speed },
  { note: "W", duration: 600 - Speed },
  { note: "A", duration: 900 - Speed },
  { note: "W", duration: 1000 - Speed },
  { note: "A", duration: 1500 - Speed },
  { note: "W", duration: 600 - Speed },
  { note: "A", duration: 900 - Speed },
];

var index = 0;
var CurrentKey;
var isAutoplay = false;
var isPlayback = false;
var StartPlaying = false;

var Boxes;
var Circles;
var Lines;
var Butterflies;
var Fades;
var Triangles;

var RecordedKeys, RecordedDuration;
var Keys;
var Timer, LastKeyTime;

function setup() {

  RecordedKeys = [];
  RecordedDuration = [];
  Keys = [];
  Timer = 0;

  frameRate(60);

  var cnv = createCanvas(windowWidth, windowHeight);
  var x = (windowWidth - width) / 2;
  var y = (windowHeight - height) / 2;
  cnv.position(x, y);

  Boxes = new Boxes();
  Circles = new Circles();
  Lines = new Lines();
  Butterflies = new Butterflies();
  Fades = new Fades();
  Triangles = new Triangles();
}

function draw() {
  background(200);

  Fades.run();
  Boxes.run();
  Circles.run();
  Lines.run();
  Butterflies.run();
  Triangles.run();

  // Timer += 0.01;
  // var a = EasingFunctions.easeInOutCubic(Timer);
  // fill(255);
  // //if(a <= 1)
  // {
  //   rect(a * 500, 0, 50, 50);
  // }

  // stroke(255);
  // noFill();
  // for (var i = 0; i < 200; i += 20) {
  //   bezier(0, 40+i, 410, 110, 440, 300, mouseX, 200+(i/8.0));
  // }

  // push();
  // noStroke();
  // translate(width*0.2, height*0.5);
  // rotate(frameCount / 200.0);
  // polygon(0, 0, 82, GON); 
  // pop();

  //var max_distance = dist(0, 0, width, height);

  //noStroke();
  //for(var i = 0; i <= width; i += 30) {
  //  for(var j = 0; j <= height; j += 30) {
  //    var size = dist(random(0,width),random(0,height), i, j);
  //    size = size/max_distance * 66;
  //    rect(i, j, size, size);
  //  }
  //}

  // playback();
  autoplay();
  if (StartPlaying) {
    Timer++;
    if (!isAutoplay) {
      LastKeyTime++;
    }
  }

}

// function playback() {

//   if (isPlayback) {

//     if (Timer >= RecordedKeys.length) {
//       isPlayback = false;
//       return;
//     }

//     key = RecordedKeys[Timer];
//     keyTyped();
//     Timer++;
//   }

// }

function autoplay() {

  if (isAutoplay) {
    print(Timer + " " + Keys.length);
    if (Timer >= Keys.length) {
      Timer = -LastKeyTime;
      //isAutoplay = false;
      //return;
    }

    if (Keys[Timer] == '') return;
    key = Keys[Timer];
    keyTyped();



  }
}

function polygon(x, y, radius, npoints) {
  var angle = TWO_PI / npoints;
  beginShape();
  for (var a = 0; a < TWO_PI; a += angle) {
    var sx = x + cos(a) * radius;
    var sy = y + sin(a) * radius;
    vertex(sx, sy);
  }
  endShape(CLOSE);
}


function PlaySound(Path) {
  var sound = new Howl({
    src: ["sounds/" + Path]
  });
  sound.play();
}