import 'package:flutter/material.dart';
import 'package:tickets_app/base/res/styles/app_style.dart';
import 'package:tickets_app/base/res/widgets/app_column_text_layout.dart';
import 'package:tickets_app/base/res/widgets/app_layoutbuilder.dart';
import 'package:tickets_app/base/res/widgets/big_dot.dart';
import 'package:tickets_app/base/res/widgets/text_style_fourth.dart';

import 'big_circle.dart';
import 'text_style_third.dart';

class TicketView extends StatelessWidget {
  final Map<String, dynamic> ticket;
  final bool wholeScreen;
  final bool? isColor;
  const TicketView(
      {super.key,
      required this.ticket,
      this.wholeScreen = false,
      this.isColor});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * 0.85,
      height: 183,
      child: Container(
        margin: EdgeInsets.only(right: wholeScreen == true ? 0 : 16),
        child: Column(
          children: [
            //blur part of the ticket
            Container(
              margin: EdgeInsets.only(right: wholeScreen == true ? 0 : 16),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              decoration: BoxDecoration(
                color: isColor == null ? AppStyles.ticketBlue : Colors.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(21),
                  topRight: Radius.circular(21),
                ),
              ),
              child: Column(
                children: [
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextStyleThird(
                        text: ticket["from"]["code"],
                        isColor: isColor,
                      ),
                      Expanded(child: Container()),
                      BigDot(
                        isColor: isColor,
                      ),
                      Expanded(
                          child: Stack(
                        children: [
                          SizedBox(
                            height: 24,
                            child: AppLayoutBuilderWidget(
                              randomDivider: 6,
                              isColor: isColor,
                            ),
                          ),
                          Center(
                            child: Transform.rotate(
                              angle: 1.5,
                              child: Icon(
                                Icons.local_airport_rounded,
                                color: isColor == null
                                    ? Colors.white
                                    : AppStyles.planeScondeColor,
                              ),
                            ),
                          ),
                        ],
                      )),
                      BigDot(
                        isColor: isColor,
                      ),
                      Expanded(child: Container()),
                      TextStyleThird(
                        text: ticket["to"]["code"],
                        isColor: isColor,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 100,
                        child: TextStyleFourth(
                          text: ticket["from"]["name"],
                          isColor: isColor,
                        ),
                      ),
                      Expanded(child: Container()),
                      TextStyleFourth(
                          text: ticket["flying_time"], isColor: isColor),
                      Expanded(child: Container()),
                      SizedBox(
                        width: 100,
                        child: TextStyleFourth(
                          text: ticket["from"]["name"],
                          align: TextAlign.end,
                          isColor: isColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            //circlie part of the ticket
            Container(
              margin: EdgeInsets.only(right: wholeScreen == true ? 0 : 16),
              color: isColor == null
                  ? AppStyles.ticketOrange
                  : AppStyles.TicketColor,
              child: Row(
                children: [
                  BigCircle(
                    isRight: false,
                    isColor: isColor,
                  ),
                  Expanded(
                    child: AppLayoutBuilderWidget(
                      randomDivider: 16,
                      width: 6,
                      isColor: isColor,
                    ),
                  ),
                  BigCircle(
                    isRight: true,
                    isColor: isColor,
                  ),
                ],
              ),
            ),
            //orange part of the ticket
            Container(
              margin: EdgeInsets.only(right: wholeScreen == true ? 0 : 16),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              decoration: BoxDecoration(
                color: isColor == null
                    ? AppStyles.ticketOrange
                    : AppStyles.TicketColor,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(21),
                  bottomRight: Radius.circular(21),
                ),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppColumnTextLayout(
                        axisAlignment: CrossAxisAlignment.start,
                        topText: ticket["date"],
                        bottomText: "Date",
                        isColor: isColor,
                      ),
                      AppColumnTextLayout(
                        axisAlignment: CrossAxisAlignment.center,
                        topText: ticket["departure_time"],
                        bottomText: "departure_time",
                        isColor: isColor,
                      ),
                      AppColumnTextLayout(
                        axisAlignment: CrossAxisAlignment.end,
                        topText: ticket["number"].toString(),
                        bottomText: "Number",
                        isColor: isColor,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
