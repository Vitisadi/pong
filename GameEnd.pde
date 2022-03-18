final int FLASH_INTERVAL_MS = 1_000;

boolean playerVictory;
int flashStartTime;
boolean flashingOn;
int numberFlashes;

void startEndGameMode(boolean playerWon) {
  playerVictory = playerWon;
  flashStartTime = millis();
  numberFlashes = 0;
  flashingOn = true;
  gameState = GameStateEnum.END_GAME;
}

boolean drawingEndGame() {
  return numberFlashes <= 4;
}

void drawGameOver() {
  if(millis() - flashStartTime > FLASH_INTERVAL_MS) {
    numberFlashes++;
    flashingOn = !flashingOn;
    flashStartTime = millis();
  }
  if (flashingOn) {
    textSize(200);
    if (playerVictory) {
      fill(100, 255, 100);
      text("You Win", 500, 600);
    } else {
      fill(255,0,0);
      text("You Lose", 500, 600);
    }
  }
}
