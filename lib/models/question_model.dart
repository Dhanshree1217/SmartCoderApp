class QuestionModel {
  final String id;
  final String language;
  final String level;
  final String question;
  final List<String> options;
  final String answer;

  QuestionModel({
    required this.id,
    required this.language,
    required this.level,
    required this.question,
    required this.options,
    required this.answer,
  });

  factory QuestionModel.fromFirestore(Map<String, dynamic> data, String id) {
    return QuestionModel(
      id: id,
      language: data['language'] ?? '',
      level: data['level'] ?? '',
      question: data['question'] ?? '',
      options: List<String>.from(data['options'] ?? []),
      answer: data['answer'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'language': language,
      'level': level,
      'question': question,
      'options': options,
      'answer': answer,
    };
  }
}
