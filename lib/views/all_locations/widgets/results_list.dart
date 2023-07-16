import 'package:flutter/material.dart';

import '../../theme/type_face.dart';

class ResultsList extends StatelessWidget {
  List<dynamic> data;
  ResultsList({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
          padding: const EdgeInsets.only(top: 10),
          itemCount: data.length - 1,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text(
                data[index + 1][0],
                style: b1.copyWith(color: Colors.pink),
              ),
            );
          }),
    );
  }
}
