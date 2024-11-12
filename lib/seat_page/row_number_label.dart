import 'package:flutter/material.dart';

class RowNumberLabel extends StatelessWidget {
  const RowNumberLabel({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Spacer(),
        labelBox('A'),
        SizedBox(width: 4,),
        labelBox('B'),
        SizedBox(width: 4,),
        SizedBox(
          width: 50,
          height: 50,
        ),
        SizedBox(width: 4,),
        labelBox('C'),
        SizedBox(width: 4,),
        labelBox('D'),
        Spacer(),
      ],
    );
  }

  Widget labelBox(String label) {
    return SizedBox(
      width: 50,
      height: 50,
      child: Center(
        child: Text(
          label,
          style: TextStyle(
            fontSize: 18,
          ),
        ),
      )
    );
  }
}
