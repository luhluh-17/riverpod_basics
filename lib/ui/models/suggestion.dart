class Suggestion {
  final String activity;
  final String type;

  Suggestion({required this.activity, required this.type});

  factory Suggestion.fromJson(Map<String, dynamic> json) {
    return Suggestion(
      activity: json['activity'],
      type: json['type'],
    );
  }
}
