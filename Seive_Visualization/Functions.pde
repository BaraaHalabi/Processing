int power(int b, int p) {
  return p == 0 ? 1 : b * power(b, p - 1);
}

String flip(String str) {
  String flipped = "";
  for (int i = 0; i < str.length(); i ++) {
    flipped += str.charAt(str.length() - 1 - i);
  }
  return flipped;
}

String intToStr(int number) {
  String ret = "";
  while (number > 0) {
    ret += char(number % 10 + '0');
    number /= 10;
  }
  return flip(ret);
}

color getRandomColor() {
  int r = int(random(256)), g = int(random(256)), b = int(random(256));
  while(abs(r - g) < 100 && abs(r - b) < 100 && abs(g - b) < 100) {
     r = int(random(256));
     g = int(random(256));
     b = int(random(256));
  }
  color c = color(r, g, b);
  return c;
}
