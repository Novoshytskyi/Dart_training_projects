class Caesar {
  static const int _letterOffset = 5;

  static String encrypt(String inputText) {
    String outputText = '';

    for (int i = 0; i < inputText.length; i++) {
      outputText = outputText +
          String.fromCharCode((inputText[i].codeUnits)[0] + _letterOffset);
    }

    return outputText;
  }

  static String decrypt(String inputText) {
    String outputText = '';

    for (int i = 0; i < inputText.length; i++) {
      outputText = outputText +
          String.fromCharCode((inputText[i].codeUnits)[0] - _letterOffset);
    }

    return outputText;
  }
}
