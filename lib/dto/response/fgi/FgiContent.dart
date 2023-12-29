class FgiContent {
  final String job;
  final String fgiTarget;
  final String companyNameOrItemName;
  final String serviceLink;
  final String fgiMethod;
  final String estimatedTime;
  final String participantsCount;
  final String preferTime;
  final String desiredParticipants;
  final String contact;


  FgiContent({
    required this.job,
    required this.fgiTarget,
    required this.companyNameOrItemName,
    required this.serviceLink,
    required this.fgiMethod,
    required this.estimatedTime,
    required this.participantsCount,
    required this.preferTime,
    required this.desiredParticipants,
    required this.contact,
  });

  factory FgiContent.fromJson(Map<String, dynamic> json) {
    return FgiContent(
      job: json['job'] as String,
      fgiTarget: json['target'] as String,
      companyNameOrItemName: json['companyNameOrItemName'] as String,
      serviceLink: json['link'] as String,
      fgiMethod: json['interviewMethod'] as String,
      estimatedTime: json['estimatedTime'] as String,
      participantsCount: json['participantsCount'] as String,
      desiredParticipants: json['desiredParticipants'] as String,
      contact: json['contact'] as String,
      preferTime: json['preferTime'] as String,
    );
  }
}
