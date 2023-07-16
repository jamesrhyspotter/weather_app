import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../theme/type_face.dart';

class InfoIcon extends StatelessWidget {
  final IconData icon;
  final String value;
  final String item;
  final Color color;
  const InfoIcon(
      {super.key,
      required this.item,
      required this.value,
      required this.icon,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: color,
          size: 52,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          value,
          style: h3.copyWith(color: color),
        ),
        Text(
          item,
          style: b2.copyWith(color: color),
        )
      ],
    );
  }
}
