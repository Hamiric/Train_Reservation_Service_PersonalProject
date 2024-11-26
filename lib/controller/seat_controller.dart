import 'package:get/get.dart';

class SeatController extends GetxController {
  // 예약된 좌석
  // [String, int, int] 형태의 데이터
  List<dynamic> alreadyResevationSeat = [];

  late String startStation;
  late String endStation;
  late String startendStation;

  // 좌석 행, 열
  int selectedcol = -1;
  int selectedrow = -1;

  List<String> stringRow = ['A', 'B', 'C', 'D'];

  // 좌석이 눌러졌을 경우 체크
  bool readyReservation = false;

  // SeatPage에서 좌석을 누를경우 작동하는 로직
  // 좌석 번호(행,열)을 저장
  // 좌석 색상이 변해야 하므로 UI업데이트를 위한 Update필요
  void setSeat(int col, int row) {
    selectedcol = col;
    selectedrow = row;
    readyReservation = true;
    update();
  }

  // HomePage의 좌석선택버튼을 눌렀을경우 작동하는 로직
  // 출발역-도착역을 저장하고, 만약 좌석이 선택되어져 있는 경우를 대비해 선택좌석 초기화
  // (버그 수정) readyReservation 값이 초기화가 되지 않았어서 수정..
  // SeatPage를 열고, SeatPage의 UI에만 영향을 끼치므로 Update 필요 없음
  void setStation(String start, String end) {
    startStation = start;
    endStation = end;

    startendStation = startStation + endStation;

    selectedcol = -1;
    selectedrow = -1;

    readyReservation = false;
  }

  // SeatPage의 ReservationButton에서 확인 버튼을 눌렀을경우 작동하는 로직
  // Controller에 설정된 값들 초기화
  // HomePage로 돌아갈때, 해당 값들은 HomePage에서 사용하지 않으므로, Update 필요 없음
  // (추가) 예매한 좌석 저장
  void reset() {
    alreadyResevationSeat.add([startendStation, selectedcol, selectedrow]);

    selectedcol = -1;
    selectedrow = -1;

    readyReservation = false;
    // update();
  }

  // 좌석이 이미 예약되었는지 아닌지 판별하는 로직
  bool isAlreadyReservation(int col, int row) {
    for (int i = 0; i < alreadyResevationSeat.length; i++) {
      if (alreadyResevationSeat[i][0] == startendStation &&
          alreadyResevationSeat[i][1] == col &&
          alreadyResevationSeat[i][2] == row) {
        return true;
      }
    }

    return false;
  }
}
