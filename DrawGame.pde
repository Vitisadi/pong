void drawGame() {
  fill(255);
  ellipse(ballXPos, ballYPos, ballRadius * 2, ballRadius * 2);
  drawLineIntersection();
  drawScore();
  drawPong();

  
  if (!gameOn) {
    return;
  }
  
  ballXPos += ballXSpeed;
  ballYPos += ballYSpeed;
    
  //is pong hit
  if (ballXPos - ballRadius <= pong1X && (ballYPos >= pong1Y && ballYPos <= pong1Y + pong1Size)) {
      ballXSpeed = ballXSpeed * -1;
  } else if (ballXPos + ballRadius >= pong2X && (ballYPos >= pong2Y && ballYPos <= pong2Y + pong2Size)) {
      ballXSpeed = ballXSpeed * -1;
      chanceWin = int(random(0,chanceMax + 1));
  } 
  else {
    //did we hit the wall
    if (ballXPos > width - ballRadius || ballXPos < ballRadius){ //hit detection Pong2
       ballXSpeed = ballXSpeed * -1; 
       gameOn = false;
       chanceWin =0;
    }
    if (ballYPos > height - ballRadius || ballYPos < ballRadius){ //hit detection Pong2
       ballYSpeed = ballYSpeed * -1; 
    }
  }
  
  //score
  if (ballXPos > width - ballRadius) {
    player1Score ++;
  }
  if (ballXPos < ballRadius){
    player2Score++;
  }
  
  if(player1Score == VICTORY_POINTS) {
    playerVictory = true;
  }
  
  if(player2Score == VICTORY_POINTS) {
    playerVictory = false;
  }
  
  if (player1Score == VICTORY_POINTS || player2Score == VICTORY_POINTS){
    startEndGameMode(playerVictory);
    println("working?");
  }
  
  
  //winning
  if (chanceWin == chanceMax-1) {
    pong2Speed = ballYSpeed/2;
  } 
  if (chanceWin != chanceMax -1) {
    pong2Speed = abs(ballYSpeed);
  }
  //move pong 2
  if (pong2Y + 50 < ballYPos && ballXSpeed > 0 && ballXPos > width*0.4) {
    pong2Y += pong2Speed;
  } 
  else if (pong2Y + 50> ballYPos && ballXSpeed > 0 && ballXPos > width*0.4) {
    pong2Y += -pong2Speed;
  }
  if (pong2Y +50 < 600 && ballXSpeed < 0){
    pong2Y += pong2Speed;
  } 
  else if (pong2Y + 50> 600 && ballXSpeed < 0){
    pong2Y += -pong2Speed;
  }
}


void drawLineIntersection(){
  for(int i = 35; i<height; i = i + 150) {
    strokeWeight(10);
    stroke(255);
    line(width/2, i, width/2, i +75);
    noStroke();
  }
}

void drawScore(){
  fill(255);
  textSize(100);
  text (player1Score,width/2 - 110,100);
  text (player2Score,width/2 + 50,100);
}

void drawPong(){
  fill(255);
  rect(pong1X, pong1Y, 10, pong1Size, 100); //pong left
  fill(255);
  rect(pong2X, pong2Y, 10, pong2Size, 100); //pong right 
}
