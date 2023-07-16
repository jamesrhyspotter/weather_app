import 'package:flutter/material.dart';

import '../../theme/type_face.dart';

class ForecastWidget extends StatelessWidget {
  final String data1;
  final String data2;
  final String iconName;
  const ForecastWidget(
      {super.key,
      required this.data1,
      required this.data2,
      required this.iconName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 77,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Colors.black,
            width: 3,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              height: 40,
              width: 40,
              image: AssetImage('assets/icons/$iconName.png'),
            ),
            Text(data1, style: b1),
            Text(data2, style: b2),
          ],
        ),
      ),
    );
  }
}
