cell board[][];
int numCols, numRows;
int scale;
int hue = 0;
boolean pattern = false;

void setup(){
  size(900, 1000);
  init();
  
  colorMode(HSB, 360, 100, 100);
}

void draw(){
  //iterate thru list
  for(int r = 0; r < numRows; r++){
    for(int c = 0; c < numCols; c++){
      //draw cell
      board[r][c].display();
    }
  }
  update();
  
  hue = (hue + 1) % 360;
}

void update(){
  cell buffer[][] = new cell[numRows][numCols];
  int neighbors;
  
  //calculate cell
  for(int r = 0; r < numRows; r++){
    for(int c = 0; c < numCols; c++){
      neighbors = countNeighbors(r, c);  //get neighbors
      
      buffer[r][c] = new cell(r, c); //init cell
      
      buffer[r][c].alive = board[r][c].alive;
      
      //death
      if(neighbors < 2 || neighbors > 3){
        buffer[r][c].alive = 0;
      }
      
      //life
      if(neighbors == 3){
        buffer[r][c].alive = 1;
      }
    }
  }
  
  //write to board
  for(int r = 0; r < numRows; r++){
    for(int c = 0; c < numCols; c++){
      board[r][c].alive = buffer[r][c].alive;
    }
  }
}

int countNeighbors(int row, int col){
  int value = 0;
  int range = 1;
  int neighborR, neighborC;
  
  //iterate through neighbors
  for(int dr = -range; dr <= range; dr++){
    for(int dc = -range; dc <= range; dc++){
      
      //only do this if not referencing center cell
      if(dr != 0 || dc != 0){
        neighborR = ((row + dr) + numRows) % numRows;
        neighborC = ((col + dc) + numCols) % numCols;
     
        //add to value
        value += board[neighborR][neighborC].alive;
      }
    }
  }
  
  return value;
}

void init(){
  //init vars
  scale = 5;
  numRows = height / 5;
  numCols = width / 5;
  board = new cell[numRows][numCols];
  
  //init random board
  for(int r = 0; r < numRows; r++){
    for(int c = 0; c < numCols; c++){
      board[r][c] = new cell(r, c);
      
      if(pattern){
        board[r][c].alive = 0;
      }
    }
  }
  
  noStroke(); //remove border
  
  if(!pattern){
    return;
  }
  
  int r = int(numRows / 2);
  int c = int(numCols / 2);
  
  board[r][c].alive = 1; 
  board[r - 1][c].alive = 1;
  board[r + 1][c].alive = 1;
  
  
}
