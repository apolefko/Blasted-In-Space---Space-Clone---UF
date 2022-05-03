class Menu {

  void drawMenu() {
    background (240, 0, 130);
    rect(40, 65, 215, 50);
    textSize(25);
    fill(240, 0, 130);
    text("Blasted in Space", 50, 100);
    textSize(15);
    fill(255);
    text("Aim for the red one!", 25, 275);
    textSize(15);
    text("Click AND hold the left mouse button to play.", 25, 300);
    textSize(15);
    text("Use the arrows to move your ship.", 25, 325);
    textSize(15);
    text("Use WASD to move your guided missile.", 25, 350);
    textSize(15);
    text("-You only have one!", 50, 375);
    textSize(15);
    fill(0);
    text("v2.0", 365, 390);
  }
}

