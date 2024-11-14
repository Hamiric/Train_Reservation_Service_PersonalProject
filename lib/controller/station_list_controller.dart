import 'package:get/get.dart';

class StationListController extends GetxController {
  final List<String> stationName = [
    '수서',
    '동탄',
    '평택지제',
    '천안아산',
    '오송',
    '대전',
    '김천구미',
    '동대구',
    '경주',
    '울산',
    '부산'
  ];

  // 현재 선택역 타입 (출발역 : true, 도착역 : false)
  late bool stationtype;

  String startStation = '선택';
  String endStation = '선택';

  // 선택된 역전 index값
  int selectedStartStationIndex = -1;
  int selectedEndStationIndex = -1;

  // 역을 선택했는지 구분하는 bool 값
  bool changedstart = false;
  bool changedend = false;

  // 각 페이지에서 반대쪽 역전이 선택되었는지 확인하는 bool 값
  bool checkOppositionList = false;


  // StationListPage로 넘어갈때 작동
  // 선택역 타입을 저장
  // 출발역 페이지로 넘어가는데, 이미 도착역이 설정되어 있는 경우 checkOppositionList를 true
  // 도착역 페이지로 넘어가는데, 이미 출발역이 설정되어 있는 경우 checkOppositionList를 true
  void setStationType(bool type) {
    stationtype = type;

    if (stationtype) {
      if (changedend) {
        checkOppositionList = true;
      } else {
        checkOppositionList = false;
      }
    } else {
      if (changedstart) {
        checkOppositionList = true;
      } else {
        checkOppositionList = false;
      }
    }
    // update();
  }

  // StationListPage에서 StationList중 하나를 터치했을 경우 작동하는 로직
  // 터치한 목록의 index값과, 선택역 타입을 저장
  // 이후, 스택 아래에서 빌드되어 있던 HomePage의 UI업데이트를 위해 Update필요
  void setStation(String station, int index) {
    if (stationtype) {
      startStation = station;
      selectedStartStationIndex = index;
      changedstart = true;
    } else {
      endStation = station;
      selectedEndStationIndex = index;
      changedend = true;
    }
    update();
  }

  // 출발역과 도착역을 버튼 하나로 바꿔주는 로직
  // HomePage UI가 즉각적으로 업데이트 되어야 하므로 Update필요
  void swapStation(){
    String tmpstation;
    int tmpselectedStationIndex;
    bool tmpchanged;

    // startStaion <스왑> endStation
    tmpstation = startStation;
    startStation = endStation;
    endStation = tmpstation;

    // selectedStartStationIndex <스왑> selectedEndStationIndex
    tmpselectedStationIndex = selectedStartStationIndex;
    selectedStartStationIndex = selectedEndStationIndex;
    selectedEndStationIndex = tmpselectedStationIndex;

    // changedstart <스왑> changedend
    tmpchanged = changedstart;
    changedstart = changedend;
    changedend = tmpchanged;

    update();
  }

  // SeatPage의 ReservationButton에서 확인 버튼을 눌렀을경우 작동하는 로직
  // Controller에 설정된 값들 초기화
  // HomePage로 돌아갈때, Station부분은 UI업데이트가 필요하기 때문에 Update필요
  void reset() {
    startStation = '선택';
    endStation = '선택';

    changedstart = false;
    changedend = false;

    selectedStartStationIndex = -1;
    selectedEndStationIndex = -1;
    
    update();
  }
}
