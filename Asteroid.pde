class Asteroid extends Floater
{
  private double speedOfRotation;
  private int radius;
  
  Asteroid(){
    speedOfRotation = (int)(Math.random()*2+4);
    corners = (int)(Math.random()*4)+6;  
    xCorners = new int[corners];
    yCorners = new int[corners];
    radius = (int)(Math.random()*20+10);
    for (int i = 0; i < corners; i++){
      double angle = Math.random()*((Math.PI*2)/corners)+((Math.PI*2)/corners*i);
      xCorners[i] = (int)(Math.cos(angle)*radius);
      yCorners[i] = (int)(Math.sin(angle)*radius);
    }
    myColor = color(255, 255, 255);   
    myCenterX = (int)(Math.random()*451);
    myCenterY = (int)(Math.random()*451);; 
    myXspeed = 1;
    myYspeed = 1; 
    myPointDirection = 1; 
  }
  
  public void move(){
    turn(speedOfRotation);
    super.move();
  }
  
  public double getX(){
    return myCenterX;
  }
  
  public double getY(){
    return myCenterY;
  }
  
  public int getRadius(){
    return radius;
  }
}
