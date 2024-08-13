import 'package:flutter/material.dart';
import 'package:quiz_app/Quiz/Challenge.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: const Challenges(),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:learningapp/Hand_Cricket/game_ui.dart';

class HomeUI extends StatelessWidget {
  const HomeUI(this.fun, this.learn, {super.key});

  final void Function() fun;
  final void Function() learn;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'images/quiz-logo.png',
            width: 230,
            color: const Color.fromARGB(95, 244, 67, 54),
          ),
          const SizedBox(height: 60),
          const Text(
            'Learn flutter the fun way!',
            style: TextStyle(
              fontSize: 25,
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 60),
          OutlinedButton.icon(
            onPressed: fun,
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
              textStyle: const TextStyle(
                fontSize: 25,
                color: Colors.white,
              ),
              side: BorderSide.none,
            ),
            icon: const Icon(Icons.arrow_right_alt),
            label: const Text('Start Quiz'),
          ),
        ],
      ),
    );
  }
}
