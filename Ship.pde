class Ship {
 PImage img;
 float x = width/2;
 float y = 4.5*height/5;
 int size = 20;
 int dir = 0;
 int score = 0;
 
  Ship() {
    img = new PImage();
    img = loadImage("ship.png");
    img.resize(size, size);
 } 
 
 void show() {
   textureMode(NORMAL);
   noStroke();
   beginShape();
   texture(img);
   vertex(x-size/2,y-size/2,0,0);
   vertex(x+size/2,y-size/2,1,0);
   vertex(x+size/2,y+size/2,1,1);
   vertex(x-size/2,y+size/2,0,1);
   endShape();
 }
 
 void setDir(int value) {
   
   dir = value;
   
 }
 
 void move() {
   x += dir*3;
 }
 
 void updateScore(Enemy[][] enemies, int cols, int rows) {
   for (int i = 0; i < rows; i++) {
     for (int j = 0; j < cols; j++) {
       if (!enemies[i][j].alive && !enemies[i][j].counted) {
         enemies[i][j].counted = true;
         score++;
       }
     }
   }
 }
 
 void showScore(){
  PFont font;
  String s = "SCORE: ";
  s = s + Integer.toString(score);
  font = createFont("Bitstream Charter", 15);
  textFont(font);
  text(s,20,height - 20);
 }
}
