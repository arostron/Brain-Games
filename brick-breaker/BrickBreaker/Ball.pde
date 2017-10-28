class Ball {
  
  Vector location;
  Vector velocity;
  float radius;
  color c;
 
  public Ball(Vector l, Vector v, float r, color c) {
    location = l;
    velocity = v;
    radius   = r;
    this.c   = c;
  }
 
  //draws the ball
  void display() {
    fill(c);
    ellipse(location.x,location.y,radius*2,radius*2);
  }
 
  //moves the ball and detects if it hits the wall
  void move() {
    location.add(velocity);
    if (location.x - radius <= 0 || location.x + radius >= width) {
      velocity.x *= -1;
    }
   
    if (location.y - radius <= 0) {
      velocity.y *= -1;
    }
  }
 
  //return the location
  Vector getLocation() {
    return location; 
  }
 
  //determines if the ball has collided with the platform
  void detectCollision(Platform p) {
    Vector pLoc = p.getLocation();
    if (overlap(pLoc.x, pLoc.y, p.getWidth(), p.getLength())) {
           velocity.y *= -1;
    }
  }
 
  //determine if the ball has collided with a brick
  boolean detectCollision(Brick b) {
    Vector bLoc = b.getLocation();
    if (overlap(bLoc.x, bLoc.y, b.getWidth(), b.getLength())) {
           velocity.y *= -1;
           b.breakBrick();
           return true;
    } 
    return false;
  }
  
  
// ----------------------improved collison detections funcitons -----------------------
  //accuratly determines if the ball has collided with the platform
  void accdetectCollision(Platform p) {
    Vector pLoc = p.getLocation();
    boolean collide = false; 
    //use pLoc.x, pLoc.y, p.getWidth(), p.getLength()
    
    //determine where the ball is 
    //run collision checks based on where the ball is with respect to the box
    
    //collide determined respond accordingly
    if (collide) {
           velocity.y *= -1;
    }
  }
 
  //accuratly determine if the ball has collided with a brick
  boolean accdetectCollision(Brick b) {
    Vector bLoc = b.getLocation();
    boolean collide = false; 
    //use bLoc.x, bLoc.y, b.getWidth(), b.getLength()
    
    //determine where the ball is 
    //run collision checks based on where the ball is with respect to the box
    
    //collide determined respond accordingly 
    if (collide) {
           velocity.y *= -1;
           b.breakBrick();
           return true;
    } 
    return false;
  }
  
  //returns: if a circle in 2d space is touching/overlapping a vertical line 
  boolean circTouchVert(){
    return false;
  }
  
  //returns: if a circle in 2d space is touching/overlapping a horizontal line 
  boolean circTouchHoriz(){
    return false;
  }
  
  //returns: if a cirvle in 2d space is touching/overlapping a point 
  boolean circTouchVertex(){
    return false;
  }
  
  // ---------------------- end improved collison detections funcitons -----------------------
  
  
  
  //returns if this circle and a rectangle are overlapped
  boolean overlap(float x, float y, float w, float l){
    return ((this.location.x + radius >= x && this.location.x + radius <= x + w) &&(this.location.y + radius >= y && this.location.y - radius <= y + l)); 
  }
 
  //return to the ball to it's starting position - on top of the platform
  void returnToOrigin() {
    this.setLocation(new Vector(width/2,339));
  }
 
  //set the location
  void setLocation(Vector v) {
    this.location = v; 
  }
 
  //return description of the ball
  String toString() {
    return "x: " + location.x + " y: " + location.y + " radius: " + radius;
  }
  
 
}