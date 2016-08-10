class Point {
  public float x;
  public float y;

  public Point() {
  }

  public Point(float x, float y) {
    this.x=x;
    this.y=y;
  }
}

Point[] stars;

void setup() {
  size(600, 600);

  stars = new Point[100];
  for (int i=0; i<stars.length; i++) {
    stars[i] = new Point(random(600), random(600));
  }
}

void draw() {
  background(0, 0, 0);
  stroke(255, 255, 255);
  for (int i=0; i<stars.length; i++) {
    float speed=0;
    point(stars[i].x, stars[i].y);
    if (i%2==0) {
      speed = 0.4;
    } else {
      speed = 0.8;
    }
    stars[i].y = (stars[i].y + speed) % height;
  }
}