import 'package:flutter/material.dart';

class AppLayoutBuilderWidget extends StatelessWidget {
  final int randomDivider;
  final double width;
  final bool? isColor;
  const AppLayoutBuilderWidget(
      {super.key,
      required this.randomDivider,
      this.width = 3,
      this.isColor = null});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      // print("${(constraints.constrainWidth()/randomDivider).floor()}"); /// to get number between widgets
      return Flex(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        direction: Axis.horizontal,
        children: List.generate(
          (constraints.constrainWidth() / randomDivider).floor(),
          (index) => SizedBox(
            height: 1,
            width: width,
            child: DecoratedBox(
              decoration: BoxDecoration(
                  color: isColor == null ? Colors.white : Colors.grey.shade300),
            ),
          ),
        ),
      );
    });
  }
}
