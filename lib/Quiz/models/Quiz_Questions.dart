class quizQuestion {
  const quizQuestion(this.text, this.answers);

  final String text;
  final List<String> answers;

  List<String> getShuffle() {
    final suffledList = List.of(answers);
    suffledList.shuffle();
    suffledList.shuffle();
    return suffledList;
  }
}
