class UserData {
  final String researchName;
  final String userName;
  final String age;
  final String gender;
  final String jobCode;
  final String householdType;
  final String residenceArea;
  final String phoneNumber;

  UserData({
    required this.researchName,
    required this.userName,
    required this.age,
    required this.gender,
    required this.jobCode,
    required this.householdType,
    required this.residenceArea,
    required this.phoneNumber,
  });
}

String convertUserDataListToString(List<UserData> dataList) {
  StringBuffer sb = StringBuffer();

  for (var data in dataList) {
    sb.writeln("리서치 이름: ${data.researchName}");
    sb.writeln("유저 이름: ${data.userName}");
    sb.writeln("나이: ${data.age}");
    sb.writeln("성별: ${data.gender}");
    sb.writeln("직업코드: ${data.jobCode}");
    sb.writeln("가구형태: ${data.householdType}");
    sb.writeln("거주지역: ${data.residenceArea}");
    sb.writeln("전화번호: ${data.phoneNumber}");
    sb.writeln(""); // 각 사용자 데이터 사이에 빈 줄을 추가합니다.
  }

  return sb.toString();
}
