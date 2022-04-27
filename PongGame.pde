//TO DO:
//restart button
//back button
//sound effects+ pause mode
//FONT change
//in gameover reset ball postion, score, speed

//stars
Star [] stars= new Star[1000]; //how many stars
Confetti [] confettis= new Confetti[1000]; //how many stars

//sound
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

//sound variables
Minim minim;
AudioPlayer theme, coin, bump, gameover;

//color variable
color red    = #F50A12;
color blue   = #0F2AD1;

//MODE variables------------------------------------
int mode; 
final int INTRO     = 0;
final int GAME      = 1;
final int PAUSE     = 2;
final int GAMEOVER  = 3;
//final int OPTION=4;

  //variables
 float x, y, w, h;
 int winner; 
 int rightplayer;
 int leftplayer;
 int thickness;
 
 //font
 PFont  font;
 PFont  intro;
 PFont  player;
 PFont  win;
 PFont  cod;
 PFont  restart;

 
 //player strikers
 PImage selectiveImage;
 PImage leftStriker;
 PImage rightStriker;
 boolean showImage;

 //selective
 int selective;
 
 //ball variables
  float vx, vy;
  float ballx, bally, balld, ballr;
  float distleft;

  //paddles variables
 float leftx, lefty, leftd, rightx, righty, rightd;
  //keyboard variables
  boolean wkey, skey, upkey, downkey; //when it's true, they key will be pressed
  boolean AI;
  //scoring
  int leftscore, rightscore, timer;



void setup() {
  size(800,600);
  mode= INTRO;
  
  for (int i= 0; i < stars.length; i++){
   stars[i] = new Star();
 }
  
  for (int i= 0; i < confettis.length; i++){
   confettis[i] = new Confetti();
 }
   
 //variable setup
 x= width/2;
 y= height/2;
 //initialize w, h
 w=0;
 h=0;
 
 //initilize selective
 selective=255;
 
 //initialize font
 font= createFont("DIGITAL.TTF", 40);
 intro= createFont("game_over.ttf", 40);
 player= createFont("neon.ttf", 40);
 win= createFont("Adventure.otf", 40);
 cod= createFont("video games 2.ttf", 40);
 restart= createFont("Font 90 Icons.ttf", 40);


 //initialize strikers
 leftStriker= loadImage("bluepuck.jpeg");
 rightStriker= loadImage("redplayer.jpeg");
 selectiveImage= rightStriker;
 showImage= false;

 //initialize paddles
 leftx= 0;
 lefty= height/2;
 leftd= 200; //diameter of left paddel
 rightx= width;
 righty= height/2;
 rightd= 200; //diameter of left paddel
 
 //initialize ball
 ballx= width/2;
 bally= height/2;
 balld= 80; //diameter of ball
// ballr= balld/2;
 vx= random(-5,5);
 vy= random(-5,5);
 
 //initialize keyboard variable
 wkey= skey= upkey= downkey= false; //assume that we are not pressing any keys
 
 //initialize score
  rightscore= leftscore= 0;
  timer= 100;
  
 //minim sounds
    minim = new Minim(this);
    theme = minim.loadFile("theme.mp3");//intro screen
    coin = minim.loadFile("coin.wav");//winning sound (goal)
    bump = minim.loadFile("bump.wav");//bump sound( paddles bump)
    gameover = minim.loadFile("gameover.wav");//winner screen
}

void draw() {
  //stars
  pushMatrix();
  background(0);
  translate(width/2, height/2);
  for (int i= 0; i < stars.length; i++){
   stars[i]. update();
   stars[i]. show();
 }
 popMatrix();
  if (mode ==INTRO) {
    intro(); //if mode = intro, then intro will be the draw function
  } else if (mode == GAME){
    game(); //if mode= game. then intro will stop and game will be draw function
  } else if (mode == PAUSE) {
    pause();
  } else if (mode== GAMEOVER){
    gameover();
  } else {
    println("Error: Mode = " + mode);
  } 
}
