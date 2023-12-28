class InterviewContent {
  final String job;
  final String companyNameOrItemName;
  final String itemIntroduction;
  final String interviewMethod;
  final String estimatedTime;
  final String interviewReward;
  final String desiredIntervieweeCharacteristics;
  final String desiredParticipants;
  final String otherRequests;
  final String requestedService;
  final String interviewPurpose;
  final String contact;

  InterviewContent({
    required this.job,
    required this.companyNameOrItemName,
    required this.itemIntroduction,
    required this.interviewMethod,
    required this.estimatedTime,
    required this.interviewReward,
    required this.desiredIntervieweeCharacteristics,
    required this.desiredParticipants,
    required this.otherRequests,
    required this.requestedService,
    required this.interviewPurpose,
    required this.contact,
  });

  factory InterviewContent.fromJson(Map<String, dynamic> json) {
    return InterviewContent(
      job: json['job'] as String,
      companyNameOrItemName: json['companyNameOrItemName'] as String,
      itemIntroduction: json['itemIntroduction'] as String,
      interviewMethod: json['interviewMethod'] as String,
      estimatedTime: json['estimatedTime'] as String,
      interviewReward: json['interviewReward'] as String,
      desiredIntervieweeCharacteristics: json['desiredIntervieweeCharacteristics'] as String,
      desiredParticipants: json['desiredParticipants'] as String,
      otherRequests: json['otherRequests'] as String,
      requestedService: json['requestedService'] as String,
      interviewPurpose: json['interviewPurpose'] as String,
      contact: json['contact'] as String,
    );
  }
}
