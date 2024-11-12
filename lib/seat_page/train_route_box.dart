import 'package:flutter/material.dart';

class TrainRouteBox extends StatelessWidget {
  const TrainRouteBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Spacer(),
        Text(
          '출발',
          style: TextStyle(
            fontSize: 30,
            color: Colors.purple,
            fontWeight: FontWeight.bold,
          ),
        ),
        Spacer(),
        Icon(
          Icons.arrow_circle_right_outlined,
          size: 30,
        ),
        Spacer(),
        Text(
          '도착',
          style: TextStyle(
            fontSize: 30,
            color: Colors.purple,
            fontWeight: FontWeight.bold,
          ),
        ),
        Spacer(),
      ],
    );
  }
}