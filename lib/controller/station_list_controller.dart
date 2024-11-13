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

  late bool stationtype;
  String startStation = '선택';
  String endStation = '선택';

  int selectedStartStationIndex = -1;
  int selectedEndStationIndex = -1;

  bool changedstart = false;
  bool changedend = false;
  bool checkOppositionList = false;

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
