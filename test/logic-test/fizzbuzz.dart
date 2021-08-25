void main() {
  final List data = [];
  var n = 15;
  data.clear();
  for (var i = 1; i < n + 1; i++) {
    data.add(((i % 3 == 0 && i % 5 == 0)
        ? "FizzBuzz"
        : (i % 3 == 0)
            ? "Fizz"
            : (i % 5 == 0)
                ? "Buzz"
                : i));
  }
  print(data);
}
