class Question {
  final int id, answer;
  final String question, media, type;
  final List<String> options;

  Question(
      {required this.id,
      required this.question,
      required this.answer,
      required this.media,
      required this.type,
      required this.options});
}
