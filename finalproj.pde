//create objects to store background images
PImage background1;
PImage background2;
PImage background3;
PImage backgroundHome;
PImage ocean;
PImage oceanFlipped;

//create objects to store sprite sheets to implement different actions: idle, run, jump facing left or right
PImage runLeftSheet;
PImage runRightSheet;
PImage idleLeftSheet;
PImage idleRightSheet;
PImage jumpLeftSheet;
PImage jumpRightSheet;

//store the sprites different positions from the image loaded in, in an array of PImage objects
//length depends of the image loaded in
PImage[] runL = new PImage[8];
PImage[] runR = new PImage[8];
PImage[] idleL = new PImage[6];
PImage[] idleR = new PImage[6];
PImage[] jumpL = new PImage[10];
PImage[] jumpR = new PImage[10];

//width of the sprite
int charWidth = 56;
//sprite current x and y position
int charX;
int startHeight = 10;
int charY = startHeight;
//current state of screen
int screen;
//current x position of the camera
int cameraX = 0;
//which frame in the sprite sheet to use
int animFrameIdle = 0;
int animFrameRun = 0;
int animFrameJump = 0;
//velocity player is moving in horizontal and vertical directions
float velX = 0;
float velY = 0;

//sets initial values of variables to adjust the sea's position
float offset = -15;
float easing = 10;
int framesPassed = 40;

//default starts at level 1
int level = 1;

//booleans to store current state of the sprite (direction facing and action doing)
boolean facingLeft = false;

//stores current action
//set to idle as default
String actionPreJump = "idle";

//button objects for control buttons in top right corner
Button exitButton;
Button pauseButton;
Button restartButton;
PImage restartIcon;

//create a list of litter objects
ArrayList<Coin> coinList = new ArrayList<Coin>();
//number of litter pieces player has collected so far
int coinCount = 0;

//by default game is unpaused
boolean paused = false;

//timer objects to keep track of time during each level
Timer startTimer;
Timer level2Timer;


public void setup() {
  //screen size, width of 1000 pix, height of 180 pix
  size(1000, 180);
  //frameRate(20);
  //sets x position of sprite to approx the middle of the screen
  charX = width/2;

  //loads background and sprite sheet images and assigns them to PImage objects
  background1 = loadImage("layer-1-sky.png");
  imgResize(background1);
  background2 = loadImage("layer-2-mountain.png");
  imgResize(background2);
  background3 = loadImage("layer-3-ground.png");
  imgResize(background3);
  backgroundHome = loadImage("desert_BG.png");
  imageScale(backgroundHome, 0.5);
  ocean = loadImage("ocean2.png");
  imageScale(ocean, 0.1);
  oceanFlipped = loadImage("ocean2flipped.png");
  imageScale(oceanFlipped, 0.1);
  restartIcon = loadImage("restart1.png");
  imageScale(restartIcon, 0.08); //0.022

  runRightSheet = loadImage("https://ecs.wgtn.ac.nz/foswiki/pub/Courses/CGRA151_2022T2/Assignment3/run_r.png");
  runLeftSheet = loadImage("https://ecs.wgtn.ac.nz/foswiki/pub/Courses/CGRA151_2022T2/Assignment3/run_l.png");
  idleRightSheet = loadImage("https://ecs.wgtn.ac.nz/foswiki/pub/Courses/CGRA151_2022T2/Assignment3/idle_r.png");
  idleLeftSheet = loadImage("https://ecs.wgtn.ac.nz/foswiki/pub/Courses/CGRA151_2022T2/Assignment3/idle_l.png");
  jumpRightSheet = loadImage("https://ecs.wgtn.ac.nz/foswiki/pub/Courses/CGRA151_2022T2/Assignment3/jump_r.png");
  jumpLeftSheet = loadImage("https://ecs.wgtn.ac.nz/foswiki/pub/Courses/CGRA151_2022T2/Assignment3/jump_l.png");

  //connects state of sprite to the correlated sprite sheet
  getCharState(runLeftSheet, runL);
  getCharState(runRightSheet, runR);
  getCharState(idleLeftSheet, idleL);
  getCharState(idleRightSheet, idleR);
  getCharState(jumpLeftSheet, jumpL);
  getCharState(jumpRightSheet, jumpR);

  //creates new buttons for each control
  exitButton = new Button(970, 20);
  pauseButton = new Button(940, 20);
  restartButton = new Button(910, 20);

  //creates timers starting at 0
  startTimer = new Timer(0);
  level2Timer = new Timer(0);
}

public void draw() {
  if (screen ==0) { //home screen
    drawHome();
    textSize(48);
    text("RISING TIDES", width/2-125, height/2+20);
    textSize(25);
    text("Click space to play!", width-220, height-20);
    textSize(20);
    text(" Use WASD keys to collect all the litter ", 30, height-40);
    text("before the sea level rises too high!", 45, height-20);
    charX = width/2;
  }

  if (screen == 1) { //level 1
    if (!paused) {
      level1();
    }
  }

  if (screen == 2) { //level 2

    if (!paused) {
      level2();
    }
  }

  if (screen == -1) { //lost screen
    background(0, 0, 0);
    text("Game over, press G to go back to menu", width/2-150, height/2);
  }

  if (screen == 3) { //won screen
    background(250, 218, 221);
    fill(0);
    text("Victory, press G to play again", width/2-100, height/2);
    fill(255);
  }
}

void mousePressed() {
  if (exitButton.overCircle(30)) { //if mouse clicks on exit button
    exit();
  }

  if (restartButton.overCircle(30)) { //if mouse clicks on restart button
    coinList.clear(); //clears old litter to redraw in new positions
    screen = 0;
    offset = -15; //resets position of sea
    easing = 10;
  }

  if (pauseButton.overCircle(30)) { //if mouse clicks on pause button
    paused = !paused; //changes to opposite state eg. if paused now will be unpaused and vice versa
  }
}
