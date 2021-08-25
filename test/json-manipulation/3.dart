import 'dart:convert';

import 'json.dart';

void main() {
  var contain = [
    ...list.where((e) => jsonEncode(e["tags"]).contains("furniture")),
  ];
  print(contain);
}
