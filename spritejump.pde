/**
 * sets animation frame
 */
void setAnimFrame() {
  if (frameCount%3==0) { //animates sprite once every 3 frames
    animFrameIdle = (animFrameIdle + 1)%6; //animation frame for idle
    animFrameRun = (animFrameRun + 1)%8; //animation frame for run
  }
  if (frameCount%5==0) { //animates sprite once every 5 frames (slows it down so jump looks cleaner)
    animFrameJump = (animFrameJump + 1)%10; //animation frame for jump
  }
}

/**
 * draws sprite from defined array at character x pos and at an appropriate height
 */
public void drawCharacter(PImage[] array, int animFrame) {
  image(array[animFrame], charX, (height-5)-charWidth-charY);
}

/**
 * draws sprite doing an action and facing in the correct direction
 */
public void drawSpriteInAction() {
  //sprite faces in the direction velocity is being applied
  if (velX < 0) {
    facingLeft = true;
  } else if (velX > 0) {
    facingLeft = false;
  }

  //vertical velocity is applied on sprite
  if (velY != 0) {
    //draws jumping sprite facing in the correct direction
    drawCharacter(facingLeft ? jumpL : jumpR, animFrameJump);
    //makes sprite jump up and come down
    charY += velY;
    velY -= 0.2;
    //ensures sprite finishes jumping
    finishJump();
  } else if (velX != 0) { //if horizontal velocity is applied on sprite
    //draws running sprite facing in the correct direction
    drawCharacter(facingLeft ? runL : runR, animFrameRun);
  } else { //if neither vertical or horizontal velocity is applied on sprite
    //draws idling sprite facing in the correct direction
    drawCharacter(facingLeft ? idleL : idleR, animFrameIdle);
  }
}

/**
 * ensures that sprite finished whole jump animation cycle
 */
void finishJump() {
  //jump until finished all animation frames
  if (animFrameJump == jumpL.length-1) {
    animFrameJump = jumpL.length-1;
  }
  //once stopped jumping
  if (charY <= startHeight) {
    charY = startHeight;
    velY = 0;
  }
}
