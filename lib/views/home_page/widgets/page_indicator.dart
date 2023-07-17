import 'package:flutter/material.dart';

class PageIndicator extends StatefulWidget {
  final int index;
  final int itemCount;
  const PageIndicator(
      {super.key, required this.index, required this.itemCount});

  @override
  State<PageIndicator> createState() => _PageIndicatorState();
}

class _PageIndicatorState extends State<PageIndicator> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
            widget.itemCount,
            (ind) => Padding(
                padding: const EdgeInsets.all(2.0),
                child: Icon(
                  ind == 0
                      ? Icons.search
                      : ind == 1
                          ? Icons.navigation
                          : Icons.circle_rounded,
                  size: ind == widget.index ? 15 : 8,
                  color: widget.index == 0 ? Colors.pink : Colors.black,
                ))),
      ),
    );
  }
}
