class Question {
  final String id;
  final String questionText;
  final Map<String, dynamic> answer1;
  final Map<String, dynamic> answer2;

  Question({
    required this.id,
    required this.questionText,
    required this.answer1,
    required this.answer2,
  });

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      id: json["id"] as String,
      questionText: json["questionText"] as String,
      answer1: json["answer1"] as Map<String, dynamic>,
      answer2: json["answer2"] as Map<String, dynamic>,
    );
  }
}

// Расскоментировать!
var jsonQuestions = '''
[
    {
        "id": "q1",
        "questionText": "Какое у вас семейное положение?",
        "answer1": {
            "text": "Холост",
            "next_question": "q2"
        },
        "answer2": {
            "text": "В браке",
            "next_question": "q3"
        }
    },
    {
        "id": "q2",
        "questionText": "Планируете ли вы пожениться в следующем году?",
        "answer1": {
            "text": "Да",
            "next_question": "q6"
        },
        "answer2": {
            "text": "Нет",
            "next_question": "q5"
        }
    },
    {
        "id": "q3",
        "questionText": "Как долго вы женаты?",
        "answer1": {
            "text": "Меньше года",
            "next_question": "q7"
        },
        "answer2": {
            "text": "Больше года",
            "next_question": "q4"
        }
    },
    {
        "id": "q4",
        "questionText": "Вы отметили свою первую годовщину?",
        "answer1": {
            "text": "Да",
            "next_question": "q9"
        },
        "answer2": {
            "text": "Нет",
            "next_question": "q8"
        }
    },
    {
        "id": "q5",
        "questionText": "У вас есть девушка или парень?",
        "answer1": {
            "text": "Да",
            "next_question": "q9"
        },
        "answer2": {
            "text": "Нет",
            "next_question": "-"
        }
    },
    {
        "id": "q6",
        "questionText": "Вы уже объявили о помолвке?",
        "answer1": {
            "text": "Да",
            "next_question": "q9"
        },
        "answer2": {
            "text": "Нет",
            "next_question": "-"
        }
    },
    {
        "id": "q7",
        "questionText": "Вы будете отмечать свою первую годовщину?",
        "answer1": {
            "text": "Да",
            "next_question": "-"
        },
        "answer2": {
            "text": "Нет",
            "next_question": "-"
        }
    },
    {
        "id": "q8",
        "questionText": "Вы уже собираетесь подать на развод?",
        "answer1": {
            "text": "Да",
            "next_question": "-"
        },
        "answer2": {
            "text": "Нет",
            "next_question": "-"
        }
    },
    {
        "id": "q9",
        "questionText": "Вы дарили подарки?",
        "answer1": {
            "text": "Да",
            "next_question": "-"
        },
        "answer2": {
            "text": "Нет",
            "next_question": "-"
        }
    }
]
''';
