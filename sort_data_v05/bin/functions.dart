import 'dart:convert';
import 'color_printing_in_console.dart';

dynamic jsonDecoding(String incomingJson) {
  try {
    return jsonDecode(incomingJson);
  } catch (e) {
    printRed('jsonDecode error!');
  }
  return '-1';
}
