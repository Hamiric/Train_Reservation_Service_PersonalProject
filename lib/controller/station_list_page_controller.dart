import 'package:get/get.dart';

class StationListPageController extends GetxController {
  late bool stationtype;
  String startStation = '선택';
  String endStation = '선택';

  void setStationType(bool type) {
    stationtype = type;
    update();
  }

  void setStation(String station) {
    if (stationtype) {
      startStation = station;
    } else{
      endStation = station;
    }
    update();
  }
}
