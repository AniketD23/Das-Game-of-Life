import java.util.List;
import java.util.ArrayList;

// Side length of each cell in pixels
final int SIDE = 5;

//Number of columns and rows of cells
final int COL = 300;
final int ROW = 150;

// 2D Array of cells representing the board
Cell[][] cells = new Cell[ROW][COL];


void setup(){
  size(1500,1000);
  background(0);
  frameRate(5);
  surface.setSize(SIDE*COL, SIDE*ROW);
  
  // Populate cells array with Cell objects that have a 15% chance of being alive in the first generation
  for (int i = 0; i < ROW; i++){
    for (int j = 0; j < COL; j++){
      cells[i][j] = new Cell(j*SIDE, i*SIDE, Math.random() < 0.15);
    }
  }
  
}
  




void draw(){
  
  //draw the cells on the board
  for (int i = 0; i < ROW; i++){
    for (int j = 0; j < COL; j++){
      cells[i][j].drawCell();
    }
  }
  line(width-1, 0, width-1, height); //right border
  line(0, height-1, width, height-1); //bottom border
  line(1, 0, 1, height); //left border;
  line(0, 1, width, 1);

  
  // Count living neighbors this generation 
  for (int i = 0; i < ROW; i++){
    for (int j = 0; j < COL; j++){
      if (i != 0 && cells[i - 1][j].isAlive) { // Cell above is a neighbor
        cells[i][j].livingNeighbors++;
      } 
      if (i != ROW - 1 && cells[i + 1][j].isAlive) { // Below is neighbor
        cells[i][j].livingNeighbors++;
      }
      if (j != 0 && cells[i][j - 1].isAlive) { // Left is neighbor
        cells[i][j].livingNeighbors++;
      }
      if (j != COL - 1 && cells[i][j + 1].isAlive) { // Right is neighbor
        cells[i][j].livingNeighbors++;
      }
      
      if (i != 0 && j != 0 && cells[i - 1][j - 1].isAlive) { // Top left is neighbor
        cells[i][j].livingNeighbors++;
      }
      if (i != 0 && j != COL - 1 && cells[i - 1][j + 1].isAlive) { // Top right is neighbor
        cells[i][j].livingNeighbors++;
      }
      if (i != ROW - 1 && j != 0 && cells[i + 1][j - 1].isAlive) { // Bottom left is neighbor
        cells[i][j].livingNeighbors++;
      }
      if (i != ROW - 1 && j != COL - 1 && cells[i + 1][j + 1].isAlive) { // Bottom right is neighbor
        cells[i][j].livingNeighbors++;
      }
    }
  }
    
  //determine whether each cell will be alive in the next generation
  for (int i = 0; i < ROW; i++){
    for (int j = 0; j < COL; j++){
      if( cells[i][j].isAlive && (cells[i][j].livingNeighbors == 2 || cells[i][j].livingNeighbors == 3) ){ // Living cell with 2 or 3 living neighbors stays alive
        cells[i][j].nextGen = true;
      } else if (!(cells[i][j].isAlive) && cells[i][j].livingNeighbors == 3){ // Dead cell with 3 neighbors comes to life
          cells[i][j].nextGen = true;
      } else{ // All other cells die or stay dead
          cells[i][j].nextGen = false;
      }
    }
  }
  
  //draw the next generation
  for (int i = 0; i < ROW; i++){
    for (int j = 0; j < COL; j++){
      cells[i][j].isAlive = cells[i][j].nextGen;
      cells[i][j].livingNeighbors = 0;
    }
  }
  
}
