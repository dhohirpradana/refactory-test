// UNTUK INPUTAN DI CONSOLE

// import 'dart:io';
// void palindrome() async {
//   print('Ketik sesuatu');
//   String? text = stdin.readLineSync();
//   String? reverse = text!.split('').reversed.join('');
//   if (text == reverse) {
//     print('palindrome');
//   } else {
//     print('not palindrome');
//   }
// }

void main() async {
  String? text = "KASUR INI RUSAK";
  String? reverse = text.split('').reversed.join('');
  if (text == reverse) {
    print('palindrome');
  } else {
    print('not palindrome');
  }
}
