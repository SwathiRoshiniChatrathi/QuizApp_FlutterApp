class QuizQuestion {
  const QuizQuestion(this.text, this.answers);

  final String text;
  final List<String> answers;

  List<String> get shuffledAnswers {
    final shuffledList = List.of(
        answers); // of creates a new list based on the old list - creates a copy of the old list
    shuffledList
        .shuffle(); // shuffles the list (does not return anything, but shuffles and edits the given list
    return shuffledList;
    // final only assures that we can not reassign any value to that variable.but it can be edited
  }
}
