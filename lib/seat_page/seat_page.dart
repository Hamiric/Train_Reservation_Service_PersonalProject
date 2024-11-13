import 'package:flutter/material.dart';
import 'package:train_reservation_service/seat_page/reservation_button.dart';
import 'package:train_reservation_service/seat_page/row_number_label.dart';
import 'package:train_reservation_service/seat_page/seat_label.dart';
import 'package:train_reservation_service/seat_page/seats.dart';
import 'package:train_reservation_service/seat_page/train_route_box.dart';

class SeatPage extends StatelessWidget {
  const SeatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('좌석 선택'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TrainRouteBox(),
            SeatLabel(),
            RowNumberLabel(),
            Seats(),
            ReservationButton(),
            SizedBox(height: 30,),
          ],
        ),
      ),
    );
  }
}