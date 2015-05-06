int N = 1;
float x[], y[];

void setup() {
  size(2133, 1067);
  //size(2133/2, 1067/2);
  frameRate(10);
  colorMode(HSB);

  x = new float[N];
  y = new float[N];
  for (int i = 0; i < N; i++ ) {
    x[i] = random(width/10, width-width/10);
    y[i] = random(height/10, height-height/10);
  }
  x[0] = width/2;
  y[0] = height/2;
}

void draw() {
  background(255);

  noStroke();
  stroke(0);
  for ( int j = 0; j < N; j++ ) {
    int NC = 250;
    for (int i = 0; i < NC; i++) {
      //circulo(200, 200, 2 +i*5, 150, 0.01+i*0.05);
      //circulo(width/2, height/2, 2 +i*3, color(150, (i/20.0)*255, 0, 200), 0.01+i*0.001);
      circulo(x[j]+map(i, 0, NC, -width/3, width/3), y[j]+map(i, 0, NC, -height/3, height/3), height/4, 
      color(map(i, 0, NC, 0, 255), 255, 255, 200), 
      0.1+i*0.001, 
      map(i, 0, NC, 10, 150)
        );
    }
  }

  if ( frameCount == 60*5 ) {
    saveFrame("out.png");
  }
}


void circulo(float cx, float cy, float raio, int cor, float vel, float size) {

  float x = cx + raio*sin(frameCount*vel);
  float y = cy + raio*cos(frameCount*vel);

  fill(cor);
  ellipse(x, y, size, size);
}


void keyPressed() {
  if ( key == ' ' ) {
    noLoop();
  } else {
    loop();
  }
}

