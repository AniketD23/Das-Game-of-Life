import java.util.List;
import java.util.ArrayList;

// Side length of each cell in pixels
final int SIDE = 5;

//Number of columns and rows of cells
final int COL = 200;
final int ROW = 300;

Cell[][] cells = new Cell[ROW][COL];



  
void setup(){
  size(1000,1000);
  background(0);
  stroke(248,144,231);
  frameRate(5);
  surface.setSize(SIDE*COL, SIDE*ROW);
  
  
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

  
    // Living neighbors this generation 
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
    
  //for(int i = 0; i < ROW; i++){
  //  for(int j = 0; j < COL; j++){
  //    if(i == 0 && j == 0){ //top left corner
  //        cells[i][j].neighbors[0] = cells[i][j+1].isAlive; //right
  //        cells[i][j].neighbors[1] = cells[i+1][j].isAlive; //below
  //        cells[i][j].neighbors[2] = cells[i+1][j+1].isAlive; //below right
  //    } else if (i == 0 && j == COL-1){ //top right corner
  //        cells[i][j].neighbors[0] = cells[i][j-1].isAlive; //left
  //        cells[i][j].neighbors[1] = cells[i+1][j-1].isAlive; //below left
  //        cells[i][j].neighbors[2] = cells[i+1][j].isAlive; //below
  //    } else if (i == ROW-1 && j == 0){ //bottom left corner
  //        cells[i][j].neighbors[0] = cells[i-1][j].isAlive; //above
  //        cells[i][j].neighbors[1] = cells[i-1][j+1].isAlive; //above right
  //        cells[i][j].neighbors[2] = cells[i][j+1].isAlive; //right
  //    } else if (i == ROW-1 && j == COL-1){ //bottom right corner
  //        cells[i][j].neighbors[0] = cells[i-1][j-1].isAlive; //above left
  //        cells[i][j].neighbors[1] = cells[i-1][j].isAlive; //above;
  //        cells[i][j].neighbors[2] = cells[i][j-1].isAlive; //left
  //    } else if (i == 0){ //top row
  //        cells[i][j].neighbors[0] = cells[i][j-1].isAlive; //left
  //        cells[i][j].neighbors[1] = cells[i][j+1].isAlive; //right
  //        cells[i][j].neighbors[2] = cells[i+1][j-1].isAlive; //below left
  //        cells[i][j].neighbors[3] = cells[i+1][j].isAlive; //below
  //        cells[i][j].neighbors[4] = cells[i+1][j+1].isAlive; //below right
  //    } else if (i == ROW-1){ //bottom row
  //        cells[i][j].neighbors[0] = cells[i-1][j-1].isAlive; //above left
  //        cells[i][j].neighbors[1] = cells[i-1][j].isAlive; //above;
  //        cells[i][j].neighbors[2] = cells[i-1][j+1].isAlive; //above right
  //        cells[i][j].neighbors[3] = cells[i][j-1].isAlive; //left
  //        cells[i][j].neighbors[4] = cells[i][j+1].isAlive; //right
  //    } else if (j == 0){ //left column
  //        cells[i][j].neighbors[0] = cells[i-1][j].isAlive; //above
  //        cells[i][j].neighbors[1] = cells[i-1][j+1].isAlive; //above right
  //        cells[i][j].neighbors[2] = cells[i][j+1].isAlive; //right
  //        cells[i][j].neighbors[3] = cells[i+1][j].isAlive; //below
  //        cells[i][j].neighbors[4] = cells[i+1][j+1].isAlive; //below right
  //    } else if (j == COL-1){ //right column
  //        cells[i][j].neighbors[0] = cells[i-1][j-1].isAlive; //above left
  //        cells[i][j].neighbors[1] = cells[i-1][j].isAlive; //above
  //        cells[i][j].neighbors[2] = cells[i][j-1].isAlive; //left
  //        cells[i][j].neighbors[3] = cells[i+1][j-1].isAlive; //below left
  //        cells[i][j].neighbors[4] = cells[i+1][j].isAlive; //below
  //    } else{ //all the other cells (with the pumped up kicks)
  //        cells[i][j].neighbors[0] = cells[i-1][j-1].isAlive; //above left 
  //        cells[i][j].neighbors[1] = cells[i-1][j].isAlive; //above
  //        cells[i][j].neighbors[2] = cells[i-1][j+1].isAlive; //above right
  //        cells[i][j].neighbors[3] = cells[i][j-1].isAlive; //left
  //        cells[i][j].neighbors[4] = cells[i][j+1].isAlive; //right
  //        cells[i][j].neighbors[5] = cells[i+1][j-1].isAlive; //below left
  //        cells[i][j].neighbors[6] = cells[i+1][j].isAlive; //below
  //        cells[i][j].neighbors[7] = cells[i+1][j+1].isAlive; //below right
  //    }
  //  }
  //}
  
  //determine whether each cell will be alive in the next generation
  for (int i = 0; i < ROW; i++){
    for (int j = 0; j < COL; j++){
      if( cells[i][j].isAlive && (cells[i][j].livingNeighbors == 2 || cells[i][j].livingNeighbors == 3) ){
        cells[i][j].nextGen = true;
      } else if (!(cells[i][j].isAlive) && cells[i][j].livingNeighbors == 3){
          cells[i][j].nextGen = true;
      } else{
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
