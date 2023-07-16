import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';

import '../../../models/helper_functions.dart';
import '../../theme/type_face.dart';

class DateWidget extends StatelessWidget {
  final Color color;
  const DateWidget({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.black, borderRadius: BorderRadius.circular(20)),
        child: Center(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: DelayedDisplay(
            child: Text(
              formatDateTime(DateTime.now()),
              style: b2.copyWith(color: color),
            ),
          ),
        )),
      ),
    );
  }
}
