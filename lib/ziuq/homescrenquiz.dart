import "package:flutter/material.dart";
import "package:flutter_quiz/ziuq/quipage.dart";

import "cardop.dart";
import "nextbutt.dart";

const Color correct = Color(0xFF1DAF2B);
const Color incorrect = Color(0xFFD23232);
const Color neutral = Color(0xFFCECECC);
const Color background = Color(0xFFFFA600);

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Question> _questions = [
    Question(
      id: '10',
      title: 'ماهو حاصل جمع 5+5؟',
      options: {'5': false, '30': false, '4': true, '10': false},
    ),
    Question(
      id: '11',
      title: 'ماهو حاصل جمع 2 + 2 ؟ ',
      options: {'5': false, '30': true, '4': false, '10': false},
    ),
    Question(
      id: '12',
      title: 'حاصل طرح 5-30 ؟',
      options: {'600': true, '25': false, '4': false, '10': false},
    ),
    Question(
      id: '13',
      title: 'حاصل جمع 5+9 ؟',
      options: {'600': false, '30': false, '6': false, '14': true},
    )
  ];

  int index = 0;
  int score = 0;
  bool isPressed = false;

  void nextQuestion() {
    if (index == _questions.length - 1) {
      return;
    } else {
      if (isPressed) {
        setState(() {
          index++;
          isPressed = false;
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('الرجاء الاختيار'), behavior: SnackBarBehavior.floating, margin: EdgeInsets.symmetric(vertical: 20.0)));
      }
    }
  }

  void cheackAnswerAndUpdate(bool value) {
    if (value == true) {
      score++;
      setState(() {
        isPressed = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        title: const Text('اختبار تجريبي'),
        backgroundColor: background,
        shadowColor: Colors.transparent,
        actions: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Text(
              'الدرجه: $score',
              style: const TextStyle(fontSize: 18.0),
            ),
          )
        ],
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: [
            QuestionWidget(indexAction: index, question: _questions[index].title, totalQuestions: _questions.length),
            const Divider(color: neutral),
            const SizedBox(height: 25.0),
            for (int i = 0; i < _questions[index].options.length; i++)
              GestureDetector(
                onTap: () => cheackAnswerAndUpdate(_questions[index].options.values.toList()[i]),
                child: OptionCard(
                    option: _questions[index].options.keys.toList()[i],
                    color: isPressed
                        ? _questions[index].options.values.toList()[i] == true
                            ? correct
                            : incorrect
                        : neutral),
              ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: NextButton(
          nextQuestion: nextQuestion,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class Question {
  final String id;
  final String title;
  final Map<String, bool> options;
  Question({
    required this.id,
    required this.title,
    required this.options,
  });

  @override
  String toString() {
    return 'Question(id: $id, title: $title, options: $options )';
  }
}
