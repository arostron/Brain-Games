//for testing the collision funcitons you made in the brick breaker game (ball class)

float locationx = 0;
float locationy = 0;

void setup(){
  size(100,100);

/*
println((int)map(-1,-1,1,0,2)); 
println((int)map(0,-1,1,0,2)); 
println((int)map(1,-1,1,0,2)); 
*/


test(17,40,10,10,10,10); 



}

void draw(){}

void test(float lx,float ly,float x,float y,float w,float l){
  
  fill(0);
  rect(lx,ly,1,1);
  rect(x,y,w,l);
  
  locationx = lx;
  locationy = ly;
  println("ball at: "+findBall(x,y,w,l));

}



  int findBall(float x, float y, float WIDTH, float LENGTH){
    //x,y,width, length are dim of the rect 
    int[][] ballpos =  {{1,8,7},{2,9,6},{3,4,5}};
    int i = (int)map(inRange(locationx,x,x+WIDTH),-1,1,0,2);
    int j = (int)map(inRange(locationy,y,y+LENGTH),-1,1,0,2); 
   
    return ballpos[i][j]; 
  }
  
  
  
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