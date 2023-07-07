/**
 * Coin class which draws litter pieces and stores its state as either falling or static
 */
public class Coin {
  private float x_pos;
  private float y_pos;
  private float width_obstacle;
  private float height_obstacle;
  private boolean falling = false;

  public Coin(float x_pos, float y_pos, float width_obstacle, float height_obstacle) //constructor for a static litter piece
  {
    this.x_pos = x_pos;
    this.y_pos = y_pos;
    this.width_obstacle = width_obstacle;
    this.height_obstacle = height_obstacle;
  }
  public Coin(float x_pos, float y_pos, float width_obstacle, float height_obstacle, boolean falling) //constructor for a falling litter piece
  {
    this.x_pos = x_pos;
    this.y_pos = y_pos;
    this.width_obstacle = width_obstacle;
    this.height_obstacle = height_obstacle;
    this.falling = falling;
  }

  /**
   * draws coins on the screen
   */
  public void drawCoin() {
    ellipse(x_pos, y_pos, width_obstacle, height_obstacle);
  }

  /**
   * increments y position of a falling coin for every frame (as is called in draw function)
   */
  public void tick() {
    y_pos += 0.5;
  }

  /**
   * returns true if a coin hits the ocean floor, false otherwise
   */
  public boolean belowGround() {
    return y_pos > 180;
  }

  /**
   * returns true if sprite has collided with a coin, otherwise false
   */
  public boolean collide(float spriteX, float spriteY, float spriteWidth, float coinX, float coinY, float coinWidth, float coinHeight) {
    // temporary variables to set edges for testing
    float testX = 0;
    float testY = 0;
    if (spriteX+(spriteWidth/2) < coinX)         testX = coinX;      // test left edge
    else if (spriteX+(spriteWidth/2) > coinX+coinWidth) testX = coinX+coinWidth;   // right edge
    if (spriteY+(spriteWidth/2) < coinY)         testY = coinY;      // top edge
    else if (spriteY+(spriteWidth/2) > coinY+coinHeight) testY = coinY+coinHeight;   // bottom edge
    // get distance from closest edges
    float distX = spriteX+(spriteWidth/2)-testX;
    float distY = (height-(spriteY+(spriteWidth/2)))-testY;
    float distance = sqrt( (distX*distX) + (distY*distY) );

    // if the distance is less than the radius, collision!
    if (distance <= spriteWidth/2) {
      return true;
    }
    return false;
  }
}

/**
 * puts coin objects in different positions in screen
 */
void placeCoins() {
  for (Coin c : coinList) {
    c.drawCoin();
  }
}


/**
 * puts coin objects in different positions in screen for level 2
 */
void doCoins2() {
  for (Coin c : coinList) {
    c.tick();
    c.drawCoin();

    if (c.belowGround()) { //if coin hits the ocean floor, go to lost game screen
      screen = -1;
    }
  }
}

/**
 * checks coin collions and returns true if collided, false otherwise
 */
boolean checkCoinCollision(Coin c) {
  return c.collide(charX, charY, charWidth, c.x_pos, c.y_pos, c. width_obstacle, c.height_obstacle); //checks if collided
}
