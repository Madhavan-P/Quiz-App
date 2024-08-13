import 'package:flutter/material.dart';
import 'package:quiz_app/Quiz/Question_Screen.dart';
import 'package:quiz_app/Quiz/data/question.dart';
import 'package:quiz_app/Quiz/result_screen.dart';
import 'package:quiz_app/main.dart';

class Challenges extends StatefulWidget {
  const Challenges({super.key});

  @override
  State<Challenges> createState() => _ChallengesState();
}

class _ChallengesState extends State<Challenges> {
  // Type 1
  /*Widget? activeScreen;
  void initState() {
    activeScreen = HomeUI(screening);
    super.initState();
  }*/

  // Type 2,3,4
  var activeScreen = 'Home-UI';
  List<String> selectedanswer = [];

  void screening1() {
    setState(() {
      activeScreen = 'Question';
    });
  }

  void screening2() {
    setState(() {
      activeScreen = 'If-List';
    });
  }

  // void screening3() {
  //   setState(() {
  //     activeScreen = 'result-screen';
  //   });
  // }

  void chooseAnswer(String answer) {
    selectedanswer.add(answer);
    //print(selectedanswer);
    if (selectedanswer.length == question.length) {
      setState(() {
        //selectedanswer = [];
        activeScreen = 'result-screen';
      });
    }
  }

  void restart() {
    setState(() {
      selectedanswer = [];
      activeScreen = 'Question';
    });
  }

  @override
  Widget build(BuildContext context) {
    // Type 3
    /*final screenWidget =
        activeScreen == 'Home-UI' ? HomeUI(screening) : const Question();*/
    // Type 4
    Widget screenWidget = HomeUI(screening1, screening2);
    if (activeScreen == 'Question') {
      screenWidget = Question(
        on_Select_Answer: chooseAnswer,
      );
    }

    if (activeScreen == 'Home-UI') {
      screenWidget = HomeUI(screening1, screening2);
    }
    if (activeScreen == 'result-screen') {
      screenWidget = MyWidget(
        chosenanswer: selectedanswer,
        onrestart: restart,
      );
    }
    //activeScreen == 'Question' ? Question(on_Select_Answer: ,) : If_List_Con();
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 96, 2, 120),
              Color.fromARGB(255, 128, 8, 158),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        // child: activeScreen, -Type 1
        /*child: activeScreen == 'Home-UI' 
        //? HomeUI(screening) 
        //: const Question(),*/ // -Type 2
        child: screenWidget,
      ),
    );
  }
}
