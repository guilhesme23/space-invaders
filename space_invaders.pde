Ship ship;
Enemy[][] enemies;
ArrayList <Shoot> shoots = new ArrayList<Shoot>();
float scl = 10;
int enemyScl = 80;
int cols;
int rows;
void setup() {
  size(600,400,P2D);
  ship = new Ship();
  cols = floor(width/enemyScl);
  rows = 4;
  enemies = new Enemy[rows][cols];
  for (int i = 0; i  < rows; i++) {
    for (int j = 0; j < cols; j++) {
      enemies[i][j] = new Enemy(j*enemyScl + enemyScl, (i+1) * 40);
    }
  }
}

void draw() {
  background(0);
  ship.show();
  ship.move();
  ship.showScore();
  
  //Drawing enemies
  boolean border = false;
  for (int i = 0; i  < rows; i++) {
    for (int j = 0; j < cols; j++) {
      enemies[i][j].show();
      enemies[i][j].move();
      if ((enemies[i][j].x + enemies[i][j].size) > width || (enemies[i][j].x) < 0){
        border = true;
      }
      if (enemies[i][j].gameOver(ship)) {
         PFont font;
         String s = "Game Over :(";
         font = createFont("Bitstream Charter", 30);
         textFont(font);
         textAlign(CENTER,CENTER);
         text(s,width/2,height/2);
         textAlign(LEFT,CENTER);
      }
    }
  }
  
  for (int i = shoots.size() - 1; i >=0 ; i--) {
    Shoot shoot = shoots.get(i);
   shoot.show();
   shoot.move();
   
   if (shoot.isOver()) {
     shoots.remove(i);
   }
   
   boolean collision = false;
   for (int k = rows - 1; k  >= 0; k--) {
      for (int j = cols - 1; j >= 0; j--) {
        collision = shoot.detectCollision(enemies[k][j]);
        if (collision) {
          shoots.remove(i);
        }
      }
   }
   
  }
  
  if (border){
    for (int i = 0; i  < rows; i++) {
      for (int j = 0; j < cols; j++) {
        enemies[i][j].stepDown();
      }
    }
  }
  
  
  ship.updateScore(enemies,cols,rows);
  
  
}

void keyPressed() {
 if (keyCode == RIGHT) {
   ship.setDir(1);
 } else if (keyCode == LEFT) {
   ship.setDir(-1);
 } else if (key == ' ') {
   shoots.add(new Shoot(ship.x,ship.y));
 }
  
}

void keyReleased() {
  
  if (keyCode ==  RIGHT || keyCode == LEFT) {
    ship.setDir(0);
  }
  
}
