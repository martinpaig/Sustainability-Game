/**
 * moves camera position according to sprites current x-position, sprite can't explore left of 20% or right of 80% screen width
 */
public void moveCamera() {
  //if sprite is moving
  if (velX == 0) {
    return;
  }
  //if sprite is not moving, make camera move


  //if moving right
  if (velX > 0) {
    //set 80% boundary
    //add velocity onto the current x position of sprite
    charX += velX;
    //stop sprite moving any further right after reach 80% of screen width
    if (charX > 0.8*width) {
      charX = (int)(0.8*width);
      //move the camera in the direction of velocity
      cameraX += velX;
    }
  }
  //if moving left
  if (velX < 0) {
    //set 20% boundary
    //add velocity onto the current x position of sprite
    charX += velX;
    //stop sprite moving any further right after reach 80% of screen width
    if (charX < 0.2*width) {
      charX = (int)(0.2*width);
      //move the camera in the direction of velocity
      cameraX += velX;
    }
  }
}

/**
 * creates three copies of background home page image
 * each has an offset starting point so the background is repeated to fill the screen
 */
public void drawHome() {
  image(backgroundHome, 0, 0);
  image(backgroundHome, backgroundHome.width, 0);
  image(backgroundHome, 2*backgroundHome.width, 0);
}

/**
 * creates three copies of each background image
 * each has an offset starting point so the background appears to go on forever
 */
public void drawBackground() {
  image(background1, 0, 0);
  image(background1, background1.width, 0);
  image(background1, 2*background1.width, 0);
  image(background2, 0, 0);
  image(background2, background2.width, 0);
  image(background2, 2*background2.width, 0);
  image(background3, 0, 0);
  image(background3, background3.width, 0);
  image(background3, 2*background3.width, 0);
}


/**
 * scale image by a float
 */
void imageScale(PImage toScale, float scale) {
  toScale.resize(int(toScale.width*scale), int(toScale.height*scale));
}

/**
 * resize image by 0.12
 */
void imgResize(PImage toScale) {
  imageScale(toScale, 0.12);
}

/**
 * populates the sprite array from the sprite sheet
 */
public void getCharState(PImage sheet, PImage[] array) {
  for (int i=0; i<array.length; i++) {
    array[i] = sheet.get(i*charWidth, 0, charWidth, charWidth);
  }
}
