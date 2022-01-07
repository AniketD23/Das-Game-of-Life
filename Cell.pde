class Cell{
  float cellX;
  float cellY;
  boolean isAlive;
  // List of living status of each neighbor at current time
  int livingNeighbors;
  boolean nextGen;
  
  Cell (float setCellX, float setCellY, boolean setIsAlive){
    cellX =setCellX;
    cellY = setCellY;
    isAlive = setIsAlive;
    
  }
  
  void drawCell(){
    if(isAlive){
      fill(11,211,211);
      noStroke();
    }
    else{
      fill(0);
      //stroke(248,144,231);
    }
    
    square(cellX, cellY, SIDE);
  }
  
  //int getLives(){
  //  int count = 0;
  //  for(boolean b : neighbors){
  //    if(b){
  //      count++;
  //    }
  //  }
  //  return count;
  //}
  
}
