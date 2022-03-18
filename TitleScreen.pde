void titleScreen() {
  for(int x= 0; x <3; x++){
    for(int y = 0; y < 3; y++) {
      boxX = firstButtonX + distX * x;
      boxY = firstButtonY + distY * y;
      if (boxX < mouseX && mouseX < boxX + boxXSize && boxY < mouseY && mouseY < boxY + boxYSize) {
        fill (20, 50, 255);
      } else {
        fill(255);
      }
      if (y == 0 && x == gameModeBotDifficulty || y == 1 && x == gameModePongSize || y == 2 && x == gameModeBallSpeed) {
        fill(205, 255, 50);
      }
      rect(boxX, boxY, boxXSize, boxYSize);
    }
  }
  fill (255);
  rect(400, 1000, boxXSize * 3 + 400, boxYSize);
  text();
}
void text(){
  fill(255);
  textSize(100);
  text("Bot Difficulty",600, 150);
  text("Pong Size",650, 440);
  text("Ball Speed",630, 740);
    fill(0);
  text("Start", 790, 1090);
  textSize(50);
  //Bot Difficulty
  text("Easy", 450, 275);
  text("Normal", 810, 275);
  textSize(35);
  text("Impossible", 1210, 270);
  textSize(50);
  //Pong Size
  text("Small", 435, 575);
  text("Normal", 810, 575);
  text("Large", 1230, 575);
  //Ball Speed
  text("Slow", 435, 870);
  text("Normal", 810, 870);
  text("Fast", 1230, 870);
}
