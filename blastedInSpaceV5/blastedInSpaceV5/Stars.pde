//attribution Joseph Murphy

class Stars {//name

  //attr
  Star[] stars;
  int count;

  //constr
  Stars (int count_) {
    count = count_; 
    stars = new Star[count];
    for (int i=0; i<stars.length; i++) {
      stars[i] = new Star();
    }
  }
  
  void display () {
    for (int i=0; i<stars.length; i++) {
      stars[i].display();
    }
  }
}

