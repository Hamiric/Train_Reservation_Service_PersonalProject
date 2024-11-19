import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:train_reservation_service/controller/seat_controller.dart';
import 'package:train_reservation_service/logger.dart';
import 'package:train_reservation_service/seat_page/row_number_label.dart';

class Seats extends StatelessWidget {
  const Seats({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
            itemCount: 21,
            itemBuilder: (BuildContext context, index) {
              // 첫번째 리스트엔 ABCD 레이블 출력
              if (index == 0) {
                return RowNumberLabel();
              }
              // 나머지
              return seatList(index - 1);
            }));
  }

  Widget seatList(int col) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Spacer(),
          seat(col, 0),
          SizedBox(
            width: 4,
          ),
          seat(col, 1),
          SizedBox(
            width: 4,
          ),
          SizedBox(
            width: 50,
            height: 50,
            child: Center(
              child: Text(
                (col + 1).toString(),
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
          ),
          SizedBox(
            width: 4,
          ),
          seat(col, 2),
          SizedBox(
            width: 4,
          ),
          seat(col, 3),
          Spacer(),
        ],
      ),
    );
  }

  Widget seat(int col, int row) {
    // 선택된 좌석 번호를 SeatController에 전달
    // 이후, 선택된 좌석 색상 변경
    // 예매된 좌석은 onTap 이벤트 없음
    return GetBuilder<SeatController>(builder: (controller) {
      return GestureDetector(
        onTap: () {
          try {
            if (!controller.isAlreadyReservation(col, row)) {
              Get.find<SeatController>().setSeat(col, row);
            }
          } catch (e) {
            logger.e('좌석 클릭시 오류');
          }
        },
        child: AnimatedContainer(
          width: 50,
          height: 50,
          duration : Duration(milliseconds: 200),
          decoration: BoxDecoration(
            color: checkSeatColor(controller, col, row),
            borderRadius: checkSeatCircular(controller, col, row),
          ),
        ),
      );
    });
  }

  // 좌석 색상 체크를 위한 함수
  // 예매된 좌석이면 연파랑, 선택된 좌석이면 보라, 빈좌석(미선택)이면 회색
  Color checkSeatColor(SeatController controller, int col, int row) {
    if (controller.isAlreadyReservation(col, row)) {
      return Colors.blue[200]!;
    } else {
      if (controller.selectedcol == col && controller.selectedrow == row) {
        return Colors.purple;
      } else {
        return Colors.grey[300]!;
      }
    }
  }

  // 좌석 모양 체크를 위한 함수
  // 예매된 좌석이면 circular 8, 선택된 좌석이면 circular 15, 빈좌석(미선택)이면 circular 8
  BorderRadius checkSeatCircular(SeatController controller, int col, int row) {
    if (controller.isAlreadyReservation(col, row)) {
      return BorderRadius.circular(8);
    } else {
      if (controller.selectedcol == col && controller.selectedrow == row) {
        return BorderRadius.circular(20);
      } else {
        return BorderRadius.circular(8);
      }
    }
  }
}
