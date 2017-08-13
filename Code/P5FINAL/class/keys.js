function keyTyped() {
  if (key == 'q' || key == 'Q') {
    PlaySound("moon.mp3");
    print("Q");
    Boxes.add(createVector(width / 2, height / 2), 250, 250, 100);
  }

  if (key == 'w' || key == 'W') {
    PlaySound("clay.mp3");
    print("W");
    Circles.add(createVector(width / 2, height / 2), 350, 350, 100);
  }

  if (key == 'e' || key == 'E') {
    PlaySound("splits.mp3");
    print("E");
    GON++;
  }



  if (key == 'r' || key == 'R') {
    PlaySound("ufo.mp3");
    print("R");
  }

  if (key == 'a' || key == 'A') {
    PlaySound("strike.mp3");
    print("A");
    Lines.add(createVector(width / 2, height / 2), 250, 250, 20);
  }

  if (key == 's' || key == 'S') {
    PlaySound("squiggle.mp3");
    print("S");
    for (var i = 0; i < 4; i++) {
      Butterflies.add(createVector(width / 2, height / 2), width / 2, height / 2, 50);
    }
  }

  if (key == 'd' || key == 'D') {
    PlaySound("piston-1.mp3");
    print("S");
  }

  if (key == 'i' || key == 'I') {
    PlaySound("clay2.mp3");
    print("I");
  }

  if (key == 'o' || key == 'O') {
    PlaySound("corona.mp3");
    print("O");
  }

  if (key == 'p' || key == 'P') {
    PlaySound("confetti.mp3");
    print("P");
  }

  if (key == 'z' || key == 'Z') {
    PlaySound("B_01.wav");
    print("Z");
  }

  if (key == 'x' || key == 'X') {
    PlaySound("B_02.wav");
    print("X");
  }

  if (key == 'c' || key == 'C') {
    PlaySound("B_03.wav");
    print("C");
  }
  if (key == 'v' || key == 'V') {
    PlaySound("B_04.wav");
    print("V");
  }
  if (key == 'b' || key == 'B') {
    PlaySound("B_05.wav");
    print("B");
  }
  if (key == 'n' || key == 'N') {
    PlaySound("F.wav");
    print("N");
  }
  if (key == 'm' || key == 'M') {
    PlaySound("G.wav");
    print("M");
  }


}