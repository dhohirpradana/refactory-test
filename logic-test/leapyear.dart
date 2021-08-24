main() {
  var firstY = 1900;
  var lastY = 2020;
  for (var i = firstY; i <= lastY; i++) {
    if (i % 4 == 0 || i % 100 == 0 || i % 400 == 0) {
      print(" $i ");
    }
  }
}
