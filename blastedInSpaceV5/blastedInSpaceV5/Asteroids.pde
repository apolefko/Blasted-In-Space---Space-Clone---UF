//attribution Joseph Murphy
//Need to have Asteroids (or planets) start in different positions
//so they don't move like a creepy flock of birds

class Asteroids {//name

  //attr
  Asteroid[] asteroids;
  int count;

  //const
  Asteroids(int count_) {
    count = count_;
    asteroids = new Asteroid[count];
    for (int i=0; i<asteroids.length; i++) {
      asteroids[i] = new Asteroid();
    }
  }

  //functions
  void display() {
    detectCollisions();
    for (int i=0; i<asteroids.length;i++) {
      asteroids[i].display();
    }
  }

  void detectCollisions() {
    for (int i = 0; i < this.asteroids.length; i++) {
      for (int j = 0; j < ship.bullets.size(); j++) {
        Projectile bullet_ = ship.bullets.get(j);
        int bulletDist = (int) dist(this.asteroids[i].x, this.asteroids[i].y, bullet_.x, bullet_.y);
        if (bulletDist < (this.asteroids[i].w/2 + bullet_.w/2)) {
          this.asteroids[i].collided = true;
        }
      }
    }
  }
}
