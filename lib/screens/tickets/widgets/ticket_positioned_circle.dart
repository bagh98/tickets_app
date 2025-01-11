import 'package:flutter/material.dart';

import '../../../base/res/styles/app_style.dart';

class TicketPositionedCircle extends StatelessWidget {
  final bool? pos;
  const TicketPositionedCircle({super.key, this.pos});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: pos == true ? 32 : null,
      right: pos == true ? null : 32,
      top: 250,
      child: Container(
        padding: const EdgeInsets.all(3),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(width: 2, color: AppStyles.textColor),
        ),
        child: CircleAvatar(
          maxRadius: 4,
          backgroundColor: AppStyles.textColor,
        ),
      ),
    );
  }
}
