/**
 * Draws animation for Level 1 each frame
 */
void level1() {
  textSize(18);
  moveCamera();
  drawBackground();
  drawOcean();
  drawSpriteInAction();
  startTimer.countUp(); //counter starts counting up
  fill(0);
  float time = startTimer.getTime(); //gets current time for each frame
  text("Time: "+nf(time, 0, 1), 10, 20); //prints the current time each frame
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
    text("Litter collected: "+(coinCount), 10, 40); //updates players litter collected count
  }
  fill(255);
  coinList.removeAll(tempCoins); //doesn't redraw any litter that has been collected next frame
  placeCoins(); //redraws all remaining pieces of litter each frame
  tint(255, 110);  // Display screen at half opacity
  textSize(26);
  text("Level 1", width/2-50, height/2);
  textSize(18);
  setAnimFrame();
}
