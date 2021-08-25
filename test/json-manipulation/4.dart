import 'json.dart';

void main() {
  DateTime time = DateTime(2020, 01, 16); //DateTime
  var contain = [
    ...list.where((e) =>
        (DateTime.fromMillisecondsSinceEpoch(e["purchased_at"] * 1000)
                .difference(time)
                .inDays)
            .abs() <
        1),
  ];
  print(contain);
}
