//Blasted in Space
//By Alex Polefko 2014
//Code from Joseph Murphy and Jeff(?)
//Song by RoccoW

import ddf.minim.*;
Minim minim;
AudioPlayer player;
Stars background; 
Asteroids asteroidManager;
Ship ship;

void setup() {
  size(500, 500);
  rectMode(CENTER);
  imageMode(CENTER);
  background = new Stars(200);
  asteroidManager = new Asteroids(5);
  ship = new Ship();
  minim = new Minim(this);
  player = minim.loadFile("RoccoW_-_Sea_Battles_in_Space.mp3");
  player.play();
  player.loop();
}

void draw() {
  background(3, 5, 4);
  background.display();
  asteroidManager.display();
  ship.display();
  //println(keyCode);
}

void keyPressed() {
  ship.keyPressedDetect();
  if (keyCode == 82) {
    reset();
  }
}

void keyReleased() {
  ship.keyReleasedDetect();
}

void reset() {
  background = new Stars(200);
  asteroidManager = new Asteroids(3);
  ship = new Ship();
}

