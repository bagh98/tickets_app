import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:tickets_app/base/res/media.dart';
import 'package:tickets_app/base/res/styles/app_style.dart';
import 'package:tickets_app/base/res/widgets/app_layoutbuilder.dart';
import 'package:tickets_app/base/res/widgets/ticket_view.dart';
import 'package:tickets_app/base/utils/all_json.dart';
import 'package:tickets_app/screens/search/widgets/app_ticket_tabs.dart';
import 'package:tickets_app/screens/tickets/widgets/ticket_positioned_circle.dart';

import '../../base/res/widgets/app_column_text_layout.dart';

class TicketScreen extends StatefulWidget {
  const TicketScreen({super.key});

  @override
  State<TicketScreen> createState() => _TicketScreenState();
}

class _TicketScreenState extends State<TicketScreen> {
  late int ticketIndex = 0;
  @override
  void didChangeDependencies() {
    if (ModalRoute.of(context)!.settings.arguments != null) {
      var args = ModalRoute.of(context)!.settings.arguments as Map;
      ticketIndex = args["index"];
    }

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppStyles.bgColor,
        title: Container(
          padding: const EdgeInsets.all(100),
          child: const Text(
            "Tickets",
          ),
        ),
      ),
      backgroundColor: AppStyles.bgColor,
      body: Stack(
        children: [
          ListView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            children: [
              const AppTicketTabs(
                firstTab: 'Upcoming',
                secondTab: 'Previous',
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.only(
                  left: 30,
                ),
                child: TicketView(
                  ticket: ticketList[ticketIndex],
                  isColor: true,
                ),
              ),
              const SizedBox(
                height: 1,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 31),
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                decoration: BoxDecoration(color: AppStyles.TicketColor),
                child: Column(
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppColumnTextLayout(
                          axisAlignment: CrossAxisAlignment.start,
                          topText: "Flutter DB",
                          bottomText: "Passenger",
                          isColor: true,
                        ),
                        AppColumnTextLayout(
                          axisAlignment: CrossAxisAlignment.end,
                          topText: "5221 46869",
                          bottomText: "Passport",
                          isColor: true,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const AppLayoutBuilderWidget(
                      randomDivider: 15,
                      width: 5,
                      isColor: false,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppColumnTextLayout(
                          axisAlignment: CrossAxisAlignment.start,
                          topText: "2134 1234456",
                          bottomText: "Number of E-ticket",
                          isColor: true,
                        ),
                        AppColumnTextLayout(
                          axisAlignment: CrossAxisAlignment.end,
                          topText: "B23456",
                          bottomText: "Bookink code",
                          isColor: true,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const AppLayoutBuilderWidget(
                      randomDivider: 15,
                      width: 5,
                      isColor: false,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  AppMedia.visaCard,
                                  scale: 11,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "*** 2462",
                                  style: AppStyles.headLineStyle3,
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Payment method",
                              style: AppStyles.headLineStyle4,
                            )
                          ],
                        ),
                        const AppColumnTextLayout(
                          axisAlignment: CrossAxisAlignment.end,
                          topText: "\$249.99",
                          bottomText: "Price",
                          isColor: true,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 1,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 31),
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                ),
                decoration: BoxDecoration(
                    color: AppStyles.TicketColor,
                    borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(21),
                        bottomLeft: Radius.circular(21))),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Center(
                      child: BarcodeWidget(
                        height: 70,
                        data: 'https://www.dbestech.com',
                        drawText: false,
                        barcode: Barcode.code128(),
                        color: AppStyles.textColor,
                        width: double.infinity,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.only(
                  left: 30,
                ),
                child: TicketView(
                  ticket: ticketList[ticketIndex],
                ),
              ),
            ],
          ),
          const TicketPositionedCircle(
            pos: true,
          ),
          const TicketPositionedCircle(
            pos: null,
          ),
        ],
      ),
    );
  }
}
