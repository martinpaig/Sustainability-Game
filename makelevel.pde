/**
 * Creates coin objects needed for each level and resets water level for each level
 */
void makeLevel() {
  screen = level; //sets screen to current level
  //resets variables which determine sea level
  easing = 0.0005;
  offset = -15;
  framesPassed = 200; //number of frames sea decreases by after collected 10 coins, before rising again

  if (level == 1) {
    coinCount = 0; //reset litter count
    startTimer.setTimer(0); //reset timer

    //adds coins at 3 different heights and in random x positions - avoiding the sprite's starting position
    for (int i = 0; i<3; i++) {
      coinList.add(new Coin(random(560, 810), 145, 15, 15));
    }
    for (int i = 0; i<2; i++) {
      coinList.add(new Coin(random(240, 480), 145, 15, 15));
    }
    for (int i = 0; i<2; i++) {
      coinList.add(new Coin(random(560, 810), 100, 15, 15));
    }
    for (int i = 0; i<3; i++) {
      coinList.add(new Coin(random(240, 480), 100, 15, 15));
    }
    for (int i = 0; i<3; i++) {
      coinList.add(new Coin(random(560, 810), 122.5, 15, 15));
    }
    for (int i = 0; i<2; i++) {
      coinList.add(new Coin(random(240, 480), 122.5, 15, 15));
    }
  }

  if (level == 2) {
    coinCount = 0;
    level2Timer.setTimer(0);

    //adds coins at y position above top of screen to start with, and at random x pos
    for (int i = 0; i<9; i++) {
      float y = random(-140, 0);
      y += 10; //increment balls y position every frame so it falls down
      coinList.add(new Coin(random(300, 600), y, 15, 15, true));
    }
  }
}
