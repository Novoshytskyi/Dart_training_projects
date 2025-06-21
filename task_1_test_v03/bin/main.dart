import 'dart:convert';

import 'functions.dart';
import 'question.dart';

void main(List<String> arguments) {
  List<Question> questions = [];

  final decoded = json.decode(jsonQuestions);

  for (final item in decoded) {
    final Question question = Question.fromJson(item);
    questions.add(question);
  }

  // Построение дерева вопросов с вариантами
  List<Map<String, List<String>>> treeList = [];
  for (final question in questions) {
    treeList.add({
      question.id: [
        question.answer1['next_question'],
        question.answer2['next_question']
      ]
    });
  }
  // print('treeList = $treeList\n');

  // Поиск элементов в дереве - концов веток
  List<String> endElementsOfTree = [];

  for (final question in questions) {
    if (question.answer1['next_question'] == '-' ||
        question.answer2['next_question'] == '-') {
      endElementsOfTree.add(question.id);
    }
  }
  // print('Концы веток $endElementsOfTree\n');

  List allPaths = [];
  for (var i in endElementsOfTree) {
    allPaths.addAll(pathsFromEndElement(i, questions));
  }

  // Количество вариантов
  // print('Количество вариантов: ${allPaths.length}');

  List<List<Map>> allVariantsOfPaths = [];

  List<Map> variantsOfPaths = [];

  Map elrmentOfPath = {};
  String answerToQuestion;

  // Все возможные пути
  // print('allPaths: $allPaths');

  for (List path in allPaths) {
    int index = 0;
    for (var j in path) {
      int indexNext = index + 1;

      answerToQuestion =
          '"${getQuestionById(j, questions)!.answer1['text']}/${getQuestionById(j, questions)!.answer2['text']}"';

      if ((indexNext) < path.length) {
        if (getQuestionById(path[indexNext], questions)!.id ==
            getQuestionById(j, questions)!.answer1['next_question']) {
          answerToQuestion =
              '"${getQuestionById(j, questions)!.answer1['text']}"';
        } else if (getQuestionById(path[indexNext], questions)!.id ==
            getQuestionById(j, questions)!.answer2['next_question']) {
          answerToQuestion =
              '"${getQuestionById(j, questions)!.answer2['text']}"';
        }
      }

      elrmentOfPath = {
        '"${getQuestionById(j, questions)!.questionText}"': answerToQuestion
      };
      variantsOfPaths.add(elrmentOfPath);
      index++;
    }

    allVariantsOfPaths.add(variantsOfPaths.toList());

    variantsOfPaths.clear();
  }

  String json1 = '{"paths": {"number": "${allPaths.length}", "list": [';
  String json2 = allVariantsOfPaths.toString();
  String json3 = ']}}';

  String jsonResult = json1 + json2 + json3;

  print(jsonResult);
}
