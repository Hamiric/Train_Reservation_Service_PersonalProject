import 'package:get/get.dart';

class SeatController extends GetxController{
  int selectedcol = -1;
  int selectedrow = -1;

  List<String> stringRow = ['A','B','C','D'];

  bool readyReservation = false;

  void setSeat(int col, int row){
    selectedcol = col;
    selectedrow = row;
    readyReservation = true;
    update();
  }

  void reset(){
    selectedcol = -1;
    selectedrow = -1;

    readyReservation = false;
    // update();
  }
}