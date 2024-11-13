import 'package:get/get.dart';

class StationListController extends GetxController {
  late bool stationtype;
  String startStation = '선택';
  String endStation = '선택';

  bool changedstart = false;
  bool changedend = false;

  void setStationType(bool type) {
    stationtype = type;
    update();
  }

  void setStation(String station) {
    if (stationtype) {
      startStation = station;
      changedstart = true;
    } else{
      endStation = station;
      changedend = true;
    }
    update();
  }

  void reset(){
    startStation = '선택';
    endStation = '선택';

    changedstart = false;
    changedend = false;
    update();
  }
}
