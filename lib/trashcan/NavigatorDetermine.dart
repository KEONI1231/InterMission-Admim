class NavigatorHistory {
  int totalStackIndex = 0;
  int currentStackIndex = 0;
  List<String> stackList = [""];

  bool leftArrowStatus = false;
  bool rightArrowStatus = false;

  // 커스텀 함수를 통해 값을 변경
  void stackIntdexPlus(String screenName) {
    totalStackIndex += 1;
    currentStackIndex += 1;
    stackList.add(screenName);

    print('전체 인덱스 :  $totalStackIndex');
    print('현재 인덱스 :  $currentStackIndex');
    print('네비게이터 인덱스 :  ${stackList[currentStackIndex-1]}');
  }

  void stackIndexMinus() {
    currentStackIndex -= 1;
  } //일반 화면 이동시 실행될 함수



  void canBack() {

    if (currentStackIndex == totalStackIndex) {
      leftArrowStatus = true;
      if (currentStackIndex == 0) {
        leftArrowStatus = false;
      } else {
        leftArrowStatus = true;
      }
    }
    if (currentStackIndex < totalStackIndex) {
      print(stackList[currentStackIndex]);
      if (currentStackIndex == 0) {
        leftArrowStatus = false;
      } else {
        leftArrowStatus = true;
      }
    }
  }

  void canNext() {
    if(currentStackIndex < totalStackIndex) {
      rightArrowStatus = true;
    }
    else {
      rightArrowStatus = false;
    }
  }
  void clickBack() {
    stackIndexMinus();

  }

// ... 다른 커스텀 함수들도 추가 가능
}
