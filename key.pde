public void keyPressed() {
  //sets velocity depending on which key user presses
  //if user pressed left key, set negative horizontal velocity
  if (key == 'a' || key == 'A') {
    velX = -3;
  }
  //if user pressed right key, set positive horizontal velocity
  if (key == 'd' || key == 'D') {
    velX = 3;
  }
  //if user pressed up key, set positive vertical velocity
  if (key == 'w' || key == 'W') {
    //if already jumping, can't jump again
    if (velY != 0)  return;
    //start jump animation cycle again
    animFrameJump = 0;
    velY = 4;
  }

  //if user presses space bar, goes to home screen and resets all levels to start
  if ( key == ' ') {
    if (screen == 0) {
      makeLevel();
    }
  }
  screen = level; //sets level to the corresponding screen

  //if user presses g, goes to home screen
  if (key == 'g' || key == 'G') {
    coinList.clear(); //clears all litter pieces
    screen = 0;
    level=1; //resets default level to 1
  }
}

/**
 * reset so there is no velocity being applied once user releases keys
 */
public void keyReleased() {
  //once let go of left key
  if (key == 'a' || key == 'A') {
    velX = 0;
  }
  //once let go of right key
  if (key == 'd' || key == 'D') {
    velX = 0;
  }
  //once let go of up key
  if (key == 'w' || key == 'W') {
  }
}
