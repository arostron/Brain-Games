class Platform {
  
  Vector location;
  Vector velocity;
  float pWidth;    //platform width (determines size in x-direction)
  float pLength;   //platform length (determines size in y-direction)
  color c;
  int threshold; 
  int movementSpeed = 7; 
  
  public Platform(Vector l, Vector v, float w, float len, color c, int _threshold) {
    location = l;
    velocity = v;
    pWidth   = w;
    pLength  = len;
    this.c   = c;
    threshold = _threshold; 
  }
  
  //draws the platform
  void display() {
    fill(c);
    rect(location.x,location.y,pWidth,pLength);
  }
  
  //move the platform
  void move() {
    if (keyPressed) {
      if (key == CODED) {
        if (keyCode == RIGHT)
          moveRight();     
          
        if (keyCode == LEFT)
          moveLeft();
      }
    } 
  }
  
  
  //if the threshold value is exceeded, move the platform underneath the ball
  void moveUnder(int currentValue){ 
    if(currentValue > threshold){//100 to ensure that this is alwats true for now
    
      switch (inRange(ball.location.x, this.location.x,this.location.x+this.pWidth)){
        case 1:
          println("to the left of the ball"); 
          moveRight();
          break;
        case 0:
          println("under the ball"); 
          break;
        case -1:
          println("to the right of the ball"); 
          moveLeft(); 
          break;
        default:
          break; 
          //shouldnt reach default case 
      }
    
    }
  }//end move under
  
  //returns -1 if x is to the left of the specified rance, 0 if x is inside the range, or 1 if x is to the right of the range
  int inRange(float x, float bottomOfRange, float topOfRange){
    if((x < bottomOfRange) ){//if x is not between two variables 
      return -1; 
    }else if((x > topOfRange)){
      return 1; 
    }else{//x is between the range endings
      return 0; 
    }
  }
  
  //move the platform to the right
  void moveRight() {
    if (this.location.x + pWidth <= width - 25)
      location.x += movementSpeed;
  }
  
  //move the platform to the left
  void moveLeft() {
    if (this.location.x >= 25)
      location.x -= movementSpeed;
  }
  
  //return the location
  Vector getLocation() {
    return location; 
  }
  
  //return the width
  float getWidth() {
    return pWidth; 
  }
  
  //return the length
  float getLength() {
    return pLength; 
  }
  
  //return the platform to it's starting position - in the middle of the screen
  void returnToOrigin() {
    this.setLocation(new Vector(width/2 - pLength, 350));
  }
  
  //set the location
  void setLocation(Vector v) {
    this.location = v; 
  }
  
 
}