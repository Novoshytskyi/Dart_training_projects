import 'question.dart';

List<List<String>> pathsFromEndElement(
    String endElement, List<Question> questions) {
  List<List<String>> paths = [];
  List<String> pathsTemporary = [];
  Iterable<String> pathsTemporaryReversed;

  void upperElement(String sourceElement, List<Question> myQuestions) {
    for (var obj in questions) {
      if (obj.answer1['next_question'] == sourceElement ||
          obj.answer2['next_question'] == sourceElement) {
        pathsTemporary.add((obj.id).toString());

        if (obj.id == myQuestions.first.id.toString()) {
          pathsTemporary.insert(0, endElement);
          pathsTemporaryReversed = pathsTemporary.reversed;
          paths.add(pathsTemporaryReversed.toList());
          pathsTemporary.clear();
        }

        upperElement(obj.id, myQuestions);
      }
    }
  }

  upperElement(endElement, questions);

  return paths;
}

Question? getQuestionById(String id, List<Question> questions) {
  for (Question q in questions) {
    if (q.id == id) {
      return q;
    }
  }
  return null;
}
