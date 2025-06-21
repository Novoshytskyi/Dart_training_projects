import 'dart:io';

import 'caesar.dart';

void main(List<String> args) {
  String? incomingParameter1;
  String? incomingParameter2;

  String encryptedText = '';
  String decryptedText = '';

  do {
    stdout.write('\nВведите текст:\n');
    incomingParameter1 = stdin.readLineSync().toString().trim();

    stdout.write('\nЗашифровать "+", расшифровать "-" :  ');
    incomingParameter2 = stdin.readLineSync().toString();

    if (incomingParameter2 != '+' && incomingParameter2 != '-') {
      print('\nВведите корректный символ!');
      return;
    } else if (incomingParameter2 == '+') {
      encryptedText = Caesar.encrypt(incomingParameter1);

      print('\nЗашифрованный текст:\n$encryptedText');
    } else if (incomingParameter2 == '-') {
      decryptedText = Caesar.decrypt(incomingParameter1);

      print('\nРасшифрованный текст:\n$decryptedText');
    }
  } while (true);
}
