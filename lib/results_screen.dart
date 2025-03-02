import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(this.chosenAnswers, this.onRestart, {super.key});

  final List<String> chosenAnswers;
  final void Function() onRestart;

  List<Map<String, Object>> getSummary() {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'chosen_answer': chosenAnswers[i],
        'correct_answer': questions[i].answers[0],
        'is_correct_answer': chosenAnswers[i] == questions[i].answers[0]
      });
    }
    return summary;
  }

  @override
  Widget build(context) {
    final summaryData = getSummary();
    final numOfTotalQuestions = questions.length;
    final numOfCorrectAnsweredQuestions = summaryData
        .where((data) => data['chosen_answer'] == data['correct_answer']) // arrow function : a simple anonymous func which might take some input values and then immediately returns and performs no other operation inside of a function body 
        .length;

    return Container(
      padding: const EdgeInsets.all(40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "You answered $numOfCorrectAnsweredQuestions out of $numOfTotalQuestions questions correctly!",
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Color.fromARGB(255, 201, 153, 251),
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          QuestionsSummary(summaryData),
          const SizedBox(
            height: 30,
          ),
          TextButton.icon(
            onPressed: onRestart,
            label: const Text(
              "Restart Quiz!",
              style: TextStyle(color: Colors.white),
            ),
            icon: const Icon(
              Icons.refresh,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
