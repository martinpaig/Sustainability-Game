/**
 * Button class which changes colour when hovered over, registers when clicked on and does a specified action
 */
class Button {

  private float circleX;
  private float circleY;
  private float circleSize = 30;
  private int circleColor = 255;
  private int circleHighlight = 204;


  public Button(float circleX, float circleY) { //constructor
    this.circleX = circleX;
    this.circleY = circleY;
  }

  /**
   * returns true if player has clicked on the button, else returns false
   */
  boolean overCircle(int diameter) {
    if (dist(mouseX, mouseY, circleX, circleY) < diameter/2 ) {
      return true;
    } else {
      return false;
    }
  }

  /**
   * draws specified text on top of a button to show what it does
   */
  void drawText(String text) {
    fill(0);
    text(text, circleX-4, circleY+5);
    fill(255);
  }

  /**
   * puts specified image on top of a button to show what it does
   */
  void drawIcon() {
    image(restartIcon, circleX-8, circleY-8);
  }

  /**
   * draws button on the screen and changes its colour when clicked on
   */
  void drawButton() {

    if (overCircle(30)) {
      fill(circleHighlight); //shows hovered over state
    } else {
      fill(circleColor); //stays as normal colour
    }
    stroke(0);
    ellipse(circleX, circleY, circleSize, circleSize); //draws circle button
  }
}
