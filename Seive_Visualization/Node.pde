class node {
  private int x, y, alpha = 255;
  private color boxColor = color(100, 100, 100);
  private String number = "";
  private boolean deleted = false, hidden = false;

  node(int x, int y) {
    this.x = x;
    this.y = y;
  }

  void render() {
    if (!hidden) {
      noStroke();
      textSize(12);
      fill(boxColor, alpha);
      rect(x, y, side, side, side/5);
      fill(0);
      if (deleted) {
        if(alpha > 0)
          alpha -= 5;
        stroke(255, 0, 0, alpha);
        strokeWeight(3);
        line(x, y, x + side, y + side);
        line(x + side, y, x, y + side);
        noStroke();
      }
      fill(255, alpha);
      text(number, x + side / 2 - textWidth(number) / 2, y + side / 2 - (textDescent() - textAscent()) / 2);
    }
  }

  void delete() {
    deleted = true;
  }

  void hide() {
    hidden = true;
  }

  void setColor(color boxColor) {
    this.boxColor = boxColor;
  } 

  void setNumber(String number) {
    this.number = number;
  }
  
  boolean isDeleted() {
    return deleted; 
  }
}
