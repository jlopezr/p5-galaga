class Enemy {
  public float x;
  public float y;
  public boolean live;

  public Enemy(float x, float y) {
    this.x = x;
    this.y = y;
    live = true;
  }

  public void draw() {
    if (live) {
      rect(referenceX+x-25, referenceY+y-25, 50, 50);
    }
  }

  public boolean hit(float laserX, float laserY) {
    if (live && laserX>=referenceX+x-25 && laserX<=referenceX+x+25 && laserY>=referenceY+y-25 && laserY<=referenceY+y+25) {
      live = false;
      enemiesCount = enemiesCount-1;
      return true;
    } else {
      return false;
    }
  }
}