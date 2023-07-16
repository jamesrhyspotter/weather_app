import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WeatherTile extends StatelessWidget {
  final String title;
  final String data;

  const WeatherTile({
    required this.title,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10.0),
          Text(data,
              style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
