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
    int ballPos = 0; //where the ball is with respect to the rectangle 
    //use pLoc.x, pLoc.y, p.getWidth(), p.getLength()
    float x = pLoc.x;
    float y = pLoc.y; 
    float WIDTH = p.getWidth(); 
    float LENGTH = p.getLength(); 
    
    //determine where the ball is 
    
    
    //run collision checks based on where the ball is with respect to the box
    collide = isCollide(x,y,WIDTH,LENGTH,ballPos); 
    
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
    float x = bLoc.x;
    float y = bLoc.y;
    float WIDTH = b.getWidth(); 
    float LENGTH = b.getLength(); 
    int ballPos = 0; //where the ball is with respect to the rectangle 
   
    //determine where the ball is 
    
    //run collision checks based on where the ball is with respect to the box
    collide = isCollide(x,y,WIDTH,LENGTH,ballPos); 
    
    //collide determined respond accordingly 
    if (collide) {
           velocity.y *= -1;
           b.breakBrick();
           return true;
    } 
    return false;
  }
  
  boolean isCollide(float x, float y, float WIDTH, float LENGTH, int ballPos){
    // x y width and length are the params of the rectangle the ball could be touching 
    boolean collide = false; 
    switch (ballPos){
    case 1:
    //ball is top left of rect
    collide = circTouchVertex(x,y,this.location.x,this.location.y,this.radius); 
    break;
    case 2:
    //ball is above mid of rect
    collide = circTouchVertical(y,this.location.y,this.radius);
    break;
    case 3:
    //ball is top right of rect
    collide = circTouchVertex(x,y,this.location.x,this.location.y,this.radius); 
    break;
    case 4:
    //ball is right of rect
    collide = circTouchVertical(x+LENGTH,this.location.x,this.radius);
    break;
    case 5:
    //ball is bottom right of rect
    collide = circTouchVertex(x,y,this.location.x,this.location.y,this.radius); 
    break;
    case 6:
    //ball is under rect
    collide = circTouchVertical(y-WIDTH,this.location.y,this.radius);
    break;
    case 7:
    //ball is bottom left of rect
    collide = circTouchVertex(x,y,this.location.x,this.location.y,this.radius); 
    break;
    case 8:
    //ball is left of rect
    collide = circTouchVertical(x,this.location.x,this.radius);
    break;
    default:
    //do nothing error case
    break;
    }
  return collide; 
  }
  
  //returns: if a circle in 2d space is touching/overlapping a  line 
  boolean circTouchVertical(float line, float circMid, float circR){
    return (abs(line-circMid) <= circR);
  } 
  
  //returns: if a cirvle in 2d space is touching/overlapping a point 
  boolean circTouchVertex(float vertexX, float vertexY, float circX, float circY, float r){
    //uses pythagorean ther. (a^2 + b^2 = c^2) 
    // a^2 + b^2  (distance between points) <= r^2 (radius)
    return (((vertexX-circX)*(vertexX-circX)+(vertexY-circY)*(vertexY-circY))<= r*r);
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