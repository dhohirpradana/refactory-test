import 'json.dart';

void main() {
  var filtered = [
    ...list.where((e) => e["placement"]["name"] == "Meeting Room")
  ];
  print(filtered);
}
