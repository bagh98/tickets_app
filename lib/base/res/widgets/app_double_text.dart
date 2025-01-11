import 'package:flutter/material.dart';
import 'package:tickets_app/base/res/styles/app_style.dart';

class AppDoubleText extends StatelessWidget {
  const AppDoubleText(
      {super.key,
      required this.bigText,
      required this.smallText,
      required this.func});
  final String bigText;
  final VoidCallback func;
  final String smallText;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          bigText,
          style: AppStyles.headLineStyle2,
        ),
        InkWell(
          onTap: func,
          // () => Navigator.pushNamed(context, "/all_tickets"),
          child: Text(
            smallText,
            style: AppStyles.textStyle.copyWith(color: AppStyles.primaryColor),
          ),
        ),
      ],
    );
  }
}
