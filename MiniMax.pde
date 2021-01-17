// here is the brain of these program
// Minimax
void bestMove() {
  int bestScore=-10000;
  int x=-1;
  int y=-1;
// loop through every element  
// these program in advance visit all element verify
  for (int i=0; i<3; i++) {
    for (int j=0; j<3; j++) {
      if (board[i][j]=="") {
        board[i][j]=ai;
        int score=miniMax(false);
        board[i][j]="";
        //int score=0;
        if (score > bestScore) {
          bestScore=score;
          x=i;
          y=j;
        }
      }
    }
  }
  if(x==-1 && y==-1){
    noLoop();
    return;
  }
    board[x][y]=ai;
    currentPlayer=human;
}
int miniMax(boolean maxiMize) {
  String res=checkWinner();
  if(res!=null){
   if (res=="x") {
    return 10;
    }
    if (res=="o") {
      return -10;
    }
    if (res=="tie") {
      return 0;
    } 
  }
  if (maxiMize) {
    int bestScore=-10;
    for (int i=0; i<3; i++) {
      for (int j=0; j<3; j++) {
        if (board[i][j]=="") {
          board[i][j]=ai;
          int score=miniMax(false);
          board[i][j]="";
          bestScore=max(score, bestScore);
        }
      }
    }
    return bestScore;
  } 
  else {
    int bestScore=10;
    for (int i=0; i<3; i++) {
      for (int j=0; j<3; j++) {
        if (board[i][j]=="") {
          board[i][j]=human;
          int score=miniMax(true);
          board[i][j]="";
          bestScore=min(score, bestScore);
        }
      }
    }
    return bestScore;
  }
}
