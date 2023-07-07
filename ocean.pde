/**
 * Draws opaque ocean image, and adjust current sea level each frame
 */
public void drawOcean() {
  if (coinCount >= 10) { //if player collects 10 pieces of litter
    easing = -0.0009; //sea level sinks for framesPassed number of frames
    framesPassed --;
    fill(0);
    textSize(20);
    text("10 collected! Keep it up!", 150, 85);
    textSize(18);
    fill(255);

    if (framesPassed < 0) { //once specified number of frames has passed, sea level starts to rise back up again
      easing = 0.001;
    }
  }
  if (coinList.size() == 0) { //if player has collected all litter
    easing = -0.0035; //sea level decreases rapidly to show they've completed the level
    if (offset>17) { //once sea reaches the ocean floor, go to next level
      level++;
      makeLevel();
    }
  }

  float dy = (0-ocean.height); //starting position of sea to adjust
  offset += dy * easing; //adjust amount sea level changes by, every frame
  //draws ocean image 4 times horizontally to fill the screen
  image(ocean, 0, 180+offset);
  image(oceanFlipped, ocean.width, 180+offset);
  image(ocean, 2*ocean.width, 180+offset);
  image(oceanFlipped, 3*ocean.width, 180+offset);
  if ((180+offset)<=11) { //if sea level reaches the top of the screen, game over
    screen = -1;
    return;
  }
}
