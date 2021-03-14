public final int n = 15;

ArrayList <node> nodes = new ArrayList <node>();
boolean[] prime = new boolean[n * n];
color[] colors = new color[n * n];

public final int side = 36;

int counter = 2, factor = 0;

void setup() {
  //delay(10000);
  size(700, 700);
  int index = 0;
  for (int i = 0; i < n; i ++)
    for (int j = 0; j < n; j ++) {
      index ++;
      nodes.add(new node(10 + j * side + j * (690 - (n * side)) / n - 1,
      10 + i * side + i * (690 - (n * side)) / n - 1));
      nodes.get(index - 1).setNumber(intToStr(index));
    }
  for (int i = 0; i < n * n; i ++) {
    prime[i] = true;
    colors[i] = getRandomColor();
  }
  nodes.get(0).delete();
}

void draw() {
  frameRate(30);
  background(55);
  for(node n : nodes)
    n.render();
  if(counter <= n * n) {
    if(prime[counter - 1]) {
      nodes.get(counter - 1).setColor(colors[counter]);
      if(factor == 0)
        factor = counter * 2;
      if(factor > n * n) {
        counter ++;
        factor = 0;
      } else {
         prime[factor - 1] = false;
         nodes.get(factor - 1).setColor(colors[counter % 100]);
         nodes.get(factor - 1).delete();
         factor += counter;
      }
    } else {
      counter ++;
    }
  }
}

/*
void draw() {
  background(50);
  thread("render");
  for (node n : nodes)
    n.render();
}

void render() {
  int counter = 0;
  for (int i = 2; i <= n * n; i ++) {
    delay(10);
    if (prime[i - 1]) {
      nodes.get(i - 1).setColor(colors[counter]);
      for (int j = i * 2; j <= n * n; j += i) {
        prime[j - 1] = false;
        nodes.get(j - 1).delete();
        nodes.get(j - 1).setColor(colors[counter % 100]);
        delay(20);
      }
      counter ++;
    }
  }
  for (node n : nodes)
    if (n.isDeleted())
      n.hide();
  delay(1000);
  noLoop();
}
*/
