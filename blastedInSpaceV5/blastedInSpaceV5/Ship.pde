//import ddf.minim.*;
//Minim minim2;
//AudioSample bang;

class Ship { //name

  //attr
  float x, y, w, r, xSpeed, ySpeed;
  float xVector;
  float yVector;
  float frictionCoefficient = 0.95;
  float acceleration = 0.5;
  float rSpeed = radians(5); // rotation speed 1 degree
  PImage sprite;
  boolean up, down, left, right, spacebar;
  boolean colliding;
  ArrayList<Projectile> bullets;
  int lastFired = 0;
  int shootingDelay = 15;



  //constr
  Ship() {
    x = width/2;
    y = height/2;
    w = 25;
    r = 0;
    xSpeed = ySpeed = 0;
    bullets = new ArrayList<Projectile>();

    //minim2 = new Minim(this);
    //bang = minim2.loadSample("SFX.mp3", 512);
  }

  //methods
  void display() {
    detectAsteroid();
    rotation();
    updateVector();
    thrust();
    move();
    pushMatrix();
    translate(x, y);
    rotate(r);
    displayShip();
    displayField();
    popMatrix();
    shoot();
    displayBullets();
  }

  void displayShip() {
    // here's where you'll draw the sprite
    noStroke();
    fill(255, 255, 0);
    if (colliding) { 
      fill(255, 0, 0); 
      reset();
    }
    beginShape();
    vertex(-10, -5);
    vertex(10, 0);
    vertex(-10, 5);
    endShape();
    //
  }

  void displayField() {
    stroke(0, 255, 0);
    noFill();
    ellipse(0, 0, w, w);
  }

  void rotation() {
    if (right) {
      r += rSpeed;
    } 
    if (left) {
      r -= rSpeed;
    }
  }

  void updateVector() {
    xVector = cos(r);
    yVector = sin(r);
  }

  void thrust() {
    if (up) {
      xSpeed += acceleration * xVector;
      ySpeed += acceleration * yVector;
    }
  }

  void move() {
    x += xSpeed;
    y += ySpeed;
    xSpeed *= frictionCoefficient;
    ySpeed *= frictionCoefficient;
    if (x < -w/2) {
      x = width+w/2;
    } 
    else if (x > width+w/2) {
      x = -w/2;
    }
    if (y < -w/2) {
      y = height+w/2;
    }
    else if (y > height+w/2) {
      y = -w/2;
    }
  }

  void keyPressedDetect() {
    if (keyCode == UP) {
      up = true;
    }
    if (keyCode == DOWN) {
      down = true;
    }
    if (keyCode == LEFT) {
      left = true;
    }
    if (keyCode == RIGHT) {
      right = true;
    }
    if (keyCode == 32) {
      spacebar = true;
      //bullet noise
      //bang.trigger();
    }
  }

  void keyReleasedDetect() {
    if (keyCode == UP) {
      up = false;
    }
    if (keyCode == DOWN) {
      down = false;
    }
    if (keyCode == LEFT) {
      left = false;
    }
    if (keyCode == RIGHT) {
      right = false;
    }
    if (keyCode == 32) {
      spacebar = false;
    }
  }

  void shoot() {
    int timeSinceLast = frameCount - lastFired;
    if (spacebar && (timeSinceLast > shootingDelay)) {
      bullets.add(new Projectile(x, y, xVector, yVector));
      lastFired = frameCount;
    }
  }

  void displayBullets() {
    for (int i = 0; i < bullets.size(); i++) {
      Projectile bullet_ = bullets.get(i);
      bullet_.display();
      // check if it's off screen
      if (bullet_.x < -bullet_.w/2 || bullet_.x > width + bullet_.w/2 || bullet_.y < -bullet_.w/2 || bullet_.y > height + bullet_.w/2) {
        bullets.remove(i);
      }
    }
  }

  void detectAsteroid() {
    colliding = false;
    for (int i = 0; i < asteroidManager.asteroids.length; i++) {
      int dist = (int) dist(x, y, asteroidManager.asteroids[i].x, asteroidManager.asteroids[i].y);
      //stroke(255,0,0);
      //line(x,y,asteroidGroup.asteroids[i].x,asteroidGroup.asteroids[i].y);
      if (dist < (this.w/2 + asteroidManager.asteroids[i].w/2)) {
        colliding = true;
        triggerExplode();
      }
    }
  }

  void triggerExplode() {
    // explosion sequence
  }
}

