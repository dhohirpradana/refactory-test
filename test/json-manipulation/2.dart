import 'json.dart';

void main() {
  var filtered = [...list.where((e) => e["type"] == "electronic")];
  print(filtered);
}
