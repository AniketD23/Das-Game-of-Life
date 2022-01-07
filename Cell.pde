class Cell{
  // X and Y positions of the  cell
  float cellX;
  float cellY;
  // Boolean for whether the cell is alive in the current generation
  boolean isAlive;
  // List of living status of each neighbor at current time
  int livingNeighbors;
  // Boolean for whether the cell will be alive in the next generation
  boolean nextGen;
  

  Cell (float setCellX, float setCellY, boolean setIsAlive){
    cellX = setCellX;
    cellY = setCellY;
    isAlive = setIsAlive;
  }
  
  // Draw cell if it's alive
  void drawCell(){
    if(isAlive){
      fill(11,211,211);
      noStroke();
    }
    else{
      fill(0);
    }
    
    square(cellX, cellY, SIDE);
  }
  
}
