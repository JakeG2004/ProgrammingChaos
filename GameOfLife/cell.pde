class cell{
  int alive;
  int row, col;
  
  cell(int r, int c){
    alive = 0;
    if(int(random(10)) == 0){
      alive = 1; 
    }
    row = r;
    col = c;
  }
  
  void display(){
    fill(hue, 100, 100); //get color
    
    if(alive == 0){ //if dead, set black
      fill(0, 0, 0); 
    }
    rect(col * scale, row * scale, scale, scale); //fill rect 
  }
  
};
