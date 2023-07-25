final class Answer {
  final String? reading;

  const Answer({required this.reading});

  factory Answer.fromJson(Map<String, dynamic> json) {
    return Answer(
      reading: json['reading'] as String?,
    );
  }
}
