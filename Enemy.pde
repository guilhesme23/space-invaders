class Enemy{
 PImage img;
 float x;
 float y;
 int size = 40;
 int life = 2;
 float step = 0.1;
 boolean alive = true;
 boolean counted = false;
 
  Enemy(float x_, float y_) {
    String path = "enemies";
    int enemyType = floor(random(1,2.8));
    path = path + Integer.toString(enemyType) + ".png";
    img = new PImage();
    img = loadImage(path);
    img.resize(size, size);
    
    x=x_;
    y=y_;
 } 
 
 void show() {
   if (life > 0) {
     noStroke();
     textureMode(NORMAL);
     beginShape();
     texture(img);
     vertex(x,y,0,0);
     vertex(x+size,y,1,0);
     vertex(x+size,y+size,1,1);
     vertex(x,y+size,0,1);
     endShape(CLOSE);
   } else {
     alive = false;
   }
 }
 
 void stepDown(){
   if (y > height) {
     step = 0;
   }
   step *= -1;
   y += size;   
 }
 
 void move() {
   x += step;
 }
 
 boolean gameOver(Ship ship) {
   float d = dist(x,y,ship.x,ship.y);
   if (d < ship.size + size) {
     return true;
   } else {
    return false; 
   }
 }
}
