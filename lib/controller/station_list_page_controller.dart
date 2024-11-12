import 'package:get/get.dart';

class StationListPageController extends GetxController{
  late String stationtype;

  void setStationType(String type){
    stationtype = type;
    update();
  }
}