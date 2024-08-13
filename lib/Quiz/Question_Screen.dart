import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/Quiz/button.dart';
import 'package:quiz_app/Quiz/data/question.dart';

class Question extends StatefulWidget {
  // ignore: non_constant_identifier_names
  const Question({super.key, required this.on_Select_Answer});

  // ignore: non_constant_identifier_names
  final void Function(String answer) on_Select_Answer;

  @override
  State<Question> createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
  var count = 0;

  //bool prebutton = false;

  void changeQuestions(String selectedanswer) {
    widget.on_Select_Answer(selectedanswer);
    setState(() {
      print(selectedanswer);
      //count = count + 1;
      //count += 1;
      if (count < 5) {
        count++;
      }

      //return currentQuestion = Question(count);
    });
  }

  // ignore: non_constant_identifier_names
  void pre_Questions() {
    setState(() {
      //count = count + 1;
      //count += 1;

      count--;

      //return currentQuestion = Question(count);
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = question[count];
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              style: GoogleFonts.mukta(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            ...currentQuestion.getShuffle().map((answer) {
              return answerButtons(
                answerText: answer,
                onTap: () {
                  changeQuestions(answer);
                  //print(answer);
                },
              );
            }),
            const SizedBox(
              height: 30,
            ),
            //
            // answerButtons(
            //   answerText: currentQuestion.answers[0],
            //   onTap: () {},
            // ),
            // answerButtons(
            //   answerText: currentQuestion.answers[1],
            //   onTap: () {},
            // ),
            // answerButtons(
            //   answerText: currentQuestion.answers[2],
            //   onTap: () {},
            // ),
            // answerButtons(
            //   answerText: currentQuestion.answers[3],
            //   onTap: () {},
            // ),
          ],
        ),
      ),
    );
  }
}
