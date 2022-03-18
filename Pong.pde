enum GameStateEnum {
  SETTINGS,
  GAME_ON,
  END_GAME
};

GameStateEnum gameState = GameStateEnum.SETTINGS;

final int VICTORY_POINTS = 2;

int ballXPos = 50;
int ballYPos = 50;
int speedOfGame = 10;
int ballXSpeed = speedOfGame;
int ballYSpeed = speedOfGame;
int pongLimit = 1100;
boolean gameOn = false;


int pong1Size = 175;
int pong2Size = 175;
int pong1X = 100;
int pong1Y = 600;
int pong2X = 1700;
int pong2Y = 600;
int ballRadius = 20;
int pong1Speed = speedOfGame*2;
int pong2Speed = speedOfGame;

int firstButtonX = 400;
int firstButtonY = 200;
int distX = 400;
int distY = 300;
int boxXSize = 200;
int boxYSize = 100;
int boxX =0;
int boxY = 0;

int chanceMax =5;
int chanceWin;

int player1Score = 0;
int player2Score = 0;

int gameModeBotDifficulty = -1;
int gameModeBallSpeed = -1;
int gameModePongSize = -1;

void setup(){
  size(1800, 1200);
}

void draw() {
  background(0);
  if (gameState == GameStateEnum.SETTINGS) {
    titleScreen();
    return;
  }
  
  if (gameState == GameStateEnum.END_GAME) {
    drawGameOver();
    if (!drawingEndGame()) {
      //gameModeBotDifficulty = -1;
      //gameModeBallSpeed = -1;
      //gameModePongSize = -1;    
      player1Score = 0;
      player2Score = 0;
      gameState = GameStateEnum.SETTINGS;
    }
  }
  
  drawGame();
}



void keyPressed(){
  if(gameOn != true && keyCode == 32 && player1Score != VICTORY_POINTS && player2Score != VICTORY_POINTS) {
    gameOn = true;
    ballXPos = int(random(150,200));
    ballYPos = int(random(100,height - 100));
    ballXSpeed = speedOfGame;
    ballYSpeed = speedOfGame;
  }
  if (pong1Y < height - pong1Size & pong1Y > 0){
    if (keyCode == 87) { //w
      pong1Y = pong1Y - pong1Speed;
    }
    if (keyCode == 83) { //s
      pong1Y = pong1Y + pong1Speed;
    }
  }
  if (pong1Y == 0 & keyCode == 87){
    pong1Y = pong1Y + 20;
  }
  if (pong1Y == pongLimit & keyCode == 83){
    pong1Y = pong1Y - 20;
  }
}


void mousePressed(){
  int settingClicked = -1;
  
  for(int x=0; x <3; x++){
    for(int y=0; y<3; y++) {
      boxX = firstButtonX + distX * x;
      boxY = firstButtonY + distY * y;
      if (boxX < mouseX && mouseX < boxX + boxXSize && boxY < mouseY && mouseY < boxY + boxYSize) {
        settingClicked = y*3 + x;
      } 
    }
  }
  
  if (settingClicked >= 0 && settingClicked <= 2 ) {
    gameModeBotDifficulty = settingClicked;
  } else if (settingClicked >= 3 && settingClicked <= 5 ) {
    gameModePongSize = settingClicked - 3;
  } else if (settingClicked >= 6 && settingClicked <= 8 ) {
    gameModeBallSpeed = settingClicked - 6;
  }
  
  if(400<mouseX && mouseX < boxXSize * 3 + 800 && 1000 < mouseY && mouseY < 1000 + boxYSize) {
    // before starting, c all modes are pre-selected
    if (gameModeBallSpeed >=0 && gameModeBotDifficulty >=0 && gameModePongSize >=0) {
      gameState = GameStateEnum.GAME_ON;
    }
  }
  
  switch (gameModeBotDifficulty) {
    case 0: 
      chanceMax = 2; 
      break;
    case 1: 
      chanceMax = 5; 
      break;
    case 2: 
      chanceMax = 10; 
      break;
  }
  
  switch (gameModePongSize) {
    case 0: 
      pong1Size = 100;
      pong2Size = 100;
      pongLimit = 1100;      
      break;
    case 1: 
      pong1Size = 175;
      pong2Size = 175;
      pongLimit = 1040;
      break;
    case 2: 
      pong1Size = 250;
      pong2Size = 250;
      pongLimit = 960; 
      break;
  }  

  switch (gameModeBallSpeed) {
    case 0: 
      speedOfGame = 10;      
      break;
    case 1: 
      speedOfGame = 20;
      break;
    case 2: 
      speedOfGame = 30;
      break;
  }
  //pong1Speed = speedOfGame*2;
  //pong2Speed = speedOfGame;
}
