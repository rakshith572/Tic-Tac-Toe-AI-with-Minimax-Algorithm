String [][]board={
  {"","",""},
  {"","",""},
  {"","",""}
};

  float w;
  float h;
  
// we play as "O"  
  String human="o";
// computer play as "X"  
  String ai="x";
  
// lets start with human  
String currentPlayer=human;

void setup(){
// canvas  
  size(400,400);
// w value is division of width/3

  w=(int)width/3;
  h=(int)height/3;
  
   //bestMove();
}

void draw(){
  // background is white
  background(255);
  strokeWeight(4);
  
// draw a 3*3 box for play  
  line(w,0,w,height);
  line(w*2,0,w*2,height);
  line(0,h,width,h);
  line(0,h*2,width,h*2);
  
  for(int i=0;i<3;i++){
    for(int j=0;j<3;j++){
 //    the point of drawing     
      float x=w*j+w/2;
      float y=h*i+h/2;
      
//    check weather its human chance or computer
      String spot=board[i][j];
//    if it's computer it draw's "X"
//    else ot draw "0"
      if(spot== ai){
        float xr=w/4;
        line(x-xr,y-xr,x+xr,y+xr);
        line(x+xr,y-xr,x-xr,y+xr);
      }else if(spot==human){
        noFill();
        ellipse(x, y, w / 2, w / 2);
      }
    }
  }
// check's wiiner   
  String res=checkWinner();
  if(res!=null){
    if(res=="tie"){
      print("tie");
    }else{
      println(res+" "+"wins");
    }
    noLoop();
  }
}


// fuction that check for every row , columns , diagonal
String checkWinner() {
  String winner = null;

  // horizontal
  for (int i = 0; i < 3; i++) {
    if (equals3(board[i][0], board[i][1], board[i][2])) {
      winner = board[i][0];
    }
  }

  // Vertical
  for (int i = 0; i < 3; i++) {
    if (equals3(board[0][i], board[1][i], board[2][i])) {
      winner = board[0][i];
    }
  }

  // Diagonal
  if (equals3(board[0][0], board[1][1], board[2][2])) {
    winner = board[0][0];
  }
  if (equals3(board[2][0], board[1][1], board[0][2])) {
    winner = board[2][0];
  }

  int openSpots = 0;
  for (int i = 0; i < 3; i++) {
    for (int j = 0; j < 3; j++) {
      if (board[i][j] == "") {
        openSpots++;
      }
    }
  }

  if (winner == null && openSpots == 0) {
    return "tie";
  } else {
    return winner;
  }
}
boolean equals3(String a,String b,String c){
  return (a==b && b==c && a!="");
}

// when mouse is pressed pointing towards destination there board[index][index1] makes "0"
void mousePressed(){
 if(currentPlayer==human){
   int i=floor(mouseY/w);
 int j=floor(mouseX/w);
   if(board[i][j]==""){
     board[i][j]=human;
     currentPlayer=ai;
     bestMove();
   }
 }
}
