import 'package:get/get.dart';

class SeatController extends GetxController{
  // 좌석 행, 열
  int selectedcol = -1;
  int selectedrow = -1;

  List<String> stringRow = ['A','B','C','D'];

  // 좌석이 눌러졌을 경우 체크
  bool readyReservation = false;

  // SeatPage에서 좌석을 누를경우 작동하는 로직
  // 좌석 번호(행,열)을 저장
  // 좌석 색상이 변해야 하므로 UI업데이트를 위한 Update필요
  void setSeat(int col, int row){
    selectedcol = col;
    selectedrow = row;
    readyReservation = true;
    update();
  }

  // SeatPage의 ReservationButton에서 확인 버튼을 눌렀을경우 작동하는 로직
  // Controller에 설정된 값들 초기화
  // HomePage로 돌아갈때, 해당 값들은 HomePage에서 사용하지 않으므로, Update 필요 없음
  void reset(){
    selectedcol = -1;
    selectedrow = -1;

    readyReservation = false;
    // update();
  }
}