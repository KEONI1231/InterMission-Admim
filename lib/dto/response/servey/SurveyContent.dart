class SurveyContent {
  final String job;
  final String target;
  final String link;
  final String expectedQuestions;
  final String desiredParticipants;
  final String requestedService;
  final String contact;

  SurveyContent({
    required this.job,
    required this.target,
    required this.link,
    required this.expectedQuestions,
    required this.desiredParticipants,
    required this.requestedService,
    required this.contact,
  });

  factory SurveyContent.fromJson(Map<String, dynamic> json) {
    return SurveyContent(
      job: json['job'] as String,
      target: json['target'] as String,
      link: json['link'] as String,
      expectedQuestions: json['expectedQuestions'] as String,
      desiredParticipants: json['desiredParticipants'] as String,
      requestedService: json['requestedService'] as String,
      contact: json['contact'] as String,
    );
  }
}
