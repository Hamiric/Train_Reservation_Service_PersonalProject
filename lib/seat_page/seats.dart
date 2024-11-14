import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:train_reservation_service/controller/seat_controller.dart';
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
          if(index == 0){
            return RowNumberLabel();
          }
          // 나머지
          return seatList(index-1);
        }
      )
    );
  }

  Widget seatList(int col){
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Spacer(),
          seat(col,0),
          SizedBox(width: 4,),
          seat(col,1),
          SizedBox(width: 4,),
          SizedBox(
            width: 50,
            height: 50,
            child: Center(
              child: Text(
                (col+1).toString(),
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
          ),
          SizedBox(width: 4,),
          seat(col,2),
          SizedBox(width: 4,),
          seat(col,3),
          Spacer(),
        ],
      ),
    );
  }

  Widget seat(int col, int row){
    // 선택된 좌석 번호를 SeatController에 전달
    // 이후, 선택된 좌석 색상 변경
    return GetBuilder<SeatController>(
      builder: (controller) {
        return GestureDetector(
          onTap: () {
            Get.find<SeatController>().setSeat(col, row);
          },
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: (controller.selectedcol == col && controller.selectedrow == row) ? Colors.purple : Colors.grey[300],
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        );
      }
    );
  }
}
