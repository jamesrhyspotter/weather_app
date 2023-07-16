import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../theme/type_face.dart';

class SearchBox extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onSubmitted;

  const SearchBox({
    required this.controller,
    required this.onSubmitted,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: TextField(
        cursorColor: Colors.pink,
        controller: controller,
        style: b1.copyWith(color: Colors.pink),
        decoration: InputDecoration(
          hintText: 'Search',
          prefixIcon: const Icon(
            Icons.search,
            color: Colors.pink,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        onSubmitted: onSubmitted,
      ),
    );
  }
}
