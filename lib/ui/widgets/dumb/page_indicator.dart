import 'package:flutter/material.dart';

class PageIndicator extends StatelessWidget {
  final int currentPage;
  final int numberOfPages;

  const PageIndicator({
    @required this.currentPage,
    @required this.numberOfPages,
  });
  @override
  Widget build(BuildContext context) {
    List<Widget> indicators = [];
    for (var i = 0; i < numberOfPages; i++) {
      indicators.add(
        Container(
          width: 8.0,
          height: 8.0,
          margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: currentPage == i ? Colors.white : Colors.white10,
          ),
        ),
      );
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: indicators,
    );
  }
}
