class Asteroid {//name

  //attr
  float x, y, w;
  float xSpeed, ySpeed;
  color c;
  boolean collided;

  //const
  Asteroid () {
    // randomizer block
    x = random(0, width);
    y = random(0, height);
    if (x == width/2 || y == height/2 ) { //respawn asteroids if at ship spawn
      x = random(0, width);
      y = random(0, height);
    }
    w = random(45, 55);
    c = color(random(70, 150));
    collided = false;
    int rand1 = round(random(1));
    if (rand1 == 0) {
      xSpeed = random(-1.5, -0.5);
    } 
    else {
      xSpeed = random(0.5, 1.5);
    }
    int rand2 = round(random(1));
    if (rand2 == 0) {
      ySpeed = random(-1.5, -0.5);
    } 
    else {
      ySpeed = random(0.5, 1.5);
    }
  }

  //functions
  void display() {
    noStroke();
    fill(c);
    if (collided) {
      //play sprite explosion flipbook
      x = 10000;
      y = 10000;
    }
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
    x += xSpeed;
    y += ySpeed;
    ellipse(x, y, w, w);
  }
}

