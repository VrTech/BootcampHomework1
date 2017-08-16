function keyTyped() {

  if (key == '\\' || key == '|') {
    Timer = 0;
    isAutoplay = true;
    print("Play");
    console.log(LastKeyTime);
    return;
  }
  if (!isAutoplay) {
    LastKeyTime = 0;
  }

  StartPlaying = true;
  if (key == 'q' || key == 'Q') {
    PlaySound("moon.mp3");
    // print("Q");
    Boxes.add(createVector(width / 2, height / 2), width / 2 + width / 4, height / 2, 200);

    Keys[Timer] = key;
  }

  if (key == 'w' || key == 'W') {
    PlaySound("clay.mp3");
    // print("W");
    Circles.add(createVector(width / 2, height / 2), width / 2, width / 2, 100);


    Keys[Timer] = key;
  }

  if (key == 'e' || key == 'E') {
    PlaySound("splits.mp3");
    // print("E");
    GON++;


    Keys[Timer] = key;
  }



  if (key == 'r' || key == 'R') {
    PlaySound("ufo.mp3");
    print("R");


    Keys[Timer] = key;

  }

  if (key == 'a' || key == 'A') {
    PlaySound("strike.mp3");
    // print("A");
    Lines.add(createVector(width / 2, height / 2), 250, 250, 20);


    Keys[Timer] = key;

  }

  if (key == 's' || key == 'S') {
    PlaySound("squiggle.mp3");
    // print("S");
    for (var i = 0; i < 4; i++) {
      Butterflies.add(createVector(width / 2, height / 2), width / 2, height / 2, 50);


      Keys[Timer] = key;
    }

  }

  if (key == 'd' || key == 'D') {
    PlaySound("piston-1.mp3");
    // print("S");
    Fades.add(createVector(0, 0), width, height, 10);


    Keys[Timer] = key;

  }

  if (key == 'f' || key == 'F') {
    PlaySound("pinwheel.mp3");
    Triangles.add(createVector(0, 0), width / 5, 30);
    // print("F");


    Keys[Timer] = key;

  }

  if (key == 'g' || key == 'G') {
    PlaySound("prism-3.mp3");
    // print("G");


    Keys[Timer] = key;

  }


  if (key == 'i' || key == 'I') {
    PlaySound("clay2.mp3");
    // print("I");


    Keys[Timer] = key;

  }

  if (key == 'o' || key == 'O') {
    PlaySound("corona.mp3");
    // print("O");


    Keys[Timer] = key;

  }

  if (key == 'p' || key == 'P') {
    PlaySound("confetti.mp3");


    Keys[Timer] = key;

    // print("P");
  }

  if (key == ']' || key == '}') {
    print("SHOW");
    clear();
    if (Keys.length > 0) {
      for (var i = 0; i < Keys.length; i++) {
        print(Keys[i]);

      }


    }
  }
}