class Shoot {
 
  float x;
  float y;
  float offset = 15;
  float spd = 3;
  
  
  Shoot(float x_, float y_) {
    x = x_;
    y = y_;
  }
  
  void show() {
   
    stroke(158,0,200);
    strokeWeight(2);
    line(x,y,x,y-offset);
    noStroke();
  }
  
  void move() {
   y -= spd; 
  }
  
  boolean isOver(){
    if (y < 0) { 
      return true;
    } else {
      return false;
    }
  }
  
  boolean detectCollision(Enemy enemy) {
   if (enemy.alive){
     float d = dist(x,y,enemy.x,enemy.y);
     if (d < offset + enemy.size) {
        enemy.life--;
        return true;
     }
   }
   return false;
  }
  
}
