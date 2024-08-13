import 'package:flutter/material.dart';
import 'package:quiz_app/Quiz/data/question.dart';
import 'package:quiz_app/Quiz/questions_summary.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({
    super.key,
    required this.chosenanswer,
    required this.onrestart,
  });

  // ignore: non_constant_identifier_names
  final void Function() onrestart;
  final List<String> chosenanswer;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < chosenanswer.length; i++) {
      summary.add({
        'Question-index': i,
        'question': question[i].text,
        'crt-answer': question[i].answers[0],
        'chosen-answer': chosenanswer[i],
      });
      //print(summary);
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summarydata = getSummaryData();
    final totalanswer = question.length;
    final crtanswer = summarydata.where((data) {
      return data['chosen-answer'] == data['crt-answer'];
    }).length;
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You Answered $crtanswer out $totalanswer correctly',
              style: const TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            QuestionSummary(summarydata),
            const SizedBox(
              height: 30,
            ),
            TextButton.icon(
              onPressed: onrestart,
              icon: const Icon(
                Icons.restart_alt_outlined,
                color: Colors.white,
              ),
              // style: TextButton.styleFrom(
              //   textStyle: const TextStyle(
              //     fontSize: 20,
              //     color: Colors.white,
              //   ),
              // ),
              label: const Text(
                'Restart Quiz',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
