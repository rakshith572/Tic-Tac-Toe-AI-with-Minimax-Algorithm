// here is the brain of these program
// Minimax
void bestMove() {

// these is keep track of score scores by player 
// if ai wins it adds +10
// else it adds -10
  int bestScore=-10000;
  
// reference to check it hase spot in board  
  int x=-1;
  int y=-1;
// loop through every element  
// these program in advance visit all element verify
  for (int i=0; i<3; i++) {
    for (int j=0; j<3; j++) {
      if (board[i][j]=="") {
        board[i][j]=ai;
// we should pass the parameter as false it is because it is chance for human        
        int score=miniMax(false);
//    backtracking the board[i][j]      
        board[i][j]="";
        
// updateing x and y if score if better for ai
// know it has better chance
        if (score > bestScore) {
          bestScore=score;
          x=i;
          y=j;
        }
      }
    }
  }
// if x and y are -1 then no spot available  
  if(x==-1 && y==-1){
    noLoop();
    return;
  }
// now we are actually adding ai i.e O in board in best position  
    board[x][y]=ai;
    currentPlayer=human;
}

// here is the brain of these program
int miniMax(boolean maxiMize) {
// checkWinner
  String res=checkWinner();
  
// checking weather the result is not null  
  if(res!=null){
// if winner if AI then we should return 10  because these program is favour of AI so it add 10 if winner is AI
   if (res=="x") {
    return 10;
    }
// if winner if human we should return -10   
    if (res=="o") {
      return -10;
    }
// if winner if tie then return 0  
    if (res=="tie") {
      return 0;
    } 
  }
//  if it chance for ai if maxMize id true 
  if (maxiMize) {
    int bestScore=-10;
// loop through all element in spot    
    for (int i=0; i<3; i++) {
      for (int j=0; j<3; j++) {
        if (board[i][j]=="") {
//  update board[i][j] ai        
          board[i][j]=ai;
          int score=miniMax(false);
 // backTracking it's board         
          board[i][j]="";
 // know bestScore is maximum of score and bestScore         
          bestScore=max(score, bestScore);
        }
      }
    }
 // return bestScore   
    return bestScore;
  } 
  else {
// know  if maxMize if false i.e  will calculate score for human  
    int bestScore=10;
// loop through all element in spot  
    for (int i=0; i<3; i++) {
      for (int j=0; j<3; j++) {
        if (board[i][j]=="") {
//  update board[i][j] ai   
          board[i][j]=human;
          int score=miniMax(true);
// backTracking it's board             
          board[i][j]="";
  // know bestScore is maximum of score and bestScore           
          bestScore=min(score, bestScore);
        }
      }
    }
    return bestScore;
  }
}
