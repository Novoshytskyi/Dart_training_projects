// import 'dart:io'; //Todo: Uncomment.
import 'classes.dart';
import 'color_printing_in_console.dart';
import 'functions.dart';
import 'strings_for_testing.dart';

void main(List<String> arguments) {
  String? outputData;
  String? incomingParameters;
  dynamic objectFromJson;
  bool isData;
  bool isCondition;
  List<Data> datas = [];
  dynamic conditionFromJson;

  // do {     //Todo: Uncomment.
  // stdout.write('Incoming parameters:\n'); //Todo: Uncomment.
  // incomingParameters = stdin.readLineSync().toString(); //Todo: Uncomment.

  //? Strings for testing (Uncomment)
  incomingParameters = listJson1; // With include.
  // incomingParameters = listJson2; // With exclude.
  // incomingParameters = listJson3; // With include.
  // incomingParameters = listJson4; // With exclude.

  printYellow(incomingParameters);
  //?=========================================================================

  objectFromJson = jsonDecoding(incomingParameters);

  // try {
  //Todo: Uncomment.
  isData = objectFromJson.keys.toList().contains('data');
  isCondition = objectFromJson.keys.toList().contains('condition');

  if (isData || isCondition) {
    if (isData) {
      List<dynamic> dataFromJson = objectFromJson['data'];

      for (final item in dataFromJson) {
        final Data data = Data.fromJson(item);
        datas.add(data);
      }
    }
    if (isCondition) {
      conditionFromJson = objectFromJson['condition'];
      Condition condition = Condition.fromJson(conditionFromJson);

      Result resultObject = Result(datas: datas, condition: condition);
      // outputData = resultObject.result; //! 1) Without extension.
      outputData = resultObject.extendetResult; //! 2) With extension.

      datas.clear();
    }
  } else {
    printRed('This is not data and not a condition.');
  }
  // } catch (e) {     //Todo: Uncomment.
  //   printRed('Incorrect input data.'); //Todo: Uncomment.
  // } //Todo: Uncomment.

  printGreen('\n$outputData\n');

  outputData = '';
  objectFromJson = '';
  // } while (incomingParameters != '0'); //Todo: Uncomment.
}
