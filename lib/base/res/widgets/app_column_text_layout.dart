import 'package:flutter/material.dart';
import 'package:tickets_app/base/res/widgets/text_style_fourth.dart';
import 'package:tickets_app/base/res/widgets/text_style_third.dart';

class AppColumnTextLayout extends StatelessWidget {
  final String topText;
  final String bottomText;
  final CrossAxisAlignment axisAlignment;
  final bool? isColor;
  const AppColumnTextLayout(
      {super.key,
      required this.topText,
      required this.bottomText,
      required this.axisAlignment,
      this.isColor = null});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: axisAlignment,
      children: [
        TextStyleThird(
          isColor: isColor,
          text: topText,
        ),
        SizedBox(
          height: 5,
        ),
        TextStyleFourth(
          isColor: isColor,
          text: bottomText,
        ),
      ],
    );
  }
}
