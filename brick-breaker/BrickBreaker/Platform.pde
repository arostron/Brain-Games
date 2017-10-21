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
  void moveUnder(){ 
    if(100 > threshold){//100 to ensure that this is alwats true for now
      if(inRange(ball.location.x, this.location.x,this.location.x+this.pWidth)){ //if the ball is within the platform 
      //do nothing 
      println("under the ball"); 
      
      }else if(this.location.x > ball.location.x){
        //to the right of the ball
        println("to the right of the ball"); 
        moveLeft(); 
      
      }else if(this.location.x < ball.location.x){
        //to the left of the ball
        println("to the left of the ball"); 
        moveRight(); 
      }
    }//end if 
  }//end move under
  
  //returns if a value is between two values
  boolean inRange(float x, float bottomOfRange, float topOfRange){
    if((x < bottomOfRange) || (x > topOfRange)){//if x is not between two variables 
      return false; 
    }else{//x is between the range endings
      return true; 
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