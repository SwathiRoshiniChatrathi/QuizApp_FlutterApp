import 'package:flutter/material.dart';
import 'package:quiz_app/home_screen.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/results_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

// // Using 'if' statement
class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  var activeScreen = 'home_screen';

  void switchScreen() {
    setState(() {
      activeScreen = 'questions_screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'results_screen';
      });
    }
  }

  void restartQuiz() {
    setState(() {
      selectedAnswers = [];
      activeScreen = 'questions-screen';
    });
  }

  @override
  Widget build(context) {
    Widget screenWidget = HomeScreen(switchScreen);
    if (activeScreen == "questions_screen") {
      screenWidget = Questions(chooseAnswer);
    }
    if (activeScreen == "results_screen") {
      screenWidget = ResultsScreen(selectedAnswers, restartQuiz);
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
            Color.fromARGB(255, 78, 13, 151),
            Color.fromARGB(255, 107, 15, 168)
          ])),
          child: screenWidget,
        ),
      ),
    );
  }
}

// // Using ternery Operator
// class _QuizState extends State<Quiz> {
//   var activeScreen = 'home_screen';
//
//   void switchScreen() {
//     setState(() {
//       activeScreen = 'questions_screen';
//     });
//   }
//
//   @override
//   Widget build(context) {
//     final screenWidget = activeScreen == 'home_screen'
//         ? HomeScreen(switchScreen)
//         : const Questions();
//
//     return MaterialApp(
//       home: Scaffold(
//         body: Container(
//           decoration: const BoxDecoration(
//               gradient: LinearGradient(colors: [
//             Color.fromARGB(255, 78, 13, 151),
//             Color.fromARGB(255, 107, 15, 168)
//           ])),
//           child: screenWidget,
//         ),
//       ),
//     );
//   }
// }

// // Using initState() method
// class _QuizState extends State<Quiz> {
//   Widget? activeScreen;
//
//   @override
//   void initState() {
//     activeScreen = HomeScreen(switchScreen);
//     super.initState();
//   }
//
//   void switchScreen() {
//     setState(() {
//       activeScreen = const Questions();
//     });
//   }
//
//   @override
//   Widget build(context) {
//     return MaterialApp(
//       home: Scaffold(
//         body: Container(
//           decoration: const BoxDecoration(
//               gradient: LinearGradient(colors: [
//             Color.fromARGB(255, 78, 13, 151),
//             Color.fromARGB(255, 107, 15, 168)
//           ])),
//           child: activeScreen,
//         ),
//       ),
//     );
//   }
// }
