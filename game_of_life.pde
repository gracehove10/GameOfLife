import de.bezier.guido.*;
//Declare and initialize constants NUM_ROWS and NUM_COLS = 20
int NUM_ROWS = 200;
int NUM_COLS = 200;
public Life[][] buttons; //2d array of Life buttons each representing one cell
public boolean[][]buffer; //2d array of booleans to store state of buttons array
public boolean running = true; //used to start and stop program

public void setup () {
  size(1300, 1300);
  frameRate(10);
  // make the manager
  Interactive.make( this );

  //your code to initialize buttons goes here
  buttons = new Life[NUM_ROWS][NUM_COLS];
  //your code to initialize buffer goes here
  buffer = new boolean[NUM_ROWS][NUM_COLS];
  for (int a = 0; a < NUM_ROWS; a++) {
    for (int b = 0; b < NUM_COLS; b++) {
      buttons[a][b] = new Life(a, b);
    }
  }
}

public void draw () {
  background( 0 );
  if (running == false) //pause the program
    return;
  //copyFromButtonsToBuffer();

  //use nested loops to draw the buttons here
  for (int a = 0; a < NUM_ROWS; a++) {
    for (int b = 0; b < NUM_COLS; b++) {
      if (countNeighbors(a, b) == 3) {
        buffer[a][b] = true;
      } else if (countNeighbors(a, b) == 2 && buttons[a][b].getLife()) {
        buffer[a][b] = true;
      } else {
        buffer[a][b] = false;
      }
      buttons[a][b].draw();
    }
  }
  copyFromBufferToButtons();
}

public void keyPressed()
{
  if (keyCode ==32)
  {
    clearBoard();
  } else if (keyCode ==77)
  {
    clearBoard();
    makeMeth(NUM_ROWS/2, NUM_COLS/2);
  }
  else{
    running=!running;
  }
  
}
public void copyFromBufferToButtons()
{
  for (int  a = 0; a < NUM_ROWS; a++)
  {
    for (int b = 0; b< NUM_COLS; b++)
    {
      buttons[a][b].setLife(buffer[a][b]);
    }
  }
}

public void copyFromButtonsToBuffer() {
  for (int a = 0; a < NUM_ROWS; a++) {
    for (int b = 0; b< NUM_COLS; b++) {
      buffer[a][b] = buttons[a][b].getLife();
    }
  }
} 
public boolean isValid(int r, int c) {
  //redo the isValid Function so that it uses NUM_ROW and NUM_COl instead of hardcoding the number 5 in
  //make sure to put NUM_ROW and NUM_COL in the proper places
  if (r >= 0 && r < NUM_ROWS && c >= 0 && c < NUM_COLS) {
    return true;
  } 
  return false;
}

public int countNeighbors(int row, int col) {
  int neighbors = 0;
  //check the neighbors in the buttons Array
  //use the isValid function to determine if you're able to check a square without getting an error

  if (isValid(row-1, col-1) && buttons[row-1][col-1].getLife() ) {
    neighbors++;
  }
  if (isValid(row-1, col) && buttons[row-1][col].getLife() ) {
    neighbors++;
  }
  if (isValid(row-1, col+1) && buttons[row-1][col+1].getLife()) {
    neighbors++;
  }

  if (isValid(row+1, col+1) && buttons[row+1][col+1].getLife()) {
    neighbors++;
  }
  if (isValid(row+1, col) && buttons[row+1][col].getLife()) {
    neighbors++;
  }
  if (isValid(row+1, col-1) && buttons[row+1][col-1].getLife()) {
    neighbors++;
  }

  if (isValid(row, col-1) && buttons[row][col-1].getLife()) {
    neighbors++;
  }
  if (isValid(row, col+1) && buttons[row][col+1].getLife()) {
    neighbors++;
  }
  return neighbors;
}
public void clearBoard()
{
  for (int a = 0; a < NUM_ROWS; a++) {
    for (int b = 0; b< NUM_COLS; b++) {
      buttons[a][b].setLife(false);
    }
  }
}

public void makeMeth(int row, int col)
{
  if (isValid(row-1, col-2))
  {
    buffer[row-1][col-2]= true;
    buttons[row-1][col-2].setLife(true);
  }
  if (isValid(row+1, col-2))
  {
    buffer[row+1][col-2]= true;
    buttons[row+1][col-2].setLife(true);
  }
  if (isValid(row, col))
  {
    buffer[row][col]= true;
    buttons[row][col].setLife(true);
  }
  if (isValid(row+1, col+2))
  {
    buffer[row+1][col+2]= true;
    buttons[row+1][col+2].setLife(true);
  }
  if (isValid(row+1, col+1))
  {
    buffer[row+1][col+1]= true;
    buttons[row+1][col+1].setLife(true);
  }
  if (isValid(row+1, col-3))
  {
    buffer[row+1][col-3]= true;
    buttons[row+1][col-3].setLife(true);
  }
  if (isValid(row+1, col+3))
  {
    buffer[row+1][col+3]= true;
    buttons[row+1][col+3].setLife(true);
  }
}
