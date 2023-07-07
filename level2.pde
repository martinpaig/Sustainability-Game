/**
 * Draws animation for Level 2 each frame
 */
void level2() {
  moveCamera();
  drawBackground();
  drawOcean();
  drawSpriteInAction();
  level2Timer.countUp(); //counter starts counting up
  fill(0);
  float time = level2Timer.getTime(); //gets current time for each frame
  text("Time: "+nf(time, 0, 1), 10, 20); //prints the current time each frame
  fill(255);
  //draws control buttons at top right corner
  exitButton.drawButton();
  exitButton.drawText("X");
  pauseButton.drawButton();
  pauseButton.drawText("||");
  restartButton.drawButton();
  restartButton.drawIcon();
  //creates a temporary list of litter objects
  ArrayList<Coin> tempCoins = new ArrayList<Coin>();
  fill(0);
  //for every piece of litter currently on the screen
  for (Coin c : coinList) {
    checkCoinCollision(c);
    if (checkCoinCollision(c)) { //if sprite collided with that piece of litter
      coinCount ++; //increment litter collected count
      tempCoins.add(c); //add to temporary list of litter to remove
    }
    text("Litter collected: "+coinCount, 10, 40);  //updates players litter collected count
  }
  coinList.removeAll(tempCoins); //doesn't redraw any litter that has been collected next frame
  fill(255);
  doCoins2(); //redraws all remaining pieces of litter each frame, falling
  tint(255, 110);  // Display at half opacity
  textSize(26);
  text("Level 2", width/2-50, height/2);
  textSize(20);
  fill(0);
  text("Catch litter before it hits the ocean floor!", 600, height/2);
  textSize(18);
  fill(255);
  setAnimFrame();
}
