class Projectile {
  float x,y,xVector,yVector;
  float speed = 5;
  float w = 3;
  
  Projectile(float xStart_, float yStart_, float xVector_, float yVector_) {
    this.x = xStart_;
    this.y = yStart_;
    this.xVector = xVector_;
    this.yVector = yVector_;
  }
  
  void display() {
    move();
    noStroke();
    fill(255,0,0);
    ellipse(x,y,w,w);
  }
  
  void move() {
    x += speed * xVector;
    y += speed * yVector;
  }
}
