// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:tickets_app/base/res/media.dart';
import 'package:tickets_app/base/res/styles/app_style.dart';
import 'package:tickets_app/base/res/widgets/app_column_text_layout.dart';
import 'package:tickets_app/base/res/widgets/heading_text.dart';
import 'package:tickets_app/base/res/widgets/text_style_fourth.dart';
import 'package:tickets_app/base/res/widgets/text_style_third.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.bgColor,
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        children: [
          const Padding(
              padding: EdgeInsets.only(
            top: 40,
          )),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 86,
                height: 86,
                decoration: BoxDecoration(
                  color: Colors.white, // Add a background color
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(
                      20), // Ensure the image respects the border radius
                  child: Image.asset(
                    AppMedia.logo,
                    fit:
                        BoxFit.cover, // Adjust the image to cover the container
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const HeadingText(
                    text: "Book Tickets",
                    isColor: false,
                  ),
                  Text(
                    "New-york",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: Colors.grey.shade500),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 3, vertical: 3),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: AppStyles.profileLocationColor),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(3),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppStyles.profileTextColor,
                          ),
                          child: const Icon(
                            FluentSystemIcons.ic_fluent_shield_filled,
                            color: Colors.white,
                            size: 15,
                          ),
                        ),
                        // ignore: prefer_const_constructors
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Premium status",
                          style: TextStyle(
                              color: AppStyles.profileTextColor,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Expanded(child: Container()),
              Text(
                'Edit',
                style: TextStyle(
                    color: AppStyles.primaryColor, fontWeight: FontWeight.w300),
              ),
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Divider(
            color: Colors.grey.shade300,
          ),
          SizedBox(
            height: 8,
          ),
          Stack(
            children: [
              Container(
                height: 90,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  color: AppStyles.primaryColor,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                child: Row(
                  children: [
                    CircleAvatar(
                      maxRadius: 25,
                      backgroundColor: Colors.white,
                      child: Icon(
                        FluentSystemIcons.ic_fluent_lightbulb_filament_filled,
                        color: AppStyles.primaryColor,
                        size: 27,
                      ),
                    ),
                    SizedBox(width: 15),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextStyleThird(
                            text: "You\'v got a new award", isColor: null),
                        TextStyleFourth(
                            text: "You have  95 flights in a year",
                            isColor: false)
                      ],
                    )
                  ],
                ),
              ),
              Positioned(
                  top: -40,
                  right: -45,
                  child: Container(
                    padding: EdgeInsets.all(30),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        width: 18,
                        color: Color(0xFF264CD2),
                      ),
                    ),
                  )),
            ],
          ),
          SizedBox(
            height: 25,
          ),
          Text(
            "Accumulated miles",
            style: AppStyles.headLineStyle2,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              color: AppStyles.bgColor,
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 15,
                ),
                Text(
                  "192802",
                  style: TextStyle(
                      fontSize: 45,
                      color: AppStyles.textColor,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Miles accured ",
                      style: AppStyles.headLineStyle4.copyWith(
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      "16th July ",
                      style: AppStyles.headLineStyle4.copyWith(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 4,
                ),
                Divider(
                  color: Colors.grey,
                ),
                SizedBox(
                  height: 4,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppColumnTextLayout(
                      topText: "23 042",
                      bottomText: "Miles",
                      axisAlignment: CrossAxisAlignment.start,
                      isColor: false,
                    ),
                    AppColumnTextLayout(
                      topText: "Aieline CO",
                      bottomText: "Receivced form",
                      axisAlignment: CrossAxisAlignment.end,
                      isColor: false,
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppColumnTextLayout(
                      topText: "42",
                      bottomText: "Miles",
                      axisAlignment: CrossAxisAlignment.start,
                      isColor: false,
                    ),
                    AppColumnTextLayout(
                      topText: "McDoanal\'s",
                      bottomText: "Receivced form",
                      axisAlignment: CrossAxisAlignment.end,
                      isColor: false,
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppColumnTextLayout(
                      topText: "13 142",
                      bottomText: "Miles",
                      axisAlignment: CrossAxisAlignment.start,
                      isColor: false,
                    ),
                    AppColumnTextLayout(
                      topText: "Bagh",
                      bottomText: "Receivced form",
                      axisAlignment: CrossAxisAlignment.end,
                      isColor: false,
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                InkWell(
                  onTap: () {},
                  child: Text(" How to get more miles",
                      style: AppStyles.textStyle
                          .copyWith(color: AppStyles.primaryColor)),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
